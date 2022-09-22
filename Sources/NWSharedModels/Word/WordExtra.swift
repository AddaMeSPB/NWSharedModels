import BSON
import Foundation

public enum LanguageList: String, Codable, Equatable {
    case bangla, english, russian
}

public struct Language: Codable {
    public init(from: String, to: String) {
        self.from = from
        self.to = to
    }

    public var from: String
    public var to: String
}

extension Language: Equatable {}

extension WordGetObject {
    public var englishWordTitle: String {
        return "\(icon ?? "") " + englishWord
    }

    public var banglaWordTitle: String {
        return "\(icon ?? "")\(banglaWord ?? "")"
    }

    public var russianWordTitle: String {
        return "\(icon ?? "")\(russianWord ?? "")"
    }
}

public enum WordLevel: String, Equatable, Codable, CaseIterable {
    case beginner = "Beginner"
    case intermediate = "Intermediate"
    case advanced = "Advanced"
}

public let allCases = WordLevel.allCases

public struct WordGetObjectWithUser: Codable {
     public let _id: ObjectId
     public let icon: String?
     public let englishWord: String?
     public let englishDefinition: String?
     public let englishImageLink: String?
     public let englishVideoLink: String?

     public let russianWord: String?
     public let russianDefinition: String?
     public let russianImageLink: String?
     public let russianVideoLink: String?

     public let banglaWord: String?
     public let banglaDefinition: String?
     public let banglaImageLink: String?
     public let banglaVideoLink: String?

     public let isReadFromNotification: Bool
     public let isReadFromView: Bool

     public let level: WordLevel

     public var createdAt: Date?
     public var updatedAt: Date?
}

public struct WordGetObject: Codable {

    public var _id: ObjectId
    public var icon: String?
    public let englishWord: String
    public let englishDefinition: String
    public let englishImageLink: String?
    public let englishVideoLink: String?

    public let russianWord: String?
    public let russianDefinition: String?
    public let russianImageLink: String?
    public let russianVideoLink: String?

    public let banglaWord: String?
    public let banglaDefinition: String?
    public let banglaImageLink: String?
    public let banglaVideoLink: String?

    public let isReadFromNotification: Bool
    public let isReadFromView: Bool
    public let user: UserGetPublicObject

    public let level: WordLevel

    public var createdAt: Date?
    public var updatedAt: Date?
}

public struct WordCreateObject: Codable {
    public var icon: String?
    public var englishWord: String
    public var englishDefinition: String
    public var englishImageLink: String? = nil
    public var englishVideoLink: String? = nil

    public var russianWord: String? = nil
    public var russianDefinition: String? = nil
    public var russianImageLink: String? = nil
    public var russianVideoLink: String? = nil

    public var banglaWord: String? = nil
    public var banglaDefinition: String? = nil
    public var banglaImageLink: String? = nil
    public var banglaVideoLink: String? = nil

    public var isReadFromNotification: Bool = false
    public var isReadFromView: Bool = false
    public var userId: ObjectId

    public var level: WordLevel = .beginner
}

public struct WordUpdateObject: Codable {
    public var icon: String?
    public var englishWord: String
    public var englishDefinition: String
    public var englishImageLink: String? = nil
    public var englishVideoLink: String? = nil

    public var russianWord: String? = nil
    public var russianDefinition: String? = nil
    public var russianImageLink: String? = nil
    public var russianVideoLink: String? = nil

    public var banglaWord: String? = nil
    public var banglaDefinition: String? = nil
    public var banglaImageLink: String? = nil
    public var banglaVideoLink: String? = nil

    public var isReadFromNotification: Bool = false
    public var isReadFromView: Bool = false

    public var level: WordLevel = .beginner
}

public struct WordEditObject: Codable {
    public var title: String = "Word Edit"
    public let word: WordGetObject
    public var editing: Bool = true
    public var wordLevelAllCases = WordLevel.allCases
}

extension Word {
    public var englishTitle: String {
        if let iconR = icon {
            return iconR + " " + englishWord
        }

        return englishWord
    }

