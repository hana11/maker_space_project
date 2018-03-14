-- 사업종합게시판
ALTER TABLE `business_boards`
	DROP FOREIGN KEY `FK_business_TO_business_boards`; -- 사업분야 -> 사업종합게시판

-- 사업종합게시판
ALTER TABLE `business_boards`
	DROP FOREIGN KEY `FK_members_TO_business_boards`; -- 회원 -> 사업종합게시판

-- 정보통신게시판
ALTER TABLE `it_boards`
	DROP FOREIGN KEY `FK_members_TO_it_boards`; -- 회원 -> 정보통신게시판

-- 미디어게시판
ALTER TABLE `media_boards`
	DROP FOREIGN KEY `FK_members_TO_media_boards`; -- 회원 -> 미디어게시판

-- 영업/마케팅 게시판
ALTER TABLE `market_boards`
	DROP FOREIGN KEY `FK_members_TO_market_boards`; -- 회원 -> 영업/마케팅 게시판

-- 기타게시판
ALTER TABLE `etc_boards`
	DROP FOREIGN KEY `FK_members_TO_etc_boards`; -- 회원 -> 기타게시판

-- 해시태그테이블
ALTER TABLE `hashtags`
	DROP FOREIGN KEY `FK_business_boards_TO_hashtags`; -- 사업종합게시판 -> 해시태그테이블

-- 나의스크랩 테이블
ALTER TABLE `scraps_boards`
	DROP FOREIGN KEY `FK_business_boards_TO_scraps_boards`; -- 사업종합게시판 -> 나의스크랩 테이블

-- 채택진행중 테이블
ALTER TABLE `select_boards`
	DROP FOREIGN KEY `FK_business_boards_TO_select_boards`; -- 사업종합게시판 -> 채택진행중 테이블

-- 내아이디어테이블
ALTER TABLE `my_idea_boards`
	DROP FOREIGN KEY `FK_business_boards_TO_my_idea_boards`; -- 사업종합게시판 -> 내아이디어테이블

-- 채택완료 테이블
ALTER TABLE `select_complete_boards`
	DROP FOREIGN KEY `FK_business_boards_TO_select_complete_boards`; -- 사업종합게시판 -> 채택완료 테이블

-- 꿀팁 내아이디어테이블
ALTER TABLE `my_idea_boards2`
	DROP FOREIGN KEY `FK_tip_boards_TO_my_idea_boards2`; -- 꿀팁 -> 꿀팁 내아이디어테이블

-- 꿀팁 나의스크랩 테이블
ALTER TABLE `scraps_boards2`
	DROP FOREIGN KEY `FK_tip_boards_TO_scraps_boards2`; -- 꿀팁 -> 꿀팁 나의스크랩 테이블

-- 꿀팁 나의스크랩 테이블
ALTER TABLE `scraps_boards2`
	DROP FOREIGN KEY `FK_members_TO_scraps_boards2`; -- 회원 -> 꿀팁 나의스크랩 테이블

-- 회원
ALTER TABLE `members`
	DROP PRIMARY KEY; -- 회원 기본키

-- 사업분야
ALTER TABLE `business`
	DROP PRIMARY KEY; -- 사업분야 기본키

-- 사업종합게시판
ALTER TABLE `business_boards`
	DROP PRIMARY KEY; -- 사업종합게시판 기본키

-- 정보통신게시판
ALTER TABLE `it_boards`
	DROP PRIMARY KEY; -- 정보통신게시판 기본키

-- 미디어게시판
ALTER TABLE `media_boards`
	DROP PRIMARY KEY; -- 미디어게시판 기본키

-- 영업/마케팅 게시판
ALTER TABLE `market_boards`
	DROP PRIMARY KEY; -- 영업/마케팅 게시판 기본키

-- 기타게시판
ALTER TABLE `etc_boards`
	DROP PRIMARY KEY; -- 기타게시판 기본키

-- 해시태그테이블
ALTER TABLE `hashtags`
	DROP PRIMARY KEY; -- 해시태그테이블 기본키

-- 나의스크랩 테이블
ALTER TABLE `scraps_boards`
	DROP PRIMARY KEY; -- 나의스크랩 테이블 기본키

