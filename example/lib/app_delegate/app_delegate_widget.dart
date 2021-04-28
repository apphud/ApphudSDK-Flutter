import 'dart:core';

import 'package:appHud_example/actions/action_screen.dart';
import 'package:appHud_example/actions/attribution_actions/add_attribution_action.dart';
import 'package:appHud_example/actions/attribution_actions/disable_ad_tracking_action.dart';
import 'package:appHud_example/actions/attribution_actions/disable_idfa_collection_action.dart';
import 'package:appHud_example/actions/attribution_actions/set_advertising_identifier_action.dart';
import 'package:appHud_example/actions/handle_purchase_actions/app_store_receipt_action.dart';
import 'package:appHud_example/actions/handle_purchase_actions/fetch_raw_receipt_info_action.dart';
import 'package:appHud_example/actions/handle_purchase_actions/has_active_subscription_action.dart';
import 'package:appHud_example/actions/handle_purchase_actions/is_non_renewing_purchase_active_action.dart';
import 'package:appHud_example/actions/handle_purchase_actions/migrate_purchases_if_needed_action.dart';
import 'package:appHud_example/actions/handle_purchase_actions/non_renewing_purchases_action.dart';
import 'package:appHud_example/actions/handle_purchase_actions/restore_purchases_action.dart';
import 'package:appHud_example/actions/handle_purchase_actions/subscription_action.dart';
import 'package:appHud_example/actions/handle_purchase_actions/subscriptions_action.dart';
import 'package:appHud_example/actions/handle_purchase_actions/validate_receipt_action.dart';
import 'package:appHud_example/actions/initialization_actions/device_id_action.dart';
import 'package:appHud_example/actions/other_actions/enable_debug_logs.dart';
import 'package:appHud_example/actions/initialization_actions/logout_action.dart';
import 'package:appHud_example/actions/initialization_actions/start_action.dart';
import 'package:appHud_example/actions/initialization_actions/start_manually_action.dart';
import 'package:appHud_example/actions/initialization_actions/update_user_id_action.dart';
import 'package:appHud_example/actions/initialization_actions/user_id_action.dart';
import 'package:appHud_example/actions/make_purchase_actions/did_fetch_products_notification.dart';
import 'package:appHud_example/actions/make_purchase_actions/present_offer_code_redemption_sheet.dart';
import 'package:appHud_example/actions/make_purchase_actions/product_action.dart';
import 'package:appHud_example/actions/make_purchase_actions/products_action.dart';
import 'package:appHud_example/actions/make_purchase_actions/products_did_fetch_callback.dart';
import 'package:appHud_example/actions/make_purchase_actions/purchase_action.dart';
import 'package:appHud_example/actions/make_purchase_actions/purchase_promo.dart';
import 'package:appHud_example/actions/make_purchase_actions/purchase_without_validation.dart';
import 'package:appHud_example/actions/make_purchase_actions/refresh_store_kit_products.dart';
import 'package:appHud_example/actions/make_purchase_actions/sync_purchases.dart';
import 'package:appHud_example/actions/other_actions/is_sandbox_action.dart';
import 'package:appHud_example/actions/user_properties_actions/increment_user_propery_action.dart';
import 'package:appHud_example/actions/user_properties_actions/set_user_propery_action.dart';
import 'package:appHud_example/main_screen.dart';
import 'package:appHud_example/routes/attribution_routes.dart';
import 'package:appHud_example/routes/handle_purchase_routes.dart';
import 'package:appHud_example/routes/initialization_routes.dart';
import 'package:appHud_example/routes/make_purchase_routes.dart';
import 'package:appHud_example/routes/other_routes.dart';
import 'package:appHud_example/routes/routes.dart';
import 'package:appHud_example/routes/user_properties_routes.dart';
import 'package:flutter/material.dart';

class AppDelegateWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppDelegateWidgetState();
}

