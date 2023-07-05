group "default" {
    targets = [
        "latest",
        "debian",
        "ubuntu",
        "alpine",
    ]
}

target "cross" {
    platforms = [
        "linux/amd64",
        "linux/arm64"
    ]
}

// Debian

group "latest" {
    targets = [
        "debian12",
    ]
}

group "debian" {
    targets = [
        "debian11",
        "debian10",
    ]
}

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

group "debian11" {
    targets = [
        "debian11_nonroot",
        "debian11_root",
    ]
}

target "debian11_base" {
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

group "debian10" {
    targets = [
        "debian10_nonroot",
        "debian10_root",
    ]
}

target "debian10_base" {
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

group "ubuntu" {
    targets = [
        "ubuntu2304",
        "ubuntu2210",
        "ubuntu2204",
        "ubuntu2004",
    ]
}

target "ubuntu_base" {
    dockerfile = "./dockerfiles/ubuntu/base.Dockerfile"
}

target "ubuntu_root" {
    dockerfile = "./dockerfiles/ubuntu/root.Dockerfile"
}

target "ubuntu_nonroot" {
    dockerfile = "./dockerfiles/ubuntu/nonroot.Dockerfile"
}

group "ubuntu2304" {
    targets = [
        "ubuntu2304_nonroot",
        "ubuntu2304_root",
    ]
}

target "ubuntu2304_base" {
    inherits = ["ubuntu_base", "cross"]
    args = {
        UBUNTU_VERSION = "23.04"
    }
}

target "ubuntu2304_nonroot" {
    inherits = ["ubuntu_nonroot", "cross"]
    contexts = {
        base = "target:ubuntu2304_base"
    }
    tags = [
        "ghcr.io/sambyeol/latex-devcontainer:ubuntu2304",
        "ghcr.io/sambyeol/latex-devcontainer:lunar",
    ]
}

target "ubuntu2304_root" {
    inherits = ["ubuntu_root", "cross"]
    contexts = {
        base = "target:ubuntu2304_base"
    }
    tags = [
        "ghcr.io/sambyeol/latex-devcontainer:ubuntu2304-root",
        "ghcr.io/sambyeol/latex-devcontainer:lunar-root",
    ]
}


group "ubuntu2210" {
    targets = [
        "ubuntu2210_nonroot",
        "ubuntu2210_root",
    ]
}

target "ubuntu2210_base" {
    inherits = ["ubuntu_base", "cross"]
    args = {
        UBUNTU_VERSION = "22.10"
    }
}

target "ubuntu2210_nonroot" {
    inherits = ["ubuntu_nonroot", "cross"]
    contexts = {
        base = "target:ubuntu2210_base"
    }
    tags = [
        "ghcr.io/sambyeol/latex-devcontainer:ubuntu2210",
        "ghcr.io/sambyeol/latex-devcontainer:kinetic",
    ]
}

target "ubuntu2210_root" {
    inherits = ["ubuntu_root", "cross"]
    contexts = {
        base = "target:ubuntu2210_base"
    }
    tags = [
        "ghcr.io/sambyeol/latex-devcontainer:ubuntu2210-root",
        "ghcr.io/sambyeol/latex-devcontainer:kinetic-root",
    ]
}

group "ubuntu2204" {
    targets = [
        "ubuntu2204_nonroot",
        "ubuntu2204_root",
    ]
}

target "ubuntu2204_base" {
    inherits = ["ubuntu_base", "cross"]
    args = {
        UBUNTU_VERSION = "22.04"
    }
}

target "ubuntu2204_nonroot" {
    inherits = ["ubuntu_nonroot", "cross"]
    contexts = {
        base = "target:ubuntu2204_base"
    }
    tags = [
        "ghcr.io/sambyeol/latex-devcontainer:ubuntu2204",
        "ghcr.io/sambyeol/latex-devcontainer:jammy",
        "ghcr.io/sambyeol/latex-devcontainer:ubuntu",
    ]
}

target "ubuntu2204_root" {
    inherits = ["ubuntu_root", "cross"]
    contexts = {
        base = "target:ubuntu2204_base"
    }
    tags = [
        "ghcr.io/sambyeol/latex-devcontainer:ubuntu2204-root",
        "ghcr.io/sambyeol/latex-devcontainer:jammy-root",
        "ghcr.io/sambyeol/latex-devcontainer:ubuntu-root",
    ]
}

group "ubuntu2004" {
    targets = [
        "ubuntu2004_nonroot",
        "ubuntu2004_root",
    ]
}

target "ubuntu2004_base" {
    inherits = ["ubuntu_base", "cross"]
    args = {
        UBUNTU_VERSION = "20.04"
    }
}

target "ubuntu2004_nonroot" {
    inherits = ["ubuntu_nonroot", "cross"]
    contexts = {
        base = "target:ubuntu2004_base"
    }
    tags = [
        "ghcr.io/sambyeol/latex-devcontainer:ubuntu2004",
        "ghcr.io/sambyeol/latex-devcontainer:focal",
    ]
}

target "ubuntu2004_root" {
    inherits = ["ubuntu_root", "cross"]
    contexts = {
        base = "target:ubuntu2004_base"
    }
    tags = [
        "ghcr.io/sambyeol/latex-devcontainer:ubuntu2004-root",
        "ghcr.io/sambyeol/latex-devcontainer:focal-root",
    ]
}

// Alpine

group "alpine" {
    targets = [
        "alpine_318",
        "alpine_317",
        "alpine_316",
        "alpine_315",
    ]
}

target "alpine_base" {
    dockerfile = "./dockerfiles/alpine/base.Dockerfile"
}

target "alpine_nonroot" {
    dockerfile = "./dockerfiles/alpine/nonroot.Dockerfile"
}

target "alpine_root" {
    dockerfile = "./dockerfiles/alpine/root.Dockerfile"
}

group "alpine_318" {
    targets = [
        "alpine_318_root",
        "alpine_318_nonroot",
    ]
}

target "alpine_318_base" {
    inherits = ["alpine_base", "cross"]
    args = {
        ALPINE_VERSION = "3.18"
    }
}

target "alpine_318_nonroot" {
    inherits = ["alpine_nonroot", "cross"]
    contexts = {
        base = "target:alpine_318_base"
    }
    tags = [
        "ghcr.io/sambyeol/latex-devcontainer:alpine-3.18",
    ]
}

target "alpine_318_root" {
    inherits = ["alpine_root", "cross"]
    contexts = {
        base = "target:alpine_318_base"
    }
    tags = [
        "ghcr.io/sambyeol/latex-devcontainer:alpine-3.18-root",
    ]
}

target "alpine_317_base" {
    inherits = ["alpine_base", "cross"]
    args = {
        ALPINE_VERSION = "3.17"
    }
}

target "alpine_317_nonroot" {
    inherits = ["alpine_nonroot", "cross"]
    contexts = {
        base = "target:alpine_317_base"
    }
    tags = [
        "ghcr.io/sambyeol/latex-devcontainer:alpine-3.17",
    ]
}

target "alpine_317_root" {
    inherits = ["alpine_root", "cross"]
    contexts = {
        base = "target:alpine_317_base"
    }
    tags = [
        "ghcr.io/sambyeol/latex-devcontainer:alpine-3.17-root",
    ]
}

target "alpine_316_base" {
    inherits = ["alpine_base", "cross"]
    args = {
        ALPINE_VERSION = "3.16"
    }
}

target "alpine_316_nonroot" {
    inherits = ["alpine_nonroot", "cross"]
    contexts = {
        base = "target:alpine_316_base"
    }
    tags = [
        "ghcr.io/sambyeol/latex-devcontainer:alpine-3.16",
    ]
}

target "alpine_316_root" {
    inherits = ["alpine_root", "cross"]
    contexts = {
        base = "target:alpine_316_base"
    }
    tags = [
        "ghcr.io/sambyeol/latex-devcontainer:alpine-3.16-root",
    ]
}

target "alpine_315_base" {
    inherits = ["alpine_base", "cross"]
    args = {
        ALPINE_VERSION = "3.15"
    }
}

target "alpine_315_nonroot" {
    inherits = ["alpine_nonroot", "cross"]
    contexts = {
        base = "target:alpine_315_base"
    }
    tags = [
        "ghcr.io/sambyeol/latex-devcontainer:alpine-3.15",
    ]
}

target "alpine_315_root" {
    inherits = ["alpine_root", "cross"]
    contexts = {
        base = "target:alpine_315_base"
    }
    tags = [
        "ghcr.io/sambyeol/latex-devcontainer:alpine-3.15-root"
    ]
}
