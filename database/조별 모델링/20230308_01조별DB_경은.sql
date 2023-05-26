1. 테이블만들기


--회원정보 테이블 생성
create table kbe_member (
      mname varchar2(50)  not null          --회원이름
    , id    varchar2(80)  primary key       --회원아이디
    , email varchar2(100) not null          --회원이메일
    , phone varchar2(20)  not null          --회원번호
    , addr  varchar2(100) not null          --회원주소
    , birth varchar2(8)   not null          --회원생일
    , mdate date          default sysdate   --회원가입날짜 
);

--찜하기 테이블 생성
create table kbe_zzim (
      zzno  number       primary key    --번호
    , id    varchar2(80) not null       --회원아이디
    , pcode char(15)     not null       --상품코드
);

--e-cash 테이블 생성
create table kbe_ecash (
      ecno      char(8)     primary key    --ecash 코드번호
    , ecprice   number(6)   not null       --ecash 가격
);

--회원 소유 e-cash 테이블 생성
create table kbe_m_ecash (
      mecno  number         primary key     --ecash 코드번호
    , id     varchar2(80)   not null        --회원아이디
    , ecno   char(8)        null            --ecash 코드번호
    , ecuse  number         null        --ecash 사용금액
);

-- 할인쿠폰 테이블만들기
create table kbe_coupon (
     cno        char(6) primary key
    , cname     varchar2(50)    not null
    , cdiscount number          not null
    , cdate     date            not null
    );
    
-- 할인쿠폰 테이블 삭제
drop table kbe_coupon;

-- 쿠폰소유내역테이블만들기
create  table kbe_m_coupon(
     mcno  varchar2(100) primary key
   , id  varchar2 (80) not null
   , cno char(6) not null
   , mcuse char(1) not null
   );

-- 상품테이블만들기
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
    
-- 작가 테이블
create table kbe_author (
aucode          varchar2(7) not null,
aukorname      varchar2(30),
auengname      varchar2(1000),
dfcode      varchar2(1) not null,
aumclass      varchar2(50),
ausclass      varchar2(50)
);

-- 카테고리 테이블
create table kbe_category (
cagroup varchar2(4000) not null,
caname varchar2(20) not NULL
);

commit;





commit;

//////////////////////////////////////////////////////////////////////////////////

2. 시퀀스 생성


--찜하기 테이블 시퀀스 생성
create sequence kbe_member_seq;

--회원 소유 e-cash 테이블 시퀀스 생성
create sequence kbe_m_ecash_seq;

--회원 소유 e-cash 테이블 시퀀스 삭제
drop sequence kbe_m_ecash_seq;

//////////////////////////////////////////////////////////////////////////////////


3. 테이블 행추가


--회원정보 테이블 행 추가
insert into kbe_member (mname, id, email, phone, addr, birth)
values('김규리', 'kim123', 'kim123@daum.net', '010-1234-5678', 'SEOUL', '19950625');
insert into kbe_member (mname, id, email, phone, addr, birth)
values('김한울', 'kim321', 'kim321@naver.com', '010-2345-6789', 'SUWON', '19940707');
insert into kbe_member (mname, id, email, phone, addr, birth)
values('문지오', 'moon123', 'moon123@daum.net', '010-3456-7890', 'BUSAN', '19991210');
insert into kbe_member (mname, id, email, phone, addr, birth)
values('손경은', 'son456', 'son456@naver.com', '010-4567-8901', 'JEJU', '19910323');
insert into kbe_member (mname, id, email, phone, addr, birth)
values('황영리', 'hwang789', 'hwang789@gmail.com', '010-5678-9012', 'SEOUL', '19970810');


--찜하기 테이블 행 추가
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


--e-cash 테이블 행 추가
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


--회원 소유 e-cash 테이블 행 추가
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


-- 할인쿠폰행추가
insert into kbe_coupon(cno, cname, cdiscount, cdate)
values('cno001','eBook주문쿠폰',0.1,'2023-06-30');
insert into  kbe_coupon( cno, cname, cdiscount, cdate)
values('cno002','eBook주문쿠폰',0.2,'2023-06-30');    
insert into  kbe_coupon( cno, cname, cdiscount, cdate)
values('cno003','제휴사쿠폰',1000,'2023-12-31'); 
insert into  kbe_coupon( cno, cname, cdiscount, cdate)
values('cno004','제휴사쿠폰', 2000,'2023-12-31'); 


-- 쿠폰소유내역행추가
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


-- 상품행추가   
insert into kbe_product( pcode, pname, AUCODE, pbrand, pdate, psub, einfo, esize, price, CAGROUP, ppic) 
values('9788957551943', '범죄수사규칙', 'AU00017', '법률미디어',        '2017-03-09','듣기(TTS)여부:가능/ ISBN:9788957551943'        , 'pdf','39.00MB', '160000','PS, am','apple.png');

insert into kbe_product( pcode, pname, AUCODE, pbrand, pdate, psub, einfo, esize, price, CAGROUP, ppic)
values('9788967820817','예쁜 것은 다 너를 닮았다','AU00003','푸른향기',        '2018-07-17','듣기(TTS)여부:가능/ ISBN:9788967820817', 'epub','6.62MB','10500'        ,'PE, es, c5','pretty.png');

insert into kbe_product( pcode, pname, AUCODE, pbrand, pdate, psub, einfo, esize, price, CAGROUP, ppic)  
values('9788962372489', '세미한 하나님의 음성을 듣는 방법', 'AU00016', '순전한나드', '2018-03-20', '듣기(TTS)여부:가능/ISBN: 9788962372489',        'epub', '34MB',        '8400', 'RL, ch, c2','bana.png');

