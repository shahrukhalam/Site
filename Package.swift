// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

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
        .package(url: "https://github.com/vapor-community/Imperial.git", from: "1.1.0"),
        // 📂 An easy replacement of FileManager
        .package(url: "https://github.com/kylef/PathKit.git", from: "1.0.1"),
        // 📃 A HTML page renderer for shahrukh's article website
//        .package(path: "../HTMLDSL"),
        .package(
            url: "https://github.com/shahrukhalam/HTMLDSL",
            revision: "5e295f9e999ee98077810af448c97f03d74a7966"
        ),
        // 🔖 Parsing nebulous data into well-structured data
        .package(url: "https://github.com/pointfreeco/swift-parsing", from: "0.11.0")
    ],
    targets: [
        .target(name: "Modeling"),
        .target(name: "Pages", dependencies: ["Modeling", "HTMLDSL"]),
        .target(
            name: "HelperApp",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                .product(name: "Parsing", package: "swift-parsing"),
                .product(name: "ImperialGoogle", package: "Imperial"),
                "PathKit",
                "Modeling",
                "Pages"
            ]
        )
    ]
)
