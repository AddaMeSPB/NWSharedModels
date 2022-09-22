extension VerifySMSInOutput {
    static public var draff: VerifySMSInOutput = .init(
        phoneNumber: "+79218821217",
        attemptId: "165541EC-692E-440A-9CF8-565776E9DC99",
        code: "336699",
        isLoggedIn: false
    )
}

extension LoginResponseP {
    static public var draff: LoginResponseP = .init(status: "online", user: .init(fullName: "Saroar", email: "", role: .superAdmin, language: .english), access: .draff)
}

extension RefreshTokenResponse {
    static public var draff: RefreshTokenResponse = .init(accessToken: "", refreshToken: "")
}
