// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AgreementKit-SwiftUI",
    platforms: [
         .iOS(.v15)
    ],
    products: [
        .library(
            name: "AgreementKit-SwiftUI",
            targets: ["AgreementKit-SwiftUI"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/ControlKit/ControlKitBase.git",
            branch: "main"
        )
    ],
    targets: [
        .target(
            name: "AgreementKit-SwiftUI",
            dependencies: ["ControlKitBase"],
            resources: [.process("Resources")]
        ),
        .testTarget(
            name: "AgreementKit-SwiftUITests",
            dependencies: ["AgreementKit-SwiftUI"]
        ),
    ]
)
