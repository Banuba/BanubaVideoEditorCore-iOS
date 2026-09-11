// swift-tools-version:5.9

import PackageDescription

let banubaUtilsVersionRange: Range<Version> = "1.54.1"..<"1.59.99"
let banubaLicenseServicingVersionRange: Range<Version> = "1.54.1"..<"1.59.99"

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
      url: "https://nexus.banuba.net/repository/ios-frameworks/ios/frameworks/BanubaVideoEditorCore/1.54.2/BanubaVideoEditorCore-1.54.2.xcframework.zip",
      checksum: "0c52e52bd3bcbddbbc9b8fc2511b48bea03b0c286f73e3fb04ca8a1508dc1149"
    )
  ]
)
