import BSON
import Foundation

public enum LanguageList: String, Codable, Equatable {
    case bangla, english, russian, spanish
}

public struct Language: Codable {
    public init(
        from: String,
        to: String
    ) {
        self.from = from
        self.to = to
    }

    public var from: String
    public var to: String
}

extension Language {
    public static let empty: Language = .init(from: "", to: "")
}

extension Language: Equatable {}

public enum WordLevel: String, Equatable, Codable, CaseIterable {
    case beginner = "Beginner"
    case intermediate = "Intermediate"
    case advanced = "Advanced"
}

public let allCases = WordLevel.allCases

public struct WordCreateObject: Codable {
    public var userId: ObjectId
    public var icon: String?
    public var english: Translation
    public var russian: Translation?
    public var bangla: Translation?
    public var spanish: Translation?

    public var isReadFromNotification: Bool = false
    public var isReadFromView: Bool = false

    public var isActive: Bool = false
    public var isComplete: Bool = false

    public var level: WordLevel = .beginner
}

public struct WordUpdateObject: Codable {
    public var id: ObjectId
    public var icon: String?
    public var english: Translation
    public var russian: Translation?
    public var bangla: Translation?
    public var spanish: Translation?

    public var isReadFromNotification: Bool = false
    public var isReadFromView: Bool = false

    public var isActive: Bool = false
    public var isComplete: Bool = false

    public var level: WordLevel = .beginner
}

// MARK:- WordGetObject WithUser
public struct WordGetObjectWithUser: Codable, Equatable, Identifiable {

    public var id: String
    public let icon: String?

    public var english: Translation
    public var russian: Translation?
    public var bangla: Translation?
    public var spanish: Translation?

    public var imageLink: String?
    public var videoLink: String?

    public var isReadFromNotification: Bool
    public var isReadFromView: Bool

    public var level: WordLevel
    public var user: UserGetPublicObject?

    public var isActive: Bool = false
    public var isComplete: Bool = false

    public var createdAt: Date?
    public var updatedAt: Date?

    public init(
        id: String,
        icon: String? = nil,
        english: Translation,
        russian: Translation? = nil,
        bangla: Translation? = nil,
        spanish: Translation? = nil,
        imageLink: String? = nil,
        videoLink: String? = nil,
        isReadFromNotification: Bool,
        isReadFromView: Bool,
        level: WordLevel,
        user: UserGetPublicObject? = nil,
        isActive: Bool = false,
        isComplete: Bool = false,
        createdAt: Date? = nil,
        updatedAt: Date? = nil
    ) {
        self.id = id
        self.icon = icon
        self.english = english
        self.russian = russian
        self.bangla = bangla
        self.spanish = spanish
        self.imageLink = imageLink
        self.videoLink = videoLink
        self.isReadFromNotification = isReadFromNotification
        self.isReadFromView = isReadFromView
        self.level = level
        self.user = user
        self.isActive = isActive
        self.isComplete = isComplete
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }

    public enum CodingKeys: String, CodingKey {
        case id = "_id"
        case icon

        case english, russian, bangla, spanish

        case imageLink, videoLink

        case isReadFromView, level, isReadFromNotification, user

        case isActive, isComplete

        case createdAt, updatedAt
    }

}

extension WordGetObjectWithUser: Hashable {
    public static func == (lhs: WordGetObjectWithUser, rhs: WordGetObjectWithUser) -> Bool {
        return lhs.id == rhs.id && lhs.id == rhs.id
        && lhs.english == rhs.english
        && lhs.russian == rhs.russian
        && lhs.bangla == rhs.bangla
        && lhs.spanish == rhs.spanish
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension WordGetObjectWithUser {

    public static var empty: WordGetObjectWithUser = .init(
        id: "",
        english: .empty,
        isReadFromNotification: false,
        isReadFromView: false, level: .beginner
    )

    public var englishWordTitle: String {
        return "\(icon ?? "") " + english.word
    }

    public func banglaWordTitle() -> String? {
        if let wordb = bangla?.word {
            return "\(icon ?? "")\(wordb)"
        }
        return nil
    }

    public func russianWordTitle() -> String? {
        if let wordr = russian?.word {
            return "\(icon ?? "")" + wordr
        }
        return nil
    }

    public func spanishWordTitle() -> String? {
        if let words = spanish?.word {
            return "\(icon ?? "")" + words
        } else {
            return nil
        }
    }
}

// MARK:- WordGetObject WithoutUser
public struct WordGetObjectWithoutUser: Codable, Equatable, Identifiable {

    public var id: String
    public let icon: String?

    public var from: Translation
    public var to: Translation

    public var english: Translation
    public var russian: Translation?
    public var bangla: Translation?
    public var spanish: Translation?

    public var imageLink: String?
    public var videoLink: String?

    public var isReadFromNotification: Bool
    public var isReadFromView: Bool

    public var level: WordLevel
    public var user: UserGetPublicObject?

    public var isActive: Bool = false
    public var isComplete: Bool = false

    public var createdAt: Date?
    public var updatedAt: Date?

    public init(
        id: String,
        icon: String? = nil,
        from: Translation,
        to: Translation,
        english: Translation,
        russian: Translation? = nil,
        bangla: Translation? = nil,
        spanish: Translation? = nil,
        imageLink: String? = nil,
        videoLink: String? = nil,
        isReadFromNotification: Bool,
        isReadFromView: Bool,
        level: WordLevel,
        user: UserGetPublicObject? = nil,
        isActive: Bool = false,
        isComplete: Bool = false,
        createdAt: Date? = nil,
        updatedAt: Date? = nil
    ) {
        self.id = id
        self.icon = icon
        self.from = from
        self.to = to
        self.english = english
        self.russian = russian
        self.bangla = bangla
        self.spanish = spanish
        self.imageLink = imageLink
        self.videoLink = videoLink
        self.isReadFromNotification = isReadFromNotification
        self.isReadFromView = isReadFromView
        self.level = level
        self.user = user
        self.isActive = isActive
        self.isComplete = isComplete
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }

    public enum CodingKeys: String, CodingKey {
        case id = "_id"
        case icon

        case from, to
        case english, russian, bangla, spanish

        case imageLink, videoLink

        case isReadFromView, level, isReadFromNotification, user

        case isActive, isComplete

        case createdAt, updatedAt
    }

}

extension WordGetObjectWithoutUser: Hashable {
    public static func == (lhs: WordGetObjectWithoutUser, rhs: WordGetObjectWithoutUser) -> Bool {
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

extension WordGetObjectWithoutUser {
    public static var empty: WordGetObjectWithoutUser = .init(
        id: "", from: .empty , to: .empty,
        english: .empty,
        isReadFromNotification: false,
        isReadFromView: false, level: .beginner
    )
}

public struct Translation: Codable, Equatable {
    public var word: String
    public var definition: String

    public init(
        word: String = "",
        definition: String = ""
    ) {
        self.word = word
        self.definition = definition
    }
}

extension Translation: Hashable {
    public static func == (lhs: Translation, rhs: Translation) -> Bool {
        return lhs.word == rhs.word && lhs.definition == rhs.definition
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(word)
        hasher.combine(definition)
    }
}

extension Translation {
    public static var empty: Translation = .init(word: "", definition: "")
}
