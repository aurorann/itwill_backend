--member.sql


-- 회원등급
A1: 관리자
B1: 일반 사용자 (기본)
C1: 비회원
F1: 탈퇴한 회원


--콘솔창 정리
set linesize 1000;
col mid for a20;
col passwd for a10;
col mname for a10;
col jomin for a20;
col tel for a20;
col email for a30;
col mlevel for a10;
col mdate for a10;

select * from member;

--회원테이블
CREATE TABLE member (
	mid varchar2(10) 	NOT NULL,
	passwd varchar2(10) NOT NULL,
	mname varchar2(20) 	NOT NULL,
	jomin1 number(6) 	NOT NULL,
	jomin2 number(7) 	NOT NULL,
	tel varchar2(14)      NOT NULL,
	email varchar2(50) 	NOT NULL  UNIQUE,
	mlevel char(2) DEFAULT 'B1',
	mdate DATE DEFAULT sysdate,
	PRIMARY KEY(mid)
);



commit;


--행추가
insert into member(mid, passwd, mname, jomin1, jomin2, tel, email)
values('webmaster', '12341234', '웹마스터', '000123', '3234567', '010-1234-5678', 'webmaster@itwill.com');

insert into member(mid, passwd, mname, jomin1, jomin2, tel, email, mlevel, mdate)
values('itwill', '12341234', '아이티윌', '000124', '4234567', '010-2345-6789', 'aurorann@daum.net', 'B1', sysdate );

insert into member(mid, passwd, mname, jomin1, jomin2, tel, email, mlevel, mdate)
values('korea', '12341234', '코리아', '990124', '2234567', '010-2345-6789', 'aurora0323@naver.com', 'C1', sysdate );

commit;


--로그인
--아이디/비번이 일치하면 회원등급 가져오기
--단, 비회원과 탈퇴회원은 제외
select mlevel
from member
where id='webmaster' and passwd='12341234' and mlevel in ('A1', 'B1');

select mlevel
from member
where id='itwill' and passwd='12341234' and mlevel in ('A1', 'B1');

select mlevel
from member
where id='korea' and passwd='12341234' and mlevel in ('A1', 'B1');


--아이디 중복 확인
--id 갯수를 조회했을때 0이면 사용가능. 1이면 사용불가
select count(mid)
from member
where mid=?;


--회원가입
insert into member(id, passwd, mname, tel, email, zipcode, address1, address2, job, mlevel, mdate)
values(?,?,?,?,?,?,?,?,?,'D1', sysdate)


-- 아이디/비번찾기 연습용 데이터 행추가(확인 가능한 이메일 주소 정확히 작성)
insert into member(id, passwd, mname, tel, email, zipcode, address1, address2, job, mlevel, mdate)
values('ssson','12341234','손경은','123-4567','aurorann@daum.net','12345','서울시 강남구 역삼동','삼원타워','A02','D1', sysdate);


-- 아이디와 비밀번호 찾기

1) 이름과 이메일이 일치하면 아이디 가져오기
select id
from member
where mname=? and email=?;

2) 임시 비밀번호를 발급해서 member테이블 수정하기
update member
set passwd=?
where mname=? and email=?


--회원탈퇴