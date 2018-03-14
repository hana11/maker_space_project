
-- 10명 회원 초기화 쿼리
use space;
show databases;
show tables;

/**
 * TIP 용 DB
 */
insert into tip_boards (title, content, result, files, hits, scraps, email, write_date , name)
values('회사생활 이것만 알면 즐겁게 할 수 있다','','',null,0,0,'jjihyun.park@ktds.com','2018.03.10','박지현');
insert into tip_boards (title, content, result, files, hits, scraps, email, write_date , name)
values( 'kt에서 효과적으로 복지를 누리고 싶다면!', '','',null,0,0,'haewon.park@ktds.com','2018.03.03','박혜원');
insert into tip_boards (title, content, result, files, hits, scraps, email, write_date , name)
values( 'ktds의 동아리 활동 꿀팁','','',null,0,0,'sunkyung.an@ktds.com','2018.02.18','안선경');
insert into tip_boards (title, content, result, files, hits, scraps, email, write_date , name)
values( 'ktds에서 멘토를 구하고 싶다면','','',null,0,0,'donghyun.lee@ktds.com','2018.02.18','이동현');
insert into tip_boards (title, content, result, files, hits, scraps, email, write_date , name)
values( '신입사원들을 위한 회사 근처 집 구하기 꿀팁','','',null,0,0,'jaejin.lee@ktds.com','2018.02.17','이재진');
insert into tip_boards (title, content, result, files, hits, scraps, email, write_date , name)
values( 'kt인으로서 자부심 갖기','','',null,0,0,'hokyung.lee@ktds.com','2018.03.03','이호경');
insert into tip_boards (title, content, result, files, hits, scraps, email, write_date , name)
values( '회사 안에서 나의 역할 찾기','','',null,0,0,'sunghan@ktds.com','2018.03.06','전성한');
insert into tip_boards (title, content, result, files, hits, scraps, email, write_date , name)
values( '회사 생활에서 회의가 느껴진다면 이것만 기억하세요','','',null,0,0,'hana.jeong@ktds.com','2018.03.13','정하나');
insert into tip_boards (title, content, result, files, hits, scraps, email, write_date , name)
values( '회사 안에서 꼭 필요한 인재가 되고 싶다면','','',null,0,0,'hyunyeong.jeong@ktds.com','2018.03.14','정현영');
insert into tip_boards (title, content, result, files, hits, scraps, email, write_date , name)
values( '사실 회사 생활 꿀팁이란 없다','','',null,0,0,'woosuk.ji@ktds.com','2018.03.08','지우석');


insert into business (business_idx, business_name) values(1, 'it');
insert into business (business_idx, business_name) values(2, 'market');
insert into business (business_idx, business_name) values(3, 'media');
insert into business (business_idx, business_name) values(4, 'etc');

shows  columns from 'table 이름';	
insert into members values 
('hwiwon.kang@ktds.com','hwiwon123','강휘원','01011111111','kt ds', 'G',0);

insert into members values 
('nahyun.kim@ktds.com','nahyun123','김나현','01022222222','kt ds', 'G',0);

insert into members values 
('minji.kim@ktds.com','minji123','김민지','01033333333','kt ds', 'G',0);

insert into members values 
('minhyun.kim@ktds.com','minhyun123','김민현','01044444444','kt ds', 'G',0);

insert into members values 
('sookyung.kim@ktds.com','sookyung123','김수경','01055555555','kt ds', 'G',0);

insert into members values 
('eunbyul.kim@ktds.com','eunbyul123','김은별','01066666666','kt ds', 'G',0);

insert into members values 
('jitak.kim@ktds.com','jitak123','김지택','01077777777','kt ds', 'G',0);

insert into members values 
('hyungjun.kim@ktds.com','hyunhjun123','김형준','01088888888','kt ds', 'G',0);

insert into members values 
('gunjoo.ra@ktds.com','gunjoo123','라건주','01099999999','kt ds', 'G',0);

insert into members values 
('seonghyun.park@ktds.com','seonghyun123','박승현','01012222222','kt ds', 'G',0);

insert into members values 
('jihyun.park@ktds.com','jihyun123','박지현','01013333333','kt ds', 'G',0);

insert into members values 
('haewon.park@ktds.com','haewon123','박혜원','01014444444','kt ds', 'G',0);

insert into members values 
('sunkyung.an@ktds.com','sunkyung123','안선경','01015555555','kt ds', 'G',0);

insert into members values 
<<<<<<< HEAD
('donghyun.lee@ktds.com','donghyun123','이동현','01016666666','kt ds', 'G',0);

insert into members values 
('jaejin.lee@ktds.com','jaejin123','이재진','01017777777','kt ds', 'G',0);

insert into members values 
('hokyung.lee@ktds.com','hokyung123','이호경','01018888888','kt ds', 'G',0);

insert into members values 
('sunghan.jeun@ktds.com','sunghan123','전성한','01019999999','kt ds', 'G',0);

