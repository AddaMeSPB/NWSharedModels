
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

// MARK:- RootRouter

public struct RootRouter: ParserPrinter {

    public init() {}

    public var body: some Router<RootRoute> {
        OneOf {
            Route(.case(RootRoute.api)) {
                Path { "v1"; "api" }
                ApiRouter()
            }
            Route(.case(RootRoute.home))
        }
    }
}

// MARK:- ApiRouter

public struct ApiRouter: ParserPrinter {

    public init() {}

    public var body: some Router<APIRoute> {
        OneOf {
            Route(.case(APIRoute.authEngine)) {
                AuthEngineRouter()
            }

            Route(.case(APIRoute.word)) {
                WordsRouter()
            }

            Route(.case(APIRoute.appStore)) {
                AppStoreRouter()
            }

            Route(.case(APIRoute.deviceCheck)) {
                DeviceCheckRouter()
            }
        }
    }
}

// MARK:- HomeRouter

public struct HomeRouter: ParserPrinter {

    public init() {}

    public var body: some Router<HomeRoute> {

        OneOf {
            Route(.case(HomeRoute.terms)) {
                Path { "terms" }
            }

            Route(.case(HomeRoute.privacy)) {
                Path { "privacy" }
            }
        }
    }
}

// MARK:- SiteRouter
public struct SiteRouter: ParserPrinter {

    public init() {}

    public var body: some Router<SiteRoute> {
        OneOf {

            Route(.case(SiteRoute.authEngine)) {
                Path { "v1" }
                AuthEngineRouter()
            }

            Route(.case(SiteRoute.word)) {
                Path { "v1" }
                WordsRouter()
            }

            Route(.case(SiteRoute.terms)) {
                Path { "terms" }
            }

            Route(.case(SiteRoute.privacy)) {
                Path { "privacy" }
            }

            Route(.case(SiteRoute.appStore)) {
                Path { "v1" }
                AppStoreRouter()
            }

            Route(.case(SiteRoute.deviceCheck)) {
                Path { "v1" }
                DeviceCheckRouter()
            }
        }
    }
}
