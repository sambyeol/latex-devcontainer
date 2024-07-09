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
