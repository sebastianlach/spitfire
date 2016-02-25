#
# Dockerfile
#

FROM base/archlinux
MAINTAINER Sebastian Lach <root@slach.eu>

# define environment
ENV LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8
ENV ANSIBLE_FORCE_COLOR=true

# install dependencies
RUN pacman -Sy --noconfirm python2 ansible git
RUN ln -s /usr/bin/python2 /usr/bin/python

# container's entrypoint
CMD /usr/bin/ansible-pull -U $URL --accept-host-key --inventory-file="localhost," --directory=/etc/pull

