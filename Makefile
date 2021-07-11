build_darwin_amd64:
	GOOS=darwin GOARCH=amd64 go build -o utcg cmd/utcg/main.go
	tar cvzf utcg-darwin-arm64.tar.gz utcg

build_linux_amd64:
	GOOS=linux GOARCH=amd64 go build -o utcg cmd/utcg/main.go
	tar cvzf utcg-linux-arm64.tar.gz utcg
