FROM node:8.15-alpine
LABEL maintainer="2chin.yip@gmail.com"

ENV API_CONSOLE_CLI_VERSION 0.2.12
ENV API_CONSOLE_VERSION v4.2.3
ENV MAIN_API_FILE "api.raml"

WORKDIR /api-console

COPY ./raml /api-console/raml

RUN apk add --no-cache --virtual git && \
    npm install -g watch api-console-cli@${API_CONSOLE_CLI_VERSION}

EXPOSE 8081

CMD ["sh", "-c", "api-console dev -t ${API_CONSOLE_VERSION} -r ./ -H 0.0.0.0  ./raml/${MAIN_API_FILE}"]