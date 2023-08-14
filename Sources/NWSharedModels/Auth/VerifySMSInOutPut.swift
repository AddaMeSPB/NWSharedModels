import BSON
import Foundation
import PhoneNumberKit

extension String {
    public func varifyMobileNumber() async throws -> String {
        enum MobileNumberError: Error {
            case invalidNumber
        }

        let phoneNumberKit = PhoneNumberKit()

        do {
            _ = try phoneNumberKit.parse(self)
        } catch {
            throw MobileNumberError.invalidNumber
        }

        return self
    }
}

public struct MobileAndDeviceCheckDataInput: Codable, Equatable {
  public var phoneNumber: String
  public var deviceCheckData: Data

  public init(
    phoneNumber: String,
    deviceCheckData: Data
  ) {
    self.phoneNumber = phoneNumber
    self.deviceCheckData = deviceCheckData
  }
}

// Mark:- OTP via mobile
public struct VerifySmsCodeinput: Codable, Equatable {
    public init(
        phoneNumber: String,
        attemptId: ObjectId,
        code: String
    ) {
        self.phoneNumber = phoneNumber
        self.attemptId = attemptId
        self.code = code
    }

    public var phoneNumber: String
    public var attemptId: ObjectId
    public var code: String
}

public struct VerifySMSOutput: Codable, Equatable {
  public var phoneNumber: String
  public var attemptId: String
  public var code: String
  public var isLoggedIn: Bool? = false

  public init(
    phoneNumber: String,
    attemptId: String,
    code: String,
    isLoggedIn: Bool? = false
  ) {
    self.phoneNumber = phoneNumber
    self.attemptId = attemptId
    self.code = code
    self.isLoggedIn = isLoggedIn
  }

}

// MARK:- OTP via Email
public struct EmailLoginInput: Codable, Equatable {
    public init(
      name: String,
      email: String
    ) {
      self.name = name
      self.email = email
    }

  public var name: String
    public var email: String
}

public struct EmailLoginOutput: Codable, Equatable {
  public var email: String
  public var attemptId: ObjectId

  public init(
    email: String,
    attemptId: ObjectId
  ) {
    self.email = email
    self.attemptId = attemptId
  }

}

public struct VerifyEmailInput: Codable, Equatable {
  public var email: String
  public var attemptId: ObjectId
  public var code: String

  public init(
    email: String,
    attemptId: ObjectId,
    code: String
  ) {
    self.email = email
    self.attemptId = attemptId
    self.code = code
  }

}

// this belove code have to remove we have already alternative struct this

public struct SendUserVerificationResponse: Codable {
    public init(
        phoneNumber: String,
        attemptId: ObjectId,
        msg: WillSendLoginSMSCode
    ) {
        self.phoneNumber = phoneNumber
        self.attemptId = attemptId
        self.msg = msg
    }
    
    public var phoneNumber: String
    public var attemptId: ObjectId
    public var msg: WillSendLoginSMSCode
}

extension SendUserVerificationResponse: Equatable {}
extension SendUserVerificationResponse {
    static public let demo: SendUserVerificationResponse = .init(phoneNumber: "+79218821214", attemptId: ObjectId(), msg: .init(bool: false, maxCount: 3, leftCount: 0) )
}

public struct UserVerificationPayload: Codable {
    public init(attemptId: ObjectId, phoneNumber: String, code: String) {
        self.attemptId = attemptId
        self.phoneNumber = phoneNumber
        self.code = code
    }
    
    public let attemptId: ObjectId
    public let phoneNumber: String
    public let code: String
}
