// swift-tools-version:5.9

import PackageDescription

let package = Package(
  name: "BanubaVideoEditorCore",
  platforms: [
    .iOS(.v15)
  ],
  products: [
    .library(
      name: "BanubaVideoEditorCore",
      targets: ["BanubaVideoEditorCore"]
    )
  ],
  targets: [
    .binaryTarget(
      name: "BanubaVideoEditorCore",
      path: "BanubaVideoEditorCore.xcframework"
    )
  ]
)
