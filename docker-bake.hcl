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
        "debian12",
    ]
}

target "cross" {
    platforms = [
        "linux/amd64",
        "linux/arm64"
    ]
}

// Debian

group "debian" {
    targets = [
        "debian12",
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
        "ghcr.io/sambyeol/latex-devcontainer:debian-12-root",
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
        "ghcr.io/sambyeol/latex-devcontainer:debian-12",
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
        "ghcr.io/sambyeol/latex-devcontainer:debian-11-root",
        "ghcr.io/sambyeol/latex-devcontainer:bullseye-root",
    ]
}

target "debian11_nonroot" {
    inherits = ["debian_nonroot", "cross"]
    contexts = {
        base = "target:debian11_base"
    }
    tags = [
        "ghcr.io/sambyeol/latex-devcontainer:debian-11",
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
        "ghcr.io/sambyeol/latex-devcontainer:debian-10-root",
        "ghcr.io/sambyeol/latex-devcontainer:buster-root",
    ]
}

target "debian10_nonroot" {
    inherits = ["debian_nonroot", "cross"]
    contexts = {
        base = "target:debian10_base"
    }
    tags = [
        "ghcr.io/sambyeol/latex-devcontainer:debian-10",
        "ghcr.io/sambyeol/latex-devcontainer:buster",
    ]
}

// Ubuntu

group "ubuntu" {
    targets = [
        "ubuntu2310",
        "ubuntu2304",
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



group "ubuntu2310" {
    targets = [
        "ubuntu2310_nonroot",
        "ubuntu2310_root",
    ]
}

target "ubuntu2310_base" {
    inherits = ["ubuntu_base", "cross"]
    args = {
        UBUNTU_VERSION = "23.10"
    }
}

target "ubuntu2310_nonroot" {
    inherits = ["ubuntu_nonroot", "cross"]
    contexts = {
        base = "target:ubuntu2310_base"
    }
    tags = [
        "ghcr.io/sambyeol/latex-devcontainer:ubuntu-23.10",
        "ghcr.io/sambyeol/latex-devcontainer:mantic",
    ]
}

target "ubuntu2310_root" {
    inherits = ["ubuntu_root", "cross"]
    contexts = {
        base = "target:ubuntu2310_base"
    }
    tags = [
        "ghcr.io/sambyeol/latex-devcontainer:ubuntu-23.10-root",
        "ghcr.io/sambyeol/latex-devcontainer:mantic-root",
    ]
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
        "ghcr.io/sambyeol/latex-devcontainer:ubuntu-23.04",
        "ghcr.io/sambyeol/latex-devcontainer:lunar",
    ]
}

target "ubuntu2304_root" {
    inherits = ["ubuntu_root", "cross"]
    contexts = {
        base = "target:ubuntu2304_base"
    }
    tags = [
        "ghcr.io/sambyeol/latex-devcontainer:ubuntu-23.04-root",
        "ghcr.io/sambyeol/latex-devcontainer:lunar-root",
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
        "ghcr.io/sambyeol/latex-devcontainer:ubuntu-22.04",
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
        "ghcr.io/sambyeol/latex-devcontainer:ubuntu-22.04-root",
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
        "ghcr.io/sambyeol/latex-devcontainer:ubuntu-20.04",
        "ghcr.io/sambyeol/latex-devcontainer:focal",
    ]
}

target "ubuntu2004_root" {
    inherits = ["ubuntu_root", "cross"]
    contexts = {
        base = "target:ubuntu2004_base"
    }
    tags = [
        "ghcr.io/sambyeol/latex-devcontainer:ubuntu-20.04-root",
        "ghcr.io/sambyeol/latex-devcontainer:focal-root",
    ]
}

// Alpine

group "alpine" {
    targets = [
        "alpine_319",
        "alpine_318",
        "alpine_317",
        "alpine_316",
    ]
}

group "alpine_319" {
    targets = [
        "alpine_319_root",
        "alpine_319_nonroot",
    ]
}

target "alpine_319_base" {
    inherits = ["alpine_base", "cross"]
    args = {
        ALPINE_VERSION = "3.19"
    }
}

target "alpine_319_nonroot" {
    inherits = ["alpine_nonroot", "cross"]
    contexts = {
        base = "target:alpine_319_base"
    }
    tags = [
        "ghcr.io/sambyeol/latex-devcontainer:alpine-3.19",
        "ghcr.io/sambyeol/latex-devcontainer:alpine-3",
        "ghcr.io/sambyeol/latex-devcontainer:alpine",
    ]
}

target "alpine_319_root" {
    inherits = ["alpine_root", "cross"]
    contexts = {
        base = "target:alpine_319_base"
    }
    tags = [
        "ghcr.io/sambyeol/latex-devcontainer:alpine-3.19-root",
        "ghcr.io/sambyeol/latex-devcontainer:alpine-3-root",
        "ghcr.io/sambyeol/latex-devcontainer:alpine-root",
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

group "alpine_317" {
    targets = [
        "alpine_317_root",
        "alpine_317_nonroot",
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

group "alpine_316" {
    targets = [
        "alpine_316_root",
        "alpine_316_nonroot",
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
