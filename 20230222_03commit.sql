●  파일 -> 새로만들기 -> 데이터베이스계층-> 데이터베이스 파일
     -> 파일명    :   20230222_03commit.sql
     -> 저장위치  :   i:\java202301\database
///////////////////////////////////////////////////////////////////////////


※ SQL Developer툴에서 자동커밋 설정해 놓을 수 있다
   도구->환경설정->데이터베이스->객체뷰어->자동커밋설정 
   
   
[명령어 완료와 취소]
- insert, update, delete 명령어를 사용하는 경우, 명령어 취소와 명령어 완료를 선택할 수 있다
- commit    : 명령어 완료
- rollback  : 명령어 취소


[전체 행 삭제]
delete from sungjuk;

[전체 행 조회]
select * from sungjuk;

[전체 행 추가]
insert into sungjuk(uname,kor,eng,mat) values ('홍길동', 70, 85, 100);
insert into sungjuk(uname,kor,eng,mat) values ('무궁화',30,30,40);
insert into sungjuk(uname,kor,eng,mat) values ('진달래',90,90,20);
insert into sungjuk(uname,kor,eng,mat) values ('개나리',100,60,30);
insert into sungjuk(uname,kor,eng,mat) values ('라일락',30,80,40);
insert into sungjuk(uname,kor,eng,mat) values ('봉선화',80,80,20);
insert into sungjuk(uname,kor,eng,mat) values ('대한민국',10,65,35);
insert into sungjuk(uname,kor,eng,mat) values ('해바라기',30,80,40);
insert into sungjuk(uname,kor,eng,mat) values ('나팔꽃',30,80,20);
insert into sungjuk(uname,kor,eng,mat) values ('대한민국',100,100,100);




