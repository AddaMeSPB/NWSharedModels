//
//  UserResponse.swift
//  
//
//  Created by Alif on 7/6/20.
//

#if os(macOS) || os(Linux)
import Vapor

extension RefreshTokenResponse: Content {}
extension LoginResponseP: Content {}
extension UserSuccessResponse: Content {}

#endif

public struct UserSuccessResponse: Codable {
    let user: UserGetObject
    
    public init(user: UserGetObject) {
        self.user = user
    }
}

public struct RefreshTokenResponse: Codable {
    public var accessToken: String
    public var refreshToken: String
    
    public init(accessToken: String, refreshToken: String) {
      self.accessToken = accessToken
      self.refreshToken = refreshToken
    }
}


// MARK: - Login Response for mobile auth

public struct LoginResponseP: Codable, Equatable {
  public let status: String
  public let user: UserGetObject?
  public let access: RefreshTokenResponse?

  public init(
    status: String,
    user: UserGetObject? = nil,
    access: RefreshTokenResponse? = nil
  ) {
    self.status = status
    self.user = user
    self.access = access
  }

    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.user == rhs.user
        && lhs.access?.accessToken == rhs.access?.accessToken
    }
}
