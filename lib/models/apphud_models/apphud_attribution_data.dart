class ApphudAttributionData {
  final Map<String, dynamic> rawData;
  final String? adNetwork;
  final String? channel;
  final String? campaign;
  final String? adSet;
  final String? creative;
  final String? keyword;
  final String? custom1;
  final String? custom2;

  ApphudAttributionData({
    required this.rawData,
    this.adNetwork,
    this.channel,
    this.campaign,
    this.adSet,
    this.creative,
    this.keyword,
    this.custom1,
    this.custom2,
  });

  Map<String, dynamic> toJson() {
    return {
      'rawData': rawData,
      'adNetwork': adNetwork,
      'channel': channel,
      'campaign': campaign,
      'adSet': adSet,
      'creative': creative,
      'keyword': keyword,
      'custom1': custom1,
      'custom2': custom2,
    };
  }
}
