FROM golang

LABEL "version"="1.0.0"
LABEL "repository"="https://github.com/sjdaws/go-mod-outdated-action"
LABEL "homepage"="https://github.com/sjdaws/go-mod-outdated-action"
LABEL "maintainer"="Scott Dawson <scott@anz.com>"

# Add go-mod-outdated
RUN go get github.com/psampaz/go-mod-outdated

# Redirect to artifactory
ARG ARTIFACTORY=artifactory.gcp.anz
ENV GOPROXY=${ARTIFACTORY:+https://${ARTIFACTORY}/artifactory/go}
ENV GO111MODULE=on

# Run go mod outdated
ENTRYPOINT ["go", "list", "-mod=readonly", "-u", "-m", "-json", "all"]