insert into members values 
('hana.jeong@ktds.com','hana123','정하나','01021111111','kt ds', 'A',0);


insert into members values 
('hyunyeong.jeong@ktds.com','hyunyeong123','정현영','01023333333','kt ds', 'G',0);

insert into members values 
('woosuk.ji@ktds.com','woosuk123','지우석','01024444444','kt ds', 'G',0);

insert into members values 
('sunhyun.kim@kt.com','sunhyun123','김선현','01025555555','kt', 'G',0);

insert into members values 
('junhyung.kim@kt.com','junhyung123','김준형','01026666666','kt', 'G',0);

insert into members values 
('hanseul.kim@kt.com','hanseul123','김한슬','01027777777','kt', 'G',0);

insert into members values 
('sejin.park@kt.com','sejin123','박세진','01028888888','kt', 'G',0);

insert into members values 
('somang.park@kt.com','somang123','박소망','01029999999','kt', 'G',0);

insert into members values 
('jaehee.park@kt.com','jaehee123','박재희','01031111111','kt', 'G',0);

insert into members values 
('hyunjun.park@kt.com','hyunjun123','박현준','01032222222','kt', 'G',0);

insert into members values 
('cheonjoo.yun@kt.com','cheonjoo123','윤천주','01034444444','kt', 'G',0);

insert into members values 
('seongjun.lee@kt.com','seongjun123','이승준','01035555555','kt', 'G',0);

insert into members values 
('yeong.hwangbo@kt.com','yeong123','황보영','01036666666','kt', 'G',0);
<<<<<<< HEAD
/*
	각각의 서비스 쿼리
*/
/*
 * 비지니스 보드 용 디비자료
 */
insert into business_boards 
(business_idx, title, content, result, files, hits, email, write_date, name)
values(1, '클라우드 기반 "옴니채널 컨택센터"가 필요한 시점',null,null,null,80,'somang.park@kt.com','2018.03.11','박소망');

insert into business_boards 
(business_idx, title, content, result, files, hits, email, write_date, name)
values(1, '현대적인 데이터 아키텍처를 위한 7가지 핵심 개발 방안', '','',null,97,'sejin.park@kt.com','2018.02.16','박세진');

insert into business_boards 
(business_idx, title, content, result, files, hits, email, write_date, name)
values(1, '플랫폼 시대를 위한 알맞은 금융 IT 개발 방안','','',null,111,'eunbyul.kim@ktds.com','2018.01.05','김은별');

insert into business_boards 
(business_idx, title, content, result, files, hits, email, write_date, name)
values(2, '스마트폰 혁신의 대폭발에 대비하는 마케팅 전략 3가지', '','',null,64,'jaejin.lee@ktds.com','2018.03.12','이재진');

insert into business_boards 
(business_idx, title, content, result, files, hits, email, write_date, name)
values(2, '쇼핑 시 모바일 앱 영향력 막강. 이를 이용한 영업 전략','','',null,28,'jitak.kim@ktds.com','2018.03.03','김지택');

insert into business_boards 
(business_idx, title, content, result, files, hits, email, write_date, name)
values(2, 'k쇼핑을 위한 효과적인 영업 방안','','',null,91,'yeong.hwangbo@kt.com','2018.03.04','황보영');

insert into business_boards 
(business_idx, title, content, result, files, hits, email, write_date, name)
values(2,'kt clip카드, 간편걸제를 넘어..','','',null,28,'donghyun.lee@ktds.com','2018.02.17','이동현');

insert into business_boards 
(business_idx, title, content, result, files, hits, email, write_date, name)
values(2, '갤럭시 s9 출시에 따른 kt의 차별화 마케팅','','',null,30,'junhyung.kim@kt.com','2018.03.13','김준형');

insert into business_boards 
(business_idx, title, content, result, files, hits, email, write_date, name)
values(2, '모바일 보안에 따른 영업 전략', '','',null,20,'gunjoo.ra@ktds.com','2018.03.13','라건주');

insert into business_boards 
(business_idx, title, content, result, files, hits, email, write_date, name)
values(2, '5G 시대를 위한 2018 공략 영업 마케팅','','',null,112,'seonghyun.park@ktds.com','2018.03.05','박승현');

insert into business_boards 
(business_idx, title, content, result, files, hits, email, write_date, name)
values(2, '평창 올림픽 그 후를 위한 공격적 마케팅','','',null,256,'jihyun.park@ktds.com','2018.03.11','박지현');


insert into business_boards 
(business_idx, title, content, result, files, hits, email, write_date, name)
values(2, 'kt 미래 먹거리를 위한 성공적인 영업 프로세스','','',null,123,'haewon.park@ktds.com','2018.03.01','박혜원');


insert into business_boards 
(business_idx, title, content, result, files, hits, email, write_date, name)
values(2, '외야지 마을의 지속적 성장을 위한 관심 유지 전략','','',null,80,'sunkyung.an@ktds.com','2018.03.01','안선경');