-- 채택진행중 테이블
ALTER TABLE `select_boards`
	DROP PRIMARY KEY; -- 채택진행중 테이블 기본키

-- 내아이디어테이블
ALTER TABLE `my_idea_boards`
	DROP PRIMARY KEY; -- 내아이디어테이블 기본키

-- 채택완료 테이블
ALTER TABLE `select_complete_boards`
	DROP PRIMARY KEY; -- 채택완료 테이블 기본키

-- 꿀팁
ALTER TABLE `tip_boards`
	DROP PRIMARY KEY; -- 꿀팁 기본키

-- 꿀팁 내아이디어테이블
ALTER TABLE `my_idea_boards2`
	DROP PRIMARY KEY; -- 꿀팁 내아이디어테이블 기본키

-- 꿀팁 나의스크랩 테이블
ALTER TABLE `scraps_boards2`
	DROP PRIMARY KEY; -- 꿀팁 나의스크랩 테이블 기본키

-- 회원
DROP TABLE IF EXISTS `members` RESTRICT;

-- 사업분야
DROP TABLE IF EXISTS `business` RESTRICT;

-- 사업종합게시판
DROP TABLE IF EXISTS `business_boards` RESTRICT;

-- 새 테이블
DROP TABLE IF EXISTS `TABLE` RESTRICT;

-- 정보통신게시판
DROP TABLE IF EXISTS `it_boards` RESTRICT;

-- 미디어게시판
DROP TABLE IF EXISTS `media_boards` RESTRICT;

-- 영업/마케팅 게시판
DROP TABLE IF EXISTS `market_boards` RESTRICT;

-- 기타게시판
DROP TABLE IF EXISTS `etc_boards` RESTRICT;

-- 해시태그테이블
DROP TABLE IF EXISTS `hashtags` RESTRICT;

-- 나의스크랩 테이블
DROP TABLE IF EXISTS `scraps_boards` RESTRICT;

-- 채택진행중 테이블
DROP TABLE IF EXISTS `select_boards` RESTRICT;

-- 내아이디어테이블
DROP TABLE IF EXISTS `my_idea_boards` RESTRICT;

-- 채택완료 테이블
DROP TABLE IF EXISTS `select_complete_boards` RESTRICT;

-- 꿀팁
DROP TABLE IF EXISTS `tip_boards` RESTRICT;

-- 꿀팁 내아이디어테이블
DROP TABLE IF EXISTS `my_idea_boards2` RESTRICT;

-- 꿀팁 나의스크랩 테이블
DROP TABLE IF EXISTS `scraps_boards2` RESTRICT;

-- 회원
CREATE TABLE `members` (
	`email`    VARCHAR(40) NOT NULL COMMENT '이메일', -- 이메일
	`password` VARCHAR(15) NOT NULL COMMENT '비밀번호', -- 비밀번호
	`name`     VARCHAR(50) NOT NULL COMMENT '이름', -- 이름
	`mobile`   VARCHAR(30) NOT NULL COMMENT '휴대폰번호', -- 휴대폰번호
	`company`  VARCHAR(50) NOT NULL COMMENT '소속', -- 소속
	`grade`    VARCHAR(1)  NOT NULL COMMENT '등급', -- 등급
	`point`    INTEGER     NOT NULL COMMENT '포인트' -- 포인트
)
COMMENT '회원';

-- 회원
ALTER TABLE `members`
	ADD CONSTRAINT `PK_members` -- 회원 기본키
		PRIMARY KEY (
			`email` -- 이메일
		);

-- 사업분야
CREATE TABLE `business` (
	`business_idx` INT NOT NULL COMMENT '사업분야일련번호' -- 사업분야일련번호
)
COMMENT '사업분야';

-- 사업분야
ALTER TABLE `business`
	ADD CONSTRAINT `PK_business` -- 사업분야 기본키
		PRIMARY KEY (
			`business_idx` -- 사업분야일련번호
		);

