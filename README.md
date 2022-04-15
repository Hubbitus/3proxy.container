# 3proxy container image

Container with [3proxy](https://3proxy.ru/) - tiny yet powerful socks, http(s), pop3, imap proxy.

## Automated builds!
![container build status](https://quay.io/repository/hubbitus/3proxy/status)

Containers for this repository builds automatically! Please pull the latest version from the repository: https://quay.io/repository/hubbitus/3proxy

## Usage

### Very simple, yet working example
```shell
podman run -it --name 3proxy -p 8080:8088 -p 8888:8888 quay.io/hubbitus/3proxy
```

That should start HTTP proxy on port 8088 and SOCKS5 server on port 8888.
Authorisation enabled by default and single user present: testuser/testpassword.

## Using custom config
```shell
podman run -it --rm quay.io/hubbitus/3proxy cat /etc/3proxy.cfg > 3proxy.cfg
# ... arbitrary edit file, then run:
podman run -it -v ./3proxy.cfg:/etc/3proxy.cfg -v ./_logs:/var/log/3proxy --name 3proxy -p 8080:8088 -p 8888:8888 quay.io/hubbitus/3proxy
```

> **Note**! If you would like use other ports than default 8088 and 8888, most probably you will need run it in the host network mode (`--network host`).

