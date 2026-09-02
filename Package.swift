// swift-tools-version:5.9

import PackageDescription

let banubaUtilsVersionRange: Range<Version> = "1.54.2"..<"1.59.99"
let banubaLicenseServicingVersionRange: Range<Version> = "1.54.2"..<"1.59.99"

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
      url: "https://nexus.banuba.net/repository/ios-frameworks/ios/frameworks/BanubaVideoEditorCore/1.54.1/BanubaVideoEditorCore-1.54.1.xcframework.zip",
      checksum: "1fd9d697787f8d9b642a1d7817bb67e925e4f90a57c5547c38c5c42927ff2ba9"
    )
  ]
)
