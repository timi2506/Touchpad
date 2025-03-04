// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "Touchpad",
    platforms: [
        .iOS(.v15),
        .macOS(.v12)
    ],
    products: [
        .library(
            name: "Touchpad",
            targets: ["Touchpad"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Touchpad",
            dependencies: [],
            path: "Sources/Touchpad",
            resources: []
        )
    ]
)
