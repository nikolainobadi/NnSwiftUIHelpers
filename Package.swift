// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NnSwiftUIHelpers",
    products: [
        .library(
            name: "NnSwiftUIHelpers",
            targets: ["NnSwiftUIHelpers"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "NnSwiftUIHelpers",
            dependencies: []),
    ]
)