import BSON
import Foundation

public enum LanguageList: String, Codable, Equatable {
    case bangla, english, russian, spanish
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

    public func banglaWordTitle() -> String? {
        if let wordb = banglaWord {
            return "\(icon ?? "")\(wordb)"
        }
        return nil
    }

    public func russianWordTitle() -> String? {
        if let wordr = russianWord {
            return "\(icon ?? "")" + wordr
        }
        return nil
    }

    public func spanishWordTitle() -> String? {
        if let words = spanishWord {
            return "\(icon ?? "")" + words
        } else {
            return nil
        }
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

    public var spanishWord: String?
    public var spanishDefinition: String?
    public var spanishImageLink: String?
    public var spanishVideoLink: String?

     public let isReadFromNotification: Bool
     public let isReadFromView: Bool

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

    public var spanishWord: String? = nil
    public var spanishDefinition: String? = nil
    public var spanishImageLink: String? = nil
    public var spanishVideoLink: String? = nil

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

    public var spanishWord: String? = nil
    public var spanishDefinition: String? = nil
    public var spanishImageLink: String? = nil
    public var spanishVideoLink: String? = nil

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

extension WordGetObject {
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

    public var spanishTitle: String? {
        if let icon = icon, let spanishWord = spanishWord {
            return icon + " " + spanishWord
        }

        return spanishWord
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

        if from == "spanish" || to == "spanish" {
            result += spanishWord != nil ? " -> \(spanishWord ?? "")" : ""
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

        if from == "spanish" || to == "spanish" {
            result += spanishDefinition != nil ? " -> \(spanishDefinition ?? "")" : ""
        }

        return result
    }
}

public struct WordGetObject: Equatable, Identifiable, Codable {

    public var id: String
    public let icon: String?

    // English
    public var englishWord: String
    public var englishDefinition: String
    public var englishImageLink: String?
    public var englishVideoLink: String?

    // Russian
    public var russianWord: String?
    public var russianDefinition: String?
    public var russianImageLink: String?
    public var russianVideoLink: String?

    // Bangla
    public var banglaWord: String?
    public var banglaDefinition: String?
    public var banglaImageLink: String?
    public var banglaVideoLink: String?

    // Spanish
    public var spanishWord: String?
    public var spanishDefinition: String?
    public var spanishImageLink: String?
    public var spanishVideoLink: String?

    public var isReadFromNotification: Bool
    public var isReadFromView: Bool

    public var level: WordLevel
    public var user: UserGetPublicObject?

    public var isActive: Bool = false
    public var isComplete: Bool = false

    public var createdAt: Date?
    public var updatedAt: Date?

    public enum CodingKeys: String, CodingKey {
        case id = "_id"
        case icon

        case englishWord, englishDefinition, englishImageLink, englishVideoLink

        case russianWord, russianDefinition, russianImageLink, russianVideoLink

        case banglaWord, banglaDefinition, banglaImageLink, banglaVideoLink

        case spanishWord, spanishDefinition, spanishImageLink, spanishVideoLink

        case isReadFromView, level, isReadFromNotification, user

        case isActive, isComplete

        case createdAt, updatedAt
    }

    public init(
        id: String, icon: String? = nil,

        // English
        englishWord: String,
        englishDefinition: String,
        englishImageLink: String? = nil,
        englishVideoLink: String? = nil,

        // Russian
        russianWord: String? = nil,
        russianDefinition: String? = nil,
        russianImageLink: String? = nil,
        russianVideoLink: String? = nil,

        // Bangla
        banglaWord: String? = nil,
        banglaDefinition: String? = nil,
        banglaImageLink: String? = nil,
        banglaVideoLink: String? = nil,

        // Spanish
        spanishWord: String? = nil,
        spanishDefinition: String? = nil,
        spanishImageLink: String? = nil,
        spanishVideoLink: String? = nil,

        isReadFromNotification: Bool = false,
        isReadFromView: Bool = false,
        level: WordLevel = .beginner,
        user: UserGetPublicObject? = nil,

        isActive: Bool = false,
        isComplete: Bool = false,

        createdAt: Date? = nil,
        updatedAt: Date? = nil

    ) {
        self.id = id
        self.icon = icon

        // English
        self.englishWord = englishWord
        self.englishDefinition = englishDefinition
        self.englishImageLink = englishImageLink
        self.englishVideoLink = englishVideoLink

        // Russian
        self.russianWord = russianWord
        self.russianDefinition = russianDefinition
        self.russianImageLink = russianImageLink
        self.russianVideoLink = russianVideoLink

        // Bangla
        self.banglaWord = banglaWord
        self.banglaDefinition = banglaDefinition
        self.banglaImageLink = banglaImageLink
        self.banglaVideoLink = banglaVideoLink

        // Spanish
        self.spanishWord = spanishWord
        self.spanishDefinition = spanishDefinition
        self.spanishImageLink = spanishImageLink
        self.spanishVideoLink = spanishVideoLink

        self.isReadFromNotification = isReadFromNotification
        self.isReadFromView = isReadFromView
        self.level = level
        self.user = user

        self.isActive = isActive
        self.isComplete = isComplete

        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }

}

extension WordGetObject: Hashable {
    public static func == (lhs: WordGetObject, rhs: WordGetObject) -> Bool {
        return lhs.id == rhs.id && lhs.id == rhs.id
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension WordGetObject {
    public static let demo: Self = .init(
        id: UUID().uuidString,
        englishWord: "Apple",
        englishDefinition: """
        'An apple a day keeps the doctor away' is a common English-language proverb that appeared in the 19th century, advocating for the consumption of apples, and by extension, 'if one eats healthy foods, one will remain in good health and will not need to see the doctor often.'
        """,
        banglaWord: "আপেল",
        banglaDefinition: """
        'একটি আপেল প্রতিদিন ডাক্তারকে দূরে রাখে' একটি সাধারণ ইংরেজি ভাষার প্রবাদ যা 19 শতকে আবির্ভূত হয়েছিল, আপেল খাওয়ার পক্ষে পরামর্শ দিয়েছিল, এবং বর্ধিতভাবে, 'যদি কেউ স্বাস্থ্যকর খাবার খায়, তবে একজন সুস্থ থাকবে এবং সুস্থ থাকবে। প্রায়ই ডাক্তার দেখাতে হবে না।'
        """

    )
}

public struct DayWords: Codable, Equatable, Identifiable {
    public var id: String { return "\(dayNumber)" }
    public var dayNumber: Int
    public var words: [WordGetObject] = []

    public init(dayNumber: Int, words: [WordGetObject] = []) {
        self.dayNumber = dayNumber
        self.words = words
    }
}

extension DayWords {
    public static let happyPath: DayWords = .init(dayNumber: 117, words: WordGetObject.mockDatas)
}

public struct User: Codable, Equatable {
    public let fullName, language, id, role: String
}

extension User {
    public static var demo: User = .init(fullName: "Saroar", language: "ru", id: "624c31898addf0419b877915", role: "superAdmin")
}

extension WordGetObject {
    public static let mockEmpty: WordGetObject = .init(id: "", englishWord: "", englishDefinition: "")
    public static let mockDatas: [WordGetObject] = [
        WordGetObject(
            id: "D6168009-CEA2-45FC-874B-1426F7FB1005", icon: "🍏", englishWord: "Apple", englishDefinition: "AppleAppleAppleAppleAppleApple", englishImageLink: nil, englishVideoLink: nil,

            russianWord: "Яблока", russianDefinition: "ЯблокаЯблокаЯблокаЯблокаЯблокаЯблока", russianImageLink: nil, russianVideoLink: nil,

            banglaWord: "অ্যাপল", banglaDefinition: "অ্যাপলঅ্যাপলঅ্যাপলঅ্যাপল", banglaImageLink: nil, banglaVideoLink: nil,

            isReadFromNotification: false, isReadFromView: false, level: .beginner, user: nil, createdAt: nil, updatedAt: nil
        ),

        WordGetObject(
            id: "610800E5-A59C-44F5-ACC3-6809F39B42D2", icon: "🧰", englishWord: "Able", englishDefinition: "AbleAbleAbleAbleAbleAble", englishImageLink: nil, englishVideoLink: nil,

            russianWord: "Способный", russianDefinition: "СпособныйСпособныйСпособныйСпособныйСпособный", russianImageLink: nil, russianVideoLink: nil,

            banglaWord: "সক্ষম", banglaDefinition: "সক্ষমসক্ষমসক্ষমসক্ষমসক্ষমসক্ষম", banglaImageLink: nil, banglaVideoLink: nil,

            isReadFromNotification: false, isReadFromView: false, level: .beginner, user: nil, createdAt: nil, updatedAt: nil
        ),

        WordGetObject(
            id: "FC6F24EF-0DF7-4551-97AA-64E0340860D5", icon: "💨", englishWord: "Air", englishDefinition: "Air Air Air Air Air Air", englishImageLink: nil, englishVideoLink: nil,

            russianWord: "Воздух", russianDefinition: "Воздух Воздух Воздух Воздух", russianImageLink: nil, russianVideoLink: nil,

            banglaWord: "এয়ার", banglaDefinition: "এয়ার এয়ার এয়ার এয়ার এয়ার", banglaImageLink: nil, banglaVideoLink: nil,

            isReadFromNotification: false, isReadFromView: false, level: .beginner, user: nil, createdAt: nil, updatedAt: nil
        )
    ]
}

