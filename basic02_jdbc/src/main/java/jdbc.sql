
-- 20230223_04성적테이블.sql 참조

--sqlplus 사용자 추천
--오라클 콘솔창 예쁘게 출력

set linesize 1000;
col uname for a10;
col addr for a10;
col address for a10;
col phone for a10;


--sungjuk 테이블 전체 행 조회
select * from sungjuk order by sno desc;

--sungjuk 테이블 행추가
INSERT INTO sungjuk(sno, uname, kor, eng, mat, addr, wdate)
VALUES (sungjuk_seq.nextval, '손흥민', 99, 98, 97, 'Seoul', sysdate)

--sungjuk 테이블 행 수정
update sungjuk
set tot=kor+eng+mat, aver=(kor+eng+mat)/3
where sno=13;

update sungjuk
set uname=?, kor=?, eng=?, mat=?, tot=?, aver=?, addr=?, wdate=sysdate
where sno=?


--sungjuk테이블 전체 행 갯수
select count(*) from sungjuk;


select sno, uname, kor, eng, mat, addr, tot, aver, wdate
from sungjuk
where sno=12;


--문제) 주소가 서울인 행들의 국영수 평균값을 구하시오
--	   (단, 소수점은 반올림해서 둘째자리값까지 표현)

1)주소가 서울인 행 조회하기
select addr, uname, kor, eng, mat
from sungjuk
where addr='Seoul';

2)주소가 서울인 행을 대상으로 국영수 평균 구하기
select avg(kor), avg(eng), avg(mat)
from sungjuk
where addr='Seoul';

3)주소가 서울인 행을 대상으로 국영수 평균 구한후 반올림해서 소수점 둘째자리까지 표현
select round(avg(kor),2)
     , round(avg(eng),2)
     , round(avg(mat),2)
from sungjuk
where addr='Seoul';

4)주소가 서울인 행을 대상으로 국영수 평균 구한후 반올림해서 소수점 둘째자리까지 표현한 후 칼럼명 변경하기
select round(avg(kor),2) as avg_kor
     , round(avg(eng),2) as avg_eng
     , round(avg(mat),2) as avg_mat
from sungjuk
where addr='Seoul';


--문제) 이름에 '나' 문자 있는 행을 조회하시오
select *
from sungjuk
where uname like '%나%'
order by sno desc;


--문제) sungjuk테이블에서 이름순으로 정렬후 행번호 4~6만 조회하시오

1)
select sno, uname, aver, addr
from sungjuk
order by uname;

2) rownum도 같이 정렬된다
select sno, uname, aver, addr, rownum
from sungjuk
order by uname;


3) 1)의 결과를 한번 더 셀프 조인하고 , rownum 추가하기
select sno, uname, aver, addr, rownum
from (
		select sno, uname, aver, addr
		from sungjuk
		order by uname
	);
	
4) 행번호 4~6 조회하기(결과:조회되지 않음)
select sno, uname, aver, addr, rownum
from (
		select sno, uname, aver, addr
		from sungjuk
		order by uname
	)
where rownum>=4 and rownum<=6;
	
5) 3)의 내용을 한번 더 셀프조인하고, 행번호 4~6 조회하기
select *
from(
		select sno, uname, aver, addr, rownum as rnum
		from (
				select sno, uname, aver, addr
				from sungjuk
				order by uname
			)
	)
where rnum>=4 and rnum<=6;

--문제) 학번 g1001이 수강신청한 과목을 과목코드별로 조회하시오
select su.hakno, su.gcode, gw.gname
from tb_sugang SU join tb_gwamok GW
on su.gcode=gw.gcode
where su.hakno='g1001'
order by su.gcode;











