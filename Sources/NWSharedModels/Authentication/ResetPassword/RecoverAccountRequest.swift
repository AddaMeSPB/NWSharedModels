#if os(macOS) || os(Linux)
import Vapor

public struct RecoverAccountRequest: Content {
    public let password: String
    public let confirmPassword: String
    public let token: String
}

extension RecoverAccountRequest: Validatable {
    public static func validations(_ validations: inout Validations) {
		validations.add("password", as: String.self, is: .count(8...))
		validations.add("confirmPassword", as: String.self, is: !.empty)
		validations.add("token", as: String.self, is: !.empty)
	}
}
#endif
