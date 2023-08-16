import Foundation
import BSON

public struct UserWord: Codable, Equatable {
    public static var collectionName = "user_words"

    public var id: ObjectId
    public var userId: ObjectId
    public var wordId: ObjectId
    public var isNotifying: Bool
    public var isComplete: Bool
    public var createdAt: Date?
    public var updatedAt: Date?

    public init(
        id: ObjectId,
        userId: ObjectId,
        wordId: ObjectId,
        isNotifying: Bool = false,
        isComplete: Bool = false,
        createdAt: Date? = nil,
        updatedAt: Date? = nil
    ) {
        self.id = id
        self.userId = userId
        self.wordId = wordId
        self.isNotifying = isNotifying
        self.isComplete = isComplete
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case userId
        case wordId
        case isNotifying
        case isComplete
        case createdAt
        case updatedAt
    }
}
