// swift-tools-version:5.9

import PackageDescription

let banubaUtilsVersionRange: Range<Version> = "1.53.1"..<"1.53.99"

let package = Package(
  name: "BanubaVideoEditorCore",
  platforms: [
    .iOS(.v15)
  ],
  products: [
    .library(
      name: "BanubaVideoEditorCore",
      targets: ["BanubaVideoEditorCoreTarget"]
    )
  ],
  dependencies: [
    .package(url: "https://github.com/Banuba/BanubaUtilities-iOS.git", banubaUtilsVersionRange),
  ],
  targets: [
    .target(
      name: "BanubaVideoEditorCoreWrapper",
      dependencies: [
        "BanubaVideoEditorCore",
        .product(name: "BanubaUtilities", package: "BanubaUtilities-iOS")
      ],
      path: "BanubaVideoEditorCoreWrapper"
    ),
    .target(
      name: "BanubaVideoEditorCoreTarget",
      dependencies: [
        .target(name: "BanubaVideoEditorCoreWrapper")
      ],
      path: "BanubaVideoEditorCoreTarget"
    ),
    .binaryTarget(
      name: "BanubaVideoEditorCore",
      url: "https://nexus.banuba.net/repository/ios-frameworks/ios/frameworks/BanubaVideoEditorCore/1.53.1/BanubaVideoEditorCore-1.53.1.xcframework.zip",
      checksum: "6886a55aacbdc5420d3411a0f199c3860fe4f3d3c733105f72fa2eda54975cea"
    )
  ]
)
