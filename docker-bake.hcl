group "default" {
    targets = [
        "latest",
    ]
}

group "latest" {
    targets = [
        "debian",
    ]
}

target "cross" {
    platforms = [
        "linux/amd64",
        "linux/arm64",
    ]
}

// Debian

target "debian" {
    dockerfile = "./Dockerfile"
    inherits = ["cross"]
    tags = [
        "ghcr.io/sambyeol/latex-devcontainer:2025",
        "ghcr.io/sambyeol/latex-devcontainer:latest",
    ]
}
