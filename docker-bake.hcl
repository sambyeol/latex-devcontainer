group "default" {
    targets = [
        "ubuntu2204",
        "ubuntu2204_nonroot",
        "ubuntu2110",
        "ubuntu2110_nonroot",
        "ubuntu2104",
        "ubuntu2104_nonroot",
        "ubuntu2004",
        "ubuntu2004_nonroot",
        "alpine",
        "alpine_nonroot"
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

target "nonroot" {
    args = {
        USERNAME = "sambyeol"
    }
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

target "ubuntu2204_nonroot" {
    inherits = ["ubuntu", "ubuntu2204", "cross", "nonroot"]
    tags = [
        "sambyeol/latex-devcontainer:ubuntu2204-nonroot",
        "sambyeol/latex-devcontainer:jammy-nonroot",
        "sambyeol/latex-devcontainer:ubuntu-nonroot",
        "sambyeol/latex-devcontainer:latest-nonroot",
        "sambyeol/latex-devcontainer:nonroot"
    ]
}

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

target "ubuntu2110_nonroot" {
    inherits = ["ubuntu", "ubuntu2110", "cross", "nonroot"]
    tags = [
        "sambyeol/latex-devcontainer:ubuntu2110-nonroot",
        "sambyeol/latex-devcontainer:impish-nonroot"
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

target "ubuntu2104_nonroot" {
    inherits = ["ubuntu", "ubuntu2104", "cross", "nonroot"]
    tags = [
        "sambyeol/latex-devcontainer:ubuntu2104-nonroot",
        "sambyeol/latex-devcontainer:hirsute-nonroot"
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

target "ubuntu2004_nonroot" {
    inherits = ["ubuntu", "ubuntu2004", "cross", "nonroot"]
    tags = [
        "sambyeol/latex-devcontainer:ubuntu2004-nonroot",
        "sambyeol/latex-devcontainer:focal-nonroot"
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

target "alpine_nonroot" {
    inherits = ["alpine", "cross", "nonroot"]
    tags = [
        "sambyeol/latex-devcontainer:alpine-nonroot"
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

target "ubuntu1804_nonroot" {
    inherits = ["ubuntu", "ubuntu1804", "cross", "nonroot"]
    tags = [
        "sambyeol/latex-devcontainer:ubuntu1804-nonroot",
        "sambyeol/latex-devcontainer:bionic-nonroot"
    ]
    args = {
        UBUNTU_VERSION = "18.04"
    }
}