    public var russianTitle: String? {
        if let icon = icon, let russianWord = russianWord {
            return icon + " " + russianWord
        }

        return russianWord
    }

    public var banglaTitle: String? {
        if let icon = icon, let banglaWord = banglaWord {
            return icon + " " + banglaWord
        }

        return banglaWord
    }

    public func buildNotificationTitle(from: String, to: String) -> String {
        var result = ""

        if from == "english" || to == "english" {
            result += englishTitle
        }

        if from == "russian" || to == "russian" {
            result += russianWord != nil ? " -> \(russianWord ?? "")" : ""
        }

        if from == "bangla" || to == "bangla" {
            result += banglaWord != nil ? " -> \(banglaWord ?? "")" : ""
        }

        return result
    }

    public func buildNotificationDefinition(from: String, to: String) -> String {
        var result = ""

        if from == "english" || to == "english" {
            result += englishDefinition
        }

        if from == "russian" || to == "russian" {
            result += russianDefinition != nil ? " -> \(russianDefinition ?? "")" : ""
        }

        if from == "bangla" || to == "bangla" {
            result += banglaDefinition != nil ? " -> \(banglaDefinition ?? "")" : ""
        }

        return result
    }
}

public struct Word: Equatable, Identifiable, Codable {

    public var id: String
    public let icon: String?
    public let englishWord: String
    public let englishDefinition: String
    public let englishImageLink: String?
    public let englishVideoLink: String?

    public var russianWord: String?
    public var russianDefinition: String?
    public var russianImageLink: String?
    public var russianVideoLink: String?

    public var banglaWord: String?
    public var banglaDefinition: String?
    public var banglaImageLink: String?
    public var banglaVideoLink: String?

    public var isReadFromNotification: Bool
    public var isReadFromView: Bool

    public var level: WordLevel
    public var user: UserGetPublicObject?

    public var createdAt: Date?
    public var updatedAt: Date?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case icon, englishWord, englishDefinition, englishImageLink, englishVideoLink
        case russianWord, russianDefinition, russianImageLink, russianVideoLink
        case banglaWord, banglaDefinition, banglaImageLink, banglaVideoLink
        case isReadFromView, level, isReadFromNotification, user
        case createdAt, updatedAt
    }

    public init(
        id: String, icon: String? = nil, englishWord: String, englishDefinition: String, englishImageLink: String? = nil, englishVideoLink: String? = nil,
        russianWord: String? = nil, russianDefinition: String? = nil, russianImageLink: String? = nil, russianVideoLink: String? = nil,
        banglaWord: String? = nil, banglaDefinition: String? = nil, banglaImageLink: String? = nil, banglaVideoLink: String? = nil,
        isReadFromNotification: Bool = false,
        isReadFromView: Bool = false,
        level: WordLevel = .beginner,
        user: UserGetPublicObject? = nil,
        createdAt: Date? = nil,
        updatedAt: Date? = nil

    ) {
        self.id = id
        self.icon = icon
        self.englishWord = englishWord
        self.englishDefinition = englishDefinition
        self.englishImageLink = englishImageLink
        self.englishVideoLink = englishVideoLink
        self.russianWord = russianWord
        self.russianDefinition = russianDefinition
        self.russianImageLink = russianImageLink
        self.russianVideoLink = russianVideoLink
        self.banglaWord = banglaWord
        self.banglaDefinition = banglaDefinition
        self.banglaImageLink = banglaImageLink
        self.banglaVideoLink = banglaVideoLink
        self.isReadFromNotification = isReadFromNotification
        self.isReadFromView = isReadFromView
        self.level = level
        self.user = user
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }

    public init(_ word: Word) {
        self.id = word.id
        self.icon = word.icon
        self.englishWord = word.englishWord
        self.englishDefinition = word.englishDefinition
        self.englishImageLink = word.englishImageLink
        self.englishVideoLink = word.englishVideoLink
        self.russianWord = word.russianWord
        self.russianDefinition = word.russianDefinition
        self.russianImageLink = word.russianImageLink
        self.russianVideoLink = word.russianVideoLink
        self.banglaWord = word.banglaWord
        self.banglaDefinition = word.banglaDefinition
        self.banglaImageLink = word.banglaImageLink
        self.banglaVideoLink = word.banglaVideoLink
        self.isReadFromNotification = word.isReadFromNotification
        self.isReadFromView = word.isReadFromView
        self.level = word.level
        self.user = word.user
        self.createdAt = word.createdAt
        self.updatedAt = word.updatedAt
    }
}

