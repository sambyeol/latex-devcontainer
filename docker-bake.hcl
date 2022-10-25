group "default" {
    targets = [
        "ubuntu2210",
        "ubuntu2210_root",
        "ubuntu2204",
        "ubuntu2204_root",
        "ubuntu2004",
        "ubuntu2004_root",
        "alpine_316",
        "alpine_316_root",
        "alpine_315",
        "alpine_315_root",
        "alpine_314",
        "alpine_314_root",
        "alpine_313",
        "alpine_313_root"
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

target "debian" {
    dockerfile = "./dockerfiles/debian/Dockerfile"
}

target "debian11" {
    inherits = ["debian", "cross"]
    tags = [
        "sambyeol/latex-devcontainer:debian11",
        "sambyeol/latex-devcontainer:bullseye",
        "sambyeol/latex-devcontainer:debian",
        "sambyeol/latex-devcontainer:latest"
    ]
    args = {
        DEBIAN_VERSION = "bullseye"
    }
}

target "debian11_root" {
    inherits = ["debian", "debian11", "cross"]
    tags = [
        "sambyeol/latex-devcontainer:debian11-root",
        "sambyeol/latex-devcontainer:bullseye-root",
        "sambyeol/latex-devcontainer:debian-root",
        "sambyeol/latex-devcontainer:latest-root",
        "sambyeol/latex-devcontainer:root"
    ]
}

target "debian10" {
    inherits = ["debian", "cross"]
    tags = [
        "sambyeol/latex-devcontainer:debian10",
        "sambyeol/latex-devcontainer:buster",
    ]
    args = {
        DEBIAN_VERSION = "buster"
    }
}

target "debian10_root" {
    inherits = ["debian", "debian10", "cross"]
    tags = [
        "sambyeol/latex-devcontainer:debian11-root",
        "sambyeol/latex-devcontainer:buster-root",
    ]
}

// Ubuntu

target "ubuntu" {
    dockerfile = "./dockerfiles/ubuntu/Dockerfile"
}

target "ubuntu2210" {
    inherits = ["ubuntu", "cross"]
    tags = [
        "sambyeol/latex-devcontainer:ubuntu2210",
        "sambyeol/latex-devcontainer:kinetic",
    ]
    args = {
        UBUNTU_VERSION = "22.10"
    }
}

target "ubuntu2210_root" {
    inherits = ["ubuntu", "ubuntu2210", "cross", "root"]
    tags = [
        "sambyeol/latex-devcontainer:ubuntu2210-root",
        "sambyeol/latex-devcontainer:kinetic-root",
    ]
}

target "ubuntu2204" {
    inherits = ["ubuntu", "cross"]
    tags = [
        "sambyeol/latex-devcontainer:ubuntu2204",
        "sambyeol/latex-devcontainer:jammy",
        "sambyeol/latex-devcontainer:ubuntu",
    ]
    args = {
        UBUNTU_VERSION = "22.04"
    }
}

target "ubuntu2204_root" {
    inherits = ["ubuntu", "ubuntu2204", "cross", "root"]
    tags = [
        "sambyeol/latex-devcontainer:ubuntu2204-root",
        "sambyeol/latex-devcontainer:jammy-root",
        "sambyeol/latex-devcontainer:ubuntu-root",
    ]
}

// Alpine

target "alpine" {
    dockerfile = "./dockerfiles/alpine/Dockerfile"
}

target "alpine_316" {
    inherits = ["alpine", "cross"]
    tags = [
        "sambyeol/latex-devcontainer:alpine",
        "sambyeol/latex-devcontainer:alpine-3.16",
    ]
    args = {
        ALPINE_VERSION = "3.16"
    }
}

target "alpine_316_root" {
    inherits = ["alpine", "cross", "root"]
    tags = [
        "sambyeol/latex-devcontainer:alpine-root",
        "sambyeol/latex-devcontainer:alpine-3.16-root",
    ]
    args = {
        ALPINE_VERSION = "3.16"
    }
}

target "alpine_315" {
    inherits = ["alpine", "cross"]
    dockerfile = "./dockerfiles/alpine/Dockerfile"
    tags = [
        "sambyeol/latex-devcontainer:alpine-3.15"
    ]
    args = {
        ALPINE_VERSION = "3.15"
    }
}

target "alpine_315_root" {
    inherits = ["alpine", "cross", "root"]
    tags = [
        "sambyeol/latex-devcontainer:alpine-3.15-root"
    ]
    args = {
        ALPINE_VERSION = "3.15"
    }
}

target "alpine_314" {
    inherits = ["alpine", "cross"]
    dockerfile = "./dockerfiles/alpine/Dockerfile"
    tags = [
        "sambyeol/latex-devcontainer:alpine-3.14"
    ]
    args = {
        ALPINE_VERSION = "3.14"
    }
}

target "alpine_314_root" {
    inherits = ["alpine", "cross", "root"]
    tags = [
        "sambyeol/latex-devcontainer:alpine-3.14-root"
    ]
    args = {
        ALPINE_VERSION = "3.14"
    }
}

target "alpine_313" {
    inherits = ["alpine", "cross"]
    dockerfile = "./dockerfiles/alpine/Dockerfile"
    tags = [
        "sambyeol/latex-devcontainer:alpine-3.13"
    ]
    args = {
        ALPINE_VERSION = "3.13"
    }
}

target "alpine_313_root" {
    inherits = ["alpine", "cross", "root"]
    tags = [
        "sambyeol/latex-devcontainer:alpine-3.13-root"
    ]
    args = {
        ALPINE_VERSION = "3.13"
    }
}

// Depreciated in October, 2022

target "ubuntu2110" {
    inherits = ["ubuntu", "cross"]
    tags = [
        "sambyeol/latex-devcontainer:ubuntu2110",
        "sambyeol/latex-devcontainer:impish"
    ]
    args = {
        UBUNTU_VERSION = "21.10"
    }
}

target "ubuntu2110_root" {
    inherits = ["ubuntu", "ubuntu2110", "cross", "root"]
    tags = [
        "sambyeol/latex-devcontainer:ubuntu2110-root",
        "sambyeol/latex-devcontainer:impish-root"
    ]
}

target "ubuntu2104" {
    inherits = ["ubuntu", "cross"]
    tags = [
        "sambyeol/latex-devcontainer:ubuntu2104",
        "sambyeol/latex-devcontainer:hirsute"
    ]
    args = {
        UBUNTU_VERSION = "21.04"
    }
}

target "ubuntu2104_root" {
    inherits = ["ubuntu", "ubuntu2104", "cross", "root"]
    tags = [
        "sambyeol/latex-devcontainer:ubuntu2104-root",
        "sambyeol/latex-devcontainer:hirsute-root"
    ]
}

target "ubuntu2004" {
    inherits = ["ubuntu", "cross"]
    tags = [
        "sambyeol/latex-devcontainer:ubuntu2004",
        "sambyeol/latex-devcontainer:focal"
    ]
    args = {
        UBUNTU_VERSION = "20.04"
    }
}

target "ubuntu2004_root" {
    inherits = ["ubuntu", "ubuntu2004", "cross", "root"]
    tags = [
        "sambyeol/latex-devcontainer:ubuntu2004-root",
        "sambyeol/latex-devcontainer:focal-root"
    ]
}

// Depreciated in May, 2022

target "ubuntu1804" {
    inherits = ["ubuntu", "cross"]
    tags = [
        "sambyeol/latex-devcontainer:ubuntu1804",
        "sambyeol/latex-devcontainer:bionic"
    ]
    args = {
        UBUNTU_VERSION = "18.04"
    }
}

target "ubuntu1804_root" {
    inherits = ["ubuntu", "ubuntu1804", "cross", "root"]
    tags = [
        "sambyeol/latex-devcontainer:ubuntu1804-root",
        "sambyeol/latex-devcontainer:bionic-root"
    ]
    args = {
        UBUNTU_VERSION = "18.04"
    }
}
