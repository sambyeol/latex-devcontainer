group "default" {
    targets = [
        "latest_deploy",
        "debian_deploy",
        "ubuntu_deploy",
        "alpine_deploy",
    ]
}

group "latest" {
    targets = [
        "debian12",
        "latest_deploy",
    ]
}

group "latest_deploy" {
    targets = [
        "debian12_nonroot",
        "debian12_root",
    ]
}

group "debian" {
    targets = [
        "debian11",
        "debian11_nonroot",
        "debian11_root",
        "debian10",
        "debian10_nonroot",
        "debian10_root",
    ]
}

group "ubuntu" {
    targets = [
        "ubuntu2304",
        "ubuntu2304_root",
        "ubuntu2210",
        "ubuntu2210_root",
        "ubuntu2204",
        "ubuntu2204_root",
        "ubuntu2004",
        "ubuntu2004_root",
    ]
}

group "alpine" {
    targets = [
        "alpine_318",
        "alpine_318_root",
        "alpine_317",
        "alpine_317_root",
        "alpine_316",
        "alpine_316_root",
        "alpine_315",
        "alpine_315_root",
    ]
}

target "cross" {
    platforms = [
        "linux/amd64",
        "linux/arm64"
    ]
}

target "root" {
    args = {
        USERNAME = "root"
    }
}

// Debian

target "debian_base" {
    dockerfile = "./dockerfiles/debian/base.Dockerfile"
}

target "debian_root" {
    dockerfile = "./dockerfiles/debian/root.Dockerfile"
}

target "debian_nonroot" {
    dockerfile = "./dockerfiles/debian/nonroot.Dockerfile"
}

group "debian12" {
    targets = [
        "debian12_base",
        "debian12_deploy",
    ]
}

group "debian12_deploy" {
    targets = [
        "debian12_nonroot",
        "debian12_root",
    ]
}

target "debian12_base" {
    inherits = ["debian_base", "cross"]
    args = {
        DEBIAN_VERSION = "bookworm"
    }
}

target "debian12_root" {
    inherits = ["debian_root", "cross"]
    contexts = {
        base = "target:debian12_base"
    }
    tags = [
        "ghcr.io/sambyeol/latex-devcontainer:debian12-root",
        "ghcr.io/sambyeol/latex-devcontainer:bookworm-root",
        "ghcr.io/sambyeol/latex-devcontainer:debian-root",
        "ghcr.io/sambyeol/latex-devcontainer:latest-root",
        "ghcr.io/sambyeol/latex-devcontainer:root"
    ]
}

target "debian12_nonroot" {
    inherits = ["debian_nonroot", "cross"]
    contexts = {
        base = "target:debian12_base"
    }
    tags = [
        "ghcr.io/sambyeol/latex-devcontainer:debian12",
        "ghcr.io/sambyeol/latex-devcontainer:bookworm",
        "ghcr.io/sambyeol/latex-devcontainer:debian",
        "ghcr.io/sambyeol/latex-devcontainer:latest"
    ]
}

target "debian11" {
    inherits = ["debian_base", "cross"]
    args = {
        DEBIAN_VERSION = "bullseye"
    }
    
}

target "debian11_root" {
    inherits = ["debian_root", "cross"]
    contexts = {
        base = "target:debian11_base"
    }
    tags = [
        "ghcr.io/sambyeol/latex-devcontainer:debian11-root",
        "ghcr.io/sambyeol/latex-devcontainer:bullseye-root",
    ]
}

target "debian11_nonroot" {
    inherits = ["debian_nonroot", "cross"]
    contexts = {
        base = "target:debian11_base"
    }
    tags = [
        "ghcr.io/sambyeol/latex-devcontainer:debian11",
        "ghcr.io/sambyeol/latex-devcontainer:bullseye",
    ]
}

target "debian10" {
    inherits = ["debian_base", "cross"]
    args = {
        DEBIAN_VERSION = "buster"
    }
}

target "debian10_root" {
    inherits = ["debian_root", "cross"]
    contexts = {
        base = "target:debian10_base"
    }
    tags = [
        "ghcr.io/sambyeol/latex-devcontainer:debian10-root",
        "ghcr.io/sambyeol/latex-devcontainer:buster-root",
    ]
}

target "debian10_nonroot" {
    inherits = ["debian_nonroot", "cross"]
    contexts = {
        base = "target:debian10_base"
    }
    tags = [
        "ghcr.io/sambyeol/latex-devcontainer:debian10",
        "ghcr.io/sambyeol/latex-devcontainer:buster",
    ]
}

// Ubuntu

target "ubuntu" {
    dockerfile = "./dockerfiles/ubuntu/Dockerfile"
}

target "ubuntu2304" {
    inherits = ["ubuntu", "cross"]
    tags = [
        "ghcr.io/sambyeol/latex-devcontainer:ubuntu2304",
        "ghcr.io/sambyeol/latex-devcontainer:lunar",
    ]
    args = {
        UBUNTU_VERSION = "23.04"
    }
}

