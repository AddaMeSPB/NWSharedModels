import URLRouting

public enum UsersRoute: Equatable {
    case user(id: String, route: UserRoute)
    case update(input: UserGetObject)
    case userWord(UserWordRoute)
}

public struct UsersRouter: ParserPrinter {
    public var body: some Router<UsersRoute> {
        OneOf {
            Route(.case(UsersRoute.user)) {
                Path { Parse(.string) }
                UserRouter()
            }

            Route(.case(UsersRoute.update)) {
                Method.put
                Body(.json(UserGetObject.self))
            }

          Route(.case(UsersRoute.userWord)) {
              Path { "user_words" }
              UserWordRouter()
          }
        }
    }
}

public enum UserRoute: Equatable {
    case find
    case deleteSoft
    case restore
    case delete
}

public struct UserRouter: ParserPrinter {
    public var body: some Router<UserRoute> {
        OneOf {
            Route(.case(UserRoute.find))

            Route(.case(UserRoute.deleteSoft)) {
                Method.delete
                Path { "soft" }
            }

            Route(.case(UserRoute.restore)) {
                Method.put
                Path { "restore" }
            }

            Route(.case(UserRoute.delete)) {
                Method.delete
            }
        }
    }
}
