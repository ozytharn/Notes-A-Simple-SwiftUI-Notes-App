// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "NotesApp",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .executable(
            name: "NotesApp",
            targets: ["NotesApp"]
        )
    ],
    targets: [
        .executableTarget(
            name: "NotesApp",
            path: "Sources/NotesApp"
        )
    ]
)
