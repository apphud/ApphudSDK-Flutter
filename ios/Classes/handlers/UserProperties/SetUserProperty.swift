import ApphudSDK

final class SetUserPropertyRequest: Request {
    typealias ArgumentProvider = SetUserPropertyArgumentParser

    func startRequest(arguments: (apiKey: String, userID: String?, observerMode: Bool), result: @escaping FlutterResult) {
        Apphud.start(apiKey: arguments.apiKey,
                     userID: arguments.userID,
                     observerMode: arguments.observerMode)
        result(nil)
    }
}

final class SetUserPropertyArgumentParser: Parser {

    typealias ArgumentType = (key: ApphudUserPropertyKey, value: Any?, setOnce: Bool)

    func parse(args: [String : Any]?) throws -> ArgumentType {
        guard let args = args, let keyString = args["key"] as? String else {
            throw(InternalError(code: "400", message: "key is required argument"))
        }
        let value = args["value"] as? Any
        let setOnce = args["setOnce"] as? Bool

        return (keyString.toApphudUserPropertyKey(),
                value,
                setOnce ?? false)
    }

    func parseApphudUserPropertyKey(keyString : String) -> ApphudUserPropertyKey {

    }
}

extension String {
    func toApphudUserPropertyKey() -> ApphudUserPropertyKey {
        switch self {
        case "email":
            return ApphudUserPropertyKey.email
        case "email":
            return ApphudUserPropertyKey.email
        case "name":
            return ApphudUserPropertyKey.name
        case "phone":
            return ApphudUserPropertyKey.phone
        case "age":
            return ApphudUserPropertyKey.age
        case "gender":
            return ApphudUserPropertyKey.gender
        case "cohort":
            return ApphudUserPropertyKey.cohort
        default:
            return ApphudUserPropertyKey.init(self)
        }
    }
}
