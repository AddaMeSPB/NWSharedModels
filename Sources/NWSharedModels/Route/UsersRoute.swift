import URLRouting

public enum UsersRoute: Equatable {
    case user(id: String, route: UserRoute)
    case update(input: UserGetObject)
}

public let usersRouter = OneOf {
    Route(.case(UsersRoute.user)) {
        Path { Parse(.string) }
        userRouter
    }

    Route(.case(UsersRoute.update)) {
        Method.put
        Body(.json(UserGetObject.self))
    }
}

public enum UserRoute: Equatable {
    case find
    case deleteSoft
    case restore
    case delete
}

public let userRouter = OneOf {
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
