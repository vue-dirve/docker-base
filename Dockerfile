      FROM node:latest
      #容器中的文件工作目录
      WORKDIR /app  
      #把容器外的内容拷贝到容器内
      COPY . . 
      RUN npm config set registry https://registry.npmmirror.com/
       #容器中执行的命令
      RUN npm install -g http-server 
       # 当前容器暴漏的端口
      EXPOSE 8080 

       # 容器启动之后执行的命令
      CMD ["http-server", "-p", "8080"]