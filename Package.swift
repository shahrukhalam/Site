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
        // 📂 An easy replacement of FileManager
        .package(url: "https://github.com/kylef/PathKit.git", from: "1.0.1"),
        // 📃 A HTML page renderer for shahrukh's article website
        .package(path: "../HTMLDSL"),
//        .package(
//            url: "https://github.com/shahrukhalam/HTMLDSL",
//            revision: "8d8b2dba01b599659218c11b3f2f6894e42f59a6"
//        ),
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
                "PathKit",
                "Modeling",
                "Pages"
            ]
        )
    ]
)
