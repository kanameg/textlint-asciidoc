FROM node:latest

MAINTAINER Kaname Yoshida <kaname.g@gmail.com>

ENV TEXTLINT_VERSION 11.8.2
RUN npm install -g textlint@${TEXTLINT_VERSION} \
    && npm install -g \
    textlint-rule-preset-japanese \
    textlint-rule-preset-ja-technical-writing \
    textlint-rule-preset-ja-spacing \
    textlint-rule-spellcheck-tech-word \
    textlint-plugin-asciidoctor

WORKDIR /documents
COPY .textlintrc /documents/

ENTRYPOINT ["textlint", "--config", "/work/.textlintrc"]
CMD ["-h"]
