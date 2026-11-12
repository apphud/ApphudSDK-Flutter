import 'package:apphud/apphud.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  const channel = MethodChannel('apphud');
  final calls = <MethodCall>[];

  void handler(dynamic response) {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (call) async {
      calls.add(call);
      return response;
    });
  }

  setUp(calls.clear);

  tearDown(() {
    debugDefaultTargetPlatformOverride = null;
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('consumePurchase on Android returns null on success', () async {
    debugDefaultTargetPlatformOverride = TargetPlatform.android;
    handler(null);

    expect(await Apphud.consumePurchase('test-token'), isNull);
    expect(calls.single.method, 'consumePurchase');
    expect(calls.single.arguments, {'purchaseToken': 'test-token'});
  });

  test('consumePurchase on Android parses the native error', () async {
    debugDefaultTargetPlatformOverride = TargetPlatform.android;
    handler(<String, dynamic>{
      'message': 'Item not owned',
      'errorCode': 8,
      'networkIssue': false,
      'billingResponseCode': 8,
      'billingErrorTitle': 'ITEM_NOT_OWNED',
    });

    final error = await Apphud.consumePurchase('test-token');

    expect(error, isNotNull);
    expect(error!.message, 'Item not owned');
    expect(error.errorCode, 8);
    expect(error.billingResponseCode, 8);
    expect(error.billingErrorTitle, 'ITEM_NOT_OWNED');
  });

  test('consumePurchase on iOS returns an error without a native call',
      () async {
    debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
    handler(null);

    final error = await Apphud.consumePurchase('test-token');

    expect(error?.message, 'consumePurchase is available on Android only');
    expect(calls, isEmpty);
  });
}
