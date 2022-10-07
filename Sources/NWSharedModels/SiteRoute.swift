
import URLRouting

public enum SiteRoute: Equatable {
    case authEngine(AuthEngineRoute)
    case word(WordsRoute)
    case appStore(AppStoreRoute)
    case terms
    case privacy
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
}

