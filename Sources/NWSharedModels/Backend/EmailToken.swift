//
//  EmailToken.swift
//  
//
//  Created by Saroar Khandoker on 20.01.2022.
//

#if os(macOS) || os(Linux)
import Vapor
import Fluent
import MongoKitten

public final class EmailToken: Model {
    public static let schema = "userEmailTokens"
    
    @ID(custom: "id") public var id: ObjectId?
    @Parent(key: "userId") public var user: UserModel
    @Field(key: "token") public var token: String
    @Field(key: "expiresAt") public var expiresAt: Date
    
    public init() {}
    
    public init(
        id: ObjectId? = nil,
        userID: ObjectId,
        token: String,
        expiresAt: Date = Date().addingTimeInterval(Constants.EMAIL_TOKEN_LIFETIME)
    ) {
        self.id = id
        self.$user.id = userID
        self.token = token
        self.expiresAt = expiresAt
    }
}
#endif
