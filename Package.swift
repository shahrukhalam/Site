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
        .package(url: "https://github.com/vapor/vapor.git", from: "4.0.0"),
        .package(url: "https://github.com/vapor-community/Imperial.git", from: "1.0.0"),
        // 📂 An easy replacement of FileManager
        .package(url: "https://github.com/kylef/PathKit.git", from: "1.0.1"),
        // 📃 A HTML page renderer for shahrukh's article website
//        .package(path: "../HTMLDSL"),
        .package(
            url: "https://github.com/shahrukhalam/HTMLDSL",
            revision: "ee2158d2f98d54be1076622aeec0a48365905b28"
        ),
        // 🔖 Parsing nebulous data into well-structured data
        .package(url: "https://github.com/pointfreeco/swift-parsing", exact: "0.10.0")
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
