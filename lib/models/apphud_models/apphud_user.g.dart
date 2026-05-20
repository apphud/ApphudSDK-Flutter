// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apphud_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApphudUser _$ApphudUserFromJson(Map json) => ApphudUser(
      userId: json['userId'] as String,
      subscriptions: (json['subscriptions'] as List<dynamic>)
          .map((e) => ApphudSubscriptionWrapper.fromJson(e as Map))
          .toList(),
      purchases: (json['purchases'] as List<dynamic>)
          .map((e) => ApphudNonRenewingPurchase.fromJson(e as Map))
          .toList(),
      rawPlacements: (json['rawPlacements'] as List<dynamic>?)
              ?.map((e) => ApphudPlacement.fromJson(e as Map))
              .toList() ??
          const [],
      hasPurchases: json['hasPurchases'] as bool? ?? false,
      totalDevicesCount: (json['totalDevicesCount'] as num?)?.toInt() ?? 0,
      internalId: json['internalId'] as String? ?? '',
      experimentName: json['experimentName'] as String?,
      variationName: json['variationName'] as String?,
      targetingName: json['targetingName'] as String?,
      remoteConfigString: json['remoteConfigString'] as String?,
    );

Map<String, dynamic> _$ApphudUserToJson(ApphudUser instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'subscriptions': instance.subscriptions,
      'purchases': instance.purchases,
      'rawPlacements': instance.rawPlacements,
      'hasPurchases': instance.hasPurchases,
      'totalDevicesCount': instance.totalDevicesCount,
      'internalId': instance.internalId,
      'experimentName': instance.experimentName,
      'variationName': instance.variationName,
      'targetingName': instance.targetingName,
      'remoteConfigString': instance.remoteConfigString,
    };
