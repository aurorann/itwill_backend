��  ���� -> ���θ���� -> �����ͺ��̽�����-> �����ͺ��̽� ����
     -> ���ϸ�   : 20230303_01���̺�����.sql
     -> ������ġ : i:\java202301\database
////////////////////////////////////////////////////

��  [���̺� ���� ���� ����]

-- ��ü �� ����
select count(*) from tb_student; --6
select count(*) from tb_gwamok; --9
select count(*) from tb_sugang; --14

��2) �������� ������û �ο���, ������ ��ȸ�Ͻÿ�
     ���� 2��
     ���� 2��

1) �������̺� ��ȸ
select * from tb_sugang order by hakno;

2) ���� ��û�� �л����� ��� ��ȸ(�й�)
select hakno from tb_sugang order by hakno;
select distinct(hakno) from tb_sugang order by hakno; -- distinct �ߺ� ����
select hakno from tb_sugang group by hakno; -- group by�� hakno �׷�ȭ, ���������� ������ ������ ����
select hakno, count(*) from tb_sugang group by hakno; 

3) ������û�� �й�(AA)���� �ּҸ� �л����̺��� ��������
select aa.hakno, address
from(
    select hakno from tb_sugang group by hakno
    ) AA join tb_student ST
on AA.hakno=ST.hakno;

4) 3�� ����� BB���̺�� ������
select bb.address, count(*) || '��' as cnt
from(
        select aa.hakno, address
        from(
            select hakno from tb_sugang group by hakno
            ) AA join tb_student ST
        on AA.hakno=ST.hakno
    ) BB
group by bb.address;

5) 4)�� SQL������ BB ��Ī�� ���� �����ϴ�
select address, count(*) || '��' as cnt
from(
        select aa.hakno, address
        from(
            select hakno from tb_sugang group by hakno
            ) AA join tb_student ST
        on AA.hakno=ST.hakno
    )
group by address;

���������� 10:08
select address, count(distinct SU.hakno)  as total
from tb_sugang SU join  tb_student ST on SU.hakno = ST.hakno
group by address;

ȫ�ٿ����� 10:08
SELECT STU.ADDRESS, COUNT(*) CNT
FROM (
      SELECT DISTINCT(SU.HAKNO), UNAME, ADDRESS
      FROM TB_SUGANG SU INNER JOIN TB_STUDENT ST
      ON SU.HAKNO = ST.HAKNO
     )STU
GROUP BY STU.ADDRESS
ORDER BY STU.ADDRESS;

���������� 10:08
select address, count(*)
from(
        select distinct(ST.address), SU.hakno
        from tb_sugang SU inner join tb_student ST
        on SU.hakno=ST.hakno       
        ) AA
group by address;



��3) ���� ���� ��û �ο���, �����ڵ�, ����� ��ȸ�Ͻÿ� 
     d001  HTML    2��
     d002  ���伥    1��
     d003  �Ϸ���Ʈ  1��
     p001  JAVA    4��
     p002  Oracle  2��
     p003  JSP     2��
     p004  Python  1��

--1) �������̺��� �����ڵ� �����ؼ� ��ȸ�ϱ�
select * from tb_sugang order by gcode;

--2) �������̺��� �����ڵ尡 ������ ���� �׷�ȭ �ϱ�
select gcode, count(*)
from tb_sugang
group by gcode;

--3) 2)�� ����� AA���̺�� �����ϰ�, �������̺� �����ϱ�
select aa.gcode, gname, concat(cnt,'��') as �����ο�
from(
    select gcode, count(*) as cnt
    from tb_sugang
    group by gcode
    ) aa join tb_gwamok GW
    on aa.gcode=gw.gcode
order by aa.gcode;

-- �����ڵ�
select gcode, gname from tb_gwamok; --�����ڵ�, �����

select aa.gcode, gname, su.hakno
from(
    select gcode, gname from tb_gwamok
    ) aa join tb_sugang SU
    on aa.gcode=SU.gcode;

select bb.gcode, bb.gname, count(*) || '��' as cnt
from(
    select aa.gcode, gname, su.hakno
    from(
        select gcode, gname from tb_gwamok
        ) aa join tb_sugang SU
        on aa.gcode=SU.gcode
    ) bb
group by bb.gcode, bb.gname
order by bb.gcode;



��4) �й��� ������û������ �������� �й��������� ��ȸ�Ͻÿ�
     g1001  ȫ�浿  12����
     g1002  ȫ�浿   8����
     g1005  ���޷�  12����
     g1006  ������   3����

--1) �������̺��� �й����� ��ȸ
select hakno, gcode from tb_sugang order by hakno;

--2) �������̺��� �����ڵ尡 ��ġ�ϴ� ������ �������̺��� �����ͼ� ���̱�
select su.hakno, su.gcode, gw.ghakjum
from tb_sugang SU join tb_gwamok GW
on SU.gcode=GW.gcode;

