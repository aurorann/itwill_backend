1. ���̺����


--ȸ������ ���̺� ����
create table kbe_member (
      mname varchar2(50)  not null          --ȸ���̸�
    , id    varchar2(80)  primary key       --ȸ�����̵�
    , email varchar2(100) not null          --ȸ���̸���
    , phone varchar2(20)  not null          --ȸ����ȣ
    , addr  varchar2(100) not null          --ȸ���ּ�
    , birth varchar2(8)   not null          --ȸ������
    , mdate date          default sysdate   --ȸ�����Գ�¥ 
);

--���ϱ� ���̺� ����
create table kbe_zzim (
      zzno  number       primary key    --��ȣ
    , id    varchar2(80) not null       --ȸ�����̵�
    , pcode char(15)     not null       --��ǰ�ڵ�
);

--e-cash ���̺� ����
create table kbe_ecash (
      ecno      char(8)     primary key    --ecash �ڵ��ȣ
    , ecprice   number(6)   not null       --ecash ����
);

--ȸ�� ���� e-cash ���̺� ����
create table kbe_m_ecash (
      mecno  number         primary key     --ecash �ڵ��ȣ
    , id     varchar2(80)   not null        --ȸ�����̵�
    , ecno   char(8)        null            --ecash �ڵ��ȣ
    , ecuse  number         null        --ecash ���ݾ�
);

-- �������� ���̺����
create table kbe_coupon (
     cno        char(6) primary key
    , cname     varchar2(50)    not null
    , cdiscount number          not null
    , cdate     date            not null
    );
    
-- �������� ���̺� ����
drop table kbe_coupon;

-- ���������������̺����
create  table kbe_m_coupon(
     mcno  varchar2(100) primary key
   , id  varchar2 (80) not null
   , cno char(6) not null
   , mcuse char(1) not null
   );

-- ��ǰ���̺����
create table kbe_product(
     pcode char(13) primary key
    , pname varchar2(100) not null
    , AUCODE varchar2(7) not null
    , pbrand varchar2(50) not null
    , pdate date  not null
    , psub long not null
    , einfo varchar2(50) not null
    , esize varchar2(50) not null
    , price varchar2(50) not null
    , CAGROUP varchar2(400) not null
    , ppic varchar2(100) not null
    );
    
-- �۰� ���̺�
create table kbe_author (
aucode          varchar2(7) not null,
aukorname      varchar2(30),
auengname      varchar2(1000),
dfcode      varchar2(1) not null,
aumclass      varchar2(50),
ausclass      varchar2(50)
);

-- ī�װ� ���̺�
create table kbe_category (
cagroup varchar2(4000) not null,
caname varchar2(20) not NULL
);

commit;





commit;

//////////////////////////////////////////////////////////////////////////////////

2. ������ ����


--���ϱ� ���̺� ������ ����
create sequence kbe_member_seq;

--ȸ�� ���� e-cash ���̺� ������ ����
create sequence kbe_m_ecash_seq;

--ȸ�� ���� e-cash ���̺� ������ ����
drop sequence kbe_m_ecash_seq;

//////////////////////////////////////////////////////////////////////////////////


3. ���̺� ���߰�


--ȸ������ ���̺� �� �߰�
insert into kbe_member (mname, id, email, phone, addr, birth)
values('��Ը�', 'kim123', 'kim123@daum.net', '010-1234-5678', 'SEOUL', '19950625');
insert into kbe_member (mname, id, email, phone, addr, birth)
values('���ѿ�', 'kim321', 'kim321@naver.com', '010-2345-6789', 'SUWON', '19940707');
insert into kbe_member (mname, id, email, phone, addr, birth)
values('������', 'moon123', 'moon123@daum.net', '010-3456-7890', 'BUSAN', '19991210');
insert into kbe_member (mname, id, email, phone, addr, birth)
values('�հ���', 'son456', 'son456@naver.com', '010-4567-8901', 'JEJU', '19910323');
insert into kbe_member (mname, id, email, phone, addr, birth)
values('Ȳ����', 'hwang789', 'hwang789@gmail.com', '010-5678-9012', 'SEOUL', '19970810');


