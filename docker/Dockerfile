FROM alpine:latest AS builder
WORKDIR /out
COPY docker-entrypoint.sh entrypoint.sh
RUN chmod +x entrypoint.sh
RUN apk add --update --no-cache wget \
    && baseArch=$(cat /etc/apk/arch | sed "{s/x86_64/amd64/; s/aarch64/arm64/}") \
    && wget -nv https://github.com/cdle/sillyGirl/releases/download/main/sillyGirl_linux_${baseArch} -O sillyGirl
RUN chmod 777 sillyGirl


FROM alpine:latest
LABEL container.maintainer="xtoys <echoless@yeah.net>"
ENV SHELL=/bin/bash \
    TZ=Asia/Shanghai \
    PS1="\u@\h:\w \$ "

COPY --from=builder /out/sillyGirl /app/
COPY --from=builder /out/entrypoint.sh /bin/

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
    && apk add --update --no-cache bash tini tzdata

WORKDIR /app
ENTRYPOINT  ["tini","--","entrypoint.sh"]