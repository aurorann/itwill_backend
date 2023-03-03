●  파일 -> 새로만들기 -> 데이터베이스계층-> 데이터베이스 파일
     -> 파일명   : 20230303_04CSV변환.sql
     -> 저장위치 : i:\java202301\database
////////////////////////////////////////////////////


문1) 디자인 교과목중에서 학점이 제일 많은 교과목을 수강신청한 명단을 조회하시오
    (학번, 이름, 과목코드)

select su.hakno, st.uname, gw.gcode
from tb_sugang SU join tb_student ST
on SU.hakno=st.hakno join tb_gwamok GW
on SU.gcode=GW.gcode
where ghakjum=5;


문2) 학번별 수강신청한 총학점을 구하고 학번순으로 정렬해서 줄번호 4~6행 조회하시오
    (단, 수강신청하지 않은 학생의 총학점도 0으로 표시)
--left right 이용, rownum

select * from tb_student;

select su.hakno, st.uname
from tb_student ST left join tb_sugang SU
on ST.hakno=su.hakno;

select st.hakno, uname, gw.ghakjum
from tb_student ST left join tb_sugang SU
on ST.hakno=SU.hakno left join tb_gwamok GW
on SU.gcode=GW.gcode;

select distinct(st.hakno), nvl(sum(gw.ghakjum),0) as 학점
from tb_student ST left join tb_sugang SU
on ST.hakno=SU.hakno left join tb_gwamok GW
on SU.gcode=GW.gcode
group by st.hakno
order by st.hakno;

select hakno, 학점, rownum
from(
        select distinct(st.hakno), nvl(sum(gw.ghakjum),0) as 학점
        from tb_student ST left join tb_sugang SU
        on ST.hakno=SU.hakno left join tb_gwamok GW
        on SU.gcode=GW.gcode
        group by st.hakno
        order by st.hakno
        );
        
select hakno, 학점, rnum
from(
    select hakno, 학점, rownum as rnum
    from(
            select distinct(st.hakno), nvl(sum(gw.ghakjum),0) as 학점
            from tb_student ST left join tb_sugang SU
            on ST.hakno=SU.hakno left join tb_gwamok GW
            on SU.gcode=GW.gcode
            group by st.hakno
            order by st.hakno
            )
    )    
where rnum>=4 and rnum<=6;



문3) 학번별로 수강신청 총학점을 구하고, 총학점순으로 내림차순 정렬후
     위에서 부터 1건만 조회하시오 (학번, 이름, 총학점)
--rownum 1을 찾자

select su.hakno, st.uname, sum(gw.ghakjum) as hap
from tb_sugang SU join tb_student ST
on SU.hakno=st.hakno join tb_gwamok GW
on SU.gcode=GW.gcode
group by su.hakno, st.uname
order by hap desc;


select hakno, uname, hap, rownum as rnum
from(
        select su.hakno, st.uname, sum(gw.ghakjum) as hap
        from tb_sugang SU join tb_student ST
        on SU.hakno=st.hakno join tb_gwamok GW
        on SU.gcode=GW.gcode
        group by su.hakno, st.uname
        order by hap desc
     );

select hakno, uname, hap, rnum
from(
        select hakno, uname, hap, rownum as rnum
        from(
                select su.hakno, st.uname, sum(gw.ghakjum) as hap
                from tb_sugang SU join tb_student ST
                on SU.hakno=st.hakno join tb_gwamok GW
                on SU.gcode=GW.gcode
                group by su.hakno, st.uname
                order by hap desc
             )
    )
where rnum=1;









