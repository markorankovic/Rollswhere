// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "RollswhereAPI",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "RollswhereAPI",
            targets: ["RollswhereAPI"]),
    ],
    dependencies: [
        .package(url: "https://github.com/screensailor/Hope.git", .branch("trunk"))
    ],
    targets: [
        .target(
            name: "RollswhereAPI"),
        .testTarget(
            name: "RollswhereAPITests",
            dependencies: ["RollswhereAPI", "Hope"]),
    ]
)
