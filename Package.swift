// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

// Create a server with Swift Package Manager
// https://www.kitura.io/docs/getting-started/create-server-spm

// HeliumLogger
// https://www.kitura.io/docs/logging/helium-logger

// Kitura OpenAPI
// https://www.kitura.io/docs/routing/kitura-openapi

// Swift Kuery ORM
// https://www.kitura.io/docs/databases/orm
// brew install postgresql // apt install libpq-dev; sudo -u postgres -i

import PackageDescription

let package = Package(
    name: "BookStore",
    dependencies: [
	.package(url: "https://github.com/IBM-Swift/HeliumLogger.git", from: "1.9.0"),
        .package(url: "https://github.com/IBM-Swift/Kitura", from: "2.9.1"),
        .package(url: "https://github.com/IBM-Swift/Kitura-OpenAPI.git", from: "1.3.0"),
        .package(url: "https://github.com/IBM-Swift/Swift-Kuery-ORM.git", from: "0.6.1"),
        .package(url: "https://github.com/IBM-Swift/Swift-Kuery-PostgreSQL.git", from: "2.1.1"),
    ],
    targets: [
        .target(name: "BookStore", dependencies: [.target(name: "Application")]),
        .target(name: "Application", dependencies: [
            "HeliumLogger", "Kitura", "KituraOpenAPI", "SwiftKueryORM", "SwiftKueryPostgreSQL"
        ]),
        .testTarget(name: "ApplicationTests", dependencies: [.target(name: "Application")]),
    ]
)
