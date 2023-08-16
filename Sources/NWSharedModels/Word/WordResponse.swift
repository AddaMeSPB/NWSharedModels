import Foundation
import BSON

public struct WordResponse: Codable, Equatable, Identifiable {

    public var id: ObjectId
    public let icon: String?

    public var from: Translation
    public var to: Translation

    public var imageLink: String?
    public var videoLink: String?

    public var level: WordLevel
    public var user: UserGetPublicObject?

    public var isNotifying: Bool = false
    public var isComplete: Bool = false

    public var createdAt: Date?
    public var updatedAt: Date?

    public init(
        id: ObjectId,
        icon: String? = nil,
        from: Translation,
        to: Translation,
        imageLink: String? = nil,
        videoLink: String? = nil,
        level: WordLevel,
        user: UserGetPublicObject? = nil,
        isNotifying: Bool = false,
        isComplete: Bool = false,
        createdAt: Date? = nil,
        updatedAt: Date? = nil
    ) {
        self.id = id
        self.icon = icon
        self.from = from
        self.to = to
        self.imageLink = imageLink
        self.videoLink = videoLink
        self.level = level
        self.user = user
        self.isNotifying = isNotifying
        self.isComplete = isComplete
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }

    public enum CodingKeys: String, CodingKey {
        case id = "_id"
        case icon
        case from, to
        case imageLink, videoLink
        case level, user
        case isNotifying, isComplete
        case createdAt, updatedAt
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        // Decode ObjectId
        id = try container.decode(ObjectId.self, forKey: CodingKeys.id)

        // Decode optional String values
        icon = try container.decodeIfPresent(String.self, forKey: CodingKeys.icon)
        imageLink = try container.decodeIfPresent(String.self, forKey: CodingKeys.imageLink)
        videoLink = try container.decodeIfPresent(String.self, forKey: CodingKeys.videoLink)

        // Decode Translation values
        from = try container.decode(Translation.self, forKey: CodingKeys.from)
        to = try container.decode(Translation.self, forKey: CodingKeys.to)

        // Decode WordLevel
        level = try container.decode(WordLevel.self, forKey: CodingKeys.level)

        // Decode optional UserGetPublicObject
        user = try container.decodeIfPresent(UserGetPublicObject.self, forKey: CodingKeys.user)

        // Decode Bool values
        isNotifying = try container.decodeIfPresent(Bool.self, forKey: CodingKeys.isNotifying) ?? false
        isComplete = try container.decodeIfPresent(Bool.self, forKey: CodingKeys.isComplete) ?? false

        // Decode optional Date values
        createdAt = try container.decodeIfPresent(Date.self, forKey: CodingKeys.createdAt)
        updatedAt = try container.decodeIfPresent(Date.self, forKey: CodingKeys.updatedAt)
    }

}

extension WordResponse: Hashable {
    public static func == (lhs: WordResponse, rhs: WordResponse) -> Bool {
        return lhs.id == rhs.id && lhs.id == rhs.id
        && lhs.from == rhs.from
        && lhs.to == rhs.to
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(from)
        hasher.combine(to)
    }
}

extension WordResponse {
    public static var empty: WordResponse = .init(
        id: .init(), from: .empty , to: .empty, level: .beginner
    )
}

extension WordResponse {

    var iconView: String { return self.icon ?? "" }
    var showQuizButton: Bool { return self.isNotifying && !self.isComplete }

    var imageURL: String {
      return self.imageLink ?? "https://img.freepik.com/free-vector/realistic-set-whole-cut-juicy-red-green-apples-isolated-white_1284-33173.jpg"
    }

}

