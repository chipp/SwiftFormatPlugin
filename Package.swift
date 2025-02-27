// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "SwiftFormatPlugin",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        .plugin(
            name: "SwiftFormat",
            targets: ["SwiftFormat"]
        ),
        .plugin(
            name: "SwiftFormatRun",
            targets: ["SwiftFormatRun"]
        )
    ],
    targets: [
        .plugin(
            name: "SwiftFormat",
            capability: .buildTool(),
            dependencies: [
                .target(name: "swiftformat")
            ]
        ),
        .plugin(
            name: "SwiftFormatRun",
            capability: .command(intent: .custom(verb: "swiftformat", description: "Run swiftformat"), permissions: [
                .writeToPackageDirectory(reason: "Fixing SwiftFormat issues")
            ]),
            dependencies: [
                .target(name: "swiftformat")
            ]
        ),
        .binaryTarget(
            name: "swiftformat",
            url: "https://github.com/nicklockwood/SwiftFormat/releases/download/0.55.5/swiftformat.artifactbundle.zip",
            checksum: "2c6e8903b88ca94f621586a91617c89337f53460bb3db00e3de655f96895a1a8"
        )
    ]
)
