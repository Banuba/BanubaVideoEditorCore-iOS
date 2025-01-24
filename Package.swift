// swift-tools-version:5.9

import PackageDescription

let utilsVersionRange: Range<Version> = "1.40.0"..<"1.49.99"

let package = Package(
    name: "BanubaVideoEditorCore",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "BanubaVideoEditorCore",
            targets: [
                "BanubaVideoEditorCoreTarget",
            ]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/Banuba/BanubaUtilities-iOS.git", utilsVersionRange),
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
          path: "BanubaVideoEditorCore.xcframework"
        )
    ]
)
