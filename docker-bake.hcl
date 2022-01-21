group "default" {
    targets = [
        "ubuntu2110",
        "ubuntu2104",
        "ubuntu2004",
        "ubuntu1804"
    ]
}

target "cross" {
    platforms = [
        "linux/amd64",
        "linux/arm64"
    ]
}

target "ubuntu" {
    dockerfile = "./dockerfiles/ubuntu/Dockerfile"
}

target "ubuntu2110" {
    inherits = ["ubuntu", "cross"]
    tags = [
        "sambyeol/latex-devcontainer:ubuntu2110",
        "sambyeol/latex-devcontainer:impish "
    ]
    args = {
        UBUNTU_VERSION = "21.04"
    }
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

target "ubuntu2004" {
    inherits = ["ubuntu", "cross"]
    tags = [
        "sambyeol/latex-devcontainer:ubuntu2004",
        "sambyeol/latex-devcontainer:focal",
        "sambyeol/latex-devcontainer:ubuntu",
        "sambyeol/latex-devcontainer:latest"
    ]
    args = {
        UBUNTU_VERSION = "20.04"
    }
}

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
