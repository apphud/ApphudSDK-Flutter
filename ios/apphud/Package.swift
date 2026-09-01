// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "apphud",
    platforms: [
        .iOS("15.0")
    ],
    products: [
        .library(name: "apphud", targets: ["apphud"])
    ],
    dependencies: [
        // Keep in sync with the ApphudSDK pin in ../apphud.podspec.
        .package(url: "https://github.com/apphud/ApphudSDK.git", exact: "4.4.9")
    ],
    targets: [
        .target(
            name: "apphud",
            dependencies: [
                .product(name: "ApphudSDK", package: "ApphudSDK")
            ]
        )
    ]
)
