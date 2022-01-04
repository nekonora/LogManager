// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "LogManager",
    products: [
        .library(name: "LogManager", targets: ["LogManager"]),
    ],
    dependencies: [
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        .target(name: "LogManager", path: "Sources"),
        .testTarget(name: "LogManagerTests", dependencies: ["LogManager"]),
    ]
)
