��  ���� -> ���θ���� -> �����ͺ��̽�����-> �����ͺ��̽� ����
     -> ���ϸ�   : 20230303_04CSV��ȯ.sql
     -> ������ġ : i:\java202301\database
////////////////////////////////////////////////////

��  [CSV ����]
    - ��� �����Ͱ� , �� ���еǾ� �ִ� ����


��  [CSV ������ �����ͺ��̽��� ��������]
    - �������������� https://data.go.kr/ Ȱ��
///////////////////////////////////////////////////////////////////////////////


��1) ���θ� �����ȣ ���̺� �����ϱ�

--1) zipdoro.csv �غ�(258267��)

--2) zipdoro.csv ������ �����ϴ� zipdoro���̺� ����
create table zipdoro (
    zipno      char(5)          --�����ȣ
   ,zipaddress varchar(1000)    --�ּ�
);

commit;
drop table zipdoro; --���̺� ����

--3) ��������� ��������
- zipdoro ���̺� ��Ŭ�� -> ������ ����Ʈ (��������)
- zipdoro ���̺� ��Ŭ�� -> export      (��������)

--4) ��ü �� ���� ��ȸ�ϱ�
select count(*) from zipdoro;
///////////////////////////////////////////////




-- �б� ���̺� ����
create table school (
    schoolid    varchar2(10)    --�б�ID
   ,schoolname  varchar2(255)   --�б���
   ,schoolgubun varchar2(20)    --�б��ޱ���
   ,schooladdr  varchar2(255)   --���������θ��ּ�
   ,cdate       date            --��������
   ,udate       date            --��������
   ,lati        char(15)        --����
   ,longi       char(15)        --�浵
);

commit;
drop table school;

select count(*) from school; --11873


��2) �ѱ��������б�_���ߵ��б���ġ.csv�� ��ȯ�ؼ� ���̺� �����Ͻÿ� (11873��)

--����1) ����ִ� ��(null)�� ã���ÿ�
select * from school where schoolid is null;
select * from school where schoolname is null;
select * from school where schoolgubun is null;
select * from school where schooladdr is null; --null



--����2) �� �õ��� �ʵ��б�, ���б� ������ ���Ͻÿ�
select address, grade
from school
where address like '����%';


select substr(address,0, instr(address,' ' ,1,1))


















