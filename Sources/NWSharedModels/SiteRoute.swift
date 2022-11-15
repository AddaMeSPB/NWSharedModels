
import URLRouting

public enum RootRoute: Equatable {
    case api(APIRoute)
    case home
}

public enum APIRoute: Equatable {
    case authEngine(AuthEngineRoute)
    case word(WordsRoute)
    case appStore(AppStoreRoute)
    case deviceCheck(DeviceCheckRoute)
}

public enum SiteRoute: Equatable {
    case authEngine(AuthEngineRoute)
    case word(WordsRoute)
    case appStore(AppStoreRoute)
    case deviceCheck(DeviceCheckRoute)
    case terms
    case privacy
}

public enum HomeRoute: Equatable {
    case terms
    case privacy
}

// MARK:- rootRouter

public let rootRouter = OneOf {
    Route(.case(RootRoute.api)) {
        Path { "v1"; "api" }
        apiRouter
    }
    Route(.case(RootRoute.home))
}

// MARK:- apiRouter

public let apiRouter = OneOf {
    Route(.case(APIRoute.authEngine)) {
        authEngineRoute
    }

    Route(.case(APIRoute.word)) {
        wordsRouter
    }

    Route(.case(APIRoute.appStore)) {
        appStoreRouter
    }

    Route(.case(APIRoute.deviceCheck)) {
        deviceCheckRouter
    }
}

// MARK:- homeRouter

public let homeRouter = OneOf {
    Route(.case(HomeRoute.terms)) {
        Path { "terms" }
    }

    Route(.case(HomeRoute.privacy)) {
        Path { "privacy" }
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

    Route(.case(SiteRoute.appStore)) {
        Path { "v1" }
        appStoreRouter
    }

    Route(.case(SiteRoute.deviceCheck)) {
        Path { "v1" }
        deviceCheckRouter
    }
}

