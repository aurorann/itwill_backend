��  ���� -> ���θ���� -> �����ͺ��̽�����-> �����ͺ��̽� ����
     -> ���ϸ�   : 20230303_03����¡.sql
     -> ������ġ : i:\java202301\database
////////////////////////////////////////////////////


��  [����Į�� rownum]

--�ٹ�ȣ
select hakno, uname, rownum from tb_student;

--�ٹ�ȣ�� Į���� �ٲٱ�
select hakno, uname, rownum as rnum from tb_student;

--�ٹ�ȣ�� ���� �ο��ǰ� ���ĵȴ�
select hakno, uname, rownum as rnum from tb_student order by uname;

--�ٹ�ȣ 1~3���� ��ȸ
select hakno, uname, rownum from tb_student where rownum>=1 and rownum<=3;

--�ٹ�ȣ 4~6���� ��ȸ (��ȸ �ȵ�)
select hakno, uname, rownum from tb_student where rownum>=4 and rownum<=6;
///////////////////////////////////////////////////////////////////////////


��  [rownum�� Ȱ���� ����¡]
    - rownum�� ����Į���̹Ƿ� �������� ���� ������� ����, ����Į������ �ν��� ����� ���� ��õ
    - rownumĮ���� �������� �Ŀ� �ٹ�ȣ �߰��ϰ� �������� Ȱ���Ѵ�


��) �ٹ�ȣ(rownum)�� �̿��ؼ� �ٹ�ȣ 4~6 ��ȸ

-- 1) �̸������� ��ȸ(�ٹ�ȣ���� ���� ����)
select uname, hakno, address, rownum
from tb_student
order by uname;

--2) 1)�� ����� ��������(AA ���̺�)
select aa.uname, aa.hakno, aa.address, rownum as rnum
from ( 
        select uname, hakno, address
        from tb_student
        order by uname
      ) AA;
      
-- AA���̺� ��Ī�� �����ص� �ȴ�
select uname, hakno, address, rownum as rnum
from ( 
        select uname, hakno, address
        from tb_student
        order by uname
      );

--3) 2)�� ����� BB���̺�� �����, �ٹ�ȣ 4~6�� ��ȸ�Ͻÿ�
select uname, hakno, address, rnum
from(
        select uname, hakno, address, rownum as rnum
        from ( 
                select uname, hakno, address
                from tb_student
                order by uname
              )
     )BB
where rnum>=4 and rnum<=6;

--4) 3)�� ������� ���̺� ��Ī(AA, BB) �����ϱ�
select uname, hakno, address, rnum
from(
        select uname, hakno, address, rownum as rnum
        from ( 
                select uname, hakno, address
                from tb_student
                order by uname
              )
     )
where rnum>=4 and rnum<=6;















