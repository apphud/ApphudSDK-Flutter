import 'dart:async';

import 'package:apphud/apphud.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  const channel = MethodChannel('apphud');
  final calls = <MethodCall>[];
  final user = <String, dynamic>{
    'userId': 'test-A',
    'subscriptions': <dynamic>[],
    'purchases': <dynamic>[],
  };

  void handler(Future<dynamic> Function(MethodCall) response) {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (call) async {
      calls.add(call);
      return response(call);
    });
  }

  setUp(() {
    calls.clear();
    handler((call) async => user);
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('start defaults to V1 without host-owned identity inputs', () async {
    expect((await Apphud.start(apiKey: 'test-key')).userId, 'test-A');
    expect(calls.single.method, 'start');
    expect(calls.single.arguments, {
      'apiKey': 'test-key',
      'userID': null,
      'observerMode': false,
      'baseUrl': null,
      'identityVersion': 'v1',
    });
  });

  test('start forwards explicit V2, user and gateway', () async {
    await Apphud.start(
      apiKey: 'test-key',
      userID: 'test-A',
      baseUrl: 'https://example.invalid',
      identityVersion: ApphudIdentityVersion.v2,
    );
    expect(calls.single.arguments['identityVersion'], 'v2');
    expect(calls.single.arguments['userID'], 'test-A');
    expect(calls.single.arguments['baseUrl'], 'https://example.invalid');
    expect(calls.single.arguments.containsKey('installationId'), isFalse);
    expect(calls.single.arguments.containsKey('anonymousId'), isFalse);
  });

  test('legacy startManually keeps its V1 device ID', () async {
    await Apphud.startManually(apiKey: 'test-key', deviceID: 'legacy-device');
    expect(calls.single.arguments['identityVersion'], 'v1');
    expect(calls.single.arguments['deviceID'], 'legacy-device');
  });

  test('V2 startManually permits native-owned IDs only', () async {
    await expectLater(
      Apphud.startManually(
        apiKey: 'test-key',
        deviceID: 'host-id',
        identityVersion: ApphudIdentityVersion.v2,
      ),
      throwsArgumentError,
    );
    expect(calls, isEmpty);
    await Apphud.startManually(
      apiKey: 'test-key',
      identityVersion: ApphudIdentityVersion.v2,
    );
    expect(calls.single.arguments['identityVersion'], 'v2');
    expect(calls.single.arguments['deviceID'], isNull);
  });

  test('identity getters preserve null returned by native V1', () async {
    handler((call) async => null);
    expect(await Apphud.installationId(), isNull);
    expect(await Apphud.anonymousId(), isNull);
    expect(calls.map((call) => call.method), ['installationId', 'anonymousId']);
  });

  test('reads native IDs afresh across logout instead of caching them',
      () async {
    // The native SDK owns ID rotation. These fixtures check bridge forwarding.
    final anonymousReplies = ['native-before', 'native-after'];
    handler((call) async {
      if (call.method == 'installationId') return 'native-installation';
      if (call.method == 'anonymousId') return anonymousReplies.removeAt(0);
      return null;
    });
    final installation = await Apphud.installationId();
    expect(await Apphud.anonymousId(), 'native-before');
    await Apphud.logout();
    expect(await Apphud.installationId(), installation);
    expect(await Apphud.anonymousId(), 'native-after');
    expect(calls.where((call) => call.method == 'logout').single.arguments,
        isNull);
  });

  test('deprecated deviceID continues using its legacy native route', () async {
    handler((call) async => 'legacy-or-installation-id');
    // ignore: deprecated_member_use_from_same_package
    expect(await Apphud.deviceID(), 'legacy-or-installation-id');
    expect(calls.single.method, 'deviceID');
  });

  test('same-ID updates still reach native Identify logic', () async {
    await Apphud.updateUserID('test-A');
    await Apphud.updateUserID('test-A');
    expect(calls.map((call) => call.method), ['updateUserID', 'updateUserID']);
    expect(calls.every((call) => call.arguments['userID'] == 'test-A'), isTrue);
  });

  test('concurrent starts still share one native initialization', () async {
    final pending = Completer<Map<String, dynamic>>();
    handler((call) => pending.future);
    final first = Apphud.start(
      apiKey: 'test-key',
      identityVersion: ApphudIdentityVersion.v2,
    );
    final second = Apphud.start(
      apiKey: 'test-key',
      identityVersion: ApphudIdentityVersion.v2,
    );
    pending.complete(user);
    expect((await first).userId, 'test-A');
    expect((await second).userId, 'test-A');
    expect(calls, hasLength(1));
  });

  test('Restore returns the native transferred entitlement without extra flags',
      () async {
    handler((call) async => {
          'subscriptions': [
            {
              'productId': 'subscription-transferred-to-B',
              'expiresAt': 9999999999,
              'startedAt': 1,
              'isInRetryBilling': false,
              'isAutorenewEnabled': true,
              'isIntroductoryActivated': false,
              'isActive': true,
              'status': 'regular',
            }
          ],
          'nrPurchases': <dynamic>[],
        });
    final restored = await Apphud.restorePurchases();
    expect(restored.subscriptions.single.productId,
        'subscription-transferred-to-B');
    expect(restored.subscriptions.single.isActive, isTrue);
    expect(restored.error, isNull);
    expect(calls.single.method, 'restorePurchases');
    expect(calls.single.arguments, isNull);
  });
}
