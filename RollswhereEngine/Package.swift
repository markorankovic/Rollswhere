// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "RollswhereEngine",
    products: [
        .library(
            name: "RollswhereEngine",
            targets: ["RollswhereEngine"]),
    ],
    targets: [
        .target(
            name: "RollswhereEngine"
        ),
        .testTarget(
            name: "RollswhereEngineTests",
            dependencies: ["RollswhereEngine"]),
    ]
)
