#
# Stage 1
#
FROM library/golang:1 as builder

# Recompile the standard library without CGO
RUN CGO_ENABLED=0 go install -a std

WORKDIR /build
ADD . .
# Compile the binary and statically link
RUN CGO_ENABLED=0 go build -ldflags '-w -s' -o /chartmuseum-ui

#
# Stage 2
#
FROM alpine:3.11
RUN apk add --no-cache curl cifs-utils ca-certificates \
    && adduser -D -u 1000 chartmuseum
COPY --from=builder /chartmuseum-ui /chartmuseum-ui
COPY /views /views
COPY /static /static
USER 1000
ENTRYPOINT ["/chartmuseum-ui"]
