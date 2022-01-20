group "default" {
    targets = [
        "ubuntu2004",
        "ubuntu2104"
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

target "ubuntu2004" {
    inherits = ["ubuntu", "cross"]
    tags = [
        "sambyeol/latex-devcontainer:ubuntu2004"
    ]
}

target "ubuntu2104" {
    inherits = ["ubuntu", "cross"]
    tags = [
        "sambyeol/latex-devcontainer:ubuntu2104"
    ]
}

