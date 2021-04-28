class ApphudUserPropertyKey {
  final String keyName;

  const ApphudUserPropertyKey._(this.keyName);

  static const email = ApphudUserPropertyKey._('email');
  static const name = ApphudUserPropertyKey._('name');
  static const phone = ApphudUserPropertyKey._('phone');
  static const age = ApphudUserPropertyKey._('age');
  static const gender = ApphudUserPropertyKey._('gender');
  static const cohort = ApphudUserPropertyKey._('cohort');

  ApphudUserPropertyKey.customProperty(this.keyName)
      : assert(keyName.isNotEmpty);

  @override
  String toString() {
    return 'ApphudUserPropertyKey.$keyName';
  }
}
