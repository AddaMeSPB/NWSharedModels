
import URLRouting

public enum RootRoute: Equatable {
    case api(APIRoute)
}

public enum APIRoute: Equatable {
    case authEngine(AuthEngineRoute)
    case word(WordsRoute)
    case appStore(AppStoreRoute)
    case deviceCheck(DeviceCheckRoute)
}

// MARK:- RootRouter

public struct RootRouter: ParserPrinter {

    public init() {}

    public var body: some Router<RootRoute> {
      OneOf {
        Route(.case(RootRoute.api)) {
          Path { "api"; "v1" }
          ApiRouter()
        }
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
