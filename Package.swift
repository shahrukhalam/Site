// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import class Foundation.ProcessInfo

let package = Package(
    name: "Site",
    platforms: [
        .iOS(.v15),
        .macOS(.v12)
    ],
    products: [
        .library(name: "Modeling", targets: ["Modeling"]),
        .library(name: "Pages", targets: ["Pages"]),
        .library(name: "HelperApp", targets: ["HelperApp"])
    ],
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from: "4.70.0"),
    ],
    targets: [
        .target(name: "Modeling"),
        .target(name: "Pages", dependencies: ["Modeling", "HTMLDSL"]),
        .target(
            name: "HelperApp",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                "Modeling",
                "Pages"
            ],
            exclude: [
                "Models/Request/Request + Analytics.swift",
                "Models/Application/Application + Articles.swift"
            ]
        )
    ]
)

/// Local Development Setup
/// 
/// We can set `CI_ENVIRONMENT` in `fly.io` to fetch from Remote
if ProcessInfo.processInfo.environment["CI_ENVIRONMENT"] == "YES" {
    package.dependencies += [
        // 📃 A HTML page renderer for shahrukh's article website
        .package(url: "https://github.com/shahrukhalam/HTMLDSL", branch: "main")
    ]
} else {
    package.dependencies += [
        .package(path: "../HTMLDSL")
    ]
}
