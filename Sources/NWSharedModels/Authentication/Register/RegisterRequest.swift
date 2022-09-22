#if os(macOS) || os(Linux)
import Vapor

public struct RegisterRequest: Content {
    public let fullName: String
    public let email: String
    public let role: UserRole
    public let language: UserLanguage
    public let passwordHash: String
    public let confirmPassword: String
}

extension RegisterRequest: Validatable {
    public static func validations(_ validations: inout Validations) {
      validations.add("fullName", as: String.self, is: .count(3...))
      validations.add("email", as: String.self, is: .email)
      validations.add("passwordHash", as: String.self, is: .count(8...))
      validations.add("role", as: String.self, is: .case(of: UserRole.self ))
      validations.add("language", as: String.self, is: .case(of: UserLanguage.self))
    }
}

extension UserModel {
    public convenience init(from register: RegisterRequest, hash: String) throws {
      self.init(
        fullName: register.fullName,
        language: register.language,
        role: register.role,
        email: register.email,
        passwordHash: hash
      )
    }
}
#endif
