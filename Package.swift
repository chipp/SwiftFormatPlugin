// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "SwiftFormatPlugin",
    platforms: [
        .macOS("13.0")
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
                .target(name: "SwiftFormatBinary")
            ]
        ),
        .plugin(
            name: "SwiftFormatRun",
            capability: .command(intent: .custom(verb: "swiftformat", description: "Run swiftformat"), permissions: [
                .writeToPackageDirectory(reason: "Fixing SwiftFormat issues")
            ]),
            dependencies: [
                .target(name: "SwiftFormatBinary")
            ]
        ),
        .binaryTarget(
            name: "SwiftFormatBinary",
            url: "https://github.com/nicklockwood/SwiftFormat/releases/download/0.61.1/swiftformat.artifactbundle.zip",
            checksum: "47f7932f35c714b00430f56df1cfaf1bea0b4baae299bb2a09874cb52ee45350"
        )
    ]
)