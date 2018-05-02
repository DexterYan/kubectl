FROM alpine

ENV KUBE_VERSION="1.8.7"

RUN apk add --update ca-certificates \
    && apk add --update -t deps curl \
    && apk add --update gettext \
    && curl -sL https://storage.googleapis.com/kubernetes-release/release/v${KUBE_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl \
    && apk del --purge deps \
    && rm /var/cache/apk/*

COPY kubectl-auth /usr/local/bin/
RUN chmod +x /usr/local/bin/kubectl-auth
