FROM --platform=$TARGETPLATFORM golang as builder

ARG TARGETPLATFORM

ENV GO111MODULE on
ENV CGO_ENABLED 0

RUN go get github.com/google/cadvisor@v0.36.0

FROM --platform=$TARGETPLATFORM alpine

COPY --from=builder /go/bin/cadvisor /usr/bin/cadvisor

EXPOSE 8080

HEALTHCHECK --interval=30s --timeout=3s \
  CMD wget --quiet --tries=1 --spider http://localhost:8080/healthz || exit 1

ENTRYPOINT ["/usr/bin/cadvisor", "-logtostderr"]
