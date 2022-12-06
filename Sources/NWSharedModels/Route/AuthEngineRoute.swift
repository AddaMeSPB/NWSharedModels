import URLRouting
import Foundation

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
    case loginViaPhoneNumber(MobileAndDeviceCheckDataInput)
    case loginViaEmail(EmailLoginInput)
    case verifySms(input: VerifySmsCodeinput)
    case verifyEmail(VerifyEmailInput)
    case refreshToken(input: RefreshTokenInput)
}

public let authenticationRouter = OneOf {

    Route(.case(AuthenticationRoute.loginViaPhoneNumber)) {
        Path { "otp_login_mobile" }
        Method.post
        Body(.json(MobileAndDeviceCheckDataInput.self))
    }

    Route(.case(AuthenticationRoute.loginViaEmail)) {
        Path { "otp_login_email" }
        Method.post
        Body(.json(EmailLoginInput.self))
    }

    Route(.case(AuthenticationRoute.verifySms)) {
        Path { "verify_otp_sms" }
        Method.post
        Body(.json(VerifySmsCodeinput.self))
    }

    Route(.case(AuthenticationRoute.verifyEmail)) {
        Path { "verify_otp_email" }
        Method.post
        Body(.json(VerifyEmailInput.self))
    }

    Route(.case(AuthenticationRoute.refreshToken)) {
        Path { "refresh_token" }
        Method.post
        Body(.json(RefreshTokenInput.self))
    }
}
