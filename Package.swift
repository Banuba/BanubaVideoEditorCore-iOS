// swift-tools-version:5.9

import PackageDescription

let banubaUtilsVersion: Version = "1.55.1"
let banubaLicenseServicingVersion: Version = "1.55.1"

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
    .package(url: "https://github.com/Banuba/BanubaUtilities-iOS.git", exact: banubaUtilsVersion),
    .package(url: "https://github.com/Banuba/BanubaLicenseServicingSDK.git", exact: banubaLicenseServicingVersion),
  ],
  targets: [
    .target(
      name: "BanubaVideoEditorCoreWrapper",
      dependencies: [
        "BanubaVideoEditorCore",
        .product(name: "BanubaUtilities", package: "BanubaUtilities-iOS"),
        .product(name: "BanubaLicenseServicingSDK", package: "BanubaLicenseServicingSDK")
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
      url: "https://nexus.banuba.net/repository/ios-frameworks/ios/frameworks/BanubaVideoEditorCore/1.55.1/BanubaVideoEditorCore-1.55.1.xcframework.zip",
      checksum: "25a9af70c755dff0f5dac2c184f900b212aae7024394534d2571c3a5f3f261d4"
    )
  ]
)
