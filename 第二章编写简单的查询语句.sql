------��2��Oracle-SQL����(��д�򵥵Ĳ�ѯ���------
----һ���½�Ŀ��-----
---ͨ������ѧϰ��ѧԱӦ�ﵽ����Ŀ�꣺
---���ṹ����ѯ���Ե����á�����;
---���SELECT��������;
---����ѡ�������С�ָ���С����ʽ������ֵNULL���б��������Ӳ������������ظ��е�SQL�����д����;


---��ϰ1-------
--1.ʹ�����ַ�ʽ��ѯ����Ա��(EMP)��Ϣ
select empno, ename, job, mgr, hiredate, sal, comm, deptno 
from emp; ---��ʽһ
select * 
from emp;---��ʽ��
--2.��ѯ(EMP)Ա����š�Ա��������Ա��ְλ��Ա����н���������ű�š�

---��ϰ2-------
--1.Ա��ת������н�ϵ�20%�����ѯ������Ա��ת�������н��
select ename Ա������,sal ת��ǰ��н,sal*1.2 ת������н
from emp;


--2.Ա��������6���£�ת������н�ϵ�20%�����ѯ������Ա��������һ�����н���á�
---�������ǽ��𲿷�,��н��������6���µ���н+ת����6���µ���н)
select ename Ա������,sal ��н,sal*6+sal*1.2*6 ��н
from emp;

---��ϰ3-------
--1.Ա��������6���£�ת������н�ϵ�20%��
---���ѯ������Ա��������һ����������루�迼�ǽ��𲿷�)��
----Ҫ����ʾ�б���ΪԱ���������������룬�������룬�����롣
select ename Ա������,sal ��������,nvl(comm,0) ��������,sal*6+sal*1.2*6 ������
from emp;

---��ϰ4-------
--1.Ա��������6���£�ת������н�ϵ�20%��
---���ѯ������Ա��������һ����������루�迼�ǽ��𲿷�)��
----Ҫ����ʾ��ʽΪ:XXX�ĵ�һ��������ΪXXX��
select ename||'�ĵ�һ��������Ϊ'||(sal*6+sal*1.2*6+nvl(comm,0)) Ա���ĵ�һ��������
from emp;


--2.��ѯԱ������һ�����ļ��ָ�λ���͡�
select distinct ename Ա������,deptno ��λ����
from emp;



-----�κ���ҵ-----
---1.�ֱ�ѡ��Ա�������ű�н�ʵȼ����е��������ݡ�
select ename, job, sal, comm from bonus;
select deptno, dname, loc from dept;
select empno, ename, job, mgr, hiredate, sal, comm, deptno from emp;
select grade, losal, hisal from salgrade;


---2.�ֱ�鿴Ա�������ű�н�ʵȼ���ı�ṹ��
--��command widow ����ڴ�
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


