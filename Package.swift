// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "feather-push-driver-memory",
    platforms: [
        .macOS(.v13),
        .iOS(.v16),
        .tvOS(.v16),
        .watchOS(.v9),
    ],
    products: [
        .library(name: "FeatherPushDriverMemory", targets: ["FeatherPushDriverMemory"]),
    ],
    dependencies: [
        .package(url: "https://github.com/feather-framework/feather-push", .upToNextMinor(from: "0.4.0")),
    ],
    targets: [
        .target(
            name: "FeatherPushDriverMemory",
            dependencies: [
                .product(name: "FeatherPush", package: "feather-push"),
            ]
        ),
        .testTarget(
            name: "FeatherPushDriverMemoryTests",
            dependencies: [
                .product(name: "FeatherPush", package: "feather-push"),
                .product(name: "XCTFeatherPush", package: "feather-push"),
                .target(name: "FeatherPushDriverMemory"),
            ]
        ),
    ]
)
