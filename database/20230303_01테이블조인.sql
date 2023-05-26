●  파일 -> 새로만들기 -> 데이터베이스계층-> 데이터베이스 파일
     -> 파일명   : 20230303_01테이블조인.sql
     -> 저장위치 : i:\java202301\database
////////////////////////////////////////////////////

●  [테이블 조인 연습 문제]

-- 전체 행 갯수
select count(*) from tb_student; --6
select count(*) from tb_gwamok; --9
select count(*) from tb_sugang; --14

문2) 지역별로 수강신청 인원수, 지역을 조회하시오
     서울 2명
     제주 2명

1) 수강테이블 조회
select * from tb_sugang order by hakno;

2) 수강 신청한 학생들의 명단 조회(학번)
select hakno from tb_sugang order by hakno;
select distinct(hakno) from tb_sugang order by hakno; -- distinct 중복 제거
select hakno from tb_sugang group by hakno; -- group by는 hakno 그룹화, 내부적으로 정렬을 가지고 있음
select hakno, count(*) from tb_sugang group by hakno; 

3) 수강신청한 학번(AA)들의 주소를 학생테이블에서 가져오기
select aa.hakno, address
from(
    select hakno from tb_sugang group by hakno
    ) AA join tb_student ST
on AA.hakno=ST.hakno;

4) 3의 결과를 BB테이블로 만든후
select bb.address, count(*) || '명' as cnt
from(
        select aa.hakno, address
        from(
            select hakno from tb_sugang group by hakno
            ) AA join tb_student ST
        on AA.hakno=ST.hakno
    ) BB
group by bb.address;

5) 4)의 SQL문에서 BB 별칭은 생략 가능하다
select address, count(*) || '명' as cnt
from(
        select aa.hakno, address
        from(
            select hakno from tb_sugang group by hakno
            ) AA join tb_student ST
        on AA.hakno=ST.hakno
    )
group by address;

김태윤오전 10:08
select address, count(distinct SU.hakno)  as total
from tb_sugang SU join  tb_student ST on SU.hakno = ST.hakno
group by address;

홍다예오전 10:08
SELECT STU.ADDRESS, COUNT(*) CNT
FROM (
      SELECT DISTINCT(SU.HAKNO), UNAME, ADDRESS
      FROM TB_SUGANG SU INNER JOIN TB_STUDENT ST
      ON SU.HAKNO = ST.HAKNO
     )STU
GROUP BY STU.ADDRESS
ORDER BY STU.ADDRESS;

김지현오전 10:08
select address, count(*)
from(
        select distinct(ST.address), SU.hakno
        from tb_sugang SU inner join tb_student ST
        on SU.hakno=ST.hakno       
        ) AA
group by address;



문3) 과목별 수강 신청 인원수, 과목코드, 과목명를 조회하시오 
     d001  HTML    2명
     d002  포토샵    1명
     d003  일러스트  1명
     p001  JAVA    4명
     p002  Oracle  2명
     p003  JSP     2명
     p004  Python  1명

--1) 수강테이블에서 과목코드 정렬해서 조회하기
select * from tb_sugang order by gcode;

--2) 수강테이블에서 과목코드가 동일한 행을 그룹화 하기
select gcode, count(*)
from tb_sugang
group by gcode;

--3) 2)의 결과를 AA테이블로 생성하고, 과목테이블 조인하기
select aa.gcode, gname, concat(cnt,'명') as 수강인원
from(
    select gcode, count(*) as cnt
    from tb_sugang
    group by gcode
    ) aa join tb_gwamok GW
    on aa.gcode=gw.gcode
order by aa.gcode;

-- 경은코드
select gcode, gname from tb_gwamok; --과목코드, 과목명

select aa.gcode, gname, su.hakno
from(
    select gcode, gname from tb_gwamok
    ) aa join tb_sugang SU
    on aa.gcode=SU.gcode;

select bb.gcode, bb.gname, count(*) || '명' as cnt
from(
    select aa.gcode, gname, su.hakno
    from(
        select gcode, gname from tb_gwamok
        ) aa join tb_sugang SU
        on aa.gcode=SU.gcode
    ) bb
group by bb.gcode, bb.gname
order by bb.gcode;



문4) 학번별 수강신청과목의 총학점을 학번별순으로 조회하시오
     g1001  홍길동  12학점
     g1002  홍길동   8학점
     g1005  진달래  12학점
     g1006  개나리   3학점

--1) 수강테이블에서 학번별로 조회
select hakno, gcode from tb_sugang order by hakno;

--2) 수강테이블에서 과목코드가 일치하는 학점을 과목테이블에서 가져와서 붙이기
select su.hakno, su.gcode, gw.ghakjum
from tb_sugang SU join tb_gwamok GW
on SU.gcode=GW.gcode;

