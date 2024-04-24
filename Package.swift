// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "finam-api-swift-sdk",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        .library(
            name: "FinamAPISwiftSDK",
            targets: ["FinamAPISwiftSDK"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/grpc/grpc-swift.git", from: "1.20.0"),
    ],
    targets: [
        .target(
            name: "FinamAPISwiftSDK",
            dependencies: [
                .product(name: "GRPC", package: "grpc-swift"),
            ]
        ),
        .testTarget(
            name: "FinamAPISwiftSDKTests",
            dependencies: ["FinamAPISwiftSDK"]),
    ]
)

