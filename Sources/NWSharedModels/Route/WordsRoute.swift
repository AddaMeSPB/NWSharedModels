import URLRouting

public enum WordsRoute: Equatable {
    case list(query: Language)
}

public struct WordsRouter: ParserPrinter {
    public var body: some Router<WordsRoute> {
        OneOf {
            Route(.case(WordsRoute.list)) {
                Path { "words" }
                Parse(.memberwise(Language.init)) {
                    Query {
                        Field("from", .string, default: "")
                        Field("to", .string, default: "")
                    }
                }
            }
        }
    }
}