target "ubuntu2304_root" {
    inherits = ["ubuntu", "ubuntu2304", "cross", "root"]
    tags = [
        "ghcr.io/sambyeol/latex-devcontainer:ubuntu2304-root",
        "ghcr.io/sambyeol/latex-devcontainer:lunar-root",
    ]
}

target "ubuntu2210" {
    inherits = ["ubuntu", "cross"]
    tags = [
        "ghcr.io/sambyeol/latex-devcontainer:ubuntu2210",
        "ghcr.io/sambyeol/latex-devcontainer:kinetic",
    ]
    args = {
        UBUNTU_VERSION = "22.10"
    }
}

target "ubuntu2210_root" {
    inherits = ["ubuntu", "ubuntu2210", "cross", "root"]
    tags = [
        "ghcr.io/sambyeol/latex-devcontainer:ubuntu2210-root",
        "ghcr.io/sambyeol/latex-devcontainer:kinetic-root",
    ]
}

target "ubuntu2204" {
    inherits = ["ubuntu", "cross"]
    tags = [
        "ghcr.io/sambyeol/latex-devcontainer:ubuntu2204",
        "ghcr.io/sambyeol/latex-devcontainer:jammy",
        "ghcr.io/sambyeol/latex-devcontainer:ubuntu",
    ]
    args = {
        UBUNTU_VERSION = "22.04"
    }
}

target "ubuntu2204_root" {
    inherits = ["ubuntu", "ubuntu2204", "cross", "root"]
    tags = [
        "ghcr.io/sambyeol/latex-devcontainer:ubuntu2204-root",
        "ghcr.io/sambyeol/latex-devcontainer:jammy-root",
        "ghcr.io/sambyeol/latex-devcontainer:ubuntu-root",
    ]
}

target "ubuntu2004" {
    inherits = ["ubuntu", "cross"]
    tags = [
        "ghcr.io/sambyeol/latex-devcontainer:ubuntu2004",
        "ghcr.io/sambyeol/latex-devcontainer:focal"
    ]
    args = {
        UBUNTU_VERSION = "20.04"
    }
}

target "ubuntu2004_root" {
    inherits = ["ubuntu", "ubuntu2004", "cross", "root"]
    tags = [
        "ghcr.io/sambyeol/latex-devcontainer:ubuntu2004-root",
        "ghcr.io/sambyeol/latex-devcontainer:focal-root"
    ]
}

// Alpine

target "alpine" {
    dockerfile = "./dockerfiles/alpine/Dockerfile"
}

target "alpine_318" {
    inherits = ["alpine", "cross"]
    tags = [
        "ghcr.io/sambyeol/latex-devcontainer:alpine",
        "ghcr.io/sambyeol/latex-devcontainer:alpine-3.18",
    ]
    args = {
        ALPINE_VERSION = "3.18"
    }
}

target "alpine_318_root" {
    inherits = ["alpine", "alpine_318", "cross", "root"]
    tags = [
        "ghcr.io/sambyeol/latex-devcontainer:alpine-root",
        "ghcr.io/sambyeol/latex-devcontainer:alpine-3.18-root",
    ]
}

target "alpine_317" {
    inherits = ["alpine", "cross"]
    tags = [
        "ghcr.io/sambyeol/latex-devcontainer:alpine",
        "ghcr.io/sambyeol/latex-devcontainer:alpine-3.17",
    ]
    args = {
        ALPINE_VERSION = "3.17"
    }
}

target "alpine_317_root" {
    inherits = ["alpine", "alpine_317", "cross", "root"]
    tags = [
        "ghcr.io/sambyeol/latex-devcontainer:alpine-root",
        "ghcr.io/sambyeol/latex-devcontainer:alpine-3.17-root",
    ]
}

target "alpine_316" {
    inherits = ["alpine", "cross"]
    tags = [
        "ghcr.io/sambyeol/latex-devcontainer:alpine-3.16",
    ]
    args = {
        ALPINE_VERSION = "3.16"
    }
}

target "alpine_316_root" {
    inherits = ["alpine", "alpine_316", "cross", "root"]
    tags = [
        "ghcr.io/sambyeol/latex-devcontainer:alpine-3.16-root",
    ]
}

target "alpine_315" {
    inherits = ["alpine", "cross"]
    dockerfile = "./dockerfiles/alpine/Dockerfile"
    tags = [
        "ghcr.io/sambyeol/latex-devcontainer:alpine-3.15"
    ]
    args = {
        ALPINE_VERSION = "3.15"
    }
}

target "alpine_315_root" {
    inherits = ["alpine", "alpine_315", "cross", "root"]
    tags = [
        "ghcr.io/sambyeol/latex-devcontainer:alpine-3.15-root"
    ]
}
