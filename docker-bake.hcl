group "default" {
    targets = [
        "latest",
    ]
}

target "latest" {
    dockerfile = "./Dockerfile"
    platforms = [
        "linux/amd64",
        "linux/arm64",
    ]
    tags = [
        "ghcr.io/sambyeol/latex-devcontainer:2025",
        "ghcr.io/sambyeol/latex-devcontainer:latest",
    ]
}
