FROM alpine:latest
RUN apk add -U curl
CMD ["curl", "www.google.com"]
