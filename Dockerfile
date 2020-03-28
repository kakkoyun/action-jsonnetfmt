# Container image that runs your code
FROM golang:1.14-alpine3.11 as builder

ENV GO111MODULE on
RUN go get -u github.com/google/go-jsonnet/cmd/jsonnetfmt@master


FROM alpine:3.11 as runner

COPY --from=builder /go/bin/jsonnetfmt /bin/jsonnetfmt

LABEL repository="https://github.com/kakkoyun/action-jsonnetfmt"
LABEL homepage="https://github.com/kakkoyun/action-jsonnetfmt"
LABEL maintainer="Kemal Akkoyun <kakkoyun@gmail.com>"

LABEL "com.github.actions.name"="jsonnetfmt Action"
LABEL "com.github.actions.description"="Run jsonnetfmt to check if jsonnet files are formatted in current workspace"
LABEL "com.github.actions.icon"="feather"
LABEL "com.github.actions.color"="blue"

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
