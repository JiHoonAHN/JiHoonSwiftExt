// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "JiHoonSwiftExt",
    products: [
        .library(
            name: "JiHoonSwiftExt-Basic",
            targets: ["JiHoonSwiftExt-Basic"]),
        .library(
            name: "JiHoonSwiftExt-UIKit",
            targets: ["JiHoonSwiftExt-UIKit"]),
        .library(
            name: "JiHoonSwiftExt-SwiftUI",
            targets: ["JiHoonSwiftExt-SwiftUI"]),
    ],
    dependencies: [
        
    ],
    targets: [
        .target(
            name: "JiHoonSwiftExt-Basic",
            dependencies: []),
        .target(
            name: "JiHoonSwiftExt-UIKit",
            dependencies: []),
        .target(
            name: "JiHoonSwiftExt-SwiftUI",
            dependencies: []),
        
        .testTarget(
            name: "JiHoonSwiftExtTests",
            dependencies: ["JiHoonSwiftExt-UIKit", "JiHoonSwiftExt-SwiftUI"]),
    ]
)
