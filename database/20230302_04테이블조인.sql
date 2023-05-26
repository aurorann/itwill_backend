��  ���� -> ���θ���� -> �����ͺ��̽�����-> �����ͺ��̽� ����
     -> ���ϸ�   : 20230302_04���̺�����.sql
     -> ������ġ : i:\java202301\database
////////////////////////////////////////////////////


��  [���̺� ����]

    - ���� ���̺��� �ϳ��� ���̺�ó�� ����ϴ� ����
    - �ΰ��̻��� ���̺��� �����Ͽ� �����͸� �����ϴ� ���
    - �����̺��� ���밪�� �̿��Ͽ� �÷��� �����ϴ� ����

    ����)
        select Į����
        from ���̺�1 join ���̺�2
        on ������;                --ANSI(ǥ��) SQL��
        
        select Į����
        from ���̺�1, ���̺�2
        on ������;                --Oracle DB SQL��


        select T1.*, T2.*        --T1.���Į��, T2.���Į��
        from T1 inner join T2    --inner ��������
        on T1.x=T2.x;            --���̺��.Į����

        select T1.*, T2.*, T3.*
        from T1 join T2
        on T1.x=T2.x join T3
        on T1.y=T3.y;                   --3�� ���̺� ���� ����

        select T1.*, T2.*, T3.*, T4.*   --4�� ���̺� ���� ����
        from T1 join T2
        on T1.x=T2.x join T3
        on T1.y=T3.y join T4
        on T1.z=T4.z;


��  ������ : where ������, having ������, on ������


��  ������ ���̺�� ���� ���̺��� ���� ������ �����̴�
    - ������ ���̺� : ���� create table�� ���̺�
    - ���� ���̺� : SQL���� ���� ������ ���̺�
////////////////////////////////////////////////////////////////////////////////


�� inner join ����

select * from tb_sugang;

-- �й��� �������� �������̺�� �л����̺� ����
select tb_sugang.*, tb_student.*
from tb_sugang inner join tb_student
on tb_sugang.hakno = tb_student.hakno;

-- �����̺��� ������ ����. inner��������. ���� �⺻
select tb_sugang.*, tb_student.*
from tb_sugang join tb_student
on tb_sugang.hakno = tb_student.hakno;

--������û�� �л����� �й�, �����ڵ�, �̸�, �̸��� ��ȸ�Ͻÿ�
select tb_sugang.*, tb_student.uname, tb_student.email
from tb_sugang inner join tb_student
on tb_sugang.hakno = tb_student.hakno;


select * from tb_sugang;

--�����ڵ带 �������� �������̺�� �������̺� ����
select tb_sugang.*, tb_gwamok.gname, tb_gwamok.ghakjum
from tb_sugang inner join tb_gwamok
on tb_sugang.gcode = tb_gwamok.gcode;


--3�� ���̺� ���� : �������̺� + �л����̺�(�̸�) + �������̺�(�����)
select tb_sugang.*, tb_student.uname, tb_gwamok.gname
from tb_sugang inner join tb_student
on tb_sugang.hakno=tb_student.hakno inner join tb_gwamok
on tb_sugang.gcode=tb_gwamok.gcode;


--���̺��� alias(��Ī)�� �����ϴ�. ��ҹ��� ���� ����. as�� ���̸� �ȵ�. as�� Į��������
select SU.*, ST.uname, ST.email
from tb_sugang SU join tb_student ST
on SU.hakno=ST.hakno;

select SU.*, GW.gname, GW.ghakjum
from tb_sugang SU join tb_gwamok GW
on SU.gcode=GW.gcode;

select * -- ��� ���̺��� ��� Į�� ��ȸ�ϱ�
from tb_sugang SU join tb_student ST
on SU.hakno=ST.hakno join tb_gwamok GW
on SU.gcode=GW.gcode;

-- ��ȸ�� ���̺��� �ߺ����� ���� Į������ ���̺���� ������ �� �ִ�
select SU.*, uname, email, gname, ghakjum
from tb_sugang SU join tb_student ST
on SU.hakno=ST.hakno join tb_gwamok GW
on SU.gcode=GW.gcode;


