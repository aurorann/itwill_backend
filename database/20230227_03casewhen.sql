��  ���� -> ���θ���� -> �����ͺ��̽�����-> �����ͺ��̽� ����
     -> ���ϸ�   : 20230227_03casewhen.sql
     -> ������ġ : i:\java202301\database
////////////////////////////////////////////////////


�� [CASE WHEN ~ THEN END ����]
����)
     CASE WHEN ����1 THEN ���Ǹ����� ��1
          WHEN ����2 THEN ���Ǹ����� ��2
          WHEN ����3 THEN ���Ǹ����� ��3
             ...
          ELSE ��
     END ����÷���
     
-- �̸�, �ּҸ� ��ȸ�Ͻÿ�
select uname, addr from sungjuk;

-- �̸�, �ּҸ� ��ȸ�Ͻÿ�(��, �ּҴ� �ѱ۷� �ٲ㼭 ��ȸ)
select uname, addr, case when addr='Seoul' then '����'
                         when addr='Jeju' then '����'
                         when addr='Suwon' then '����'
                         when addr='Busan' then '�λ�'
                    end as juso
from sungjuk;


--����) �̸�, ����, ������ ��ȸ�Ͻÿ�
--���� : �������� 90�̻� 'A����'
                      80�̻� 'B����'
                      70�̻� 'C����'
                      60�̻� 'D����'
                      ������ 'F����'
1)
select uname, kor, case when kor>=90 then 'A����'
                        when kor>=80 then 'B����'
                        when kor>=70 then 'C����'
                        when kor>=60 then 'D����'
                        else 'F����'
                    end as grade
from sungjuk;

2) Į���� �ѱ� ����
select uname, kor, case when kor>=90 then 'A����'
                        when kor>=80 then 'B����'
                        when kor>=70 then 'C����'
                        when kor>=60 then 'D����'
                        else 'F����'
                    end as ��������
from sungjuk;

3) between ~ and ������
select uname, kor, case when kor between 90 and 100 then 'A����'
                        when kor between 80 and 89 then 'B����'
                        when kor between 70 and 79 then 'C����'
                        when kor between 60 and 69 then 'D����'
                        else 'F����'
                    end as ��������
from sungjuk;

4) �������������� �����ϱ�
select uname, kor, case when kor between 90 and 100 then 'A����'
                        when kor between 80 and 89 then 'B����'
                        when kor between 70 and 79 then 'C����'
                        when kor between 60 and 69 then 'D����'
                        else 'F����'
                    end as ��������
from sungjuk
order by kor desc;










