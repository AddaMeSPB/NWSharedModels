// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NWSharedModels",
    platforms: [
        .iOS(.v14),
        .macOS(.v12)
    ],
    products: [
        // Products define the executables and libraries a package produces,
        // and make them visible to other packages.
        .library(
            name: "NWSharedModels",
            targets: ["NWSharedModels"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "4.65.2"),
        .package(url: "https://github.com/vapor/fluent.git", from: "4.5.0"),
        .package(url: "https://github.com/vapor/fluent-mongo-driver.git", from: "1.1.2"),
        .package(url: "https://github.com/vapor/jwt.git", from: "4.2.1"),

        // Route
        .package(url: "https://github.com/pointfreeco/vapor-routing.git", from: "0.1.1"),
//        .package(path: "../swift-url-routing-main"),
//        .package(url: "https://github.com/pointfreeco/swift-url-routing.git", from: "0.3.0"),
        .package(url: "https://github.com/saroar/swift-url-routing", branch: "main"),
        .package(url: "https://github.com/OpenKitten/BSON.git", from: "7.0.0"),
        .package(url: "https://github.com/marmelroy/PhoneNumberKit", from: "3.4.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package.
        // A target can define a module or a test suite.
        // Targets can depend on other targets in this package,
        // and on products in packages this package depends on.
        .target(
            name: "NWSharedModels",
            dependencies: [
                .product(
                    name: "Vapor",
                    package: "vapor",
                    condition: .when(platforms: [.macOS, .linux])
                ),
                .product(
                    name: "Fluent",
                    package: "fluent",
                    condition: .when(platforms: [.macOS, .linux])
                ),
                .product(
                    name: "FluentMongoDriver",
                    package: "fluent-mongo-driver",
                    condition: .when(platforms: [.macOS, .linux])
                ),
                .product(
                    name: "VaporRouting",
                    package: "vapor-routing",
                    condition: .when(platforms: [.macOS, .linux])
                ),
                .product(
                    name: "JWT",
                    package: "jwt",
                    condition: .when(platforms: [.macOS, .linux])
                ),

                // IOS + MacOS + Linux
                .product(name: "PhoneNumberKit", package: "PhoneNumberKit"),

                // IOS
                .product(
                    name: "URLRouting",
                    package: "swift-url-routing",
                    condition: .when(platforms: [.iOS, .macOS])
                ),

                .product(
                    name: "BSON",
                    package: "BSON"
                )

            ]

        ),
        .testTarget(
            name: "NWSharedModelsTests",
            dependencies: ["NWSharedModels"]),
    ]
)
