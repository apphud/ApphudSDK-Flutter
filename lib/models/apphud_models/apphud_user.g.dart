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
      rawPlacements: (json['rawPlacements'] as List<dynamic>)
          .map((e) => ApphudPlacement.fromJson(e as Map))
          .toList(),
      rawPaywalls: (json['rawPaywalls'] as List<dynamic>)
          .map((e) => ApphudPaywall.fromJson(e as Map))
          .toList(),
      hasPurchases: json['hasPurchases'] as bool,
    );

Map<String, dynamic> _$ApphudUserToJson(ApphudUser instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'subscriptions': instance.subscriptions,
      'purchases': instance.purchases,
      'rawPlacements': instance.rawPlacements,
      'rawPaywalls': instance.rawPaywalls,
      'hasPurchases': instance.hasPurchases,
    };
