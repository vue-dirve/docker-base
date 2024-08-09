# build stage
FROM node:18-alpine3.14 as build-stage

WORKDIR /nestDir

COPY package.json .

RUN npm config set registry https://registry.npmmirror.com/

RUN npm install

COPY . .

RUN npm run build 

# build stage end


# production stage
FROM node:18-alpine3.14 as production-stage

COPY --from=build-stage /nestDir/dist /nestDir
COPY --from=build-stage /nestDir/package.json /nestDir/package.json

WORKDIR /nestDir

RUN npm config set registry https://registry.npmmirror.com/

RUN npm install --production

EXPOSE 3000

CMD [ "node", "/nestDir/main.js" ]


# 可以考虑根据ecosystem.config.js 进行文件配置


