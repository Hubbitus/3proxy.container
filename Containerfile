FROM registry.fedoraproject.org/fedora

LABEL \
    org.opencontainers.image.author="Pavel Alexeev <Pahan@hubbitus.info>" \
    org.opencontainers.image.title="3proxy" \
    org.opencontainers.image.description="Tiny free proxy server" \
    org.opencontainers.image.url="https://github.com/tarampampam/3proxy-docker" \
    org.opencontainers.image.source="https://github.com/tarampampam/3proxy-docker" \
    org.opencontainers.image.vendor="Hubbitus" \
    org.opencontainers.image.licenses="MIT"

RUN dnf install -y 3proxy && dnf clean all

ADD 3proxy.cfg.example /etc/3proxy.cfg

RUN useradd 3proxy

RUN mkdir -p /var/log/3proxy && chown 3proxy /var/log/3proxy

USER 3proxy:3proxy

EXPOSE 8888/tcp 8088/tcp

CMD ["/usr/bin/3proxy", "/etc/3proxy.cfg"]
