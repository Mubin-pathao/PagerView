// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PagerView",
    platforms: [
        .iOS(.v12),
        .macOS(.v10_13),
        .tvOS(.v12),
        .visionOS(.v1)
    ],
    
    products: [
        .library(name: "PagerView", targets: ["PagerView"]),
        .library(name: "PagerRx", targets: ["PagerRx"]),
        .library(name: "PagerRxDynamic", type: .dynamic, targets: ["PagerRx"]),
    ],
    
    
    dependencies: [
//        .package(path: "../ScrollShadow"),
//        .package(path: "../ZoomableImageView"),
        .package(url: "https://github.com/Mubin-pathao/ZoomableImageView.git", .upToNextMajor(from: "1.0.0")),
        .package(url: "https://github.com/ReactiveX/RxSwift.git", .upToNextMajor(from: "6.0.0"))
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        
        .target(
            name: "PagerView",
            dependencies: [
                "ZoomableImageView"
            ],
            resources: [
                .process("../PrivacyInfo.xcprivacy")
            ]
//            ,
//            swiftSettings: [
//                .enableExperimentalFeature(<#T##name: String##String#>),
//                .enableUpcomingFeature(<#T##name: String##String#>, .when(platforms: <#T##[Platform]#>, configuration: <#T##BuildConfiguration#>)),
//                .interoperabilityMode(<#T##mode: SwiftSetting.InteroperabilityMode##SwiftSetting.InteroperabilityMode#>, <#T##condition: BuildSettingCondition?##BuildSettingCondition?#>),
//                .unsafeFlags(<#T##flags: [String]##[String]#>, <#T##condition: BuildSettingCondition?##BuildSettingCondition?#>)
//            ]
        ),
        
        .target(name: "PagerRx",
                dependencies: [
                    "PagerView",
                    .product(name: "RxSwift", package: "RxSwift")
                ]
        ),
        
        
        .testTarget(
            name: "PagerViewTests",
            dependencies: ["PagerView"]),
    ],
    swiftLanguageVersions: [.v4]
)
