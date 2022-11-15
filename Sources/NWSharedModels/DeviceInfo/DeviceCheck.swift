#if os(macOS) || os(Linux)
import Vapor
import Fluent
import FluentMongoDriver

public final class DeviceCheckModel: Model {

    public static var schema = "device_check"
    public init() {}

    public init(
        id: ObjectId? = nil,
        identifierForVendor: String,
        bit0: Bool,
        bit1: Bool,
        maxTryCount: Int
    ) {
        self.id = id
        self.identifierForVendor = identifierForVendor
        self.bit0 = bit0
        self.bit1 = bit1
        self.maxTryCount = maxTryCount
    }

    @ID(custom: .id) public var id: ObjectId?
    @Field(key: "identifier_for_vendor") public var identifierForVendor: String
    @Field(key: "bit0") public var bit0: Bool
    @Field(key: "bit1") public var bit1: Bool
    @Field(key: "max_try_count") public var maxTryCount: Int

    @Timestamp(key: "created_at", on: .create) public var createdAt: Date?
    @Timestamp(key: "updated_at", on: .update) public var updatedAt: Date?
    @Timestamp(key: "deleted_at", on: .delete) public var deletedAt: Date?
}

extension DeviceCheckModel: Content {}

extension DeviceCheckModel {}

#endif

