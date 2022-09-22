
import URLRouting

public enum SiteRoute: Equatable {
    case authEngine(AuthEngineRoute)
    case word(WordsRoute)
    case terms
    case privacy
}

public enum WordsRoute: Equatable {
    case list(query: Language)
}

public let wordsRouter = OneOf {
    Route(.case(WordsRoute.list)) {
        Path { "api/words" }
        Parse(.memberwise(Language.init)) {
            Query {
                Field("from", .string, default: "")
                Field("to", .string, default: "")
            }
        }
    }
}

public let siteRouter = OneOf {

    Route(.case(SiteRoute.authEngine)) {
        Path { "v1" }
        authEngineRoute
    }

    Route(.case(SiteRoute.word)) {
        Path { "v1" }
        wordsRouter
    }

    Route(.case(SiteRoute.terms)) {
        Path { "terms" }
    }

    Route(.case(SiteRoute.privacy)) {
        Path { "privacy" }
    }
}

import URLRouting

public enum AuthEngineRoute: Equatable {
    case authentication(AuthenticationRoute)
    case users(UsersRoute)
}

public let authEngineRoute = OneOf {
    Route(.case(AuthEngineRoute.authentication)) {
        Path { "auth" }
        authenticationRouter
    }

    Route(.case(AuthEngineRoute.users)) {
        Path { "users" }
        usersRouter
    }

}

public enum AuthenticationRoute: Equatable {
    case login(input: VerifySMSInOutput)
    case verifySms(input: VerifySMSInOutput)
    case refreshToken(input: RefreshTokenInput)
}

public let authenticationRouter = OneOf {
    Route(.case(AuthenticationRoute.login)) {
        Path { "login" }
        Method.post
        Body(.json(VerifySMSInOutput.self))
    }

    Route(.case(AuthenticationRoute.verifySms)) {
        Path { "verify_sms" }
        Method.post
        Body(.json(VerifySMSInOutput.self))
    }

    Route(.case(AuthenticationRoute.refreshToken)) {
        Path { "refresh_token" }
        Method.post
        Body(.json(RefreshTokenInput.self))
    }
}

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
