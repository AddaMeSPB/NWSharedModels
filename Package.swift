// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NWSharedModels",
    platforms: [
        .iOS(.v14),
        .macOS(.v12)
    ],
    products: [
        .library(
            name: "NWSharedModels",
            targets: ["NWSharedModels"]
        ),
    ],
    dependencies: [

        // Route
        .package(url: "https://github.com/pointfreeco/swift-url-routing.git", from: "0.6.0"),
        .package(url: "https://github.com/OpenKitten/BSON.git", from: "7.0.31"),
        .package(url: "https://github.com/marmelroy/PhoneNumberKit", from: "3.5.8")
    ],
    targets: [
        .target(
            name: "NWSharedModels",
            dependencies: [

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
