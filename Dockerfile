FROM hub.artifactory.gcp.anz/golang:1.14.7-alpine3.12

LABEL "version"="1.0.0"
LABEL "repository"="https://github.com/sjdaws/go-mod-outdated-action"
LABEL "homepage"="https://github.com/sjdaws/go-mod-outdated-action"
LABEL "maintainer"="Scott Dawson <scott@anz.com>"

# Set go proxy
ENV GONOSUMDB=*
ENV GO111MODULE=on
ENV GOPROXY=https://artifactory.gcp.anz/artifactory/api/go/go,direct
#ENV GOPRIVATE=github.com/anzx

# Add go-mod-outdated
RUN go get github.com/psampaz/go-mod-outdated

# Run go mod outdated
ENTRYPOINT ["go", "list", "-mod=readonly", "-u", "-m", "-json", "all"]