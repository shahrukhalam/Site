// swift-tools-version: 5.7

import PackageDescription
import class Foundation.ProcessInfo

let package = Package(
    name: "Site",
    platforms: [
        .iOS(.v15),
        .macOS(.v13)
    ],
    products: [
        .library(name: "Modeling", targets: ["Modeling"]),
        .library(name: "Pages", targets: ["Pages"]),
        .library(name: "NotionPages", targets: ["NotionPages"]),
        .library(name: "HelperApp", targets: ["HelperApp"])
    ],
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from: "4.70.0"),
        .package(url: "https://github.com/pointfreeco/swift-parsing", from: "0.13.0")
    ],
    targets: [
        .target(name: "Modeling"),
        .target(name: "Pages", dependencies: ["Modeling", "HTMLDSL"]),
        .target(
            name: "NotionPages", 
            dependencies: [
                .product(name: "NotionParsing", package: "swift-notion-parsing"),
                .product(name: "NotionHTML", package: "swift-notion-html"),
                "Pages"
            ]
        ),
        .target(
            name: "HelperApp",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                .product(name: "Parsing", package: "swift-parsing"),
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
        .package(url: "https://github.com/shahrukhalam/HTMLDSL", branch: "main"),
        .package(url: "https://github.com/swiftpublished/swift-notion-parsing.git", branch: "main"),
        .package(url: "https://github.com/swiftpublished/swift-notion-html.git", branch: "main")
    ]
} else {
    package.dependencies += [
        .package(path: "../HTMLDSL"),
        .package(path: "../swift-notion-parsing"),
        .package(path: "../swift-notion-html")
    ]
}
