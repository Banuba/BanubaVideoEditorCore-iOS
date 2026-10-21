// swift-tools-version:5.9

import PackageDescription

let banubaUtilsVersionRange: Range<Version> = "0.54.5-beta.2"..<"1.59.99"
let banubaLicenseServicingVersionRange: Range<Version> = "0.54.5-beta.2"..<"1.59.99"

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
    .package(url: "https://github.com/Banuba/BanubaLicenseServicingSDK.git", banubaLicenseServicingVersionRange),
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
      url: "https://nexus.banuba.net/repository/ios-frameworks/ios/frameworks/BanubaVideoEditorCore/0.54.5-beta.2/BanubaVideoEditorCore-0.54.5-beta.2.xcframework.zip",
      checksum: "a8a7cc755cd3f62bf58fa9046d0faf218f5304807c0d588848c078a7fa4ada00"
    )
  ]
)
