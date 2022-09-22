
import BSON

public enum UserRole: String, Codable, CaseIterable {
    case basic, superAdmin, englishAdmin, russianAdmin, banglaAdmin
}

public enum UserLanguage: String, Codable, CaseIterable {
    case russian, english, bangla
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

    public var email: String
    public var passwordHash: String
}

public struct UserGetObject: Codable {

    public let id: ObjectId?
    public let fullName: String
    public let email: String
    public let role: UserRole
    public let language: UserLanguage

    public init(
        id: ObjectId? = nil, fullName: String,
        email: String, role: UserRole,
        language: UserLanguage
    ) {
        self.id = id
        self.fullName = fullName
        self.email = email
        self.role = role
        self.language = language
    }
}

extension UserGetObject: Equatable {}

public struct UserGetPublicObject: Codable {

    public let id: ObjectId?
    public let fullName: String
    public let role: UserRole
    public let language: UserLanguage

    public init(
        id: ObjectId? = nil, fullName: String,
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
    public static let demo: Self = .init(fullName: "", role: .banglaAdmin, language: .english)
}
