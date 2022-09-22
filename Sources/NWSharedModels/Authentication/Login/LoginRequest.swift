#if os(macOS) || os(Linux)
import Vapor

public struct LoginRequest: Content {
	public let email: String
    public let password: String
}

extension LoginRequest: Validatable {
    public static func validations(_ validations: inout Validations) {
		validations.add("email", as: String.self, is: .email)
		validations.add("passwordHash", as: String.self, is: !.empty)
	}
}
#endif
