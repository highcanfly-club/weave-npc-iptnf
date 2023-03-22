FROM weaveworks/weave-npc:2.8.1 as builder

FROM alpine:latest
LABEL maintainer="Ronan Le Meillat <ronan.le_meillat@highcanfly.club>" 
COPY --from=builder /usr/bin/weave-npc /usr/bin/weave-npc 
COPY --from=builder /usr/bin/launch.sh /usr/bin/launch.sh
RUN apk add --update \
    iptables \
    ipset \
	ulogd \
  && rm -rf /var/cache/apk/* \
  && mknod /var/log/ulogd.pcap p
RUN cd /sbin && \
    rm -f /sbin/iptables /sbin/ip6tables /sbin/iptables-save /sbin/iptables-restore &&\
    ln -f -s xtables-nft-multi /sbin/iptables && \
    ln -f -s xtables-nft-multi /sbin/ip6tables && \
    ln -f -s xtables-nft-multi /sbin/iptables-save && \
    ln -f -s xtables-nft-multi /sbin/iptables-restore
ENTRYPOINT [ "/usr/bin/launch.sh" ]