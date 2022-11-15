import Foundation

//public struct DeviceCheckResponse: Codable {
//    public init(device_token: String, transaction_id: String, timestamp: Int64, bit0: Bool = false, bit1: Bool = false, last_update_time: Int64? = nil, bit_state_msg: String? = nil) {
//        self.device_token = device_token
//        self.transaction_id = transaction_id
//        self.timestamp = timestamp
//        self.bit0 = bit0
//        self.bit1 = bit1
//        self.last_update_time = last_update_time
//        self.bit_state_msg = bit_state_msg
//    }
//
//   public let device_token: String
//   public let transaction_id: String
//   public let timestamp: Int64
//   public var bit0: Bool = false
//   public var bit1: Bool = false
//   public var last_update_time: Int64?
//   public var bit_state_msg: String? = nil
//}
//extension DeviceCheckResponse: Equatable {}

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
