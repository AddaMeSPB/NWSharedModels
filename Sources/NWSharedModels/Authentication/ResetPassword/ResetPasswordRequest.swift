#if os(macOS) || os(Linux)
import Vapor

public struct ResetPasswordRequest: Content {
    public let email: String
}

extension ResetPasswordRequest: Validatable {
    public static func validations(_ validations: inout Validations) {
        validations.add("email", as: String.self, is: .email)
    }
}
#endif