--3) 2)�� ����� AA���̺�� �����, �й����� �׷�ȭ�� �� ���� ���ϱ�
select aa.hakno, sum(aa.ghakjum) as hap
from(
        select su.hakno, su.gcode, gw.ghakjum
        from tb_sugang SU join tb_gwamok GW
        on SU.gcode=GW.gcode
    )AA
group by aa.hakno;

--4) 3)�� ����� BB���̺�� �����, �й��� �������� �л����̺��� �̸� �����ͼ� ���̱�
select bb.hakno, st.uname, concat(hap, '����')
from(
        select aa.hakno, sum(aa.ghakjum) as hap
        from(
                select su.hakno, su.gcode, gw.ghakjum
                from tb_sugang SU join tb_gwamok GW
                on SU.gcode=GW.gcode
            )AA
        group by aa.hakno
        ) bb join tb_student ST
on bb.hakno=st.hakno;
-------------------------------------------------------------------------------
��4)�� �Ǵٸ� ���
--1) �������̺�+�л����̺�+�������̺�=3�� ���̺� ����
select su.hakno, su.gcode, st.uname, gw.ghakjum
from tb_sugang SU join tb_student ST
on SU.hakno=st.hakno join tb_gwamok GW
on SU.gcode=GW.gcode
order by su.hakno;

--2) 1���׷�(�й�), 2���׷�(�̸�)���� �׷�ȭ�ϰ�, ������ ���ϱ�
select su.hakno, st.uname, sum(gw.ghakjum) ||'����' as hap
from tb_sugang SU join tb_student ST
on SU.hakno=st.hakno join tb_gwamok GW
on SU.gcode=GW.gcode
group by su.hakno, st.uname;


--�����ڵ�
-- �й�, �л��̸�
select hakno, uname from tb_student; 

-- �й�, �л��̸�, ������û �ڵ�
select aa.hakno, uname, gcode
from(
    select hakno, uname from tb_student
    ) aa join tb_sugang SU
on aa.hakno=su.hakno;

-- �й�, �л��̸�, ������û �ڵ�, ����
select hakno, uname, bb.gcode, ghakjum
from(
    select aa.hakno, uname, gcode
    from(
        select hakno, uname from tb_student
        ) aa join tb_sugang SU
    on aa.hakno=su.hakno
    ) bb join tb_gwamok GA
on bb.gcode=ga.gcode;  


select hakno, uname, sum(ghakjum)
from(
    select hakno, uname, bb.gcode, ghakjum
    from(
        select aa.hakno, uname, gcode
        from(
            select hakno, uname from tb_student
            ) aa join tb_sugang SU
        on aa.hakno=su.hakno
        ) bb join tb_gwamok GA
    on bb.gcode=ga.gcode
    ) cc
group by hakno, uname;



��5) �й� g1001�� ������û�� ������ �����ڵ庰�� ��ȸ�Ͻÿ�
     g1001  d001  HTML
     g1001  p001  JAVA
     g1001  p002  Oracle
     g1001  p003  JSP
     g1001  p004  Python

--1) �������̺� + �������̺� ����
select su.hakno, su.gcode, gw.gname
from tb_sugang SU join tb_gwamok GW
on su.gcode=gw.gcode;

--2) �й� g1001�� ��û�� ���� ��ȸ�ϱ�
select su.hakno, su.gcode, gw.gname
from tb_sugang SU join tb_gwamok GW
on su.gcode=gw.gcode
where su.hakno='g1001' --���� �ڹ��ڵ忡�� �й��� ����ó�� �Ѵ�
order by su.gcode;


--�����ڵ�
select hakno, gcode from tb_sugang
where hakno='g1001';

select aa.hakno, aa.gcode, gname
from(
    select hakno, gcode from tb_sugang
    where hakno='g1001' 
    ) aa join tb_gwamok GA
on aa.gcode=ga.gcode
order by aa.gcode;


��6) ������û�� �� �л����� �й�, �̸� ��ȸ
     g1001  ȫ�浿
     g1002  ȫ�浿
     g1005  ���޷�
     g1006  ������

--1) ������û�� �� �л����� �й� ��ȸ
select hakno from tb_sugang;
select distinct(hakno) from tb_sugang;
select hakno from tb_sugang group by hakno;

--2)
select hakno, uname
from tb_student
where hakno='g1001' or hakno='g1002' or hakno='g1005' or hakno='g1006';

select hakno, uname
from tb_student
where hakno in ('g1001','g1002','g1005','g1006');--in ������

--3) 1)�� ����� �������� ���·� ��ȸ
select hakno, uname
from tb_student
where hakno in (select hakno from tb_sugang group by hakno);


--�����ڵ�
select su.hakno, st.uname
from tb_sugang SU join tb_student ST
on SU.hakno=st.hakno join tb_gwamok GW
on SU.gcode=GW.gcode
group by su.hakno, st.uname;



��7)������û�� ���� ���� �л����� �й�, �̸� ��ȸ
     g1003  ������
     g1004  ȫ�浿

select hakno from tb_student ST; --�й�
select hakno from tb_sugang SU group by hakno; --������û�� �й�

select hakno, uname
from tb_student
where hakno not in (select hakno from tb_sugang group by hakno);