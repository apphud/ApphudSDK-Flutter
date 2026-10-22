/// The identity model used by the native SDK.
///
/// V1 preserves the existing SDK behaviour. V2 separates the installation,
/// anonymous person and identified user. The native SDK creates and stores IDs.
/// Changing this option takes effect on the next app launch.
enum ApphudIdentityVersion { v1, v2 }