-- 사업종합게시판
CREATE TABLE `business_boards` (
	`business_idx`        INT          NOT NULL COMMENT '사업분야일련번호', -- 사업분야일련번호
	`business_boards_idx` INT          NOT NULL COMMENT '인덱스', -- 인덱스
	`title`               VARCHAR(255) NOT NULL COMMENT '제목', -- 제목
	`content`             VARCHAR(255) NULL     COMMENT '내용', -- 내용
	`result`              VARCHAR(255) NULL     COMMENT '기대효과', -- 기대효과
	`files`               VARCHAR(255) NULL     COMMENT '파일', -- 파일
	`hits`                INT          NOT NULL COMMENT '조회수', -- 조회수
	`email`               VARCHAR(40)  NULL     COMMENT '이메일', -- 이메일
	`write_date`          VARCHAR(20)  NOT NULL COMMENT '작성일' -- 작성일
)
COMMENT '사업종합게시판';

-- 사업종합게시판
ALTER TABLE `business_boards`
	ADD CONSTRAINT `PK_business_boards` -- 사업종합게시판 기본키
		PRIMARY KEY (
			`business_idx`,        -- 사업분야일련번호
			`business_boards_idx`  -- 인덱스
		);

-- 새 테이블
CREATE TABLE `TABLE` (
)
COMMENT '새 테이블';

-- 정보통신게시판
CREATE TABLE `it_boards` (
	`it_boards_idx` INT          NOT NULL COMMENT '인덱스', -- 인덱스
	`title`         VARCHAR(255) NOT NULL COMMENT '제목', -- 제목
	`content`       VARCHAR(255) NULL     COMMENT '내용', -- 내용
	`result`        VARCHAR(255) NULL     COMMENT '기대효과', -- 기대효과
	`files`         VARCHAR(255) NULL     COMMENT '파일', -- 파일
	`hits`          INT          NOT NULL COMMENT '조회수', -- 조회수
	`email`         VARCHAR(40)  NOT NULL COMMENT '이메일', -- 이메일
	`write_date`    VARCHAR(20)  NOT NULL COMMENT '작성일' -- 작성일
)
COMMENT '정보통신게시판';

-- 정보통신게시판
ALTER TABLE `it_boards`
	ADD CONSTRAINT `PK_it_boards` -- 정보통신게시판 기본키
		PRIMARY KEY (
			`it_boards_idx` -- 인덱스
		);

-- 미디어게시판
CREATE TABLE `media_boards` (
	`media_boards_idx` INT          NOT NULL COMMENT '인덱스', -- 인덱스
	`title`            VARCHAR(255) NOT NULL COMMENT '제목', -- 제목
	`content`          VARCHAR(255) NULL     COMMENT '내용', -- 내용
	`result`           VARCHAR(255) NULL     COMMENT '기대효과', -- 기대효과
	`files`            VARCHAR(255) NULL     COMMENT '파일', -- 파일
	`hits`             INT          NOT NULL COMMENT '조회수', -- 조회수
	`email`            VARCHAR(40)  NOT NULL COMMENT '이메일', -- 이메일
	`write_date`       VARCHAR(20)  NOT NULL COMMENT '작성일' -- 작성일
)
COMMENT '미디어게시판';

-- 미디어게시판
ALTER TABLE `media_boards`
	ADD CONSTRAINT `PK_media_boards` -- 미디어게시판 기본키
		PRIMARY KEY (
			`media_boards_idx` -- 인덱스
		);

-- 영업/마케팅 게시판
CREATE TABLE `market_boards` (
	`market_boards_idx` INT          NOT NULL COMMENT '인덱스', -- 인덱스
	`title`             VARCHAR(255) NOT NULL COMMENT '제목', -- 제목
	`content`           VARCHAR(255) NULL     COMMENT '내용', -- 내용
	`result`            VARCHAR(255) NULL     COMMENT '기대효과', -- 기대효과
	`files`             VARCHAR(255) NULL     COMMENT '파일', -- 파일
	`hits`              INT          NOT NULL COMMENT '조회수', -- 조회수
	`email`             VARCHAR(40)  NOT NULL COMMENT '이메일', -- 이메일
	`write_date`        VARCHAR(20)  NOT NULL COMMENT '작성일' -- 작성일
)
COMMENT '영업/마케팅 게시판';

-- 영업/마케팅 게시판
ALTER TABLE `market_boards`
	ADD CONSTRAINT `PK_market_boards` -- 영업/마케팅 게시판 기본키
		PRIMARY KEY (
			`market_boards_idx` -- 인덱스
		);

