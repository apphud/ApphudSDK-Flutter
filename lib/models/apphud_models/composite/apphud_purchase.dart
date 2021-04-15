import 'dart:io';

import 'package:apphud/models/apphud_models/android/apphud_purchase_result_android.dart';
import 'package:apphud/models/apphud_models/ios/apphud_purchase_result_ios.dart';

class ApphudPurchase {
  final ApphudPurchaseResultIos? iosResult;
  final List<ApphudPurchaseResultAndroid>? androidResult;

  ApphudPurchase({
    this.iosResult,
    this.androidResult,
  });

  factory ApphudPurchase.fromJson(dynamic? json) {
    if (json != null) {
      final dynamic localJson = json!;
      if (Platform.isAndroid) {
        final List<Map<dynamic, dynamic>> purchaseList =
            List<Map<dynamic, dynamic>>.from(localJson);

        final List<ApphudPurchaseResultAndroid>? androidResult = purchaseList
            .map((jsonItem) => ApphudPurchaseResultAndroid.fromJson(jsonItem))
            .toList();
        return ApphudPurchase(androidResult: androidResult);
      } else {
        final ApphudPurchaseResultIos? iosResult =
            ApphudPurchaseResultIos.fromJson(
                Map<dynamic, dynamic>.from(localJson));
        return ApphudPurchase(iosResult: iosResult);
      }
    }
    return ApphudPurchase();
  }
}
