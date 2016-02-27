#
# Dockerfile
#

FROM base/archlinux
MAINTAINER Sebastian Lach <root@slach.eu>

# define environment
ENV LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8
ENV ANSIBLE_FORCE_COLOR=true
ENV SLEEP 120

# install dependencies
RUN pacman-key --refresh-keys && pacman -Sqyu --noconfirm --needed --noprogressbar python2 ansible git supervisor
RUN ln -s /usr/bin/python2 /usr/bin/python

# ansible configuration
RUN echo -e "localhost\tansible_connection=local" > /etc/ansible/hosts

# supervisord configuration
ADD supervisord.conf /etc/supervisord.conf
CMD supervisord

