FROM golang:latest AS compiler

WORKDIR /go/src
COPY src/. .

RUN go build

FROM scratch
WORKDIR /
COPY --from=compiler /go/src/main .

ENTRYPOINT [ "./main" ]