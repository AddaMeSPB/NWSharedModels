
#if os(macOS) || os(Linux)
import Vapor

public struct AccessTokenRequest: Content {
    public let refreshToken: String
}
#endif
