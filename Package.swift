// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "EngineerTrashTalkMatrixRain",
    platforms: [
        .iOS(.v14),
        .macOS(.v12)
    ],
    products: [
        .library(
            name: "EngineerTrashTalkMatrixRain",
            targets: ["EngineerTrashTalkMatrixRain"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "EngineerTrashTalkMatrixRain",
            dependencies: []),
        .testTarget(
            name: "EngineerTrashTalkMatrixRainTests",
            dependencies: ["EngineerTrashTalkMatrixRain"]),
    ]
)
