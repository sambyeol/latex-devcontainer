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

target "cache" {
    dockerfile = "./cache.Dockerfile"
}

// Debian

target "debian" {
    dockerfile = "./Dockerfile"
    inherits = ["cross"]
    contexts = {
        cache = "target:cache"
    }
    tags = [
        "ghcr.io/sambyeol/latex-devcontainer:2025",
        "ghcr.io/sambyeol/latex-devcontainer:latest",
    ]
}
