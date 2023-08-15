import Foundation

/// List of language from Server Web UI
public enum LanguageList: String, Codable, Equatable {
    case bangla, english, russian, spanish, romanian

    /// List of Regional Code
    /// https://en.wikipedia.org/wiki/Regional_indicator_symbol
    var flag: String {
        switch self {
        case .bangla:
            return "bd".countryFlag
        case .english:
            return "us".countryFlag
        case .russian:
            return "ru".countryFlag
        case .spanish:
            return "es".countryFlag
        case .romanian:
            return "ro".countryFlag
        }
    }
}
