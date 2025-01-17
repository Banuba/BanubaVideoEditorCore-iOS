// swift-tools-version:5.9

import PackageDescription

let utilsVersionRange: Range<Version> = "1.40.0-beta.3"..<"1.49.99"

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
  dependencies: [
    .package(url: "https://github.com/Banuba/BanubaUtilities-iOS.git", utilsVersionRange),
  ],
  targets: [
    .binaryTarget(
        name: "BanubaVideoEditorCore",
      path: "BanubaVideoEditorCore.xcframework"
    )
  ]
)
