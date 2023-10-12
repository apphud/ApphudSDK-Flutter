package com.apphud.fluttersdk.handlers

import android.app.Activity
import android.util.Log
import com.apphud.fluttersdk.toApphudProduct
import com.apphud.fluttersdk.toMap
import com.apphud.sdk.Apphud
import com.apphud.sdk.ApphudPurchaseResult
import com.apphud.sdk.domain.ApphudPaywall
import com.apphud.sdk.domain.ApphudProduct
import com.apphud.sdk.flutter.ApphudFlutter
import io.flutter.plugin.common.MethodChannel
import java.lang.IllegalStateException


class MakePurchaseHandler(
    override val routes: List<String>,
    val activity: Activity,
    handleOnMainThreadP: HandleOnMainThread
) : Handler {
    private var handleOnMainThread = handleOnMainThreadP
    override fun tryToHandle(
        method: String,
        args: Map<String, Any>?,
        result: MethodChannel.Result
    ) {
        when (method) {
            MakePurchaseRoutes.didFetchProductsNotification.name -> result.notImplemented()

            MakePurchaseRoutes.productsDidFetchCallback.name -> productsDidFetchCallback(result)

            MakePurchaseRoutes.refreshStoreKitProducts.name -> result.notImplemented()

            MakePurchaseRoutes.products.name -> products(result)

            MakePurchaseRoutes.product.name -> ProductParser(result).parse(args)
            { productIdentifier -> product(productIdentifier, result) }

            MakePurchaseRoutes.purchase.name -> PurchaseParser(result).parse(args)
            { productId, offerIdToken, oldToken, replacementMode ->
                purchase(productId, offerIdToken, oldToken, replacementMode, result)
            }

            MakePurchaseRoutes.purchaseWithoutValidation.name -> result.notImplemented()

            MakePurchaseRoutes.purchasePromo.name -> result.notImplemented()

            MakePurchaseRoutes.syncPurchases.name -> SyncPurchasesParser(result).parse(args) { paywallIdentifier ->
                syncPurchases(
                    paywallIdentifier,
                    result
                )
            }

            MakePurchaseRoutes.presentOfferCodeRedemptionSheet.name -> result.notImplemented()

            MakePurchaseRoutes.getPaywalls.name -> result.notImplemented()

            MakePurchaseRoutes.paywalls.name -> paywalls(result)

            MakePurchaseRoutes.purchaseProduct.name -> PurchaseProductParser(result).parse(args)
            { product, offerIdToken, oldToken, replacementMode ->
                purchaseProduct(
                    product,
                    offerIdToken,
                    oldToken,
                    replacementMode,
                    result
                )
            }

            MakePurchaseRoutes.permissionGroups.name -> getPermissionGroups(result)

            MakePurchaseRoutes.didPurchaseFromPaywall.name -> result.notImplemented()

            MakePurchaseRoutes.refreshEntitlements.name -> refreshEntitlements(result)
        }
    }

    private fun getPermissionGroups(result: MethodChannel.Result) {
        val groups = Apphud.permissionGroups()
        handleOnMainThread { result.success(groups.map { it.toMap() }) }
    }

    private fun paywalls(result: MethodChannel.Result) {
        val paywalls: List<ApphudPaywall> = Apphud.paywalls()
        val resultMap = hashMapOf<String, Any?>()
        resultMap["paywalls"] = paywalls.map { paywall -> paywall.toMap() }
        handleOnMainThread { result.success(resultMap) }
    }


    private fun productsDidFetchCallback(result: MethodChannel.Result) {
        Apphud.productsFetchCallback { productDetails ->
            val jsonList: List<HashMap<String, Any?>> = productDetails.map {
                it.toMap()
            }
            handleOnMainThread { result.success(jsonList) }
        }
    }

    private fun products(result: MethodChannel.Result) {
        val productDetails = Apphud.products()
        if (productDetails != null) {
            val jsonList: List<HashMap<String, Any?>> = productDetails.map {
                it.toMap()
            }
            handleOnMainThread { result.success(jsonList) }
        } else {
            handleOnMainThread { result.success(null) }
        }
    }

    private fun product(productIdentifier: String, result: MethodChannel.Result) {
        val productDetails = Apphud.product(productIdentifier = productIdentifier)
        if (productDetails != null) {
            handleOnMainThread { result.success(productDetails.toMap()) }
        } else {
            handleOnMainThread { result.success(null) }
        }
    }

    private fun purchase(
        productId: String,
        offerIdToken: String? = null,
        oldToken: String? = null,
        replacementMode: Int? = null,
        result: MethodChannel.Result
    ) {
        ApphudFlutter.purchase(
            activity,
            productId,
            offerIdToken,
            oldToken,
            replacementMode
        ) { purchaseResult ->
            processPurchaseResult(purchaseResult, result)
        }

    }

    private fun purchaseProduct(
        product: ApphudProduct,
        offerIdToken: String? = null,
        oldToken: String? = null,
        replacementMode: Int? = null,
        result: MethodChannel.Result
    ) {
        Apphud.purchase(
            activity,
            product,
            offerIdToken,
            oldToken,
            replacementMode
        ) { purchaseResult ->
            processPurchaseResult(purchaseResult, result)
        }
    }


    private fun processPurchaseResult(
        purchaseResult: ApphudPurchaseResult,
        result: MethodChannel.Result
    ) {
        val resultMap = hashMapOf<String, Any?>()

        purchaseResult.subscription?.let {
            resultMap["subscription"] = it.toMap()
        }

        purchaseResult.nonRenewingPurchase?.let {
            resultMap["nonRenewingPurchase"] = it.toMap()
        }

        purchaseResult.purchase?.let {
            resultMap["purchase"] = it.toMap()
        }

        purchaseResult.error?.let {
            resultMap["error"] = it.toMap()
        }

        try {
            handleOnMainThread { result.success(resultMap) }
        } catch (e: IllegalStateException) {
            Log.e("Apphud", e.toString(), e)
        }
    }

    private fun syncPurchases(paywallIdentifier: String?, result: MethodChannel.Result) {
        ApphudFlutter.syncPurchases(paywallIdentifier)
        handleOnMainThread { result.success(null) }
    }

    private fun refreshEntitlements(result: MethodChannel.Result) {
        Apphud.refreshEntitlements()
        handleOnMainThread { result.success(null) }
    }

    class ProductParser(private val result: MethodChannel.Result) {
        fun parse(args: Map<String, Any>?, callback: (productIdentifier: String) -> Unit) {
            try {
                args ?: throw IllegalArgumentException("productIdentifier is required argument")
                val productIdentifier = args["productIdentifier"] as? String
                    ?: throw IllegalArgumentException("productIdentifier is required argument")

                callback(productIdentifier)
            } catch (e: IllegalArgumentException) {
                result.error("400", e.message, "")
            }
        }
    }

    class PurchaseProductParser(private val result: MethodChannel.Result) {
        fun parse(
            args: Map<String, Any>?, callback: (
                product: ApphudProduct,
                offerIdToken: String?,
                oldToken: String?,
                replacementMode: Int?
            ) -> Unit
        ) {
            try {
                args ?: throw IllegalArgumentException("arguments are required")

                val product = args.toApphudProduct()
                val paywalls = Apphud.paywalls()
                for (pw in paywalls) {
                    val apphudProduct =
                        pw.products?.firstOrNull { pr -> pr.product_id == product.product_id }
                    if (apphudProduct != null) {
                        product.productDetails = apphudProduct.productDetails
                        break
                    }
                }
                val offerIdToken = args["offerIdToken"] as? String
                val oldToken = args["oldToken"] as? String
                val replacementMode = args["replacementMode"] as? Int

                callback(product, offerIdToken, oldToken, replacementMode)
            } catch (e: IllegalArgumentException) {
                result.error("400", e.message, "")
            }
        }
    }

    class PurchaseParser(private val result: MethodChannel.Result) {
        fun parse(
            args: Map<String, Any>?, callback: (
                productId: String,
                offerIdToken: String?,
                oldToken: String?,
                replacementMode: Int?
            ) -> Unit
        ) {
            try {
                args ?: throw IllegalArgumentException("productId is required argument")
                val productId = args["productId"] as? String
                    ?: throw IllegalArgumentException("productId is required argument")

                val offerIdToken = args["offerIdToken"] as? String
                val oldToken = args["oldToken"] as? String
                val replacementMode = args["replacementMode"] as? Int

                callback(productId, offerIdToken, oldToken, replacementMode)
            } catch (e: IllegalArgumentException) {
                result.error("400", e.message, "")
            }
        }
    }

    class SyncPurchasesParser(private val result: MethodChannel.Result) {
        fun parse(args: Map<String, Any>?, callback: (paywallIdentifier: String?) -> Unit) {
            val paywallIdentifier = args?.get("paywallIdentifier") as String?
            callback(paywallIdentifier)
        }
    }
}

enum class MakePurchaseRoutes {
    didFetchProductsNotification,
    productsDidFetchCallback,
    refreshStoreKitProducts,
    products,
    product,
    purchase,
    purchaseWithoutValidation,
    purchasePromo,
    syncPurchases,
    presentOfferCodeRedemptionSheet,
    getPaywalls,
    paywalls,
    purchaseProduct,
    permissionGroups,
    didPurchaseFromPaywall,
    refreshEntitlements;

    companion object Mapper {
        fun stringValues(): List<String> {
            return values().map { route -> route.toString() }
        }
    }
}
