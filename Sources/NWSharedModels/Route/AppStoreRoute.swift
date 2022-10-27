import URLRouting
import Foundation

public enum AppStoreRoute: Equatable {
    case verifyReceipt(Data)
}

public let appStoreRouter = OneOf {
    Route(.case(AppStoreRoute.verifyReceipt)) {
        Method.post
        Path { "verify-receipt" }
        Body()
    }
}
