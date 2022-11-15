#if os(macOS) || os(Linux)
import Vapor
import Fluent
import FluentMongoDriver

public final class WordModel: Model, Content, PropertyNames {

    public static var schema = "new_words"

    public init() {}

    public init(
        id: ObjectId? = nil,
        icon: String? = nil,
        english: Translation,
        russian: Translation? = nil,
        bangla: Translation? = nil,
        spanish: Translation? = nil,
        isReadFromNotification: Bool,
        isReadFromView: Bool,
        level: WordLevel,
        userId: ObjectId,
        isActive: Bool,
        isComplete: Bool,
        createdAt: Date? = nil,
        updatedAt: Date? = nil
    ) {
        self.id = id
        self.icon = icon
        self.english = english
        self.russian = russian
        self.bangla = bangla
        self.spanish = spanish
        self.isReadFromNotification = isReadFromNotification
        self.isReadFromView = isReadFromView
        self.level = level
        self.$user.id = userId
        self.isActive = isActive
        self.isComplete = isComplete
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }

    @ID(custom: "_id") public var id: ObjectId?

    @OptionalField(key: "icon") public var icon: String?

    @Field(key: "english") public var english: Translation
    @OptionalField(key: "russian") public var russian: Translation?
    @OptionalField(key: "bangla") public var bangla: Translation?
    @OptionalField(key: "spanish") public var spanish: Translation?

    @Field(key: "isReadFromNotification") public var isReadFromNotification: Bool
    @Field(key: "isReadFromView") public var isReadFromView: Bool
    @Field(key: "level") public var level: WordLevel
    @Parent(key: "userId") public var user: UserModel

    @Field(key: "isActive") public var isActive: Bool
    @Field(key: "isComplete") public var isComplete: Bool

    @Timestamp(key: "createdAt", on: .create) public var createdAt: Date?
    @Timestamp(key: "updatedAt", on: .update) public var updatedAt: Date?

}

extension WordModel {

    public func mapGet() -> WordGetObjectWithUser {
        .init(
            id: id!.hexString,
            icon: icon,
            english: english,
            russian: russian,
            bangla: bangla,
            spanish: spanish,

            isReadFromNotification: isReadFromNotification,
            isReadFromView: isReadFromView,
            level: level,
            user: user.mapGetPublic(),
            isActive: isActive, isComplete: isComplete,

            createdAt: createdAt, updatedAt: updatedAt
        )
    }

    public func create(_ input: WordCreateObject) {
        icon = input.icon
        english = input.english
        russian = input.russian
        bangla = input.bangla
        spanish = input.spanish

        isReadFromNotification = input.isReadFromNotification
        isReadFromView = input.isReadFromView
        level = input.level

        isActive = input.isActive
        isComplete = input.isComplete
    }

    public func update(_ input: WordUpdateObject) async throws {
        icon = input.icon
        english = input.english
        russian = input.russian
        bangla = input.bangla
        spanish = input.spanish

        isReadFromNotification = input.isReadFromNotification
        isReadFromView = input.isReadFromView
        level = input.level

        isActive = input.isActive
        isComplete = input.isComplete

    }
}

extension WordCreateObject: Content {}
extension WordGetObjectWithUser: Content {}
extension WordGetObjectWithoutUser: Content {}
#endif
