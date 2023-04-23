{ pkgs }: {
    deps = [
        pkgs.wget
        pkgs.unzip
        pkgs.zip
        pkgs.go
        pkgs.gopls
    ];
}