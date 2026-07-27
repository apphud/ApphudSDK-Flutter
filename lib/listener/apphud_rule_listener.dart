import 'package:apphud/models/apphud_models/apphud_paywall.dart';
import 'package:apphud/models/apphud_models/apphud_product.dart';
import 'package:apphud/models/apphud_models/apphud_rule.dart';
import 'package:apphud/models/apphud_models/composite/apphud_purchase_result.dart';

/// Listener for Apphud Rules lifecycle events (Figma rule paywalls and legacy screens).
///
/// Rule gates (`shouldPerform` / `shouldShow`) always auto-allow on the native
/// side. Use [Apphud.showPendingRuleScreen] only if you previously delayed
/// presentation via a future plugin API; with the current events-only bridge,
/// screens are shown automatically.
abstract class ApphudRuleListener {
  /// Called when a rule-triggered screen is visible to the user.
  Future<void> apphudRuleScreenDidAppear(ApphudRule rule);

  /// Called when the user taps purchase (or restore) on a rule screen.
  Future<void> apphudRuleWillPurchase(ApphudRule rule, ApphudProduct? product);

  /// Called when a purchase from a rule screen finishes (success or failure).
  ///
  /// On success [result] contains the purchased `subscription` or
  /// `nonRenewingPurchase`, plus the `transaction` on [iOS] (`null` for
  /// StoreKit 2 purchases) and the `purchase` on [Android].
  Future<void> apphudRulePurchaseCompleted(
    ApphudRule rule,
    ApphudPurchaseResult result,
  );

  /// Called when a rule screen is about to dismiss.
  Future<void> apphudRuleScreenWillDismiss(ApphudRule rule, String? error);

  /// Called after a rule screen has been dismissed.
  Future<void> apphudRuleScreenDidDismiss(ApphudRule rule);

  /// Called after a survey answer is selected on a legacy HTML rule screen.
  Future<void> apphudRuleDidSelectSurveyAnswer(
    ApphudRule rule,
    String question,
    String answer,
  );

  /// Called when a paywall rule has no visual screen payload.
  /// Present the [paywall] yourself.
  Future<void> apphudRulePaywallWithoutScreen(
    ApphudRule rule,
    ApphudPaywall paywall,
  );
}
