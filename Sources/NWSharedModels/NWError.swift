import Foundation


public struct NWError: Error, Equatable {

    public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.description == rhs.description
    }

    public var description: String
    public let reason: Error?

    public static var nonHTTPResponse: Self {
        .init(description: "Non-HTTP response received", reason: nil)
    }

    public static var missingTokenFromIOS: Self {
        .init(description: "JWT token are missing on ios app", reason: nil)
    }

    public static func requestFailed(_ statusCode: Int) -> Self {
        return .init(description: "Request Failed HTTP with error - \(statusCode)", reason: nil)
    }

    public static func serverError(_ statusCode: Int) -> Self {
        return .init(description: "Server Error - \(statusCode)", reason: nil)
    }

    public static func networkError(_ error: Error?) -> Self {
        return .init(description: "Failed to load the request: \(String(describing: error))", reason: error)
    }

    public static func authError(_ statusCode: Int) -> Self {
        return .init(description: "Authentication Token is expired: \(statusCode)", reason: nil)
    }

    public static func decodingError(_ decError: DecodingError) -> Self {
        return .init(description: "Failed to process response: \(decError)", reason: decError)
    }

    public static func unhandledResponse(_ statusCode: Int) -> Self {
        return .init(description: "Unhandled HTTP Response Status code: \(statusCode)", reason: nil)
    }

    public static func custom(_ status: String, _ error: Error?) -> Self {
        return .init(description: "\(status)", reason: error)
    }
}

public struct ApiError: Codable, Error, Equatable, LocalizedError {
  public let errorDump: String
  public let file: String
  public let line: UInt
  public let message: String

  public init(
    error: Error,
    file: StaticString = #fileID,
    line: UInt = #line
  ) {
    var string = ""
    dump(error, to: &string)
    self.errorDump = string
    self.file = String(describing: file)
    self.line = line
    self.message = error.localizedDescription  // TODO: separate user facing from debug facing messages?
  }

  public var errorDescription: String? {
    self.message
  }
}
