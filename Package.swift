// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "LiquidGlassApp",
    platforms: [.iOS(.v26)],
    products: [
        .library(name: "LiquidGlassApp", targets: ["LiquidGlassApp"]),
    ],
    targets: [
        .target(name: "LiquidGlassApp", path: "Sources/LiquidGlassApp"),
    ]
)
