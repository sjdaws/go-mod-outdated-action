FROM gcr.io/anz-x-fabric-np-641432/base-images/base-debian10:vf23e3b5

LABEL "version"="1.0.0"
LABEL "repository"="https://github.com/sjdaws/go-mod-outdated-action"
LABEL "homepage"="https://github.com/sjdaws/go-mod-outdated-action"
LABEL "maintainer"="Scott Dawson <scott@anz.com>"

# Add go-mod-outdated
RUN go get github.com/psampaz/go-mod-outdated

# Set go proxy
ENV GONOSUMDB=*
ENV GO111MODULE=on
ENV GOPROXY=https://platform-gomodproxy.services-platdev.x.gcpnp.anz,https://artifactory.gcp.anz/artifactory/api/go/go,direct
#ENV GOPRIVATE=github.com/anzx

# Run go mod outdated
ENTRYPOINT ["go", "list", "-mod=readonly", "-u", "-m", "-json", "all"]