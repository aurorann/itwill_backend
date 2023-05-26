��  ���� -> ���θ���� -> �����ͺ��̽�����-> �����ͺ��̽� ����
     -> ���ϸ�    :   20230223_01where.sql
     -> ������ġ  :   i:\java202301\database
///////////////////////////////////////////////////////////////////////////

alter table sungjuk rename column korea to kor;
select * from sungjuk;

��  [between A and B] ������ - A���� B����
-- ���������� 80~89�� ���� ���� ��ȸ�Ͻÿ�
select uname, kor
from sungjuk
where kor between 80 and 89;

��  [in] ������ - ��Ͽ��� ã��
-- �̸��� '����ȭ', '����ȭ'�� ��ȸ�Ͻÿ�
select uname
from sungjuk
where uname in ('����ȭ', '����ȭ');

-- �������� 10, 30, 50�� ��ȸ�Ͻÿ�
select uname, kor
from sungjuk
where kor in (10, 30, 50);

��  [LIKE] ������
- ���ڿ� �����Ϳ��� ����� ������ �˻��� ��
- % ���ڰ����� �������
- _ ���ڰ������� ��ġ�ؾ� ��

select uname
from sungjuk
where uname='���ѹα�';

-- ��1) �̸����� 'ȫ'���� �����ϴ� �̸��� ��ȸ�Ͻÿ�
select uname
from sungjuk
where uname like 'ȫ%';

-- ��2) �̸����� 'ȭ'�� ������ �̸��� ��ȸ�Ͻÿ�
select uname
from sungjuk
where uname like '%ȭ';

-- ��3) �̸��� '��'���� �ִ� �̸��� ��ȸ�Ͻÿ�
select uname
from sungjuk
where uname like '%��%';

-- ��4) �α��� �̸����� 'ȭ'�� ������ �̸��� ��ȸ�Ͻÿ�
select uname
from sungjuk
where uname like '_ȭ';

-- ��5) �̸� ������ �߿��� ��� ���ڰ� '��' �ִ� ���� ��ȸ�Ͻÿ�
select uname
from sungjuk
where uname like '_��_';

select count(uname)
from sungjuk
where uname like '_��_';

-- ��6) ����+������ �����ϰ� �˻�� '�Ľ�Ÿ' �϶�

where subject like '%�Ľ�Ÿ%' or content like '%�Ľ�Ÿ%'

-- ��7) ���� ������ 50���̻��� �࿡ ���ؼ� ����(tot)�� ���(aver)�� ���Ͻÿ�
select * from sungjuk where kor>=50;

update sungjuk
set tot=kor+eng+mat, aver=(kor+eng+mat)/3
where kor>=50 ;

rollback; -- ��ɾ� ���


��  [NULL]

-- ������ ������ ���Ͻÿ�
select count(tot) from sungjuk; --null���� ī��Ʈ ���� ����

-- ������ NULL�� �ִ� ���� ������ ���Ͻÿ�
select count(*) from sungjuk where tot=null;    --null�� Ȯ�� ����. 0
select count(*) from sungjuk where tot is null; --null�� Ȯ���ؾ� �ϴ� ���. 5

-- ��տ� ������� ���� ���� ������ ���Ͻÿ� (null�� �ƴ� ��)
select count (*) from sungjuk where aver is not null;


-- ��8) ����ִ� ������ ����� ��� ���Ͻÿ�
update sungjuk
set tot=kor+eng+mat, aver=(kor+eng+mat)/3
where aver is null and tot is null;

select * from sungjuk;
commit;





