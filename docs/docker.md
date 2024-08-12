### docker 的基础使用

- 后端系统会部署很多服务，包括我们自己开发的服务，还有吗 mysql,redis 等中间件服务。部署他们需要一些安装依赖，环境变量的设置等。而 Docker 就是为了解决大批量部署机器重复步骤的问题。

- Docker 把所有系统文件封装成一个镜像，镜像跑起来作为容器，它就可以在一台机器上跑多个容器，每个容器都有独立的操作系统环境，比如文件系统，网络接口等，在容器上跑各种服务。这样整个环境都保存在这个镜像中，部署多个实例只需要这个镜像跑多个容器就行。

- docker 提供了 dockerHub 镜像仓库，可以把本地环境 push 到仓库或者从仓库 pull 镜像到本地

  - docker 启动命名`docker run --name nginx-test2 -p 80:80 -v /tmp/aaa /usr/share/nignx/html -e KEY1=VALUE1 -d nginx`

    - p 是指定端口
    - v 指定数据卷挂载到目录
    - e 指定环境变量
    - d 是后端运行

  - docker ps \[option\]
    - a 查看全部的容器列表
  - docker images 查看本地所有的镜像
  - docker exec -it containerId /bin/bash 启动当前的镜像
  - docker logs containerId
  - docker inspect containerId
  - docker volume 对数据卷的管理
  - docker start containerId
  - docker rm containerId

  - ## 自动化制作镜像 打包上线 前端中的 dockerfile 文件的指令

    > 只需要在 dockerFile 里声明要做的事情，docker build 的时候会根据这个 dockerfile 来自动化构建出一个镜像来。

  - ```dockerfile
      # 依据的基础镜像 后面才能指定npm install
      FROM node:latest
      #容器中的文件工作目录
      WORKDIR /app
      #把容器外的内容拷贝到容器内
      COPY . .
      RUN npm config set registry https://registry.npmmirror.com/
       #容器中执行的命令
      RUN npm install g http-server
       # 当前容器暴漏的端口
      EXPOSE 8080

       # 容器启动之后执行的命令
      CMD ["http-server", "-p", "8080"]
    ```

  - 构建 docker build -t [imageName]:[imageTag] .
  - 启动服务 docker run -name containerName -p 端口:8080 -d 镜像名

- 修改静态文件的时候，把/app 目录设置为挂载点 可以保证实时文件的变化

### Nest 中集成 docker

- dockerfile 在 build 的时候是在 docker deamon 中执行的。命令行工具会和 docker deamon 交互来完成各种功能。
- docker build 的时候会把 dockerfile 和他的上下文打包给 docker daemon 来构建镜像。而构建自然越小越好，所有 docker 支持通过`.dockerignore`声明那些不需要的文件发送给 docker daemon.

- docker 的优化手段

  - 1. 通过.dockerignore 方式添加忽略文件
  - 2. 通过多阶段构建的方式多阶段打包
  - 3. 使用 alpine 晓得 liunx 进行打包优化
  - 4. build-args 指定环境变量
  - 5. CMD 和 ENTRYPOINT 的两种启动方式
  - 6. ADD(自带解压)和 COPY

- 为什么需要 PM2 来跑 Node 服务
  - Node 是单线程的，除了线上 node 原型起来，应用还需要做自动重启，日志，多进行，监控等事项。
  - PM2 的主要功能是进程管理，日志管理，负载均衡，性能监控。
  - PM2 通过 ecosystem.config 文件进行多应用管理。
