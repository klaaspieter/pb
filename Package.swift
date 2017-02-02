import PackageDescription

let package = Package(
    name: "pb",
    targets: [
        Target(name: "pbps", dependencies: []),
        Target(name: "pbcp", dependencies: []),
    ]
)