--���ϱ� ���̺� �� �߰�
insert into kbe_zzim (zzno, id, pcode)
values(kbe_member_seq.nextval,'kim123','9788957551943');
insert into kbe_zzim (zzno, id, pcode)
values(kbe_member_seq.nextval,'kim321','9788967820817');
insert into kbe_zzim (zzno, id, pcode)
values(kbe_member_seq.nextval,'moon123','9788962372489');
insert into kbe_zzim (zzno, id, pcode)
values(kbe_member_seq.nextval,'son456','9791188754786');
insert into kbe_zzim (zzno, id, pcode)
values(kbe_member_seq.nextval,'hwang789','9791130697901');


--e-cash ���̺� �� �߰�
insert into kbe_ecash (ecno, ecprice)
values('ec1000', 1000);
insert into kbe_ecash (ecno, ecprice)
values('ec10000', 11000);
insert into kbe_ecash (ecno, ecprice)
values('ec30000', 33000);
insert into kbe_ecash (ecno, ecprice)
values('ec50000', 55000);
insert into kbe_ecash (ecno, ecprice)
values('ec100000', 110000);


--ȸ�� ���� e-cash ���̺� �� �߰�
insert into kbe_m_ecash (mecno, id, ecno, ecuse)
values(kbe_m_ecash_seq.nextval,'kim123','ec1000', null);
insert into kbe_m_ecash (mecno, id, ecno, ecuse)
values(kbe_m_ecash_seq.nextval,'kim123','', -500);
insert into kbe_m_ecash (mecno, id, ecno, ecuse)
values(kbe_m_ecash_seq.nextval,'kim321','ec1000', null);
insert into kbe_m_ecash (mecno, id, ecno, ecuse)
values(kbe_m_ecash_seq.nextval,'kim321','ec1000', null);
insert into kbe_m_ecash (mecno, id, ecno, ecuse)
values(kbe_m_ecash_seq.nextval,'moon123','ec10000', null);


-- �����������߰�
insert into kbe_coupon(cno, cname, cdiscount, cdate)
values('cno001','eBook�ֹ�����',0.1,'2023-06-30');
insert into  kbe_coupon( cno, cname, cdiscount, cdate)
values('cno002','eBook�ֹ�����',0.2,'2023-06-30');    
insert into  kbe_coupon( cno, cname, cdiscount, cdate)
values('cno003','���޻�����',1000,'2023-12-31'); 
insert into  kbe_coupon( cno, cname, cdiscount, cdate)
values('cno004','���޻�����', 2000,'2023-12-31'); 


-- ���������������߰�
insert into  kbe_m_coupon(mcno, id, cno, mcuse) 
values('cu_001','kim123','cno001','Y');        
insert into  kbe_m_coupon( mcno, id, cno, mcuse) 
values('cu_002','kim321','cno002','N');    
insert into kbe_m_coupon( mcno, id, cno, mcuse) 
values('cu_003','kim321','cno003','N');    
insert into kbe_m_coupon( mcno, id, cno, mcuse) 
values('cu_004','moon123','cno004','Y');    
insert into kbe_m_coupon( mcno, id, cno, mcuse) 
values('cu_005','son456','cno004','N');    
insert into kbe_m_coupon( mcno, id, cno, mcuse) 
values('cu_006','hwang789','cno002','N');    
insert into kbe_m_coupon( mcno, id, cno, mcuse) 
values('cu_007','hwang789','cno004','N');


-- ��ǰ���߰�   
insert into kbe_product( pcode, pname, AUCODE, pbrand, pdate, psub, einfo, esize, price, CAGROUP, ppic) 
values('9788957551943', '���˼����Ģ', 'AU00017', '�����̵��',        '2017-03-09','���(TTS)����:����/ ISBN:9788957551943'        , 'pdf','39.00MB', '160000','PS, am','apple.png');

