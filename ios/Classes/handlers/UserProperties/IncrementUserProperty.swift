import ApphudSDK

final class IncrementUserPropertyRequest: Request {
    typealias ArgumentProvider = IncrementUserPropertyArgumentParser

    func startRequest(arguments: (key: ApphudUserPropertyKey, by: Any), result: @escaping FlutterResult) {
        Apphud.incrementUserProperty(key: arguments.key, by: arguments.by)
        result(nil)
    }
}

final class IncrementUserPropertyArgumentParser: Parser {

    typealias ArgumentType = (key: ApphudUserPropertyKey, by: Any)

    func parse(args: [String : Any]?) throws -> ArgumentType {
        guard let args = args, let keyString = args["key"] as? String else {
            throw(InternalError(code: "400", message: "key is required argument"))
        }
        guard let by = args["by"] as? Any else {
            throw(InternalError(code: "400", message: "by is required argument"))
         }

        return (keyString.toApphudUserPropertyKey(), by)
    }
}