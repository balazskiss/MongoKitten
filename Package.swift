// swift-tools-version:4.0

import PackageDescription

var package = Package(
    name: "MongoKitten",
    products: [
        .library(name: "MongoKitten", targets: ["MongoKitten"]),
        .library(name: "GeoJSON", targets: ["GeoJSON"]),
        .library(name: "ExtendedJSON", targets: ["ExtendedJSON"]),
    ],
    dependencies: [
        // For MongoDB Documents
        //.package(url: "https://github.com/OpenKitten/BSON.git", from: "5.1.6"),
        
        // For ExtendedJSON support
        //.package(url: "https://github.com/OpenKitten/Cheetah.git", from: "1.0.3"),

        // Authentication
        //.package(url: "https://github.com/OpenKitten/CryptoKitten.git", from: "0.2.3"),

        // Asynchronous behaviour
        //.package(url: "https://github.com/OpenKitten/Schrodinger.git", from: "1.0.1"),
    ],
    targets: [
        .target(name: "GeoJSON", dependencies: []),
        .target(name: "MongoSocket", dependencies: []),
        .target(name: "ExtendedJSON", dependencies: []),
        .target(name: "MongoKitten", dependencies: ["GeoJSON", "MongoSocket", "ExtendedJSON"])
    ]
)

// Provides Sockets + SSL
#if !os(macOS) && !os(iOS)
package.dependencies.append(.package(url: "https://github.com/OpenKitten/KittenCTLS.git", majorVersion: 1))
#endif
