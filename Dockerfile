FROM golang

LABEL "version"="1.0.0"
LABEL "repository"="https://github.com/sjdaws/go-mod-outdated-action"
LABEL "homepage"="https://github.com/sjdaws/go-mod-outdated-action"
LABEL "maintainer"="Scott Dawson <scott@anz.com>"

# Add go-mod-outdated
RUN go get github.com/psampaz/go-mod-outdated

# Run go mod outdated
ENTRYPOINT ["go list", "-mod=readonly", "-u", "-m", "-json all", "|", "$(go env GOPATH)/bin/go-mod-outdated", "-update", "-direct", "-ci"]