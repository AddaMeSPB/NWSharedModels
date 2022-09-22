//
//  RefreshToken.swift
//  
//
//  Created by Saroar Khandoker on 20.01.2022.
//

#if os(macOS) || os(Linux)
import Vapor
import Fluent
import MongoKitten

public final class RefreshToken: Model {
    public static let schema = "userRefreshTokens"

	@ID(custom: "id") public var id: ObjectId?
	@Field(key: "token") public var token: String
	@Parent(key: "userId") public var user: UserModel

	@Field(key: "expiresAt") public var expiresAt: Date
	@Field(key: "issuedAt") public var issuedAt: Date

    public init() {}

    public init(id: ObjectId? = nil, token: String,
		 userID: ObjectId, expiresAt: Date = Date().addingTimeInterval(Constants.REFRESH_TOKEN_LIFETIME), issuedAt: Date = Date()) {
		self.id = id
		self.token = token
		self.$user.id = userID
		self.expiresAt = expiresAt
		self.issuedAt = issuedAt
	}
}
#endif

