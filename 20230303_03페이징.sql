●  파일 -> 새로만들기 -> 데이터베이스계층-> 데이터베이스 파일
     -> 파일명   : 20230303_03페이징.sql
     -> 저장위치 : i:\java202301\database
////////////////////////////////////////////////////


●  [모조칼럼 rownum]

--줄번호
select hakno, uname, rownum from tb_student;

--줄번호에 칼럼명 바꾸기
select hakno, uname, rownum as rnum from tb_student;

--줄번호가 먼저 부여되고 정렬된다
select hakno, uname, rownum as rnum from tb_student order by uname;

--줄번호 1~3사이 조회
select hakno, uname, rownum from tb_student where rownum>=1 and rownum<=3;

--줄번호 4~6사이 조회 (조회 안됨)
select hakno, uname, rownum from tb_student where rownum>=4 and rownum<=6;
///////////////////////////////////////////////////////////////////////////


●  [rownum을 활용한 페이징]
    - rownum은 모조칼럼이므로 조건절에 직접 사용하지 말고, 실제칼럼으로 인식후 사용할 것을 추천
    - rownum칼럼은 셀프조인 후에 줄번호 추가하고 조건절에 활용한다


문) 줄번호(rownum)을 이용해서 줄번호 4~6 조회

-- 1) 이름순으로 조회(줄번호까지 같이 정렬)
select uname, hakno, address, rownum
from tb_student
order by uname;

--2) 1)의 결과를 셀프조인(AA 테이블)
select aa.uname, aa.hakno, aa.address, rownum as rnum
from ( 
        select uname, hakno, address
        from tb_student
        order by uname
      ) AA;
      
-- AA테이블 명칭은 생략해도 된다
select uname, hakno, address, rownum as rnum
from ( 
        select uname, hakno, address
        from tb_student
        order by uname
      );

--3) 2)의 결과를 BB테이블로 만들고, 줄번호 4~6행 조회하시오
select uname, hakno, address, rnum
from(
        select uname, hakno, address, rownum as rnum
        from ( 
                select uname, hakno, address
                from tb_student
                order by uname
              )
     )BB
where rnum>=4 and rnum<=6;

--4) 3)의 결과에서 테이블 별칭(AA, BB) 생략하기
select uname, hakno, address, rnum
from(
        select uname, hakno, address, rownum as rnum
        from ( 
                select uname, hakno, address
                from tb_student
                order by uname
              )
     )
where rnum>=4 and rnum<=6;















