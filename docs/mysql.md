### MySql 的操作

- mysql => DBMS

- 主要学习 sql 语句的操作
- sql 主要对数据的操作，主要包含数据定义(DDL)，数据操作，数据查询，数据控制，事务控制等

  - 第一, 库的创建，定义列，表的创建(DDL)
  - 第二, 对数据的添加，修改，删除数据 (DML)
  - 第三, 对数据的查询,查询条件(DQL)
  - 第四，事务启动，提交和回滚(TCL)
  - 第五，对账号创建，权限控制(数据控制 DCL)

- 数据库的连接

  - 命令: mysql -u<username> -p<passward> -h<hostname> -P<port>

  - DDL 语句

    - create database IF NOT EXSITS <database_name> charactar set utf8mb4 collate utf8mb4_0900_ai_ci;
    - show databases 查看所有的数据库
    - select database() 查看当前库
    - show tables from 库名 查看库中的表
    - show create database 库名 查看创建库的信息
    - use database 使用当前数据库

  - 修改库的字符集：alter 关键字
  - 数据库中的库不能改名，可以先备份数据在进行删除后创建新的库
  - 删除库
    - drop database if exsits 库名
