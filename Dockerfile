FROM node:21-alpine AS builder
RUN apk add git bash python3 py3-pip zip grep

WORKDIR /app

COPY package.json ./package.json
COPY yarn.lock ./yarn.lock

RUN yarn install --frozen-lockfile

# Build time args
ARG VERSION

COPY . ./

RUN REACT_APP_VERSION=${VERSION} yarn build

FROM nginx:stable-alpine

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /app/build /usr/share/nginx/html

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]