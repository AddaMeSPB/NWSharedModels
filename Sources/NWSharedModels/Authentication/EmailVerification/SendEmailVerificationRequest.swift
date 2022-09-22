
#if os(macOS) || os(Linux)
import Vapor

public struct SendEmailVerificationRequest: Content {
	public let email: String
}
#endif
