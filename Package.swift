// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ExamplePackage",
    platforms: [
        .iOS(.v13), .tvOS(.v13)
    ],
    products: [
        // Products define the executables an   d libraries a package produces, and make them visible to other packages.
        .library(
            name: "ExamplePackage",
            targets: ["ExamplePackage"]),
        .library(
            name: "Networking",
            targets: ["Networking"]),
        .library(
            name: "Protocols",
            targets: ["Protocols"]),
        .library(
            name: "Utilities",
            targets: ["Utilities"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "ExamplePackage",
            dependencies: [],
            path: "Sources/ExamplePackage"),
        .target(
            name: "Networking",
            dependencies: ["Utilities", "Protocols"],
            path: "Sources/Networking"),
        .target(
            name: "Protocols",
            dependencies: ["Utilities"],
            path: "Sources/Protocols"),
        .target(
            name: "Utilities",
            dependencies: [],
            path: "Sources/Utilities"),
        .testTarget(
            name: "ExamplePackageTests",
            dependencies: ["ExamplePackage"]),
    ]
)
