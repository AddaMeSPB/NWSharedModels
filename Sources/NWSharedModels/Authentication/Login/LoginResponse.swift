#if os(macOS) || os(Linux)
import Vapor

public struct LoginResponse: Content {
    public init(user: UserGetObject, accessToken: String, refreshToken: String) {
        self.user = user
        self.accessToken = accessToken
        self.refreshToken = refreshToken
    }

    public let user: UserGetObject
    public let accessToken: String
    public let refreshToken: String
}
#endif
