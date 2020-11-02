FROM alpine:3.12

RUN apk add --no-cache unbound

ENTRYPOINT ["unbound", "-d"]

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
	CMD [ "drill", "-p", "53", "zdns.cn", "@127.0.0.1" ]
