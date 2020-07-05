FROM centos:7
MAINTAINER Alejandro alejo.pm92@gmail.com

RUN yum -y install  openssh-server \
    libpq-dev libjpeg-dev libopenjp2-7-dev passwd curl

RUN yum -y install https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm

RUN yum -y install epel-release yum-utils && \
    yum-config-manager --enable pgdg12 && \
    yum -y install postgresql12-server postgresql12

RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
    python get-pip.py && \
    pip install awscli --upgrade

RUN useradd remote_user && \
    echo "globant1234" | passwd --stdin remote_user && \
    mkdir /home/remote_user/.ssh && \
    chmod 700 /home/remote_user/.ssh

# Copy ssh key and pass it to centos in authorized keys
COPY remote-key.pub /home/remote_user/.sshauthorized_keys

RUN chmod -R 700 /scripts/
RUN export PGPASSWORD="somepwd112233"

RUN chown remote_user:remote_user -R /home/remote_user/.ssh/ && \
    chmod 600 /home/remote_user/.sshauthorized_keys && \
    chown remote_user:remote_user -R /scripts && \
    mkdir tmp/pg_data && \
    chown remote_user:remote_user -R /tmp/pg_data

RUN chmod -R 700 /tmp/pg_data

RUN /usr/sbin/sshd-keygen

CMD /usr/sbin/sshd -D
