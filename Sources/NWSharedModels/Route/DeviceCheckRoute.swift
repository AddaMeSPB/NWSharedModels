import URLRouting
import Foundation

public enum DeviceCheckRoute: Equatable {
    case queryTwoBits(Data)
    case updateTwoBits(UpdateTwoBitsInput)
    case userFraudCheck(Data)
}

public struct DeviceCheckRouter: ParserPrinter {
    public var body: some Router<DeviceCheckRoute> {
        OneOf {
            Route(.case(DeviceCheckRoute.updateTwoBits)) {
                Path { "update_two_bits" }
                Method.post
                Body(.json(UpdateTwoBitsInput.self))
            }

            Route(.case(DeviceCheckRoute.queryTwoBits)) {
                Path { "query_two_bits" }
                Method.post
                Body()
            }

            Route(.case(DeviceCheckRoute.userFraudCheck)) {
                Path { "user_fraud_check" }
                Method.post
                Body()
            }
        }
    }
}
