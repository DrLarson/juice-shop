# OWASP Juice Shop - An intentionally insecure JavaScript Web Application
FROM            node:8-alpine
MAINTAINER      Bjoern Kimminich <bjoern.kimminich@owasp.org>
LABEL version = "6.1.0"

RUN apk update && apk add git

COPY . /juice-shop
WORKDIR /juice-shop
RUN npm install --production --unsafe-perm

FROM    node:8-alpine
WORKDIR /juice-shop
COPY --from=0 /juice-shop .
EXPOSE  3000
CMD ["npm", "start"]