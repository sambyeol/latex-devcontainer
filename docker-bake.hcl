group "default" {
    targets = [
        "ubuntu2204",
        "ubuntu2204_root",
        "ubuntu2004",
        "ubuntu2004_root",
        "alpine",
        "alpine_root"
    ]
}

target "cross" {
    platforms = [
        "linux/amd64",
        "linux/arm64"
    ]
}

// Ubuntu

target "ubuntu" {
    dockerfile = "./dockerfiles/ubuntu/Dockerfile"
}

target "root" {
    args = {
        USERNAME = "root"
    }
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
        "sambyeol/latex-devcontainer:latest"
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
        "sambyeol/latex-devcontainer:latest-root",
        "sambyeol/latex-devcontainer:root"
    ]
}

// Alpine

target "alpine" {
    inherits = ["cross"]
    dockerfile = "./dockerfiles/alpine/Dockerfile"
    tags = [
        "sambyeol/latex-devcontainer:alpine"
    ]
}

target "alpine_root" {
    inherits = ["alpine", "cross", "root"]
    tags = [
        "sambyeol/latex-devcontainer:alpine-root"
    ]
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
