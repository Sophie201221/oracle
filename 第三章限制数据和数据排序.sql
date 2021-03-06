--------第3章限制数据和对数据开发-----
-----目标---------
----通过本章学习，学员应达到如下目标：
----理解限制数据和排序数据的作用;
---掌握 WHERE 子句及 ORDER BY 子句的语法;
---掌握各种不同类型的数据如何进行比较;
---掌握特殊比较运算符的含义及用法;
---掌握逻辑运算符的含义及用法;

-----练习1--------
---1.查询职位为SALESMAN的员工编号、职位、入职日期。
select empno 员工编号,job 职位,hiredate 入职日期
from emp
where job='SALESMAN';

---2.查询1985年12月31日之前入职的员工姓名及入职日期。
select ename 员工姓名,hiredate 入职日期
from emp
where hiredate<=to_date('31-12-1985','DD-MM-YYYY');

---3.查询部门编号不在10部门的员工姓名、部门编号。
select ename 员工姓名,deptno 部门编号
from emp
where not deptno=10;

-----练习2--------
---1.查询入职日期在82年至85年的员工姓名，入职日期。
select ename 员工姓名, hiredate 入职日期
  from emp
 where hiredate between to_date('01-01-1982', 'DD-MM-YYYY') and
       to_date('31-12-1985', 'DD-MM-YYYY');

---2.查询月薪在3000到5000的员工姓名，月薪。
select ename 员工姓名,sal 月薪
from emp
where sal between 3000 and 5000;



---3.查询部门编号为10或者20的员工姓名，部门编号。
select ename 员工姓名,deptno 部门编号
from emp
where deptno in(10,20);


---4.查询经理编号为7902, 7566, 7788的员工姓名，经理编号。
select ename 员工姓名,mgr 经理编号
from emp
where mgr in(7902,7566,7788);

-----练习3--------
---1.查询员工姓名以W开头的员工姓名。
select ename 员工姓名
from emp
where ename like 'W%';


---2.查询员工姓名倒数第2个字符为T的员工姓名。
select ename 员工姓名
from emp
where ename like '%T_';


---3.查询奖金为空的员工姓名，奖金。
select ename 员工姓名,comm 奖金
from emp
where comm  is null;


-----练习4--------
---1.查询工资超过2000并且职位是MANAGER,或者职位是SALESMAN的员工姓名、职位、工资
select ename 员工姓名,job 职位,sal 工资
from emp
where (sal>=2000
and job='MANAGER')
or job='SALESMAN';


---2.查询工资超过2000并且职位是 MANAGER或SALESMAN的员工姓名、职位、工资。
select ename 员工姓名,job 职位,sal 工资
from emp
where sal>=2000
and (job='MANAGER'
or job='SALESMAN');



---3.查询部门在10或者20，并且工资在3000到5000之间的员工姓名、部门、工资。
select ename 员工姓名,deptno 部门,sal 工资
from emp
where (deptno in(10,20))
and sal between 3000 and 5000;


---4.查询入职日期在81年，并且职位不是SALES开头的员工姓名、入职日期、职位。
select ename 员工姓名, hiredate 入职日期, job 职位
  from emp
 where hiredate between to_date('01-01-1981', 'DD-MM-YYYY') and
       to_date('31-12-1981', 'DD-MM-YYYY')
   and job not like 'SALES%';----方式一特殊比较运算符
select ename 员工姓名, hiredate 入职日期, job 职位
  from emp
 where (hiredate <= to_date('31-12-1981', 'DD-MM-YYYY') and
       hiredate >= to_date('01-01-1981', 'DD-MM-YYYY'))
   and job not like 'SALES%';----方式二:比较运算符
---5.查询职位为SALESMAN或MANAGER，部门编号为10或者20，姓名包含A的员工姓名、职位、部门编号。
select ename 员工姓名,job 职位,deptno 部门编号
from emp
where job='SALESMAN' or job='MANAGER'
and deptno in(10,20);----

-----练习4--------
---1.查询部门在20或30的员工姓名，部门编号，并按照工资升序排序。
select ename 员工姓名,deptno 部门编号,sal 工资
from emp
where deptno in(20,30)
order by sal asc;
---2.查询工资在2000-3000之间，部门不在10号的员工姓名，部门编号，工资，并按照部门升序，工资降序排序。
select ename 员工姓名,deptno 部门编号,sal 工资
from emp
where sal between 2000 and 3000
and deptno<>10
order by deptno asc,sal desc;
---3.查询入职日期在82年至83年之间，职位以SALES或者MAN开头的员工姓名，入职日期，职位，并按照入职日期降序排序。
select ename 员工姓名, hiredate 入职日期, job 职位
  from emp
 where (hiredate between to_date('31-12-1983', 'DD-MM-YYYY') and
       to_date('01-01-1982', 'DD-MM-YYYY'))
   and job like 'SALES%'
    or job like 'MAN%';
order by hiredate desc;-----疑问




-----课后作业-----
---1.查询入职时间在1982-7-9之后，并且不从事SALESMAN工作的员工姓名、入职时间、职位。
select ename 员工姓名,hiredate 入职时间,job 职位
from emp
where hiredate>= to_date('09-07-1982', 'DD-MM-YYYY')
and  job<>'SALESMAN';

---2.查询员工姓名的第三个字母是a的员工姓名。
select ename
from emp
where ename like '__A%';

---3.查询除了10、20号部门以外的员工姓名、部门编号。
select ename 员工姓名,deptno 部门编号
from emp
where deptno not in(10,20);

---4.查询部门号为30号员工的信息，先按工资降序排序，再按姓名升序排序。 
select ename 员工姓名,sal 工资,deptno 部门编号
from emp
where deptno=30
order by sal desc,ename asc;


---5.查询没有上级的员工(经理号为空)的员工姓名。
select ename 员工姓名,mgr 经理编号
from emp
where mgr is null;

---6.查询工资大于等于4500并且部门为10或者20的员工的姓名\工资、部门编号。
select ename 员工姓名,sal 工资,deptno 部门编号
from emp
where (sal<=4500)
and (deptno=10 or deptno=20);-----
select *from emp;
