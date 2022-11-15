import BSON
import Foundation

extension MobileAndDeviceCheckDataInput {
    static public var draff: MobileAndDeviceCheckDataInput = .init(phoneNumber: "+79218821217", deviceCheckData: Data())
}

extension VerifySMSOutput {
    static public var draff: VerifySMSOutput = .init(
        phoneNumber: "+79218821217",
        attemptId: "165541EC-692E-440A-9CF8-565776E9DC99",
        code: "336699",
        isLoggedIn: false
    )
}

extension LoginResponseP {
    static public var draff: LoginResponseP = .init(status: "online", user: .init(id: ObjectId(),fullName: "Saroar", email: "", role: .superAdmin, language: .english), access: .draff)
}

extension RefreshTokenResponse {
    static public var draff: RefreshTokenResponse = .init(accessToken: "", refreshToken: "")
}
