��  ���� -> ���θ���� -> �����ͺ��̽�����-> �����ͺ��̽� ����
     -> ���ϸ�   : 20230303_04CSV��ȯ.sql
     -> ������ġ : i:\java202301\database
////////////////////////////////////////////////////


��1) ������ �������߿��� ������ ���� ���� �������� ������û�� ����� ��ȸ�Ͻÿ�
    (�й�, �̸�, �����ڵ�)
    
--�����α������� ���� ��ȸ
select *from tb_gwamok where gcode like 'd%' order by ghakjum desc;

--1) ������ �������߿��� ������ ���� ���� ���� ��ȸ�ϱ�
select max(ghakjum)
from tb_gwamok
where gcode like 'd%'; --5

--2) 1)������� ���� ����(5)�� ������ ������ ���� �ִ� �࿡�� �����ڵ� ����
--   ��, ������ �������߿��� ������ ���� ���� �����ڵ�(��, �ߺ��� ������ ���ٴ� �����Ͽ�)
select gcode
from tb_gwamok
where ghakjum=(5)
and gcode like 'd%'; --d002

select gcode
from tb_gwamok
where ghakjum=(select max(ghakjum) from tb_gwamok where ghakjum=(5) and gcode like 'd%')
and gcode like 'd%'; --d002

--3) 2)���� ���� �����ڵ�(d002)�� ������û�� ����� ��ȸ
select gcode, hakno from tb_sugang where gcode=('d002');

select gcode, hakno
from tb_sugang
where gcode=(
                select gcode
                from tb_gwamok
                where ghakjum=(select max(ghakjum) from tb_gwamok where ghakjum=(5) and gcode like 'd%')
                and gcode like 'd%'
            );

--4) 3)�� ����� AA���̺�� ���� ��, �л� ���̺��� �����ؼ� �̸� ��������
select ST.uname, aa.hakno, aa.gcode
from(
    select gcode, hakno
    from tb_sugang
    where gcode=(
                    select gcode
                    from tb_gwamok
                    where ghakjum=(select max(ghakjum) from tb_gwamok where ghakjum=(5) and gcode like 'd%')
                    and gcode like 'd%'
                )
    ) AA join tb_student ST
on AA.hakno=ST.hakno;





--�����ڵ�
select su.hakno, st.uname, gw.gcode
from tb_sugang SU join tb_student ST
on SU.hakno=st.hakno join tb_gwamok GW
on SU.gcode=GW.gcode
where ghakjum=5;


��2) �й��� ������û�� �������� ���ϰ� �й������� �����ؼ� �ٹ�ȣ 4~6�� ��ȸ�Ͻÿ�
    (��, ������û���� ���� �л��� �������� 0���� ǥ��)
--left right �̿�, rownum

select * from tb_student;

select su.hakno, st.uname
from tb_student ST left join tb_sugang SU
on ST.hakno=su.hakno;

select st.hakno, uname, gw.ghakjum
from tb_student ST left join tb_sugang SU
on ST.hakno=SU.hakno left join tb_gwamok GW
on SU.gcode=GW.gcode;

select distinct(st.hakno), nvl(sum(gw.ghakjum),0) as ����
from tb_student ST left join tb_sugang SU
on ST.hakno=SU.hakno left join tb_gwamok GW
on SU.gcode=GW.gcode
group by st.hakno
order by st.hakno;

select hakno, ����, rownum
from(
        select distinct(st.hakno), nvl(sum(gw.ghakjum),0) as ����
        from tb_student ST left join tb_sugang SU
        on ST.hakno=SU.hakno left join tb_gwamok GW
        on SU.gcode=GW.gcode
        group by st.hakno
        order by st.hakno
        );
        
select hakno, ����, rnum
from(
    select hakno, ����, rownum as rnum
    from(
            select distinct(st.hakno), nvl(sum(gw.ghakjum),0) as ����
            from tb_student ST left join tb_sugang SU
            on ST.hakno=SU.hakno left join tb_gwamok GW
            on SU.gcode=GW.gcode
            group by st.hakno
            order by st.hakno
            )
    )    
where rnum>=4 and rnum<=6;



��3) �й����� ������û �������� ���ϰ�, ������������ �������� ������
     ������ ���� 1�Ǹ� ��ȸ�Ͻÿ� (�й�, �̸�, ������)
--rownum 1�� ã��

select su.hakno, st.uname, sum(gw.ghakjum) as hap
from tb_sugang SU join tb_student ST
on SU.hakno=st.hakno join tb_gwamok GW
on SU.gcode=GW.gcode
group by su.hakno, st.uname
order by hap desc;


select hakno, uname, hap, rownum as rnum
from(
        select su.hakno, st.uname, sum(gw.ghakjum) as hap
        from tb_sugang SU join tb_student ST
        on SU.hakno=st.hakno join tb_gwamok GW
        on SU.gcode=GW.gcode
        group by su.hakno, st.uname
        order by hap desc
     );

select hakno, uname, hap, rnum
from(
        select hakno, uname, hap, rownum as rnum
        from(
                select su.hakno, st.uname, sum(gw.ghakjum) as hap
                from tb_sugang SU join tb_student ST
                on SU.hakno=st.hakno join tb_gwamok GW
                on SU.gcode=GW.gcode
                group by su.hakno, st.uname
                order by hap desc
             )
    )
where rnum=1;









