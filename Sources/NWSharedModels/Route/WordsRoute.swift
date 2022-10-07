import URLRouting

public enum WordsRoute: Equatable {
    case list(query: Language)
}

public let wordsRouter = OneOf {
    Route(.case(WordsRoute.list)) {
        Path { "api"; "words" }
        Parse(.memberwise(Language.init)) {
            Query {
                Field("from", .string, default: "")
                Field("to", .string, default: "")
            }
        }
    }
}