insert into kbe_product( pcode, pname, AUCODE, pbrand, pdate, psub, einfo, esize, price, CAGROUP, ppic)
values('9788967820817','���� ���� �� �ʸ� ��Ҵ�','AU00003','Ǫ�����',        '2018-07-17','���(TTS)����:����/ ISBN:9788967820817', 'epub','6.62MB','10500'        ,'PE, es, c5','pretty.png');

insert into kbe_product( pcode, pname, AUCODE, pbrand, pdate, psub, einfo, esize, price, CAGROUP, ppic)  
values('9788962372489', '������ �ϳ����� ������ ��� ���', 'AU00016', '�����ѳ���', '2018-03-20', '���(TTS)����:����/ISBN: 9788962372489',        'epub', '34MB',        '8400', 'RL, ch, c2','bana.png');

insert into kbe_product( pcode, pname, AUCODE, pbrand, pdate, psub, einfo, esize, price, CAGROUP, ppic) 
values('9791188754786', '���������� ��2���� ���� ����', 'AU00047', '�������̵��','2023-02-20','���(TTS)����:����/ ISBN:9791188754786'        , 'epub','24.67MB', '12,000','EC, ge, c3','walga.png');
            
    
-- �۰� �� �߰�
insert into kbe_author (aucode, aukorname, dfcode, aumclass, ausclass) 
values ('AU00003', '������', 'K', '���а�', '���߹��а�>���信�����۰�');
insert into kbe_author (aucode, aukorname, dfcode, aumclass, ausclass) 
values ('AU00016', '�ȹΰ�', 'K', '������/�뿪��', '������/�뿪��>����');
insert into kbe_author (aucode, aukorname, dfcode, aumclass, ausclass) 
values ('AU00017', '������', 'K', '����/����/�����', '����/�ֽ�����������');


-- ī�װ� �� �߰�
insert into kbe_category (cagroup, caname) 
values ('PS', '��ġ/��ȸ');
insert into kbe_category (cagroup, caname) 
values ('am', '����/��å');
insert into kbe_category (cagroup, caname) 
values ('PE', '��/������');
insert into kbe_category (cagroup, caname) 
values ('es', '������');
insert into kbe_category (cagroup, caname) 
values ('c5', '�ѱ�������');
insert into kbe_category (cagroup, caname) 
values ('RL', '����');
insert into kbe_category (cagroup, caname) 
values ('ch', '�⵶��');
insert into kbe_category (cagroup, caname) 
values ('c2', '�⵶���Ϲ�');

-- �۰�/ī�װ� �� �߰�
alter table kbe_category add cacode varchar2(4);

-- �۰�/ī�װ� �� �߰�
update kbe_category set cacode='D01'
where cagroup='PS';
update kbe_category set cacode='J01'
where cagroup='am';
update kbe_category set cacode='D02'
where cagroup='PE';
update kbe_category set cacode='J02'
where cagroup='es';
update kbe_category set cacode='S01'
where cagroup='c5';
update kbe_category set cacode='D03'
where cagroup='RL';
update kbe_category set cacode='J03'
where cagroup='ch';
update kbe_category set cacode='S02'
where cagroup='c2';

alter table kbe_category modify (cacode not null);


-- ��ǰ ���̺� ī�װ� ���̺� ������ �ҷ�����

----- <���˼����Ģ> ī�װ� ������Ʈ ����
update kbe_product kbpr 
set kbpr.cagroup = (
    select listagg(caname, '>')
    within group(order by cacode)
    from kbe_category
    where cacode in ('D01', 'J01')
)
where pcode='9788957551943';

----- <���� ���� �� �ʸ� ��Ҵ�> ī�װ� ������Ʈ ����
update kbe_product kbpr 
set kbpr.cagroup = (
    select listagg(caname, '>')
    within group(order by cacode)
    from kbe_category
    where cacode in ('D02', 'J02', 'S01')
)
where pcode='9788967820817';

-----<������ �ϳ����� ������ ��� ���> ī�װ� ������Ʈ ����
update kbe_product kbpr 
set kbpr.cagroup = (
    select listagg(caname, '>')
    within group(order by cacode)
    from kbe_category
    where cacode in ('D03', 'J03', 'S02')
)
where pcode='9788962372489';