-- 기타게시판
CREATE TABLE `etc_boards` (
	`etc_boards_idx` INT          NOT NULL COMMENT '인덱스', -- 인덱스
	`title`          VARCHAR(255) NOT NULL COMMENT '제목', -- 제목
	`content`        VARCHAR(255) NULL     COMMENT '내용', -- 내용
	`result`         VARCHAR(255) NULL     COMMENT '기대효과', -- 기대효과
	`files`          VARCHAR(255) NULL     COMMENT '파일', -- 파일
	`hits`           INT          NOT NULL COMMENT '조회수', -- 조회수
	`email`          VARCHAR(40)  NOT NULL COMMENT '이메일', -- 이메일
	`write_date`     VARCHAR(12)  NOT NULL COMMENT '작성일' -- 작성일
)
COMMENT '기타게시판';

-- 기타게시판
ALTER TABLE `etc_boards`
	ADD CONSTRAINT `PK_etc_boards` -- 기타게시판 기본키
		PRIMARY KEY (
			`etc_boards_idx` -- 인덱스
		);

-- 해시태그테이블
CREATE TABLE `hashtags` (
	`business_boards_idx` INT         NOT NULL COMMENT '인덱스', -- 인덱스
	`business_idx`        INT         NOT NULL COMMENT '사업분야일련번호', -- 사업분야일련번호
	`hash_tag`            VARCHAR(10) NULL     COMMENT '해시태그' -- 해시태그
)
COMMENT '해시태그테이블';

-- 해시태그테이블
ALTER TABLE `hashtags`
	ADD CONSTRAINT `PK_hashtags` -- 해시태그테이블 기본키
		PRIMARY KEY (
			`business_boards_idx`, -- 인덱스
			`business_idx`         -- 사업분야일련번호
		);

-- 나의스크랩 테이블
CREATE TABLE `scraps_boards` (
	`business_boards_idx` INT NOT NULL COMMENT '인덱스', -- 인덱스
	`business_idx`        INT NOT NULL COMMENT '사업분야일련번호' -- 사업분야일련번호
)
COMMENT '나의스크랩 테이블';

-- 나의스크랩 테이블
ALTER TABLE `scraps_boards`
	ADD CONSTRAINT `PK_scraps_boards` -- 나의스크랩 테이블 기본키
		PRIMARY KEY (
			`business_boards_idx`, -- 인덱스
			`business_idx`         -- 사업분야일련번호
		);

-- 채택진행중 테이블
CREATE TABLE `select_boards` (
	`business_boards_idx` INT NOT NULL COMMENT '인덱스', -- 인덱스
	`business_idx`        INT NOT NULL COMMENT '사업분야일련번호' -- 사업분야일련번호
)
COMMENT '채택진행중 테이블';

-- 채택진행중 테이블
ALTER TABLE `select_boards`
	ADD CONSTRAINT `PK_select_boards` -- 채택진행중 테이블 기본키
		PRIMARY KEY (
			`business_boards_idx`, -- 인덱스
			`business_idx`         -- 사업분야일련번호
		);

-- 내아이디어테이블
CREATE TABLE `my_idea_boards` (
	`business_boards_idx` INT NOT NULL COMMENT '인덱스', -- 인덱스
	`business_idx`        INT NOT NULL COMMENT '사업분야일련번호' -- 사업분야일련번호
)
COMMENT '내아이디어테이블';

-- 내아이디어테이블
ALTER TABLE `my_idea_boards`
	ADD CONSTRAINT `PK_my_idea_boards` -- 내아이디어테이블 기본키
		PRIMARY KEY (
			`business_boards_idx`, -- 인덱스
			`business_idx`         -- 사업분야일련번호
		);

-- 채택완료 테이블
CREATE TABLE `select_complete_boards` (
	`business_boards_idx` INT NOT NULL COMMENT '인덱스', -- 인덱스
	`business_idx`        INT NOT NULL COMMENT '사업분야일련번호' -- 사업분야일련번호
)
COMMENT '채택완료 테이블';