insert into business_boards 
(business_idx, title, content, result, files, hits, email, write_date, name)
values(3, 'kt 스포츠 활성화를 위한 광고','','',null,66,'hokyung.lee@ktds.com','2018.02.16','이호경');

insert into business_boards 
(business_idx, title, content, result, files, hits, email, write_date, name)
values(3, '미디어의 대 홍수시대, 이를 효과적으로 이용하는 미디어란','','',null,58,'sungjan.jeun@ktds.com','2018.03.08','전성한');

insert into business_boards 
(business_idx, title, content, result, files, hits, email, write_date, name)
values(3, '나스미디어의 새로운 역할','','',null,89,'hyunyeong.jeong@ktds.com','2018.03.13','정현영');

insert into business_boards 
(business_idx, title, content, result, files, hits, email, write_date, name)
values(3, '플레이디의 방향성','','',null,99,'woosuk.ji@ktds.com','2018.03.02','지우석');

insert into business_boards 
(business_idx, title, content, result, files, hits, email, write_date, name)
values(3, '효과적인 미디어를 위한 플레이디의 역할','','',null,91,'sunhyun.kim@kt.com','2018.02.18','김선현');

insert into business_boards 
(business_idx, title, content, result, files, hits, email, write_date, name)
values(3, 'kth의 k쇼핑은 어떻게 차별화를 두어야 하는가' ,'','',null,1,'hanseoul.kim@kt.com','2018.03.09','김한슬');

insert into business_boards 
(business_idx, title, content, result, files, hits, email, write_date, name)
values(3, 'k쇼핑이 타 쇼핑채널과 다를 수 있는 방안 2가지','','',null,81,'jaehee.park@kt.com','2018.03.12','박재희');

insert into business_boards 
(business_idx, title, content, result, files, hits, email, write_date, name)
values(3, 'kth를 통한 소비자의 니즈 파악', '','',null,22,'hyunjun.parkk@kt.com','2018.02.11','박현준');

insert into business_boards 
(business_idx, title, content, result, files, hits, email, write_date, name)
values(3, '광고의 새로운 방향 4가지','','',null,80,'seongjun.lee@kt.com','2018.03.12','이승준');

insert into business_boards 
(business_idx, title, content, result, files, hits, email, write_date, name)
values(3, '미디어의 사업 확장 가능성','','',null,11,'yeong.hwangbo@kt.com','2018.03.13','황보영');

insert into business_boards 
(business_idx, title, content, result, files, hits, email, write_date, name)
values(4, '공중전화의 진화를 위한 방법','','',null,8,'hwiwon.kang@ktds.com','2018.03.01','강휘원');










=======
commit;
/*
	각각의 서비스 쿼리
*/
rollback;
>>>>>>> 8b6ba49c564fea1c762f7772f3c20744c3b4d4db
select * from members;
-- * 회원등록
insert into members (MEMBER_ID, MEMBER_PW, NAME, MOBILE, EMAIL, ENTRY_DATE, GRADE, POSITION)
values ('user00', 'pass00', '이동순', '01025613350', 'donghyun3350@gmail.com', to_char(sysdate, 'yyyy.mm.dd'), 'A', '관리자2');
commit;

select glade from memebers where name = '이동순' and mobile = '01072463363'; 

-- * 아이디찾기
-- 이름과 핸드폰 번호로 아이디 찾기 쿼리
select MEMBER_ID from members where name = '이동순' and mobile = '01025613350';

-- * 비밀번호찾기
-- 아이디 핸드폰 번호로 비밀번호 찾기쿼리
select MEMBER_PW from members where MEMBER_ID = 'user00' and mobile = '01025613350';

-- * 내정보조회
select * from members where member_id = 'user00';
-- * 전체회원정보조회
select * from members;
-- * 내 정보변경
update members set MOBILE = '01125613363'
where MEMBER_ID = 'user00';
commit;
-- * 암호변경하기
update members set MEMBER_PW = 'pass22'
where MEMBER_ID = 'user00';
commit;
-- * 회원탈퇴
delete members where MEMBER_ID = 'user00'
commit;
-- * 게시판 쓰기
insert into boards values(boards_boardnumber_seq.nextval, '게시판00', '새롭게 추가한 글이예요!', '이동현', to_char(sysdate, 'yyyy.mm.dd'), 'user01');
commit;
-- * 게시판 수정하기
update boards set title = '게시판01', content = '수정해보았어요!'
where board_number = 6;
commit;
-- * 게시판에 댓글 쓰기 
insert into comments values(comments_commentnumber_seq.nextval, 6,'안녕 첫번째 댓글 달았어요', '이동현', to_char(sysdate, 'yyyy.mm.dd'));
-- * 이름으로 게시판 찾기
select * from boards where name = '이동현';
-- * 게시판 삭제
delete boards where board_number = '6';
commit;

