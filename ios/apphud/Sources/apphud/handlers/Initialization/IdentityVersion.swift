import ApphudSDK
import Foundation

enum IdentityVersionArgument {
    static func parse(_ value: Any?) throws -> ApphudIdentityVersion {
        guard let value, !(value is NSNull) else { return .v1 }
        switch value as? String {
        case "v1": return .v1
        case "v2": return .v2
        default:
            throw InternalError(code: "400", message: "identityVersion must be v1 or v2")
        }
    }
}
