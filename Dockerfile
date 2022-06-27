#
# Stage 1
#
FROM library/golang:1 as builder

# Godep for vendoring
RUN go install github.com/tools/godep@master

# Recompile the standard library without CGO
RUN CGO_ENABLED=0 go install -a std

ENV APP_DIR $GOPATH/src/github.com/chartmuseum/ui
RUN mkdir -p $APP_DIR
ADD . $APP_DIR

# Compile the binary and statically link
RUN cd $APP_DIR && \
    GO111MODULE=auto CGO_ENABLED=0 godep go build -ldflags '-w -s' -o /chartmuseum-ui && \
    cp -r views/ /views && \
    cp -r static/ /static

#
# Stage 2
#
FROM alpine:3.8
RUN apk add --no-cache curl cifs-utils ca-certificates \
    && adduser -D -u 1000 chartmuseum
COPY --from=builder /chartmuseum-ui /chartmuseum-ui
COPY --from=builder /views /views
COPY --from=builder /static /static
USER 1000
ENTRYPOINT ["/chartmuseum-ui"]
