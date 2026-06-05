// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

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
    .package(name: "FlutterFramework", path: "../FlutterFramework"),
    .package(url: "https://github.com/apphud/ApphudSDK.git", exact: "4.2.3")
  ],
  targets: [
    .target(
      name: "apphud",
      dependencies: [
        .product(name: "FlutterFramework", package: "FlutterFramework"),
        .product(name: "ApphudSDK", package: "ApphudSDK")
      ]
    )
  ]
)
