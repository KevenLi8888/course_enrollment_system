# 选课系统 course_enrollment_system

MySQL + Flask + Bootstrap

一个简单的学校选课系统，用户角色有管理员、教师、学生。主要功能如下：

1. 管理员可以添加修改删除学生、教师、课程信息，也支持修改学生、教师的密码；
2. 教师可以查看上课课程、时间表以及课程的花名册，查看个人中心，修改个人信息，修改密码；
3. 学生可以查看上课课程、时间表，选课，退课，查看个人中心，修改个人信息，修改密码。

A simple course enrollment system, with user roles of administrator, teacher, and student. 

1. Administrators can add, modify and delete entries of students, teachers and courses through the system, as well as modifying students and teachers' passwords.
2. Teachers can view their courses, schedules and rosters of courses, view their personal center, modify their personal information and password.
3. Students can view their classes, schedules, enroll and drop out from classes, view their personal center, modify their personal information and password.

## 2020秋 软件工程 课程项目 / Fall 2020 Software Engineering Course Project

指导老师 / Advisor：杨波（教授）

组号：第六项目组

## 小组成员 / Contributors

- 组长：黎骞（2018040708002）
- 副组长：黄俊勋 （2018051409001）
- 组员：孙政霄（2018040706008）、吕欣楼（2018051403005）

## 部署方式 / Deployment

1. 创建数据库并导入部分样例数据：运行 ` ./database_development/create_schema_with_demo_data.sql `

2. 运行程序：` python course_enrollment_system.py `

3. 使用管理员账户（admin）添加/修改/删除学生、教师、课程信息

4. 使用学生账户进行选课/退课

5. 样例数据中已有的账户（可直接登录）如下：

   | 用户名 / Username | 密码 / Password | 用户类型 / User Role |
   | ----------------- | --------------- | -------------------- |
   | 201801            | 201801          | 教师 / Teacher       |
   | 201802            | 201802          | 教师 / Teacher       |
   | 201803            | 201803          | 教师 / Teacher       |
   | 201804            | 201804          | 教师 / Teacher       |
   | 201805            | 201805          | 教师 / Teacher       |
   | 201806            | 201806          | 教师 / Teacher       |
   | 201901            | 201901          | 学生 / Student       |
   | 201902            | 201902          | 学生 / Student       |
   | 201903            | 201903          | 学生 / Student       |
   | 201904            | 201904          | 学生 / Student       |
   | 201905            | 201905          | 学生 / Student       |
   | 201906            | 201906          | 学生 / Student       |
   | admin             | admin           | 管理员 / Admin       |

1. Execute this SQL script to create schema and import demo data ` ./database_development/create_schema_with_demo_data.sql `
2. Run the project ` python course_enrollment_system.py `
3. Use the admin account to add/modify/delete entries of students, teachers and courses.
4. Use a student account to enroll and drop out courses.
5. Refer to the table above for the existing accounts in demo data.
