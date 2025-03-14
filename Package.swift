// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "CSS",
    products: [
        .library(
            name: "CSS",
            targets: [
                "CSS"
            ]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/swiftwasm/carton", 
            exact: "1.1.3"
        ),
        .package(
            url: "https://github.com/swiftwasm/JavaScriptKit", 
            exact: "0.23.0"
        ),
    ],
    targets: [
        .target(
            name: "CSS",
            dependencies: [
                "JavaScriptKit"
            ]
        ),
        .testTarget(
            name: "CSSTests",
            dependencies: [
                "CSS",
                "JavaScriptKit"
            ]
        ),
    ]
)
