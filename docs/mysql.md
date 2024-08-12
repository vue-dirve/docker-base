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

    - 1. 创建库
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

  - 2. 创建表
       > 相当于创建表格内容，需要指定表名和字符集，还要指定表中的列名和列类型

    - ```sql
        CREATE TABLE [IF NOT EXISTS] [表名] {
           列名 类型 [列可选约束],
           列名 类型 [列可选约束] [COMMENT '列可选注释'],
           列名 类型 [列可选约束] [COMMENT '列可选注释'],
           列名 类型 [列可选约束] [COMMENT '列可选注释']
        } [COMMENT '表可选注释'];

        column_name int unsigned comment '可选列注释'
      ```

#### 1. 整数类型

#### 2. float 类型

- 精度要求不高使用 double/float, 精度要求比较高使用 decimal
- decimal: 存储货币金钱的数据
- double: 存储精度不高的数据

#### 3.string 类型

- char(M): 固定长度为 M，所占用的字节为 M\*4 个字节 0<M<255
- varchar(M): 可变长度为 M, 没有最大限制
- mysql 的最大一行的数据字节长度是 65535
- text/blobs 大文本类型 类型的数据是没有数组字符长度的限制的(性能差)

#### 4.时间类型

- year yyyy
- time HH:MM:SS
- date YYYY-MM-DD
- datetime
- timestamp
- 时间类型其实是一个特殊的字符串，需要自动赋值和插入
  1. datetime|timestamp default current_timeStamp on update current_timeStamp
- 插入和更改自动插入时间

#### 修改表

- alter table 表名 add 列名 类型
- alter table 表名 change 原列名 新列名 类型
- alter table 表名 modify 列名 类型
- alter table 表名 rename 新表名
- alter table 表名 drop 列名
- drop table is exists
- turncate table 表名 删除表的数据和关联关系

### DMl 语句

- 插入数据
