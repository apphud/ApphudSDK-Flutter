import 'package:apphud/models/apphud_models/apphud_composite_model.dart';
import 'package:apphud/models/apphud_models/apphud_subscription.dart';
import 'package:apphud/models/apphud_models/composite/apphud_product.dart';
import 'package:apphud/models/sk_product/discount_wrapper.dart';
import 'package:apphud/models/sk_product/sk_payment_transaction_wrapper.dart';
import 'package:apphud/models/sk_product/sk_product_wrapper.dart';
import 'package:apphud/models/sk_product/subscription_period_wrapper.dart';
import 'package:apphud/models/sku_details/sku_details.dart';

import 'apphud_models/android/apphud_purchase_result_android.dart';
import 'apphud_models/apphud_non_renewing_purchase.dart';
import 'apphud_models/ios/apphud_purchase_result_ios.dart';

class Mapper {
  static ApphudProduct? apphudProductFromJson(dynamic json) {
    if (json == null) return null;

    final map = Map<String, dynamic>.from(json);
    try {
      return ApphudProduct.fromJson(map);
    } catch (e) {
      print('Could not parse ApphudProduct: $e');
      return null;
    }
  }

  static SKProductWrapper? skProductFromJson(dynamic json) {
    if (json == null) return null;

    final map = Map<String, dynamic>.from(json);
    try {
      return SKProductWrapper.fromJson(map);
    } catch (e) {
      print('Could not parse SKProductWrapper: $e');
      return null;
    }
  }

  static SkuDetailsWrapper? skuDetailsFromJson(dynamic json) {
    if (json == null) return null;

    final map = Map<String, dynamic>.from(json);
    try {
      return SkuDetailsWrapper.fromJson(map);
    } catch (e) {
      print('Could not parse SkuDetailsWrapper: $e');
      return null;
    }
  }

  static ApphudPurchaseResultIos? ApphudPurchaseResultIosFromJson(
      dynamic json) {
    if (json == null) return null;

    final map = Map<String, dynamic>.from(json);
    try {
      return ApphudPurchaseResultIos.fromJson(map);
    } catch (e) {
      print('Could not parse ApphudPurchaseResultIos: $e');
      return null;
    }
  }

  static ApphudPurchaseResultAndroid? ApphudPurchaseResultAndroidFromJson(
      dynamic json) {
    if (json == null) return null;

    final map = Map<String, dynamic>.from(json);
    try {
      return ApphudPurchaseResultAndroid.fromJson(map);
    } catch (e) {
      print('Could not parse ApphudPurchaseResultAndroid: $e');
      return null;
    }
  }

  static SKPriceLocaleWrapper? skPriceLocaleFromJson(dynamic json) {
    if (json == null) return null;

    final map = Map<String, dynamic>.from(json);
    try {
      return SKPriceLocaleWrapper.fromJson(map);
    } catch (e) {
      print('Could not parse SKPriceLocaleWrapper: $e');
      return null;
    }
  }

  static SKProductSubscriptionPeriodWrapper?
      skProductSubscriptionPeriodFromJson(dynamic json) {
    if (json == null) return null;

    final map = Map<String, dynamic>.from(json);

    try {
      return SKProductSubscriptionPeriodWrapper.fromJson(map);
    } catch (e) {
      print('Could not parse SKProductSubscriptionPeriodWrapper: $e');
      return null;
    }
  }

  static SKProductDiscountWrapper? skProductDiscountFromJson(dynamic json) {
    if (json == null) return null;

    final map = Map<String, dynamic>.from(json);
    try {
      return SKProductDiscountWrapper.fromJson(map);
    } catch (e) {
      print('Could not parse SKProductDiscountWrapper: $e');
      return null;
    }
  }

  static SKPaymentWrapper? skPaymentWrapperFromJson(dynamic json) {
    if (json == null) return null;

    final map = Map<String, dynamic>.from(json);
    try {
      return SKPaymentWrapper.fromJson(map);
    } catch (e) {
      print('Could not parse SKPaymentWrapper: $e');
      return null;
    }
  }

  static SKPaymentTransactionWrapper? skPaymentTransactionWrapperFromJson(
      dynamic json) {
    if (json == null) return null;

    final map = Map<String, dynamic>.from(json);
    try {
      return SKPaymentTransactionWrapper.fromJson(map);
    } catch (e) {
      print('Could not parse SKPaymentTransactionWrapper: $e');
      return null;
    }
  }

  static ApphudSubscriptionWrapper? apphudSubscriptionWrapperFromJson(
      dynamic json) {
    if (json == null) return null;

    final map = Map<String, dynamic>.from(json);
    try {
      return ApphudSubscriptionWrapper.fromJson(map);
    } catch (e) {
      print('Could not parse ApphudSubscriptionWrapper: $e');
      return null;
    }
  }

  static ApphudNonRenewingPurchase? apphudNonRenewingPurchaseFromJson(
      dynamic json) {
    if (json == null) return null;

    final map = Map<String, dynamic>.from(json);
    try {
      return ApphudNonRenewingPurchase.fromJson(map);
    } catch (e) {
      print('Could not parse ApphudNonRenewingPurchase: $e');
      return null;
    }
  }

  static ApphudComposite? apphudCompositeFromJson(dynamic json) {
    if (json == null) return null;

    final map = Map<String, dynamic>.from(json);

    try {
      return ApphudComposite.fromJson(map);
    } catch (e) {
      print('Could not parse ApphudComposite: $e');
      return null;
    }
  }

  static DateTime dateTimeFromSecondsTimestamp(num timestamp) {
    final intAbsTimestamp = timestamp.toInt().abs();
    return DateTime.fromMillisecondsSinceEpoch(intAbsTimestamp);
  }
}
