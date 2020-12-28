------第2章Oracle-SQL开发(编写简单的查询语句------
----一、章节目标-----
---通过本章学习，学员应达到如下目标：
---理解结构化查询语言的作用、分类;
---理解SELECT语句的作用;
---掌握选择所有列、指定列、表达式、带空值NULL、列别名、连接操作符、消除重复行的SQL语句书写方法;


---练习1-------
--1.使用两种方式查询所有员工(EMP)信息
select empno, ename, job, mgr, hiredate, sal, comm, deptno 
from emp; ---方式一
select * 
from emp;---方式二
--2.查询(EMP)员工编号、员工姓名、员工职位、员工月薪、工作部门编号。

---练习2-------
--1.员工转正后，月薪上调20%，请查询出所有员工转正后的月薪。
select ename 员工姓名,sal 转正前月薪,sal*1.2 转正后月薪
from emp;


--2.员工试用期6个月，转正后月薪上调20%，请查询出所有员工工作第一年的年薪所得。
---（不考虑奖金部分,年薪的试用期6个月的月薪+转正后6个月的月薪)
select ename 员工姓名,sal 月薪,sal*6+sal*1.2*6 年薪
from emp;

---练习3-------
--1.员工试用期6个月，转正后月薪上调20%，
---请查询出所有员工工作第一年的所有收入（需考虑奖金部分)，
----要求显示列标题为员工姓名，工资收入，奖金收入，总收入。
select ename 员工姓名,sal 工资收入,nvl(comm,0) 奖金收入,sal*6+sal*1.2*6 总收入
from emp;

---练习4-------
--1.员工试用期6个月，转正后月薪上调20%，
---请查询出所有员工工作第一年的所有收入（需考虑奖金部分)，
----要求显示格式为:XXX的第一年总收入为XXX。
select ename||'的第一年总收入为'||(sal*6+sal*1.2*6+nvl(comm,0)) 员工的第一年总收入
from emp;


--2.查询员工表中一共有哪几种岗位类型。
select distinct ename 员工姓名,deptno 岗位类型
from emp;



-----课后作业-----
---1.分别选择员工表、部门表、薪资等级表中的所有数据。
select ename, job, sal, comm from bonus;
select deptno, dname, loc from dept;
select empno, ename, job, mgr, hiredate, sal, comm, deptno from emp;
select grade, losal, hisal from salgrade;


---2.分别查看员工表、部门表、薪资等级表的表结构。
--在command widow 命令窗口打开
Connected to Oracle Database 11g Enterprise Edition Release 11.2.0.1.0 
Connected as scott@ORCL

SQL> desc emp;
Name     Type         Nullable Default Comments 
-------- ------------ -------- ------- -------- 
EMPNO    NUMBER(4)                              
ENAME    VARCHAR2(10) Y                         
JOB      VARCHAR2(9)  Y                         
MGR      NUMBER(4)    Y                         
HIREDATE DATE         Y                         
SAL      NUMBER(7,2)  Y                         
COMM     NUMBER(7,2)  Y                         
DEPTNO   NUMBER(2)    Y                         

SQL> desc dept;
Name   Type         Nullable Default Comments 
------ ------------ -------- ------- -------- 
DEPTNO NUMBER(2)                              
DNAME  VARCHAR2(14) Y                         
LOC    VARCHAR2(13) Y                         

SQL> desc salgrade;
Name  Type   Nullable Default Comments 
----- ------ -------- ------- -------- 
GRADE NUMBER Y                         
LOSAL NUMBER Y                         
HISAL NUMBER Y 


