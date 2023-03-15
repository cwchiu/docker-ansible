FROM quay.io/ansible/creator-ee:v0.14.1

ADD requirements.yml ansible.cfg /root/
WORKDIR /root
RUN mkdir -p /root/.ansible/roles/ \
    && mkdir -p /etc/ansible/ \
    && mv /root/ansible.cfg /etc/ansible \
    && ansible-galaxy install -r requirements.yml \
    && ansible-galaxy install -r requirements.yml

ENTRYPOINT ["ansible"]

CMD ["--help"]
