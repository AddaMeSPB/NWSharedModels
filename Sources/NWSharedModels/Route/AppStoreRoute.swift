import URLRouting
import Foundation

public enum AppStoreRoute: Equatable {
    case verifyReceipt(Data)
}

public struct AppStoreRouter: ParserPrinter {
    public var body: some Router<AppStoreRoute> {
        Route(.case(AppStoreRoute.verifyReceipt)) {
            Method.post
            Path { "verify-receipt" }
            Body()
        }
    }
}
