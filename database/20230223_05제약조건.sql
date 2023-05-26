��  ���� -> ���θ���� -> �����ͺ��̽�����-> �����ͺ��̽� ����
     -> ���ϸ�   : 20230223_05��������.sql
     -> ������ġ : i:\java202301\database
////////////////////////////////////////////////////

-- sungjuk ���̺� ����
drop table sungjuk;

-- sungjuk ���̺� ����
create table sungjuk(
   sno   int         primary key --�⺻Ű(���ϼ�)
  ,uname varchar(50) not null
  ,kor   int         check(kor between 0 and 100) --�������� 0~100���̸� �Է°���
  ,eng   int         check(eng between 0 and 100) --�������� 0~100���̸� �Է°���
  ,mat   int         check(mat between 0 and 100) --�������� 0~100���̸� �Է°���
  ,addr  varchar(50) check(addr in ('Seoul', 'Busan', 'Jeju', 'Suwon'))
  ,tot   int         default 0
  ,aver  int         default 0
  ,wdate date        default sysdate              --���� ��¥ �Լ�
);
////////////////////////////////////////////////////
select * from sungjuk;


��  [���̺� �������� ���� �޼���]

-- primary key ��������
-- ORA-00001: ���Ἲ ���� ����(SYSTEM.SYS_C007329)�� ����˴ϴ�
-- sno Į���� �⺻(PK)�̹Ƿ� ������ ���� ������� ����
insert into sungjuk(sno, uname) values(1, 'ȫ�浿'); --�ι� �������� �� ���� �߻�

-- not null����
-- ORA-01400: NULL�� ("SYSTEM"."SUNGJUK"."UNAME") �ȿ� ������ �� �����ϴ�
insert into sungjuk(sno) values(2); -- uname Į���� �ݵ�� ���� �Է��ؾ� ��

insert into sungjuk(sno, uname) values(2, '1234567890');
insert into sungjuk(sno, uname) values(3, 'ABCDEFGHIJ');

-- ORA-12899: "SYSTEM"."SUNGJUK"."UNAME" ���� ���� ���� �ʹ� ŭ(����: 11, �ִ밪: 10)
insert into sungjuk(sno, uname) values(4, 'ABCDEFGHIJK');

insert into sungjuk(sno, uname) values(5, '����ȭ');

-- ORA-12899: "SYSTEM"."SUNGJUK"."UNAME" ���� ���� ���� �ʹ� ŭ(����: 12, �ִ밪: 10)
insert into sungjuk(sno, uname) values(6, '���ѹα�');



-- check ��������
-- ORA-02290: üũ ��������(SYSTEM.SYS_C007338)�� ����Ǿ����ϴ�
insert into sungjuk(sno, uname, kor, eng, mat)
values(1, 'ȫ�浿', -10, 20, 300);

-- ORA-02290: üũ ��������(SYSTEM.SYS_C007339)�� ����Ǿ����ϴ�
-- addrĮ���� 'Incheon' ��� ����.
insert into sungjuk(sno, uname, kor, eng, mat, addr)
values(1, 'ȫ�浿', 10, 20, 30, 'Incheon');


-- default ��������
-- tot�� aver�� 0 �Է�, wdate�� ���糯¥�� �Էµ�
insert into sungjuk(sno, uname, kor, eng, mat, addr)
values(1, 'ȫ�浿', 10, 20, 30, 'Seoul');

--SQL ����: ORA-00913: ���� ���� �ʹ� �����ϴ� -  "too many values"
insert into sungjuk(sno, uname, kor, eng, mat)
values(2, 'ȫ�浿', 10, 20, 30, 'Seoul');






