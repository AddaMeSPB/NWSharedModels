import Foundation

public struct WillSendLoginSMSCode: Codable {
    public init(
        bool: Bool,
        maxCount: Int,
        leftCount: Int,
        status: String? = nil
    ) {
        self.bool = bool
        self.maxCount = maxCount
        self.leftCount = leftCount
        self.status = status
    }

    public var bool: Bool
    public var maxCount: Int = 3
    public var leftCount: Int = 3
    public var status: String?
}
extension WillSendLoginSMSCode: Equatable {}

public struct UpdateTwoBitsInput: Codable {
    public init(
        device_token: String,
        bit0: Bool,
        bit1: Bool
    ) {
        self.device_token = device_token
        self.bit0 = bit0
        self.bit1 = bit1
    }

    public var device_token: String
    public var bit0: Bool
    public var bit1: Bool
}
extension UpdateTwoBitsInput: Equatable {}
