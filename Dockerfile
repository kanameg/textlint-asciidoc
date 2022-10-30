FROM node:latest

MAINTAINER Kaname Yoshida <kaname.g@gmail.com>

RUN npm install -g textlint \
    && npm install -g \
    @textlint/ast-node-types \
    textlint-rule-preset-japanese \
    textlint-rule-preset-ja-technical-writing \
    textlint-rule-preset-ja-spacing \
    textlint-rule-spellcheck-tech-word \
    textlint-rule-sentence-length \
    textlint-plugin-asciidoctor

WORKDIR /documents
COPY .textlintrc /

ENTRYPOINT ["textlint", "--config", "/.textlintrc"]
CMD ["-h"]
