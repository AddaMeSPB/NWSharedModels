import URLRouting

public enum UserWordRoute: Equatable {
    case create(UserWord)
    case update(input: UserWord)
}

public struct UserWordRouter: ParserPrinter {
    public var body: some Router<UserWordRoute> {
        OneOf {
            Route(.case(UserWordRoute.create)) {
                Method.post
                Body(.json(UserWord.self))
            }

            Route(.case(UserWordRoute.update)) {
                Path { "update" }
                Method.post
                Body(.json(UserWord.self))
            }
        }
    }
}
