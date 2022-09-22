//
//  User.swift
//  
//
//  Created by Saroar Khandoker on 04.01.2022.
//

#if os(macOS) || os(Linux)
import Vapor
import Fluent
import FluentMongoDriver

public final class UserModel: Model {

    public init() {}

    public static let schema = "users"

	@ID(custom: "id") public var id: ObjectId?
	@Field(key: "fullName") public var fullName: String
	@Field(key: "language") public var language: UserLanguage
	@Enum(key: "role") public var role: UserRole
	@Field(key: "isEmailVerified") public var isEmailVerified: Bool

	@OptionalField(key: "email") public var email: String?
    @OptionalField(key: "phoneNumber") public var phoneNumber: String?
	@Field(key: "passwordHash") public var passwordHash: String

	@Children(for: \.$user) public var words: [WordModel]

	@Timestamp(key: "createdAt", on: .create) public var createdAt: Date?
	@Timestamp(key: "updatedAt", on: .update) public var updatedAt: Date?

    public init(
		id: ObjectId? = nil,
		fullName: String,
		language: UserLanguage,
        role: UserRole = .basic,
		isEmailVerified: Bool = false,
        phoneNumber: String? = nil,
		email: String? = nil,
        passwordHash: String
	) {
		self.fullName = fullName
		self.language = language
		self.role = role
		self.isEmailVerified = isEmailVerified
        self.phoneNumber = phoneNumber
		self.email = email
		self.passwordHash = passwordHash
	}

    public final class Public: Content {
        public init(
			id: ObjectId? = nil, fullName: String,
			language: UserLanguage, role: UserRole
		) {
			self.id = id
			self.fullName = fullName
			self.language = language
			self.role = role
		}

        public var id: ObjectId?
        public var fullName: String
        public var language: UserLanguage
        public var role: UserRole
	}

}

extension UserModel {
    public func create(_ input: UserCreateObject) {
		fullName = input.fullName
		language = input.language
		role = input.role
		email = input.email
        phoneNumber = input.phoneNumber
		passwordHash = input.passwordHash
	}
}


extension UserModel {
	public func mapGet() -> UserGetObject {
        return .init(
            id: id ?? ObjectId(),
            fullName: fullName,
            phoneNumber: phoneNumber,
            email: email,
            role: role,
            language: language
        )
	}

    public func mapGetPublic() -> UserGetPublicObject {
        return .init(id: id, fullName: fullName, role: role, language: language)
    }
}

extension UserCreateObject: Content {}

extension UserModel: Authenticatable {}

extension UserModel {
	public func convertToPublic() -> UserModel.Public {
		return UserModel.Public.init(id: id, fullName: fullName, language: language, role: role)
	}
}

extension EventLoopFuture where Value: UserModel {
	public func convertToPublic() -> EventLoopFuture<UserModel.Public> {
		return self.map { user in
			return user.convertToPublic()
		}
	}
}

extension Collection where Element: UserModel {
	public func convertToPublic() -> [UserModel.Public] {
		return self.map { $0.convertToPublic() }
	}
}

extension EventLoopFuture where Value == Array<UserModel> {
	public func convertToPublic() -> EventLoopFuture<[UserModel.Public]> {
		return self.map { $0.convertToPublic() }
	}
}

extension UserModel {
	public func requireID() throws -> IDValue {
		guard let id = self.id else {
			throw FluentError.idRequired
		}
		return id
	}
}

extension UserGetObject: Content {
    public init(from user: UserModel) {
        self.init(
            id: user.id ?? ObjectId(),
            fullName: user.fullName,
            phoneNumber: user.phoneNumber,
            email: user.email,
            role: user.role,
            language: user.language
        )
    }
}

extension UserModel {
    public func update(_ input: UserGetObject) async throws {
        fullName = input.fullName
        language = input.language
        role = input.role
        email = input.email
        phoneNumber = input.phoneNumber
    }
}

#endif