insert into kbe_product( pcode, pname, AUCODE, pbrand, pdate, psub, einfo, esize, price, CAGROUP, ppic) 
values('9791188754786', '월가아재의 제2라운드 투자 수업', 'AU00047', '에프엔미디어','2023-02-20','듣기(TTS)여부:가능/ ISBN:9791188754786'        , 'epub','24.67MB', '12,000','EC, ge, c3','walga.png');
            
    
-- 작가 행 추가
insert into kbe_author (aucode, aukorname, dfcode, aumclass, ausclass) 
values ('AU00003', '김지영', 'K', '문학가', '대중문학가>포토에세이작가');
insert into kbe_author (aucode, aukorname, dfcode, aumclass, ausclass) 
values ('AU00016', '안민경', 'K', '번역가/통역사', '번역가/통역사>영어');
insert into kbe_author (aucode, aukorname, dfcode, aumclass, ausclass) 
values ('AU00017', '신현덕', 'K', '경제/금융/기업인', '증권/주식투자전문가');


-- 카테고리 행 추가
insert into kbe_category (cagroup, caname) 
values ('PS', '정치/사회');
insert into kbe_category (cagroup, caname) 
values ('am', '행정/정책');
insert into kbe_category (cagroup, caname) 
values ('PE', '시/에세이');
insert into kbe_category (cagroup, caname) 
values ('es', '에세이');
insert into kbe_category (cagroup, caname) 
values ('c5', '한국에세이');
insert into kbe_category (cagroup, caname) 
values ('RL', '종교');
insert into kbe_category (cagroup, caname) 
values ('ch', '기독교');
insert into kbe_category (cagroup, caname) 
values ('c2', '기독교일반');

-- 작가/카테고리 열 추가
alter table kbe_category add cacode varchar2(4);

-- 작가/카테고리 열 추가
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


-- 상품 테이블에 카테고리 테이블 데이터 불러오기

----- <범죄수사규칙> 카테고리 업데이트 쿼리
update kbe_product kbpr 
set kbpr.cagroup = (
    select listagg(caname, '>')
    within group(order by cacode)
    from kbe_category
    where cacode in ('D01', 'J01')
)
where pcode='9788957551943';

----- <예쁜 것은 다 너를 닮았다> 카테고리 업데이트 쿼리
update kbe_product kbpr 
set kbpr.cagroup = (
    select listagg(caname, '>')
    within group(order by cacode)
    from kbe_category
    where cacode in ('D02', 'J02', 'S01')
)
where pcode='9788967820817';

-----<세미한 하나님의 음성을 듣는 방법> 카테고리 업데이트 쿼리
update kbe_product kbpr 
set kbpr.cagroup = (
    select listagg(caname, '>')
    within group(order by cacode)
    from kbe_category
    where cacode in ('D03', 'J03', 'S02')
)
where pcode='9788962372489';


-- 상품테이블에 작가 테이블 데이터 불러오기
-- 상품테이블 데이터 길이 modify 필요
alter table kbe_product modify aucode varchar2(30);
----- <범죄수사규칙> 작가 업데이트 쿼리
update kbe_product kbpr 
set kbpr.aucode = (
    select aukorname
    from kbe_author
    where aucode in ('AU00017')
)
where pcode='9788957551943';
----- <예쁜 것은 다 너를 닮았다> 작가 업데이트 쿼리
update kbe_product kbpr 
set kbpr.aucode = (
    select aukorname
    from kbe_author
    where aucode in ('AU00003')
)
where pcode='9788967820817';
-----<세미한 하나님의 음성을 듣는 방법> 작가 업데이트 쿼리
update kbe_product kbpr 
set kbpr.aucode = (
    select aukorname
    from kbe_author
    where aucode in ('AU00016')
)
where pcode='9788962372489';


--회원 소유 ecash 테이블 업데이트
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


4. 테이블 조회


--회원정보 테이블 전체 행 조회
select * from kbe_member;

--회원정보 테이블 삭제
drop table kbe_member;

--찜하기 테이블 삭제
drop table kbe_zzim;

--찜하기 테이블 전체 행 조회
select * from kbe_zzim;

--e-cash 테이블 행 전체 조회
select * from kbe_ecash;

--회원 소유 e-cash 테이블 행 조회
select * from kbe_m_ecash;

--쿠폰 테이블 행 조회
select * from kbe_coupon;

--회원 소유 쿠폰 테이블 행 조회
select * from kbe_m_coupon;

--상품 테이블 조회
select * from kbe_product;

--작가 테이블 조회
select * from kbe_author;

--카테고리 테이블 조회
select * from kbe_category;


//////////////////////////////////////////////////////////////////////////////////


5. 테이블 조인

--ecash 테이블과 ecash소유회원테이블 조인
select kbe_m_ecash.*, kbe_ecash.*
from kbe_m_ecash inner join kbe_ecash
on kbe_m_ecash.ecno=kbe_ecash.ecno;


--ecash소유회원테이블을 모두 가져오고 ecash테이블에서 캐시넘버와 일치하는 행 가져오기
select mecno, id, kbe_m_ecash.ecno, kbe_ecash.ecprice
from kbe_m_ecash left join kbe_ecash
on kbe_m_ecash.ecno=kbe_ecash.ecno
order by mecno;


--회원 소유 쿠폰 테이블을 모두 가져오고 쿠폰테이블 조인
select mcno, id, kbe_coupon.cname, kbe_coupon.cdiscount, kbe_coupon.cdate, mcuse
from kbe_m_coupon left join kbe_coupon
on kbe_m_coupon.cno=kbe_coupon.cno
order by mcno;


 





















