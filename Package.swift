// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "Spring",
    platforms: [.iOS(.v12)],
    products: [
        .library(name: "Spring", targets: ["Spring"])
    ],
    targets: [
        .target(
            name: "Spring",
            path: "Spring",
            exclude: ["Info.plist", "Spring.h"],
            resources: [.process("LoadingView.xib")]
        )
    ],
    swiftLanguageVersions: [.v5]
)
