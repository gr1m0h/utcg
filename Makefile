origin_url := $(shell git remote get-url origin)
proto := $(shell echo ${origin_url} | grep :// | sed -e's,^\(.*://\).*,\1,g')
url := $(shell echo ${origin_url} | sed -e s,${proto},,g)
path := $(shell echo ${url} | grep / | cut -d/ -f2-)
repo_name := $(shell echo ${path} | cut -d. -f1)
package := $(shell echo ${repo_name} | cut -d/ -f2-)

build_darwin_amd64:
	GOOS=darwin GOARCH=amd64 go build -o ${package} cmd/${package}/main.go
	tar cvzf ${package}-darwin-amd64.tar.gz ${package}

build_darwin_arm64:
	GOOS=darwin GOARCH=arm64 go build -o ${package} cmd/${package}/main.go
	tar cvzf ${package}-darwin-arm64.tar.gz ${package}

build_linux_amd64:
	GOOS=linux GOARCH=amd64 go build -o ${package} cmd/${package}/main.go
	tar cvzf ${package}-linux-amd64.tar.gz ${package}

build_linux_arm64:
	GOOS=linux GOARCH=arm64 go build -o ${package} cmd/${package}/main.go
	tar cvzf ${package}-linux-arm64.tar.gz ${package}
