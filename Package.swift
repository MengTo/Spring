// swift-tools-version:4.2
import PackageDescription

let package = Package(
    name: "Spring",
    // platforms: [.iOS("8.0"), tvOS("11.0")],
    products: [
        .library(name: "Spring", targets: ["Spring"])
    ],
    targets: [
        .target(
            name: "Spring",
            path: "Spring"
        )
    ]
)