-- ��ǰ���̺� �۰� ���̺� ������ �ҷ�����
-- ��ǰ���̺� ������ ���� modify �ʿ�
alter table kbe_product modify aucode varchar2(30);
----- <���˼����Ģ> �۰� ������Ʈ ����
update kbe_product kbpr 
set kbpr.aucode = (
    select aukorname
    from kbe_author
    where aucode in ('AU00017')
)
where pcode='9788957551943';
----- <���� ���� �� �ʸ� ��Ҵ�> �۰� ������Ʈ ����
update kbe_product kbpr 
set kbpr.aucode = (
    select aukorname
    from kbe_author
    where aucode in ('AU00003')
)
where pcode='9788967820817';
-----<������ �ϳ����� ������ ��� ���> �۰� ������Ʈ ����
update kbe_product kbpr 
set kbpr.aucode = (
    select aukorname
    from kbe_author
    where aucode in ('AU00016')
)
where pcode='9788962372489';


--ȸ�� ���� ecash ���̺� ������Ʈ
update kbe_m_ecash
set kbe_m_ecash.ecuse = (
    select ecprice from kbe_ecash where ecno='ec1000'
) where ecno='ec1000';

update kbe_m_ecash
set kbe_m_ecash.ecuse = (
    select ecprice from kbe_ecash where ecno='ec10000'
) where ecno='ec10000';

update kbe_m_ecash
set kbe_m_ecash.ecuse = (
    select ecprice from kbe_ecash where ecno='ec30000'
) where ecno='ec30000';

update kbe_m_ecash
set kbe_m_ecash.ecuse = (
    select ecprice from kbe_ecash where ecno='ec50000'
) where ecno='ec50000';

update kbe_m_ecash
set kbe_m_ecash.ecuse = (
    select ecprice from kbe_ecash where ecno='ec100000'
) where ecno='ec100000';

commit;


////////////////////////////////////////////////////////////////////////////////


4. ���̺� ��ȸ


--ȸ������ ���̺� ��ü �� ��ȸ
select * from kbe_member;

--ȸ������ ���̺� ����
drop table kbe_member;

--���ϱ� ���̺� ����
drop table kbe_zzim;

--���ϱ� ���̺� ��ü �� ��ȸ
select * from kbe_zzim;

--e-cash ���̺� �� ��ü ��ȸ
select * from kbe_ecash;

--ȸ�� ���� e-cash ���̺� �� ��ȸ
select * from kbe_m_ecash;

--���� ���̺� �� ��ȸ
select * from kbe_coupon;

--ȸ�� ���� ���� ���̺� �� ��ȸ
select * from kbe_m_coupon;

--��ǰ ���̺� ��ȸ
select * from kbe_product;

--�۰� ���̺� ��ȸ
select * from kbe_author;

--ī�װ� ���̺� ��ȸ
select * from kbe_category;


//////////////////////////////////////////////////////////////////////////////////


5. ���̺� ����

--ecash ���̺�� ecash����ȸ�����̺� ����
select kbe_m_ecash.*, kbe_ecash.*
from kbe_m_ecash inner join kbe_ecash
on kbe_m_ecash.ecno=kbe_ecash.ecno;


--ecash����ȸ�����̺��� ��� �������� ecash���̺��� ĳ�óѹ��� ��ġ�ϴ� �� ��������
select mecno, id, kbe_m_ecash.ecno, kbe_ecash.ecprice
from kbe_m_ecash left join kbe_ecash
on kbe_m_ecash.ecno=kbe_ecash.ecno
order by mecno;


--ȸ�� ���� ���� ���̺��� ��� �������� �������̺� ����
select mcno, id, kbe_coupon.cname, kbe_coupon.cdiscount, kbe_coupon.cdate, mcuse
from kbe_m_coupon left join kbe_coupon
on kbe_m_coupon.cno=kbe_coupon.cno
order by mcno;


 





