class AppDelegateWidgetState extends State<AppDelegateWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      initialRoute: Routes.home,
      onGenerateRoute: (RouteSettings routeSettings) {
        switch (routeSettings.name) {
          case Routes.home:
            {
              return PageRouteBuilder(
                pageBuilder: (_, __, ___) => _makeMainScreen(Routes()),
                settings: routeSettings,
                transitionsBuilder: (_, anim, __, child) {
                  return FadeTransition(opacity: anim, child: child);
                },
              );
            }
          case Routes.initialization:
            {
              return PageRouteBuilder(
                pageBuilder: (_, __, ___) =>
                    _makeMainScreen(InitializationRoutes()),
                settings: routeSettings,
                transitionsBuilder: (_, anim, __, child) {
                  return FadeTransition(opacity: anim, child: child);
                },
              );
            }
          case Routes.makePurchase:
            {
              return PageRouteBuilder(
                pageBuilder: (_, __, ___) =>
                    _makeMainScreen(MakePurchaseRoutes()),
                settings: routeSettings,
                transitionsBuilder: (_, anim, __, child) {
                  return FadeTransition(opacity: anim, child: child);
                },
              );
            }
          case Routes.handlePurchases:
            {
              return PageRouteBuilder(
                pageBuilder: (_, __, ___) =>
                    _makeMainScreen(HandlePurchaseRoutes()),
                settings: routeSettings,
                transitionsBuilder: (_, anim, __, child) {
                  return FadeTransition(opacity: anim, child: child);
                },
              );
            }
          case Routes.userProperties:
            {
              return PageRouteBuilder(
                pageBuilder: (_, __, ___) =>
                    _makeMainScreen(UserPropertiesRoutes()),
                settings: routeSettings,
                transitionsBuilder: (_, anim, __, child) {
                  return FadeTransition(opacity: anim, child: child);
                },
              );
            }
          case Routes.rulesAndScreensMethods:
            {
              return PageRouteBuilder(
                pageBuilder: (_, __, ___) => _makeScreen(),
                settings: routeSettings,
                transitionsBuilder: (_, anim, __, child) {
                  return FadeTransition(opacity: anim, child: child);
                },
              );
            }
          case Routes.pushNotifications:
            {
              return PageRouteBuilder(
                pageBuilder: (_, __, ___) => _makeScreen(),
                settings: routeSettings,
                transitionsBuilder: (_, anim, __, child) {
                  return FadeTransition(opacity: anim, child: child);
                },
              );
            }
          case Routes.attribution:
            {
              return PageRouteBuilder(
                pageBuilder: (_, __, ___) =>
                    _makeMainScreen(AttributionRoutes()),
                settings: routeSettings,
                transitionsBuilder: (_, anim, __, child) {
                  return FadeTransition(opacity: anim, child: child);
                },
              );
            }
          case Routes.eligibilityChecks:
            {
              return PageRouteBuilder(
                pageBuilder: (_, __, ___) => _makeScreen(),
                settings: routeSettings,
                transitionsBuilder: (_, anim, __, child) {
                  return FadeTransition(opacity: anim, child: child);
                },
              );
            }

          case Routes.other:
            {
              return PageRouteBuilder(
                pageBuilder: (_, __, ___) => _makeMainScreen(OtherRoutes()),
                settings: routeSettings,
                transitionsBuilder: (_, anim, __, child) {
                  return FadeTransition(opacity: anim, child: child);
                },
              );
            }

          case InitializationRoutes.start:
            return PageRouteBuilder(
              pageBuilder: (_, __, ___) => () {
                return ActionScreen(StartAction());
              }(),
              settings: routeSettings,
              transitionsBuilder: (_, anim, __, child) {
                return FadeTransition(opacity: anim, child: child);
              },
            );
          case InitializationRoutes.startManually:
            return PageRouteBuilder(
              pageBuilder: (_, __, ___) => () {
                return ActionScreen(StartManuallyAction());
              }(),
              settings: routeSettings,
              transitionsBuilder: (_, anim, __, child) {
                return FadeTransition(opacity: anim, child: child);
              },
            );
          case InitializationRoutes.updateUserID:
            return PageRouteBuilder(
              pageBuilder: (_, __, ___) => () {
                return ActionScreen(UpdateUserIdAction());
              }(),
              settings: routeSettings,
              transitionsBuilder: (_, anim, __, child) {
                return FadeTransition(opacity: anim, child: child);
              },
            );
          case InitializationRoutes.userID:
            return PageRouteBuilder(
              pageBuilder: (_, __, ___) => () {
                return ActionScreen(UserIdAction());
              }(),
              settings: routeSettings,
              transitionsBuilder: (_, anim, __, child) {
                return FadeTransition(opacity: anim, child: child);
              },
            );
          case InitializationRoutes.deviceID:
            return PageRouteBuilder(
              pageBuilder: (_, __, ___) => () {
                return ActionScreen(DeviceIdAction());
              }(),
              settings: routeSettings,
              transitionsBuilder: (_, anim, __, child) {
                return FadeTransition(opacity: anim, child: child);
              },
            );
          case InitializationRoutes.logout:
            return PageRouteBuilder(
              pageBuilder: (_, __, ___) => () {
                return ActionScreen(LogoutAction());
              }(),
              settings: routeSettings,
              transitionsBuilder: (_, anim, __, child) {
                return FadeTransition(opacity: anim, child: child);
              },
            );
          case MakePurchaseRoutes.didFetchProductsNotification:
            return PageRouteBuilder(
              pageBuilder: (_, __, ___) => () {
                return ActionScreen(DidFetchProductsNotificationAction());
              }(),
              settings: routeSettings,
              transitionsBuilder: (_, anim, __, child) {
                return FadeTransition(opacity: anim, child: child);
              },
            );
          case MakePurchaseRoutes.productsDidFetchCallback:
            return PageRouteBuilder(
              pageBuilder: (_, __, ___) => () {
                return ActionScreen(ProductsDidFetchCallbackAction());
              }(),
              settings: routeSettings,
              transitionsBuilder: (_, anim, __, child) {
                return FadeTransition(opacity: anim, child: child);
              },
            );
          case MakePurchaseRoutes.refreshStoreKitProducts:
            return PageRouteBuilder(
              pageBuilder: (_, __, ___) => () {
                return ActionScreen(RefreshStoreKitProductsAction());
              }(),
              settings: routeSettings,
              transitionsBuilder: (_, anim, __, child) {
                return FadeTransition(opacity: anim, child: child);
              },
            );
          case MakePurchaseRoutes.products:
            return PageRouteBuilder(
              pageBuilder: (_, __, ___) => () {
                return ActionScreen(ProductsAction());
              }(),
              settings: routeSettings,
              transitionsBuilder: (_, anim, __, child) {
                return FadeTransition(opacity: anim, child: child);
              },
            );
          case MakePurchaseRoutes.product:
            return PageRouteBuilder(
              pageBuilder: (_, __, ___) => () {
                return ActionScreen(ProductAction());
              }(),
              settings: routeSettings,
              transitionsBuilder: (_, anim, __, child) {
                return FadeTransition(opacity: anim, child: child);
              },
            );
          case MakePurchaseRoutes.purchase:
            return PageRouteBuilder(
              pageBuilder: (_, __, ___) => () {
                return ActionScreen(PurchaseAction());
              }(),
              settings: routeSettings,
              transitionsBuilder: (_, anim, __, child) {
                return FadeTransition(opacity: anim, child: child);
              },
            );
          case MakePurchaseRoutes.purchaseWithoutValidation:
            return PageRouteBuilder(
              pageBuilder: (_, __, ___) => () {
                return ActionScreen(PurchaseWithoutValidationAction());
              }(),
              settings: routeSettings,
              transitionsBuilder: (_, anim, __, child) {
                return FadeTransition(opacity: anim, child: child);
              },
            );
          case MakePurchaseRoutes.purchasePromo:
            return PageRouteBuilder(
              pageBuilder: (_, __, ___) => () {
                return ActionScreen(PurchasePromoAction());
              }(),
              settings: routeSettings,
              transitionsBuilder: (_, anim, __, child) {
                return FadeTransition(opacity: anim, child: child);
              },
            );
          case HandlePurchaseRoutes.hasActiveSubscription:
            return PageRouteBuilder(
              pageBuilder: (_, __, ___) => () {
                return ActionScreen(HasActiveSubscriptionAction());
              }(),
              settings: routeSettings,
              transitionsBuilder: (_, anim, __, child) {
                return FadeTransition(opacity: anim, child: child);
              },
            );
          case HandlePurchaseRoutes.subscription:
            return PageRouteBuilder(
              pageBuilder: (_, __, ___) => () {
                return ActionScreen(SubscriptionAction());
              }(),
              settings: routeSettings,
              transitionsBuilder: (_, anim, __, child) {
                return FadeTransition(opacity: anim, child: child);
              },
            );
          case HandlePurchaseRoutes.subscriptions:
            return PageRouteBuilder(
              pageBuilder: (_, __, ___) => () {
                return ActionScreen(SubscriptionsAction());
              }(),
              settings: routeSettings,
              transitionsBuilder: (_, anim, __, child) {
                return FadeTransition(opacity: anim, child: child);
              },
            );
          case HandlePurchaseRoutes.nonRenewingPurchases:
            return PageRouteBuilder(
              pageBuilder: (_, __, ___) => () {
                return ActionScreen(NonRenewingPurchasesAction());
              }(),
              settings: routeSettings,
              transitionsBuilder: (_, anim, __, child) {
                return FadeTransition(opacity: anim, child: child);
              },
            );
          case HandlePurchaseRoutes.isNonRenewingPurchaseActive:
            return PageRouteBuilder(
              pageBuilder: (_, __, ___) => () {
                return ActionScreen(IsNonRenewingPurchaseAction());
              }(),
              settings: routeSettings,
              transitionsBuilder: (_, anim, __, child) {
                return FadeTransition(opacity: anim, child: child);
              },
            );
          case HandlePurchaseRoutes.restorePurchases:
            return PageRouteBuilder(
              pageBuilder: (_, __, ___) => () {
                return ActionScreen(RestorePurchasesAction());
              }(),
              settings: routeSettings,
              transitionsBuilder: (_, anim, __, child) {
                return FadeTransition(opacity: anim, child: child);
              },
            );
          case HandlePurchaseRoutes.migratePurchasesIfNeeded:
            return PageRouteBuilder(
              pageBuilder: (_, __, ___) => () {
                return ActionScreen(MigratePurchasesIfNeededAction());
              }(),
              settings: routeSettings,
              transitionsBuilder: (_, anim, __, child) {
                return FadeTransition(opacity: anim, child: child);
              },
            );
          case HandlePurchaseRoutes.fetchRawReceiptInfo:
            return PageRouteBuilder(
              pageBuilder: (_, __, ___) => () {
                return ActionScreen(FetchRawReceiptInfoAction());
              }(),
              settings: routeSettings,
              transitionsBuilder: (_, anim, __, child) {
                return FadeTransition(opacity: anim, child: child);
              },
            );
          case AttributionRoutes.disableIDFACollection:
            return PageRouteBuilder(
              pageBuilder: (_, __, ___) => () {
                return ActionScreen(DisableIDFACollectionAction());
              }(),
              settings: routeSettings,
              transitionsBuilder: (_, anim, __, child) {
                return FadeTransition(opacity: anim, child: child);
              },
            );
          case AttributionRoutes.setAdvertisingIdentifier:
            return PageRouteBuilder(
              pageBuilder: (_, __, ___) => () {
                return ActionScreen(SetAdvertisingIdentifierAction());
              }(),
              settings: routeSettings,
              transitionsBuilder: (_, anim, __, child) {
                return FadeTransition(opacity: anim, child: child);
              },
            );
          case AttributionRoutes.addAttribution:
            return PageRouteBuilder(
              pageBuilder: (_, __, ___) => () {
                return ActionScreen(AddAttributionAction());
              }(),
              settings: routeSettings,
              transitionsBuilder: (_, anim, __, child) {
                return FadeTransition(opacity: anim, child: child);
              },
            );
          case OtherRoutes.enableDebugLogs:
            return PageRouteBuilder(
              pageBuilder: (_, __, ___) => () {
                return ActionScreen(EnableDebugLogsAction());
              }(),
              settings: routeSettings,
              transitionsBuilder: (_, anim, __, child) {
                return FadeTransition(opacity: anim, child: child);
              },
            );

          case MakePurchaseRoutes.syncPurchases:
            return PageRouteBuilder(
              pageBuilder: (_, __, ___) => () {
                return ActionScreen(SyncPurchasesAction());
              }(),
              settings: routeSettings,
              transitionsBuilder: (_, anim, __, child) {
                return FadeTransition(opacity: anim, child: child);
              },
            );
          case MakePurchaseRoutes.presentOfferCodeRedemptionSheet:
            return PageRouteBuilder(
              pageBuilder: (_, __, ___) => () {
                return ActionScreen(PresentOfferCodeRedemptionSheetAction());
              }(),
              settings: routeSettings,
              transitionsBuilder: (_, anim, __, child) {
                return FadeTransition(opacity: anim, child: child);
              },
            );
          case HandlePurchaseRoutes.validateReceipt:
            return PageRouteBuilder(
              pageBuilder: (_, __, ___) => () {
                return ActionScreen(ValidateReceiptAction());
              }(),
              settings: routeSettings,
              transitionsBuilder: (_, anim, __, child) {
                return FadeTransition(opacity: anim, child: child);
              },
            );
          case HandlePurchaseRoutes.appStoreReceipt:
            return PageRouteBuilder(
              pageBuilder: (_, __, ___) => () {
                return ActionScreen(AppStoreReceiptAction());
              }(),
              settings: routeSettings,
              transitionsBuilder: (_, anim, __, child) {
                return FadeTransition(opacity: anim, child: child);
              },
            );
          case OtherRoutes.isSandbox:
            return PageRouteBuilder(
              pageBuilder: (_, __, ___) => () {
                return ActionScreen(IsSandboxAction());
              }(),
              settings: routeSettings,
              transitionsBuilder: (_, anim, __, child) {
                return FadeTransition(opacity: anim, child: child);
              },
            );
          case UserPropertiesRoutes.setUserProperty:
            return PageRouteBuilder(
              pageBuilder: (_, __, ___) => () {
                return ActionScreen(SetUserPropertyAction());
              }(),
              settings: routeSettings,
              transitionsBuilder: (_, anim, __, child) {
                return FadeTransition(opacity: anim, child: child);
              },
            );
          case UserPropertiesRoutes.incrementUserProperty:
            return PageRouteBuilder(
              pageBuilder: (_, __, ___) => () {
                return ActionScreen(IncrementUserPropertyAction());
              }(),
              settings: routeSettings,
              transitionsBuilder: (_, anim, __, child) {
                return FadeTransition(opacity: anim, child: child);
              },
            );
          case AttributionRoutes.disableAdTracking:
            return PageRouteBuilder(
              pageBuilder: (_, __, ___) => () {
                return ActionScreen(DisableAdTrackingAction());
              }(),
              settings: routeSettings,
              transitionsBuilder: (_, anim, __, child) {
                return FadeTransition(opacity: anim, child: child);
              },
            );
          default:
            return PageRouteBuilder(
              pageBuilder: (_, __, ___) => _makeScreen(),
              settings: routeSettings,
              transitionsBuilder: (_, anim, __, child) {
                return FadeTransition(opacity: anim, child: child);
              },
            );
        }
      },
    );
  }

  Widget _makeMainScreen<T extends BaseRoute>(T routes) {
    return MainScreenWidget(routes);
  }

  Widget _makeScreen() {
    return ActionScreen(StartManuallyAction());
  }
}