--�ߺ��Ǵ� Į������ �Ҽ� ���̺���� ��Ȯ�� ����ؾ� �Ѵ�
--ORA-00918: ���� ���ǰ� �ָ��մϴ�
select hakno, gcode, uname, email, gname, ghakjum--����
from tb_sugang SU join tb_student ST
on SU.hakno=ST.hakno join tb_gwamok GW
on SU.gcode=GW.gcode;

select SU.hakno, SU.gcode, uname, email, gname, ghakjum
from tb_sugang SU join tb_student ST
on SU.hakno=ST.hakno join tb_gwamok GW
on SU.gcode=GW.gcode;
////////////////////////////////////////////////////////////////////////////////


��  [���̺� ���� ���� ����]

��1) ������û�� �� �л��� �߿��� '����'�� ��� �л��鸸 �й�, �̸�, �ּҸ� ��ȸ�Ͻÿ�

--���� ��û�� �л��� ���
select * from tb_sugang;

--�������̺� + �л����̺�
select su.*, uname, address
from tb_sugang SU join tb_student ST
on SU.hakno=ST.hakno;
 
--'����'�� ��ȸ�ϱ�
select su.*, uname, address
from tb_sugang SU join tb_student ST
on SU.hakno=ST.hakno
where address='����';


select su.hakno, su.gcode, uname, address
from tb_sugang SU join tb_student ST
on SU.hakno=ST.hakno;


--������ ���� ���̺��� �̸��� AA��� �����ϰ�, �ٽ� �簡�� �� �� �ִ�
select AA.hakno, AA.gcode, AA.uname, AA.address
from (
        select su.hakno, su.gcode, uname, address
        from tb_sugang SU join tb_student ST
        on SU.hakno=ST.hakno
      ) AA
where AA.address='����';


--ORA-00904: "AA"."EMAIL": �������� �ĺ���
--ST ���̺��� emailĮ���� �������� �ʾ���
select AA.hakno, AA.gcode, AA.uname, AA.address, AA.email
from (
        select su.hakno, su.gcode, uname, address
        from tb_sugang SU join tb_student ST
        on SU.hakno=ST.hakno
      ) AA
where AA.address='����';


-- AA��Ī ���� ����
select hakno, gcode, uname, address
from (
        select su.hakno, su.gcode, uname, address
        from tb_sugang SU join tb_student ST
        on SU.hakno=ST.hakno
      ) AA
where AA.address='����';


--AA ���̺� �ȿ� �ִ� ��� Į��
select *
from (
        select su.hakno, su.gcode, uname, address
        from tb_sugang SU join tb_student ST
        on SU.hakno=ST.hakno
      ) AA
where AA.address='����';
////////////////////////////////////////////////////////////////////////////////


��2) �������� ������û �ο���, ������ ��ȸ�Ͻÿ�
     ���� 2��
     ���� 2��
     
select * from tb_sugang order by hakno;
select hakno from tb_sugang group by hakno; -- ������û �й�, �л���

select SU.*, uname, address
from tb_sugang SU join tb_student ST
on SU.hakno=ST.hakno;-- �л��� ���� ���̺� ����


select su.hakno, address
from tb_sugang SU join tb_student ST
on SU.hakno=ST.hakno
group by Su.hakno, address; -- ������û�� �й��� �ּҸ� ��ȸ



select aa.address, count(*)
from (
        select su.hakno, address
        from tb_sugang SU join tb_student ST
        on SU.hakno=ST.hakno
        group by Su.hakno, address
     ) AA
group by aa.address;




---------------------------���ϴ� ���� �ƴ�
select address
from tb_sugang SU join tb_student ST
on SU.hakno=ST.hakno
group by address;

select aa.address
from (
        select address
        from tb_sugang SU join tb_student ST
        on SU.hakno=ST.hakno
        group by address
     ) AA
group by aa.address;