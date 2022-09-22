//
//  Payload.swift
//  
//
//  Created by Saroar Khandoker on 20.01.2022.
//

//#if os(macOS) || os(Linux)
//import Vapor
//import JWT
//import JWTKit
//import MongoKitten
//
//public struct Payload: JWTPayload, Authenticatable {
//	// User-releated stuff
//    public var user: UserModel
//	// JWT stuff
//    public var exp: ExpirationClaim
//
//    public func verify(using signer: JWTSigner) throws {
//		try self.exp.verifyNotExpired()
//	}
//
//    public init(with user: UserModel) throws {
//		self.user = user
//		self.exp = ExpirationClaim(value: Date().addingTimeInterval(Constants.ACCESS_TOKEN_LIFETIME))
//	}
//}
//
//extension UserModel {
//    public convenience init(from payload: Payload) {
//		self.init(
//			id: payload.user.id,
//			fullName: payload.user.fullName,
//			language: payload.user.language,
//			role: payload.user.role,
//			email: payload.user.email,
//			passwordHash: "__"
//		)
//	}
//}
//
////extension Application {
////	var jwt: JWTSigner {
////		return JWTSigner.hs256(key: Array("mysupersecretsecurityKey".utf8))
////	}
////}
//#endif
