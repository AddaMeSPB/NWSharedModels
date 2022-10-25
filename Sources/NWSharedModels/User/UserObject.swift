
import BSON

public enum UserRole: String, Codable, CaseIterable {
    case basic, superAdmin, englishAdmin, russianAdmin, banglaAdmin, spanishAdmin
}

public enum UserLanguage: String, Codable, CaseIterable {
    case russian, english, bangla, spanish
}

public struct UserRoleAndLanguage: Encodable {
    public init() {}

    public let roles = UserRole.allCases
    public let languages = UserLanguage.allCases
}

public struct UserCreateObject: Codable {
    public var fullName: String
    public var language: UserLanguage
    public var role: UserRole = .basic

    public var email: String?
    public var phoneNumber: String?
    public var passwordHash: String
}

public struct UserGetObject: Codable {

    public var id: ObjectId
    public var fullName: String
    public var phoneNumber: String?
    public var email: String?
    public var role: UserRole
    public var language: UserLanguage

    public init(
        id: ObjectId,
        fullName: String,
        phoneNumber: String? = nil,
        email: String? = nil,
        role: UserRole,
        language: UserLanguage
    ) {
        self.id = id
        self.fullName = fullName
        self.phoneNumber = phoneNumber
        self.email = email
        self.role = role
        self.language = language
    }
}

extension UserGetObject: Equatable {
    public static func ==(lhs: Self, rhs: Self) -> Bool {
        return lhs.id == rhs.id && lhs.role == rhs.role
        && lhs.language == rhs.language && lhs.fullName == rhs.fullName
        && lhs.phoneNumber == rhs.phoneNumber
    }
}

public struct UserGetPublicObject: Codable {

    public let id: ObjectId?
    public let fullName: String
    public let role: UserRole
    public let language: UserLanguage

    public init(
        id: ObjectId? = nil,
        fullName: String,
        role: UserRole,
        language: UserLanguage
    ) {
        self.id = id
        self.fullName = fullName
        self.role = role
        self.language = language
    }
}

extension UserGetPublicObject: Equatable {}

extension UserGetPublicObject {
    public static let demo: Self = .init(fullName: "Demo", role: .banglaAdmin, language: .english)
}

extension UserGetObject {
    public static let demo: Self = .init(id: ObjectId(), fullName: "Demo", role: .banglaAdmin, language: .english)
}