extension Word: Hashable {
    public static func == (lhs: Word, rhs: Word) -> Bool {
        return lhs.id == rhs.id && lhs.id == rhs.id
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension Word {
    public static let demo: Self = .init(id: "", englishWord: "", englishDefinition: "")
}

public struct DayWords: Codable, Equatable, Identifiable {
    public var id: String { return "\(dayNumber)" }
    public var dayNumber: Int
    public var words: [Word] = []

    public init(dayNumber: Int, words: [Word] = []) {
        self.dayNumber = dayNumber
        self.words = words
    }
}

extension DayWords {
    public static let happyPath: DayWords = .init(dayNumber: 117, words: Word.mockDatas)
}

public struct User: Codable, Equatable {
    public let fullName, language, id, role: String
}

extension User {
    public static var demo: User = .init(fullName: "Saroar", language: "ru", id: "624c31898addf0419b877915", role: "superAdmin")
}

extension Word {
    public static let mockEmpty: Word = .init(id: "", englishWord: "", englishDefinition: "")
    public static let mockDatas: [Word] = [
        Word(
            id: "D6168009-CEA2-45FC-874B-1426F7FB1005", icon: "🍏", englishWord: "Apple", englishDefinition: "AppleAppleAppleAppleAppleApple", englishImageLink: nil, englishVideoLink: nil,

            russianWord: "Яблока", russianDefinition: "ЯблокаЯблокаЯблокаЯблокаЯблокаЯблока", russianImageLink: nil, russianVideoLink: nil,

            banglaWord: "অ্যাপল", banglaDefinition: "অ্যাপলঅ্যাপলঅ্যাপলঅ্যাপল", banglaImageLink: nil, banglaVideoLink: nil,

            isReadFromNotification: false, isReadFromView: false, level: .beginner, user: nil, createdAt: nil, updatedAt: nil
        ),

        Word(
            id: "610800E5-A59C-44F5-ACC3-6809F39B42D2", icon: "🧰", englishWord: "Able", englishDefinition: "AbleAbleAbleAbleAbleAble", englishImageLink: nil, englishVideoLink: nil,

            russianWord: "Способный", russianDefinition: "СпособныйСпособныйСпособныйСпособныйСпособный", russianImageLink: nil, russianVideoLink: nil,

            banglaWord: "সক্ষম", banglaDefinition: "সক্ষমসক্ষমসক্ষমসক্ষমসক্ষমসক্ষম", banglaImageLink: nil, banglaVideoLink: nil,

            isReadFromNotification: false, isReadFromView: false, level: .beginner, user: nil, createdAt: nil, updatedAt: nil
        ),

        Word(
            id: "FC6F24EF-0DF7-4551-97AA-64E0340860D5", icon: "💨", englishWord: "Air", englishDefinition: "AirAirAirAirAirAir", englishImageLink: nil, englishVideoLink: nil,

            russianWord: "Воздух", russianDefinition: "ВоздухВоздухВоздухВоздух", russianImageLink: nil, russianVideoLink: nil,

            banglaWord: "এয়ার", banglaDefinition: "এয়ারএয়ারএয়ারএয়ারএয়ার", banglaImageLink: nil, banglaVideoLink: nil,

            isReadFromNotification: false, isReadFromView: false, level: .beginner, user: nil, createdAt: nil, updatedAt: nil
        )
    ]
}

