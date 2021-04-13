import 'dart:io';

import 'package:apphud/models/apphud_models/android/apphud_purchase_result_android.dart';
import 'package:apphud/models/apphud_models/ios/apphud_purchase_result_ios.dart';

import '../../mapper.dart';

class ApphudPurchase {
  ApphudPurchaseResultIos? iosResult;
  List<ApphudPurchaseResultAndroid?>? androidResult;

  ApphudPurchase.fromJson(dynamic json) {
    if (Platform.isAndroid) {
      final listJson = List<dynamic>.from(json);
      androidResult = listJson
          .map((json) => Mapper.ApphudPurchaseResultAndroidFromJson(json)).toList();
    } else if (Platform.isIOS) {
      iosResult = Mapper.ApphudPurchaseResultIosFromJson(json);
    }
  }
}
