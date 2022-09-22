
#if os(macOS) || os(Linux)
import Vapor

public struct AccessTokenResponse: Content {
    public init(refreshToken: String, accessToken: String) {
        self.refreshToken = refreshToken
        self.accessToken = accessToken
    }

    public let refreshToken: String
    public let accessToken: String
}
#endif
