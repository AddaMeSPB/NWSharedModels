import URLRouting
import Foundation

public enum AuthEngineRoute: Equatable {
    case authentication(AuthenticationRoute)
    case users(UsersRoute)
}

public struct AuthEngineRouter: ParserPrinter {
    public var body: some Router<AuthEngineRoute> {
        OneOf {
            Route(.case(AuthEngineRoute.authentication)) {
                Path { "auth" }
                AuthenticationRouter()
            }

            Route(.case(AuthEngineRoute.users)) {
                Path { "users" }
                UsersRouter()
            }
        }
    }
}

public enum AuthenticationRoute: Equatable {
    case loginViaPhoneNumber(MobileAndDeviceCheckDataInput)
    case loginViaEmail(EmailLoginInput)
    case verifySms(input: VerifySmsCodeinput)
    case verifyEmail(VerifyEmailInput)
    case refreshToken(input: RefreshTokenInput)
}

public struct AuthenticationRouter: ParserPrinter {
    public var body: some Router<AuthenticationRoute> {
        OneOf {

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
    }
}
