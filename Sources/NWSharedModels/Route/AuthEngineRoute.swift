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