--3) 2)의 결과를 AA테이블로 만들고, 학번별로 그룹화한 후 학점 합하기
select aa.hakno, sum(aa.ghakjum) as hap
from(
        select su.hakno, su.gcode, gw.ghakjum
        from tb_sugang SU join tb_gwamok GW
        on SU.gcode=GW.gcode
    )AA
group by aa.hakno;

--4) 3)의 결과를 BB테이블로 만들고, 학번을 기준으로 학생테이블에서 이름 가져와서 붙이기
select bb.hakno, st.uname, concat(hap, '학점')
from(
        select aa.hakno, sum(aa.ghakjum) as hap
        from(
                select su.hakno, su.gcode, gw.ghakjum
                from tb_sugang SU join tb_gwamok GW
                on SU.gcode=GW.gcode
            )AA
        group by aa.hakno
        ) bb join tb_student ST
on bb.hakno=st.hakno;
-------------------------------------------------------------------------------
문4)의 또다른 방법
--1) 수강테이블+학생테이블+과목테이블=3개 테이블 조인
select su.hakno, su.gcode, st.uname, gw.ghakjum
from tb_sugang SU join tb_student ST
on SU.hakno=st.hakno join tb_gwamok GW
on SU.gcode=GW.gcode
order by su.hakno;

--2) 1차그룹(학번), 2차그룹(이름)으로 그룹화하고, 총학점 구하기
select su.hakno, st.uname, sum(gw.ghakjum) ||'학점' as hap
from tb_sugang SU join tb_student ST
on SU.hakno=st.hakno join tb_gwamok GW
on SU.gcode=GW.gcode
group by su.hakno, st.uname;


--경은코드
-- 학번, 학생이름
select hakno, uname from tb_student; 

-- 학번, 학생이름, 수강신청 코드
select aa.hakno, uname, gcode
from(
    select hakno, uname from tb_student
    ) aa join tb_sugang SU
on aa.hakno=su.hakno;

-- 학번, 학생이름, 수강신청 코드, 학점
select hakno, uname, bb.gcode, ghakjum
from(
    select aa.hakno, uname, gcode
    from(
        select hakno, uname from tb_student
        ) aa join tb_sugang SU
    on aa.hakno=su.hakno
    ) bb join tb_gwamok GA
on bb.gcode=ga.gcode;  


select hakno, uname, sum(ghakjum)
from(
    select hakno, uname, bb.gcode, ghakjum
    from(
        select aa.hakno, uname, gcode
        from(
            select hakno, uname from tb_student
            ) aa join tb_sugang SU
        on aa.hakno=su.hakno
        ) bb join tb_gwamok GA
    on bb.gcode=ga.gcode
    ) cc
group by hakno, uname;



문5) 학번 g1001이 수강신청한 과목을 과목코드별로 조회하시오
     g1001  d001  HTML
     g1001  p001  JAVA
     g1001  p002  Oracle
     g1001  p003  JSP
     g1001  p004  Python

--1) 수강테이블 + 과목테이블 조인
select su.hakno, su.gcode, gw.gname
from tb_sugang SU join tb_gwamok GW
on su.gcode=gw.gcode;

--2) 학번 g1001이 신청한 정보 조회하기
select su.hakno, su.gcode, gw.gname
from tb_sugang SU join tb_gwamok GW
on su.gcode=gw.gcode
where su.hakno='g1001' --실제 자바코드에서 학번을 변수처리 한다
order by su.gcode;


--경은코드
select hakno, gcode from tb_sugang
where hakno='g1001';

select aa.hakno, aa.gcode, gname
from(
    select hakno, gcode from tb_sugang
    where hakno='g1001' 
    ) aa join tb_gwamok GA
on aa.gcode=ga.gcode
order by aa.gcode;


문6) 수강신청을 한 학생들의 학번, 이름 조회
     g1001  홍길동
     g1002  홍길동
     g1005  진달래
     g1006  개나리

--1) 수강신청을 한 학생들의 학번 조회
select hakno from tb_sugang;
select distinct(hakno) from tb_sugang;
select hakno from tb_sugang group by hakno;

--2)
select hakno, uname
from tb_student
where hakno='g1001' or hakno='g1002' or hakno='g1005' or hakno='g1006';

select hakno, uname
from tb_student
where hakno in ('g1001','g1002','g1005','g1006');--in 연산자

--3) 1)의 결과를 서브쿼리 형태로 조회
select hakno, uname
from tb_student
where hakno in (select hakno from tb_sugang group by hakno);


--경은코드
select su.hakno, st.uname
from tb_sugang SU join tb_student ST
on SU.hakno=st.hakno join tb_gwamok GW
on SU.gcode=GW.gcode
group by su.hakno, st.uname;



문7)수강신청을 하지 않은 학생들의 학번, 이름 조회
     g1003  개나리
     g1004  홍길동

select hakno from tb_student ST; --학번
select hakno from tb_sugang SU group by hakno; --수강신청한 학번

select hakno, uname
from tb_student
where hakno not in (select hakno from tb_sugang group by hakno);