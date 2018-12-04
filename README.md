# register高校竞赛报名管理系统 一个基于Struts2+Herbernate+Spring的JavaWEB课程作业。
采用Web方式，由前台和后台管理两个部分组成。前台作为与用户直接交互的可视化界面，后台管理的维护工作主要由系统管理员进行，包括完成对数据的保护和修改。使之能提供以下基本功能： 
（1）．实现管理人员的登录界面以及拥有管理的功能。 
（2）．实现学生注册、登录、选择报名项目，修改报名信息，取消报名等功能。 
（3）．实现竞赛项目的增删改查管理等。 
（4）．实现比赛团队的注册登录。
### 关系映射存在多对一，多对多
### 界面不够美观
### 注册时会向邮箱发认证，后台数据使用amchart展示
## 高校报名网站使用说明

1.使用编程环境为MyEclipse，网站服务使用Apache tomcat，数据存储使用MySQL数据库,

2.在MyEclipse下导入该项目即可，数据库可直接在MySQL-workbench中运行“大作业.sql”

3.由于项目注册时会向邮箱中发送认证，故需要邮箱，建议使用163邮箱，在163邮箱中开通SMTP服务，然后在/src/cn/zyan/regist/utils/SendEmail.java中修改email地址和密码

4.MySQL中数据库的账户和密码在  src/jdbc.properties文件内修改为自己的即可

5.网站入口地址为127.0.0.1:8080/register/，但是不可用，可以在以下3个模块中进入：

- 首先学生注册，127.0.0.1:8080/register/student_regist.jsp，注册之后在127.0.0.1:8080/register/student_login.jsp登录然后进行自己的管理
- 然后可以组队报名，组队注册127.0.0.1:8080/register/team/regist.jsp，登录127.0.0.1:8080/register/team/login.jsp
- 最后管理员登录，127.0.0.1:8080/register/admin/login.jsp,账号zhangyan,密码123456这些可以在数据库表t_admin中修改










