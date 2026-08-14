// swift-tools-version:6.1
import PackageDescription

// NOTE: https://github.com/swift-server/swift-http-server/blob/main/Package.swift
var defaultSwiftSettings: [SwiftSetting] = [
    // https://github.com/swiftlang/swift-evolution/blob/main/proposals/0441-formalize-language-mode-terminology.md
    .swiftLanguageMode(.v6),
    // https://github.com/swiftlang/swift-evolution/blob/main/proposals/0444-member-import-visibility.md
    .enableUpcomingFeature("MemberImportVisibility"),
    // https://forums.swift.org/t/experimental-support-for-lifetime-dependencies-in-swift-6-2-and-beyond/78638
    .enableExperimentalFeature("Lifetimes"),
    // https://github.com/swiftlang/swift/pull/65218
    .enableExperimentalFeature("AvailabilityMacro=featherPushEphemeral:macOS 15, iOS 18, watchOS 11, tvOS 11, visionOS 2"),
]

#if compiler(>=6.2)
defaultSwiftSettings.append(
    .enableUpcomingFeature("NonisolatedNonsendingByDefault")
)
#endif

let package = Package(
    name: "feather-push-ephemeral",
    platforms: [
        .macOS(.v15),
        .iOS(.v18),
        .tvOS(.v18),
        .watchOS(.v11),
        .visionOS(.v2),
    ],
    products: [
        .library(name: "FeatherPushEphemeral", targets: ["FeatherPushEphemeral"]),
    ],
    dependencies: [
        .package(url: "https://github.com/feather-framework/feather-push", exact: "1.0.0-beta.1"),
        // [docc-plugin-placeholder]
    ],
    targets: [
        .target(
            name: "FeatherPushEphemeral",
            dependencies: [
                .product(name: "FeatherPush", package: "feather-push"),
            ],
            swiftSettings: defaultSwiftSettings
        ),
        .testTarget(
            name: "FeatherPushEphemeralTests",
            dependencies: [
                .product(name: "FeatherPush", package: "feather-push"),
                .target(name: "FeatherPushEphemeral"),
            ],
            swiftSettings: defaultSwiftSettings
        ),
    ]
)
