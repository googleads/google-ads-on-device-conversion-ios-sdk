// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

// Copyright 2024 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import PackageDescription

let package = Package(
  name: "GoogleAdsOnDeviceConversion",
  platforms: [.iOS(.v10)],
  products: [
    .library(
      name: "GoogleAdsOnDeviceConversion",
      targets: ["GoogleAdsOnDeviceConversionTarget"]
    ),
  ],
  dependencies: [
    .package(
      name: "GoogleUtilities",
      url: "https://github.com/google/GoogleUtilities.git",
      "8.1.0" ..< "9.0.0"
    ),
    .package(
      name: "nanopb",
      url: "https://github.com/firebase/nanopb.git",
      "2.30910.0" ..< "2.30911.0"
    ),
  ],
  targets: [
    .target(
      name: "GoogleAdsOnDeviceConversionTarget",
      dependencies: [
        .target(
          name: "GoogleAdsOnDeviceConversion",
          condition: .when(platforms: [.iOS])
        ),
        .product(name: "GULLogger", package: "GoogleUtilities"),
        .product(name: "GULNetwork", package: "GoogleUtilities"),
        .product(name: "nanopb", package: "nanopb"),
      ],
      path: "GoogleAdsOnDeviceConversionWrapper",
      linkerSettings: [
        .linkedLibrary("c++"),
      ]
    ),
    .binaryTarget(
      name: "GoogleAdsOnDeviceConversion",
      url: "https://dl.google.com/firebase/ios/appads/1.3.0/GoogleAdsOnDeviceConversion.zip",
      checksum: "95fe8405fb61910fa919bd340d718fc15c4b71ce8e8adf296a62bbcd50cca3b3"
    ),
  ],
  cLanguageStandard: .c99,
  cxxLanguageStandard: CXXLanguageStandard.gnucxx14
)