-- 채택완료 테이블
ALTER TABLE `select_complete_boards`
	ADD CONSTRAINT `PK_select_complete_boards` -- 채택완료 테이블 기본키
		PRIMARY KEY (
			`business_boards_idx`, -- 인덱스
			`business_idx`         -- 사업분야일련번호
		);

-- 꿀팁
CREATE TABLE `tip_boards` (
	`tip_idx`    INT          NOT NULL COMMENT '인덱스', -- 인덱스
	`title`      VARCHAR(255) NOT NULL COMMENT '제목', -- 제목
	`content`    VARCHAR(255) NULL     COMMENT '내용', -- 내용
	`result`     VARCHAR(255) NULL     COMMENT '기대효과', -- 기대효과
	`files`      VARCHAR(255) NULL     COMMENT '파일', -- 파일
	`hits`       INT          NOT NULL COMMENT '조회수', -- 조회수
	`scraps`     INT          NOT NULL COMMENT '스크랩수', -- 스크랩수
	`email`      VARCHAR(40)  NULL     COMMENT '이메일', -- 이메일
	`entry_date` VARCHAR(20)  NOT NULL COMMENT '작성일' -- 작성일
)
COMMENT '꿀팁';

-- 꿀팁
ALTER TABLE `tip_boards`
	ADD CONSTRAINT `PK_tip_boards` -- 꿀팁 기본키
		PRIMARY KEY (
			`tip_idx` -- 인덱스
		);

-- 꿀팁 내아이디어테이블
CREATE TABLE `my_idea_boards2` (
	`tip_idx` INT NOT NULL COMMENT '인덱스' -- 인덱스
)
COMMENT '꿀팁 내아이디어테이블';

-- 꿀팁 내아이디어테이블
ALTER TABLE `my_idea_boards2`
	ADD CONSTRAINT `PK_my_idea_boards2` -- 꿀팁 내아이디어테이블 기본키
		PRIMARY KEY (
			`tip_idx` -- 인덱스
		);

-- 꿀팁 나의스크랩 테이블
CREATE TABLE `scraps_boards2` (
	`tip_idx` INT         NOT NULL COMMENT '인덱스', -- 인덱스
	`email`   VARCHAR(40) NOT NULL COMMENT '이메일' -- 이메일
)
COMMENT '꿀팁 나의스크랩 테이블';

-- 꿀팁 나의스크랩 테이블
ALTER TABLE `scraps_boards2`
	ADD CONSTRAINT `PK_scraps_boards2` -- 꿀팁 나의스크랩 테이블 기본키
		PRIMARY KEY (
			`tip_idx`, -- 인덱스
			`email`    -- 이메일
		);

-- 사업종합게시판
ALTER TABLE `business_boards`
	ADD CONSTRAINT `FK_business_TO_business_boards` -- 사업분야 -> 사업종합게시판
		FOREIGN KEY (
			`business_idx` -- 사업분야일련번호
		)
		REFERENCES `business` ( -- 사업분야
			`business_idx` -- 사업분야일련번호
		);

-- 사업종합게시판
ALTER TABLE `business_boards`
	ADD CONSTRAINT `FK_members_TO_business_boards` -- 회원 -> 사업종합게시판
		FOREIGN KEY (
			`email` -- 이메일
		)
		REFERENCES `members` ( -- 회원
			`email` -- 이메일
		);

-- 정보통신게시판
ALTER TABLE `it_boards`
	ADD CONSTRAINT `FK_members_TO_it_boards` -- 회원 -> 정보통신게시판
		FOREIGN KEY (
			`email` -- 이메일
		)
		REFERENCES `members` ( -- 회원
			`email` -- 이메일
		);

-- 미디어게시판
ALTER TABLE `media_boards`
	ADD CONSTRAINT `FK_members_TO_media_boards` -- 회원 -> 미디어게시판
		FOREIGN KEY (
			`email` -- 이메일
		)
		REFERENCES `members` ( -- 회원
			`email` -- 이메일
		);

-- 영업/마케팅 게시판
ALTER TABLE `market_boards`
	ADD CONSTRAINT `FK_members_TO_market_boards` -- 회원 -> 영업/마케팅 게시판
		FOREIGN KEY (
			`email` -- 이메일
		)
		REFERENCES `members` ( -- 회원
			`email` -- 이메일
		);

