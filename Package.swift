// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RuntimeTestCase",
    products: [
        .library(
            name: "RuntimeTestCase",
            targets: ["RuntimeTestCase"]),
    ],
    dependencies: [
        .package(url: "https://github.com/acecilia/ObjectiveKit", .revision("ee3121f040da27e892ccddc05b76fb3c328a0337")),
        // .package(path: "../ObjectiveKit"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "RuntimeTestCase",
            dependencies: ["ObjectiveKit"]),
        .testTarget(
            name: "RuntimeTestCaseTests",
            dependencies: ["RuntimeTestCase"]),
    ]
)
