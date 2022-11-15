//
//  Word.swift
//  
//
//  Created by Saroar Khandoker on 29.11.2021.
//

#if os(macOS) || os(Linux)
import Vapor
import Fluent
import FluentMongoDriver

public final class WordModel: Model, Content, PropertyNames {

    public static var schema = "words"

    public init() {}

    public init(
		id: ObjectId? = nil,
        icon: String? = nil,

		englishWord: String,
        englishDefinition: String,
		englishImageLink: String? = nil,
        englishVideoLink: String? = nil,

		russianWord: String? = nil,
        russianDefinition: String? = nil,
		russianImageLink: String? = nil,
        russianVideoLink: String? = nil,

		banglaWord: String? = nil,
        banglaDefinition: String? = nil,
		banglaImageLink: String? = nil,
        banglaVideoLink: String? = nil,

        spanishWord: String? = nil,
        spanishDefinition: String? = nil,
        spanishImageLink: String? = nil,
        spanishVideoLink: String? = nil,

		isReadFromNotification: Bool = false, isReadFromView: Bool = false,
		level: WordLevel = .beginner, userId: ObjectId,
        isActive: Bool = false,
        isComplete: Bool = false
	) {
		self.id = id
        self.icon = icon
		self.englishWord = englishWord
		self.englishDefinition = englishDefinition
		self.englishImageLink = englishImageLink
		self.englishVideoLink = englishVideoLink

		self.russianWord = russianWord
		self.russianDefinition = russianDefinition
		self.russianImageLink = russianImageLink
		self.russianVideoLink = russianVideoLink

		self.banglaWord = banglaWord
		self.banglaDefinition = banglaDefinition
		self.banglaImageLink = banglaImageLink
		self.banglaVideoLink = banglaVideoLink

        self.spanishWord = spanishWord
        self.spanishDefinition = spanishDefinition
        self.spanishImageLink = spanishImageLink
        self.spanishVideoLink = spanishVideoLink

		self.isReadFromNotification = isReadFromNotification
		self.isReadFromView = isReadFromView
		self.level = level

		$user.id = userId

        self.isActive = isActive
        self.isComplete = isComplete
	}

    // @ID(key: "id") public var id: ObjectId?
	@ID(custom: "id") public var id: ObjectId?

    @OptionalField(key: "icon") public var icon: String?
	@Field(key: "englishWord") public var englishWord: String
	@Field(key: "englishDefinition") public var englishDefinition: String
	@OptionalField(key: "englishImageLink") public var englishImageLink: String?
	@OptionalField(key: "englishVideoLink") public var englishVideoLink: String?

	@OptionalField(key: "russianWord") public var russianWord: String?
	@OptionalField(key: "russianDefinition") public var russianDefinition: String?
	@OptionalField(key: "russianImageLink") public var russianImageLink: String?
	@OptionalField(key: "russianVideoLink") public var russianVideoLink: String?

	@OptionalField(key: "banglaWord") public var banglaWord: String?
	@OptionalField(key: "banglaDefinition") public var banglaDefinition: String?
	@OptionalField(key: "banglaImageLink") public var banglaImageLink: String?
	@OptionalField(key: "banglaVideoLink") public var banglaVideoLink: String?

    @OptionalField(key: "spanishWord") public var spanishWord: String?
    @OptionalField(key: "spanishDefinition") public var spanishDefinition: String?
    @OptionalField(key: "spanishImageLink") public var spanishImageLink: String?
    @OptionalField(key: "spanishVideoLink") public var spanishVideoLink: String?

	@Field(key: "isReadFromNotification") public var isReadFromNotification: Bool
	@Field(key: "isReadFromView") public var isReadFromView: Bool
	@Field(key: "level") public var level: WordLevel
	@Parent(key: "userId") public var user: UserModel

    @Field(key: "isActive") public var isActive: Bool
    @Field(key: "isComplete") public var isComplete: Bool

	@Timestamp(key: "createdAt", on: .create) public var createdAt: Date?
	@Timestamp(key: "updatedAt", on: .update) public var updatedAt: Date?

}

extension WordModel {

    public func mapGet() -> WordGetObject {
		.init(
            id: id!.hexString,
            icon: icon,

            englishWord: englishWord,
            englishDefinition: englishDefinition,
            englishImageLink: englishImageLink,
            englishVideoLink: englishVideoLink,

            russianWord: russianWord,
            russianDefinition: russianDefinition,
            russianImageLink: russianImageLink,
            russianVideoLink: russianVideoLink,

            banglaWord: banglaWord,
            banglaDefinition: banglaDefinition,
            banglaImageLink: banglaImageLink,
            banglaVideoLink: banglaVideoLink,

            spanishWord: spanishWord,
            spanishDefinition: spanishDefinition,
            spanishImageLink: spanishImageLink,
            spanishVideoLink: spanishVideoLink,

            isReadFromNotification: isReadFromNotification,
            isReadFromView: isReadFromView,
            level: level,
            user: user.mapGetPublic(),
            isActive: isActive, isComplete: isComplete,

			createdAt: createdAt, updatedAt: updatedAt
		)
	}

    public func create(_ input: WordCreateObject) {
        icon = input.icon
		englishWord = input.englishWord
		englishDefinition = input.englishDefinition
		englishImageLink = input.englishImageLink
		englishVideoLink = input.englishVideoLink

		russianWord = input.russianWord
		russianDefinition = input.russianDefinition
		russianImageLink = input.russianImageLink
		russianVideoLink = input.russianVideoLink

		banglaWord = input.banglaWord
		banglaDefinition = input.banglaDefinition
		banglaImageLink = input.banglaImageLink
		banglaVideoLink = input.banglaVideoLink

        spanishWord = input.spanishWord
        spanishDefinition = input.spanishDefinition
        spanishImageLink = input.spanishImageLink
        spanishVideoLink = input.spanishVideoLink

		isReadFromNotification = input.isReadFromNotification
		isReadFromView = input.isReadFromView
		level = input.level

        isActive = input.isActive
        isComplete = input.isComplete
	}

    public func update(_ input: WordUpdateObject) async throws {
        icon = input.icon
        englishWord = input.englishWord
        englishDefinition = input.englishDefinition
        englishImageLink = input.englishImageLink
        englishVideoLink = input.englishVideoLink

        russianWord = input.russianWord
        russianDefinition = input.russianDefinition
        russianImageLink = input.russianImageLink
        russianVideoLink = input.russianVideoLink

        banglaWord = input.banglaWord
        banglaDefinition = input.banglaDefinition
        banglaImageLink = input.banglaImageLink
        banglaVideoLink = input.banglaVideoLink

        isReadFromNotification = input.isReadFromNotification
        isReadFromView = input.isReadFromView
        level = input.level

        isActive = input.isActive
        isComplete = input.isComplete
 
    }
}
extension Language: Content {}
extension WordCreateObject: Content {}
extension WordGetObject: Content {}
extension WordGetObjectWithoutUser: Content {}
#endif
