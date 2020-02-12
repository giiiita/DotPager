// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "DotPager",
    platforms: [
      .iOS(.v13)
    ],
    products: [
        .library(
            name: "DotPager",
            targets: ["DotPager"])
    ],
    dependencies: [],
    targets: [
        .target(
            name: "DotPager",
            dependencies: [])
    ]
)
