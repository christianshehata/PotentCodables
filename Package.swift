// swift-tools-version:5.1
//
//  Package.swift
//  PotentCodables
//
//  Copyright © 2019 Outfox, inc.
//
//
//  Distributed under the MIT License, See LICENSE for details.
//

import PackageDescription

let package = Package(
  name: "PotentCodables",
  platforms: [
    .iOS(.v10),
    .macOS(.v10_12),
    .watchOS(.v3),
    .tvOS(.v10),
  ],
  products: [
    .library(
      name: "PotentCodables",
      targets: ["PotentCodables", "PotentJSON", "PotentCBOR", "PotentASN1", "PotentYAML", "Cfyaml"]
    ),
  ],
  dependencies: [
    .package(url: "https://github.com/leif-ibsen/BigInt.git", from: "1.2.12"),
    .package(url: "https://github.com/lukaskubanek/OrderedDictionary.git", from: "2.2.2")
  ],
  targets: [
    .target(
      name: "PotentCodables"
    ),
    .target(
      name: "PotentJSON",
      dependencies: ["PotentCodables"]
    ),
    .target(
      name: "PotentCBOR",
      dependencies: ["PotentCodables"]
    ),
    .target(
      name: "PotentASN1",
      dependencies: ["PotentCodables", "BigInt", "OrderedDictionary"]
    ),
    .target(    
      name: "Cfyaml",
      cSettings: [
        .headerSearchPath("config"),
        .headerSearchPath("lib"),
        .headerSearchPath("valgrind"),
        .define("HAVE_CONFIG_H")
      ]
    ),
    .target(
      name: "PotentYAML",
      dependencies: ["Cfyaml", "PotentCodables"]
    ),
    .testTarget(
      name: "PotentCodablesTests",
      dependencies: ["PotentCodables", "PotentJSON", "PotentCBOR", "PotentASN1", "PotentYAML"],
      path: "./Tests"
    )
  ]
)
