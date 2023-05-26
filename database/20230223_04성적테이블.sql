��  ���� -> ���θ���� -> �����ͺ��̽�����-> �����ͺ��̽� ����
     -> ���ϸ�   : 20230223_04�������̺�.sql
     -> ������ġ : i:\java202301\database
///////////////////////////////////////////////////////////////////////////

-- sungjuk ���̺� ����
drop table sungjuk;
commit;

-- sungjuk ���̺� ����
create table sungjuk  (
   sno   int         not null
  ,uname varchar(50) not null
  ,kor   int         not null
  ,eng   int         not null
  ,mat   int         not null
  ,tot   int
  ,aver  int
  ,addr  varchar(20)
  ,wdate date
);
////////////////////////////////////////////




��  [sungjuk ���̺� �Է� ������]

insert into sungjuk(sno, uname, kor, eng, mat, addr, wdate)
values(sungjuk_seq.nextval,'����Ƽ��', 90, 85, 95, 'Seoul',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'����ȭ',40,50,20,'Seoul',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'���޷�',90,50,90,'Jeju',sysdate);
insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'������',20,50,20,'Jeju',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'����ȭ',90,90,90,'Seoul',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'���Ȳ�',50,50,90,'Suwon',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'������',70,50,20,'Seoul',sysdate);
insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'�ҳ���',90,60,90,'Busan',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'������',20,20,20,'Jeju',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'ȫ�浿',90,90,90,'Suwon',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'����ȭ',80,80,90,'Suwon',sysdate);


commit;
select count(*) from sungjuk; --��ü ���ڵ� ����
select * from sungjuk;




-- ��1) ��ü�࿡ ���ؼ� ����(tot), ���(aver)�� ���Ͻÿ�
update sungjuk
set tot=kor+eng+mat, aver=(kor+eng+mat)/3;

-- ��2) �̸��� '��' ���ڰ� �ִ� ���� ��ȸ�Ͻÿ�
select uname
from sungjuk
where uname like '%��%';

-- ��3) �ּҰ� ����, ���� ���� ��ȸ�Ͻÿ�
select uname, addr
from sungjuk
where addr='Seoul' or addr='Busan';

select uname, addr
from sungjuk
where addr in ('Seoul', 'Jeju');

-- ��4) ������ ������ ��� 90�� �̻� ���� ����� ��ȸ�Ͻÿ�
select count(*) as cnt --Į���� ����
from sungjuk
where 90<=kor and 90<=eng and 90<=mat;

select count(*)  cnt --as ��������
from sungjuk
where 90<=kor and 90<=eng and 90<=mat;

-- ��5) �ּҺ��� �����ؼ� ��ȸ�Ͻÿ�. �ּҰ� ���ٸ� �Ϸù�ȣ ������ �ٽ� �����ؼ� ��ȸ�Ͻÿ�
select sno, uname, addr
from sungjuk
order by addr, sno;






















