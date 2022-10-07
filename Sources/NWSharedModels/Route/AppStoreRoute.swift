import URLRouting

public enum AppStoreRoute: Equatable {
    case verifyReceipt(input: VerifyReceiptInput)
}

public let appStoreRouter = OneOf {
    Route(.case(AppStoreRoute.verifyReceipt)) {
        Path { "verify_receipt" }
        Method.post
        Body(.json(VerifyReceiptInput.self))
    }
}
