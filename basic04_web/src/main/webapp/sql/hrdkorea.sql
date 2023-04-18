--hrdkorea.sql

--여행 상품 코드 테이블
create table tbl_tourcode_02(
	 tcode char(4) primary key	--상품코드
	,tarea varchar2(30)		--여행지역
	,tdate char(8)				--출발일자
	,ttime char(4)				--출발시간
	,tday number(2)			--숙박일수
	,thotel varchar2(30)		--숙박호텔
	,tmoney number(7)			--여행금액
	,tair varchar2(30)		--항공정보
);


drop table tbl_tourcode_02;

set linesize 1000;
col tcode for a10;
col tarea for a10;
col tdate for a10;
col ttime for a10;
col thotel for a10;
col tair for a10;

commit;

--여행상품코드 샘플 데이터
insert into tbl_tourcode_02(tcode, tarea, tdate, ttime, tday, thotel, tmoney, tair)
values('JJ01', '제주', '20181201', '0930', 2, 'J 호텔', 360000, 'J 항공');

insert into tbl_tourcode_02(tcode, tarea, tdate, ttime, tday, thotel, tmoney, tair)
values('JJ02', '부산', '20181202', '1000', 2, 'B 호텔', 280000, 'B 항공');

insert into tbl_tourcode_02(tcode, tarea, tdate, ttime, tday, thotel, tmoney, tair)
values('JJ03', '제주', '20181204', '1000', 2, 'J 호텔', 360000, 'J 항공');

insert into tbl_tourcode_02(tcode, tarea, tdate, ttime, tday, thotel, tmoney, tair)
values('JJ04', '제주', '20181207', '1100', 3, 'J 호텔', 420000, 'J 항공');

insert into tbl_tourcode_02(tcode, tarea, tdate, ttime, tday, thotel, tmoney, tair)
values('JJ05', '부산', '20181209', '1330', 2, 'B 호텔', 260000, 'B 항공');

insert into tbl_tourcode_02(tcode, tarea, tdate, ttime, tday, thotel, tmoney, tair)
values('JJ06', '제주', '20181210', '0930', 3, 'J 호텔', 460000, 'J 항공');


--예약등록 테이블
create table tbl_reserve_01(
	 rno 		char(8) primary key	--예약번호
	,rjumin 	varchar2(13)		--주민번호
	,rname 		varchar2(20)		--예약자
	,rphone1 	char(3)				--전화번호1
	,rphone2 	char(4)				--전화번호2
	,rphone3 	char(4)				--전화번호3
	,remail 	varchar2(30)		--이메일
	,rstat 		char(1)				--입금상태
	,tcode 		char(4)				--상품코드
);

set linesize 1000;
col rno for a10;
col rjumin for a10;
col rname for a10;
col rphone1 for a10;
col rphone2 for a10;
col rphone3 for a10;
col remail for a10;
col rstat for a10;
col rcode for a10;



--상품코드 작성 하기
--예) [JJ01] 제주 2018-12-01 출발

1)상품코드 조회
select tcode from tbl_tourcode_02;

2)상품코드, 출발지역, 출발날짜에 문자 결합해서 조회
select tcode
	  , '[' || tcode || ']' || tarea 
	    || substr(tdate, 1, 4) || '-' || substr(tdate, 5, 2) || '-' || substr(tdate, 7, 2)
	    || '출발' as tname
from tbl_tourcode_02
order by tcode;

3)상품코드, 출발지역, 출발날짜 조회
select tcode, tarea, tdate
from tbl_tourcode_02
order by tcode;


--travelList.jsp 예약 내역 조회

select tbl_tourcode_02.tcode, tarea, tdate, ttime, tday, thotel, tmoney, tair
		,rno, rjumin, rname, rphone1, rphone2, rphone3, remail, rstat
from tbl_tourcode_02 inner join tbl_reserve_01
on tbl_tourcode_02.tcode = tbl_reserve_01.tcode
order by tbl_tourcode_02.tcode;






















