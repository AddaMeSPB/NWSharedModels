import BSON
import Foundation

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
    public var romanian: Translation?

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
    public var romanian: Translation?

    public var isReadFromNotification: Bool = false
    public var isReadFromView: Bool = false

    public var isActive: Bool = false
    public var isComplete: Bool = false

    public var level: WordLevel = .beginner
}

// MARK: WordGetObject WithUser
public struct WordGetObjectWithUser: Codable, Equatable, Identifiable {

    public var id: String
    public let icon: String?

    public var english: Translation
    public var russian: Translation?
    public var bangla: Translation?
    public var spanish: Translation?
    public var romanian: Translation?

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
        romanian: Translation? = nil,
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
        self.romanian = romanian
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

        case english, russian, bangla, spanish, romanian

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
        && lhs.romanian == rhs.romanian
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

    public func romanianWordTitle() -> String? {
        if let words = romanian?.word {
            return "\(icon ?? "")" + words
        } else {
            return nil
        }
    }


}

// MARK: WordGetObject WithoutUser
public struct WordResponse: Codable, Equatable, Identifiable {

    public var id: String
    public let icon: String?

    public var from: Translation
    public var to: Translation

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
        case imageLink, videoLink
        case isReadFromView, level, isReadFromNotification, user
        case isActive, isComplete
        case createdAt, updatedAt
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
        id: "", from: .empty , to: .empty,
        isReadFromNotification: false,
        isReadFromView: false, level: .beginner
    )
}

extension WordResponse {

    var iconView: String { return self.icon ?? "" }
    var showQuizButton: Bool { return self.isActive && !self.isComplete }

    var imageURL: String {
        return self.imageLink ?? "https://img.freepik.com/free-vector/realistic-set-whole-cut-juicy-red-green-apples-isolated-white_1284-33173.jpg"
    }

//    var englishFlagString: String {
//        return self.english.definition.first?.description ?? ""
//    }
//
//    var russianFlagString: String {
//        return self.russian?.definition.first?.description ?? ""
//    }
//
//    var banglaFlagString: String {
//        return self.bangla?.definition.first?.description ?? ""
//    }
//
//    var spanishFlagString: String {
//        return self.spanish?.definition.first?.description ?? ""
//    }
//
//    var romanianFlagString: String {
//        return self.romanian?.definition.first?.description ?? ""
//    }
//
//    var englishDefDic: [String] {
//        return self.english.definition
//            .split(separator: ",")
//            .map { String($0) }
//    }
//
//    var russianDefDic: [String] {
//        return self.russian?.definition
//            .split(separator: ",")
//            .map { String($0) } ?? []
//    }
//
//    var banglaDefDic: [String] {
//        return self.bangla?.definition
//            .split(separator: ",")
//            .map { self.banglaFlagString  + String($0) } ?? []
//    }
//
//    var spanishDefDic: [String] {
//        return self.spanish?.definition
//            .split(separator: ",")
//            .map { self.spanishFlagString + String($0) } ?? []
//    }
//
//    var romanianDefDic: [String] {
//        return self.romanian?.definition
//            .split(separator: ",")
//            .map { self.romanianFlagString + String($0) } ?? []
//    }

//    var wordDefinations: [String] {
//        return [self.englishDefDic, russianDefDic].transposed()
//    }

//    public var bla: [String] {
//
//        var engflag: String? = nil
//        var engResult: [String] = []
//
//        var rusFlag: String? = nil
//        var rusResult: [String] = []
//
//        for lang in self.englishDefDic {
//            let rest = sentence(lang).rest
//            if sentence(lang).match != nil {
//                engflag = sentence(lang).match
//                engResult.append(rest)
//            } else {
//                engResult.append("\(engflag ?? "") \(rest)")
//            }
//        }
//
//
//        for lang in self.russianDefDic {
//            let rest = sentence(lang).rest
//            if sentence(lang).match != nil {
//                rusFlag = sentence(lang).match
//                rusResult.append(rest)
//            } else {
//                rusResult.append("\(rusFlag ?? "") \(rest)")
//            }
//        }
//
//        return [engResult, rusResult].transposed()
//
//    }

}

// MOVE Start
func sentence(_ str: String) -> (match: String?, rest: String) {
        let prefix = str.prefix(1)
        guard let string = String(prefix).isEmoji else {
            return (nil, str)
        }
        let rest = String(str[prefix.endIndex...])
        return (string, rest)
}

extension Collection where Self.Element: RandomAccessCollection {
    func transposed() -> [Self.Element.Element] {
        guard let rowWithMaxElems = self.max(by: { $0.count < $1.count }) else { return [] }
        return rowWithMaxElems.indices.flatMap { index in
            self.compactMap { $0[safe: index] }
        }
    }
}

extension RandomAccessCollection {
    subscript(safe index: Index) -> Element? {
        get {
            indices.contains(index) ? self[index] : nil
        }
    }
}

extension Character {
    var foundEmoji: Character? {
        if  let propertiy = self.unicodeScalars.first?.properties {
            return propertiy.isEmoji == true ? self : nil
        }

        return nil
    }
}

extension String {
    var isEmoji: String? {
        return self.first?.foundEmoji?.description
    }
}

// Move END
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