-- 기타게시판
ALTER TABLE `etc_boards`
	ADD CONSTRAINT `FK_members_TO_etc_boards` -- 회원 -> 기타게시판
		FOREIGN KEY (
			`email` -- 이메일
		)
		REFERENCES `members` ( -- 회원
			`email` -- 이메일
		);

-- 해시태그테이블
ALTER TABLE `hashtags`
	ADD CONSTRAINT `FK_business_boards_TO_hashtags` -- 사업종합게시판 -> 해시태그테이블
		FOREIGN KEY (
			`business_idx`,        -- 사업분야일련번호
			`business_boards_idx`  -- 인덱스
		)
		REFERENCES `business_boards` ( -- 사업종합게시판
			`business_idx`,        -- 사업분야일련번호
			`business_boards_idx`  -- 인덱스
		);

-- 나의스크랩 테이블
ALTER TABLE `scraps_boards`
	ADD CONSTRAINT `FK_business_boards_TO_scraps_boards` -- 사업종합게시판 -> 나의스크랩 테이블
		FOREIGN KEY (
			`business_idx`,        -- 사업분야일련번호
			`business_boards_idx`  -- 인덱스
		)
		REFERENCES `business_boards` ( -- 사업종합게시판
			`business_idx`,        -- 사업분야일련번호
			`business_boards_idx`  -- 인덱스
		);

-- 채택진행중 테이블
ALTER TABLE `select_boards`
	ADD CONSTRAINT `FK_business_boards_TO_select_boards` -- 사업종합게시판 -> 채택진행중 테이블
		FOREIGN KEY (
			`business_idx`,        -- 사업분야일련번호
			`business_boards_idx`  -- 인덱스
		)
		REFERENCES `business_boards` ( -- 사업종합게시판
			`business_idx`,        -- 사업분야일련번호
			`business_boards_idx`  -- 인덱스
		);

-- 내아이디어테이블
ALTER TABLE `my_idea_boards`
	ADD CONSTRAINT `FK_business_boards_TO_my_idea_boards` -- 사업종합게시판 -> 내아이디어테이블
		FOREIGN KEY (
			`business_idx`,        -- 사업분야일련번호
			`business_boards_idx`  -- 인덱스
		)
		REFERENCES `business_boards` ( -- 사업종합게시판
			`business_idx`,        -- 사업분야일련번호
			`business_boards_idx`  -- 인덱스
		);

-- 채택완료 테이블
ALTER TABLE `select_complete_boards`
	ADD CONSTRAINT `FK_business_boards_TO_select_complete_boards` -- 사업종합게시판 -> 채택완료 테이블
		FOREIGN KEY (
			`business_idx`,        -- 사업분야일련번호
			`business_boards_idx`  -- 인덱스
		)
		REFERENCES `business_boards` ( -- 사업종합게시판
			`business_idx`,        -- 사업분야일련번호
			`business_boards_idx`  -- 인덱스
		);

-- 꿀팁 내아이디어테이블
ALTER TABLE `my_idea_boards2`
	ADD CONSTRAINT `FK_tip_boards_TO_my_idea_boards2` -- 꿀팁 -> 꿀팁 내아이디어테이블
		FOREIGN KEY (
			`tip_idx` -- 인덱스
		)
		REFERENCES `tip_boards` ( -- 꿀팁
			`tip_idx` -- 인덱스
		);

-- 꿀팁 나의스크랩 테이블
ALTER TABLE `scraps_boards2`
	ADD CONSTRAINT `FK_tip_boards_TO_scraps_boards2` -- 꿀팁 -> 꿀팁 나의스크랩 테이블
		FOREIGN KEY (
			`tip_idx` -- 인덱스
		)
		REFERENCES `tip_boards` ( -- 꿀팁
			`tip_idx` -- 인덱스
		);

-- 꿀팁 나의스크랩 테이블
ALTER TABLE `scraps_boards2`
	ADD CONSTRAINT `FK_members_TO_scraps_boards2` -- 회원 -> 꿀팁 나의스크랩 테이블
		FOREIGN KEY (
			`email` -- 이메일
		)
		REFERENCES `members` ( -- 회원
			`email` -- 이메일
		);