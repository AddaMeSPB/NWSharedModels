import Foundation

/// Use for search query from server API
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

extension Language: Equatable {}

extension Language {
    public var fromFlag: String {
        return LanguageList(rawValue: from.lowercased())?.flag ?? ""
    }

    public var toFlag: String {
        return LanguageList(rawValue: to.lowercased())?.flag ?? ""
    }
}

extension Language {
    public static let empty: Language = .init(from: "", to: "")
    public static let bdRu: Language = .init(from: "bd", to: "ru")
}
