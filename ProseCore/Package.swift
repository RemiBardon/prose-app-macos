// swift-tools-version:5.6
import PackageDescription

let package = Package(
  name: "prose-core",
  platforms: [.macOS(.v12)],
  products: [
    .library(name: "ProseCoreLib", targets: ["ProseCore"]),
  ],
  targets: [
    .binaryTarget(
      name: "ProseCore",
      path: "Artifacts/ProseCore.xcframework"
    ),
    .testTarget(name: "ProseCoreTests", dependencies: ["ProseCore"])
  ]
)
