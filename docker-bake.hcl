group "default" {
    targets = [
        "latest",
        "debian",
        "ubuntu",
        "alpine",
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

group "debian" {
    targets = [
        "debian_nonroot",
        "debian_root",
    ]
}

target "debian_base" {
    dockerfile = "./dockerfiles/debian/base.Dockerfile"
    inherits = ["cross"]
    args = {
        CTAN_MIRROR="https://mirrors.mit.edu/CTAN/systems/texlive/tlnet"
    }
}

target "debian_nonroot" {
    dockerfile = "./dockerfiles/debian/nonroot.Dockerfile"
    inherits = ["cross"]
    contexts = {
        base = "target:debian_base"
    }
    tags = [
        "ghcr.io/sambyeol/latex-devcontainer:2024-debian",
        "ghcr.io/sambyeol/latex-devcontainer:debian",
        
        "ghcr.io/sambyeol/latex-devcontainer:2024",
        "ghcr.io/sambyeol/latex-devcontainer:latest",
    ]
}

target "debian_root" {
    dockerfile = "./dockerfiles/debian/root.Dockerfile"
    inherits = ["cross"]
    contexts = {
        base = "target:debian_base"
    }
    tags = [
        "ghcr.io/sambyeol/latex-devcontainer:2024-debian-root",
        "ghcr.io/sambyeol/latex-devcontainer:debian-root",
        
        "ghcr.io/sambyeol/latex-devcontainer:2024-root",
        "ghcr.io/sambyeol/latex-devcontainer:root",
    ]
}

// Alpine

group "alpine" {
    targets = [
        "alpine_nonroot",
        "alpine_root",
    ]
}

target "alpine_base" {
    dockerfile = "./dockerfiles/alpine/base.Dockerfile"
    inherits = ["cross"]
    args = {
        TL_VERSION="20240210.69778-r2"
    }
}

target "alpine_nonroot" {
    dockerfile = "./dockerfiles/alpine/nonroot.Dockerfile"
    inherits = ["cross"]
    contexts = {
        base = "target:alpine_base"
    }
    tags = [
        "ghcr.io/sambyeol/latex-devcontainer:2024-alpine",
        "ghcr.io/sambyeol/latex-devcontainer:alpine",
    ]
}

target "alpine_root" {
    dockerfile = "./dockerfiles/alpine/root.Dockerfile"
    inherits = ["cross"]
    contexts = {
        base = "target:alpine_base"
    }
    tags = [
        "ghcr.io/sambyeol/latex-devcontainer:2024-alpine-root",
        "ghcr.io/sambyeol/latex-devcontainer:alpine-root",
    ]
}