FROM weaveworks/weave-npc:2.8.1
LABEL maintainer="Ronan Le Meillat <ronan.le_meillat@highcanfly.club>" 
LABEL maintainer="Ronan Le Meillat <ronan.le_meillat@highcanfly.club>" 
RUN cd /sbin && \
    rm -f /sbin/iptables /sbin/ip6tables /sbin/iptables-save /sbin/iptables-restore &&\
    ln -f -s xtables-nft-multi /sbin/iptables && \
    ln -f -s xtables-nft-multi /sbin/ip6tables && \
    ln -f -s xtables-nft-multi /sbin/iptables-save && \
    ln -f -s xtables-nft-multi /sbin/iptables-restore
