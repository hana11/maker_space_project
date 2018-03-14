-- ������հԽ���
ALTER TABLE `business_boards`
	DROP FOREIGN KEY `FK_business_TO_business_boards`; -- ����о� -> ������հԽ���

-- ������հԽ���
ALTER TABLE `business_boards`
	DROP FOREIGN KEY `FK_members_TO_business_boards`; -- ȸ�� -> ������հԽ���

-- ������ŰԽ���
ALTER TABLE `it_boards`
	DROP FOREIGN KEY `FK_members_TO_it_boards`; -- ȸ�� -> ������ŰԽ���

-- �̵��Խ���
ALTER TABLE `media_boards`
	DROP FOREIGN KEY `FK_members_TO_media_boards`; -- ȸ�� -> �̵��Խ���

-- ����/������ �Խ���
ALTER TABLE `market_boards`
	DROP FOREIGN KEY `FK_members_TO_market_boards`; -- ȸ�� -> ����/������ �Խ���

-- ��Ÿ�Խ���
ALTER TABLE `etc_boards`
	DROP FOREIGN KEY `FK_members_TO_etc_boards`; -- ȸ�� -> ��Ÿ�Խ���

-- �ؽ��±����̺�
ALTER TABLE `hashtags`
	DROP FOREIGN KEY `FK_business_boards_TO_hashtags`; -- ������հԽ��� -> �ؽ��±����̺�

-- ���ǽ�ũ�� ���̺�
ALTER TABLE `scraps_boards`
	DROP FOREIGN KEY `FK_business_boards_TO_scraps_boards`; -- ������հԽ��� -> ���ǽ�ũ�� ���̺�

-- ä�������� ���̺�
ALTER TABLE `select_boards`
	DROP FOREIGN KEY `FK_business_boards_TO_select_boards`; -- ������հԽ��� -> ä�������� ���̺�

-- �����̵�����̺�
ALTER TABLE `my_idea_boards`
	DROP FOREIGN KEY `FK_business_boards_TO_my_idea_boards`; -- ������հԽ��� -> �����̵�����̺�

-- ä�ÿϷ� ���̺�
ALTER TABLE `select_complete_boards`
	DROP FOREIGN KEY `FK_business_boards_TO_select_complete_boards`; -- ������հԽ��� -> ä�ÿϷ� ���̺�

-- ���� �����̵�����̺�
ALTER TABLE `my_idea_boards2`
	DROP FOREIGN KEY `FK_tip_boards_TO_my_idea_boards2`; -- ���� -> ���� �����̵�����̺�

-- ���� ���ǽ�ũ�� ���̺�
ALTER TABLE `scraps_boards2`
	DROP FOREIGN KEY `FK_tip_boards_TO_scraps_boards2`; -- ���� -> ���� ���ǽ�ũ�� ���̺�

-- ���� ���ǽ�ũ�� ���̺�
ALTER TABLE `scraps_boards2`
	DROP FOREIGN KEY `FK_members_TO_scraps_boards2`; -- ȸ�� -> ���� ���ǽ�ũ�� ���̺�

-- ȸ��
ALTER TABLE `members`
	DROP PRIMARY KEY; -- ȸ�� �⺻Ű

-- ����о�
ALTER TABLE `business`
	DROP PRIMARY KEY; -- ����о� �⺻Ű

-- ������հԽ���
ALTER TABLE `business_boards`
	DROP PRIMARY KEY; -- ������հԽ��� �⺻Ű

-- ������ŰԽ���
ALTER TABLE `it_boards`
	DROP PRIMARY KEY; -- ������ŰԽ��� �⺻Ű

-- �̵��Խ���
ALTER TABLE `media_boards`
	DROP PRIMARY KEY; -- �̵��Խ��� �⺻Ű

-- ����/������ �Խ���
ALTER TABLE `market_boards`
	DROP PRIMARY KEY; -- ����/������ �Խ��� �⺻Ű

-- ��Ÿ�Խ���
ALTER TABLE `etc_boards`
	DROP PRIMARY KEY; -- ��Ÿ�Խ��� �⺻Ű

-- �ؽ��±����̺�
ALTER TABLE `hashtags`
	DROP PRIMARY KEY; -- �ؽ��±����̺� �⺻Ű

-- ���ǽ�ũ�� ���̺�
ALTER TABLE `scraps_boards`
	DROP PRIMARY KEY; -- ���ǽ�ũ�� ���̺� �⺻Ű

-- ä�������� ���̺�
ALTER TABLE `select_boards`
	DROP PRIMARY KEY; -- ä�������� ���̺� �⺻Ű

-- �����̵�����̺�
ALTER TABLE `my_idea_boards`
	DROP PRIMARY KEY; -- �����̵�����̺� �⺻Ű

-- ä�ÿϷ� ���̺�
ALTER TABLE `select_complete_boards`
	DROP PRIMARY KEY; -- ä�ÿϷ� ���̺� �⺻Ű

-- ����
ALTER TABLE `tip_boards`
	DROP PRIMARY KEY; -- ���� �⺻Ű

-- ���� �����̵�����̺�
ALTER TABLE `my_idea_boards2`
	DROP PRIMARY KEY; -- ���� �����̵�����̺� �⺻Ű

-- ���� ���ǽ�ũ�� ���̺�
ALTER TABLE `scraps_boards2`
	DROP PRIMARY KEY; -- ���� ���ǽ�ũ�� ���̺� �⺻Ű

-- ȸ��
DROP TABLE IF EXISTS `members` RESTRICT;

-- ����о�
DROP TABLE IF EXISTS `business` RESTRICT;

-- ������հԽ���
DROP TABLE IF EXISTS `business_boards` RESTRICT;

-- �� ���̺�
DROP TABLE IF EXISTS `TABLE` RESTRICT;

-- ������ŰԽ���
DROP TABLE IF EXISTS `it_boards` RESTRICT;

-- �̵��Խ���
DROP TABLE IF EXISTS `media_boards` RESTRICT;

-- ����/������ �Խ���
DROP TABLE IF EXISTS `market_boards` RESTRICT;

-- ��Ÿ�Խ���
DROP TABLE IF EXISTS `etc_boards` RESTRICT;

-- �ؽ��±����̺�
DROP TABLE IF EXISTS `hashtags` RESTRICT;

-- ���ǽ�ũ�� ���̺�
DROP TABLE IF EXISTS `scraps_boards` RESTRICT;

-- ä�������� ���̺�
DROP TABLE IF EXISTS `select_boards` RESTRICT;

-- �����̵�����̺�
DROP TABLE IF EXISTS `my_idea_boards` RESTRICT;

-- ä�ÿϷ� ���̺�
DROP TABLE IF EXISTS `select_complete_boards` RESTRICT;

-- ����
DROP TABLE IF EXISTS `tip_boards` RESTRICT;

-- ���� �����̵�����̺�
DROP TABLE IF EXISTS `my_idea_boards2` RESTRICT;

-- ���� ���ǽ�ũ�� ���̺�
DROP TABLE IF EXISTS `scraps_boards2` RESTRICT;

-- ȸ��
CREATE TABLE `members` (
	`email`    VARCHAR(40) NOT NULL COMMENT '�̸���', -- �̸���
	`password` VARCHAR(15) NOT NULL COMMENT '��й�ȣ', -- ��й�ȣ
	`name`     VARCHAR(50) NOT NULL COMMENT '�̸�', -- �̸�
	`mobile`   VARCHAR(30) NOT NULL COMMENT '�޴�����ȣ', -- �޴�����ȣ
	`company`  VARCHAR(50) NOT NULL COMMENT '�Ҽ�', -- �Ҽ�
	`grade`    VARCHAR(1)  NOT NULL COMMENT '���', -- ���
	`point`    INTEGER     NOT NULL COMMENT '����Ʈ' -- ����Ʈ
)
COMMENT 'ȸ��';

-- ȸ��
ALTER TABLE `members`
	ADD CONSTRAINT `PK_members` -- ȸ�� �⺻Ű
		PRIMARY KEY (
			`email` -- �̸���
		);

-- ����о�
CREATE TABLE `business` (
	`business_idx` INT NOT NULL COMMENT '����о��Ϸù�ȣ' -- ����о��Ϸù�ȣ
)
COMMENT '����о�';

-- ����о�
ALTER TABLE `business`
	ADD CONSTRAINT `PK_business` -- ����о� �⺻Ű
		PRIMARY KEY (
			`business_idx` -- ����о��Ϸù�ȣ
		);

-- ������հԽ���
CREATE TABLE `business_boards` (
	`business_idx`        INT          NOT NULL COMMENT '����о��Ϸù�ȣ', -- ����о��Ϸù�ȣ
	`business_boards_idx` INT          NOT NULL COMMENT '�ε���', -- �ε���
	`title`               VARCHAR(255) NOT NULL COMMENT '����', -- ����
	`content`             VARCHAR(255) NULL     COMMENT '����', -- ����
	`result`              VARCHAR(255) NULL     COMMENT '���ȿ��', -- ���ȿ��
	`files`               VARCHAR(255) NULL     COMMENT '����', -- ����
	`hits`                INT          NOT NULL COMMENT '��ȸ��', -- ��ȸ��
	`email`               VARCHAR(40)  NULL     COMMENT '�̸���', -- �̸���
	`write_date`          VARCHAR(20)  NOT NULL COMMENT '�ۼ���' -- �ۼ���
)
COMMENT '������հԽ���';

-- ������հԽ���
ALTER TABLE `business_boards`
	ADD CONSTRAINT `PK_business_boards` -- ������հԽ��� �⺻Ű
		PRIMARY KEY (
			`business_idx`,        -- ����о��Ϸù�ȣ
			`business_boards_idx`  -- �ε���
		);

-- �� ���̺�
CREATE TABLE `TABLE` (
)
COMMENT '�� ���̺�';

-- ������ŰԽ���
CREATE TABLE `it_boards` (
	`it_boards_idx` INT          NOT NULL COMMENT '�ε���', -- �ε���
	`title`         VARCHAR(255) NOT NULL COMMENT '����', -- ����
	`content`       VARCHAR(255) NULL     COMMENT '����', -- ����
	`result`        VARCHAR(255) NULL     COMMENT '���ȿ��', -- ���ȿ��
	`files`         VARCHAR(255) NULL     COMMENT '����', -- ����
	`hits`          INT          NOT NULL COMMENT '��ȸ��', -- ��ȸ��
	`email`         VARCHAR(40)  NOT NULL COMMENT '�̸���', -- �̸���
	`write_date`    VARCHAR(20)  NOT NULL COMMENT '�ۼ���' -- �ۼ���
)
COMMENT '������ŰԽ���';

-- ������ŰԽ���
ALTER TABLE `it_boards`
	ADD CONSTRAINT `PK_it_boards` -- ������ŰԽ��� �⺻Ű
		PRIMARY KEY (
			`it_boards_idx` -- �ε���
		);

-- �̵��Խ���
CREATE TABLE `media_boards` (
	`media_boards_idx` INT          NOT NULL COMMENT '�ε���', -- �ε���
	`title`            VARCHAR(255) NOT NULL COMMENT '����', -- ����
	`content`          VARCHAR(255) NULL     COMMENT '����', -- ����
	`result`           VARCHAR(255) NULL     COMMENT '���ȿ��', -- ���ȿ��
	`files`            VARCHAR(255) NULL     COMMENT '����', -- ����
	`hits`             INT          NOT NULL COMMENT '��ȸ��', -- ��ȸ��
	`email`            VARCHAR(40)  NOT NULL COMMENT '�̸���', -- �̸���
	`write_date`       VARCHAR(20)  NOT NULL COMMENT '�ۼ���' -- �ۼ���
)
COMMENT '�̵��Խ���';

-- �̵��Խ���
ALTER TABLE `media_boards`
	ADD CONSTRAINT `PK_media_boards` -- �̵��Խ��� �⺻Ű
		PRIMARY KEY (
			`media_boards_idx` -- �ε���
		);

-- ����/������ �Խ���
CREATE TABLE `market_boards` (
	`market_boards_idx` INT          NOT NULL COMMENT '�ε���', -- �ε���
	`title`             VARCHAR(255) NOT NULL COMMENT '����', -- ����
	`content`           VARCHAR(255) NULL     COMMENT '����', -- ����
	`result`            VARCHAR(255) NULL     COMMENT '���ȿ��', -- ���ȿ��
	`files`             VARCHAR(255) NULL     COMMENT '����', -- ����
	`hits`              INT          NOT NULL COMMENT '��ȸ��', -- ��ȸ��
	`email`             VARCHAR(40)  NOT NULL COMMENT '�̸���', -- �̸���
	`write_date`        VARCHAR(20)  NOT NULL COMMENT '�ۼ���' -- �ۼ���
)
COMMENT '����/������ �Խ���';

-- ����/������ �Խ���
ALTER TABLE `market_boards`
	ADD CONSTRAINT `PK_market_boards` -- ����/������ �Խ��� �⺻Ű
		PRIMARY KEY (
			`market_boards_idx` -- �ε���
		);

-- ��Ÿ�Խ���
CREATE TABLE `etc_boards` (
	`etc_boards_idx` INT          NOT NULL COMMENT '�ε���', -- �ε���
	`title`          VARCHAR(255) NOT NULL COMMENT '����', -- ����
	`content`        VARCHAR(255) NULL     COMMENT '����', -- ����
	`result`         VARCHAR(255) NULL     COMMENT '���ȿ��', -- ���ȿ��
	`files`          VARCHAR(255) NULL     COMMENT '����', -- ����
	`hits`           INT          NOT NULL COMMENT '��ȸ��', -- ��ȸ��
	`email`          VARCHAR(40)  NOT NULL COMMENT '�̸���', -- �̸���
	`write_date`     VARCHAR(12)  NOT NULL COMMENT '�ۼ���' -- �ۼ���
)
COMMENT '��Ÿ�Խ���';

-- ��Ÿ�Խ���
ALTER TABLE `etc_boards`
	ADD CONSTRAINT `PK_etc_boards` -- ��Ÿ�Խ��� �⺻Ű
		PRIMARY KEY (
			`etc_boards_idx` -- �ε���
		);

-- �ؽ��±����̺�
CREATE TABLE `hashtags` (
	`business_boards_idx` INT         NOT NULL COMMENT '�ε���', -- �ε���
	`business_idx`        INT         NOT NULL COMMENT '����о��Ϸù�ȣ', -- ����о��Ϸù�ȣ
	`hash_tag`            VARCHAR(10) NULL     COMMENT '�ؽ��±�' -- �ؽ��±�
)
COMMENT '�ؽ��±����̺�';

-- �ؽ��±����̺�
ALTER TABLE `hashtags`
	ADD CONSTRAINT `PK_hashtags` -- �ؽ��±����̺� �⺻Ű
		PRIMARY KEY (
			`business_boards_idx`, -- �ε���
			`business_idx`         -- ����о��Ϸù�ȣ
		);

-- ���ǽ�ũ�� ���̺�
CREATE TABLE `scraps_boards` (
	`business_boards_idx` INT NOT NULL COMMENT '�ε���', -- �ε���
	`business_idx`        INT NOT NULL COMMENT '����о��Ϸù�ȣ' -- ����о��Ϸù�ȣ
)
COMMENT '���ǽ�ũ�� ���̺�';

-- ���ǽ�ũ�� ���̺�
ALTER TABLE `scraps_boards`
	ADD CONSTRAINT `PK_scraps_boards` -- ���ǽ�ũ�� ���̺� �⺻Ű
		PRIMARY KEY (
			`business_boards_idx`, -- �ε���
			`business_idx`         -- ����о��Ϸù�ȣ
		);

-- ä�������� ���̺�
CREATE TABLE `select_boards` (
	`business_boards_idx` INT NOT NULL COMMENT '�ε���', -- �ε���
	`business_idx`        INT NOT NULL COMMENT '����о��Ϸù�ȣ' -- ����о��Ϸù�ȣ
)
COMMENT 'ä�������� ���̺�';

-- ä�������� ���̺�
ALTER TABLE `select_boards`
	ADD CONSTRAINT `PK_select_boards` -- ä�������� ���̺� �⺻Ű
		PRIMARY KEY (
			`business_boards_idx`, -- �ε���
			`business_idx`         -- ����о��Ϸù�ȣ
		);

-- �����̵�����̺�
CREATE TABLE `my_idea_boards` (
	`business_boards_idx` INT NOT NULL COMMENT '�ε���', -- �ε���
	`business_idx`        INT NOT NULL COMMENT '����о��Ϸù�ȣ' -- ����о��Ϸù�ȣ
)
COMMENT '�����̵�����̺�';

-- �����̵�����̺�
ALTER TABLE `my_idea_boards`
	ADD CONSTRAINT `PK_my_idea_boards` -- �����̵�����̺� �⺻Ű
		PRIMARY KEY (
			`business_boards_idx`, -- �ε���
			`business_idx`         -- ����о��Ϸù�ȣ
		);

-- ä�ÿϷ� ���̺�
CREATE TABLE `select_complete_boards` (
	`business_boards_idx` INT NOT NULL COMMENT '�ε���', -- �ε���
	`business_idx`        INT NOT NULL COMMENT '����о��Ϸù�ȣ' -- ����о��Ϸù�ȣ
)
COMMENT 'ä�ÿϷ� ���̺�';

-- ä�ÿϷ� ���̺�
ALTER TABLE `select_complete_boards`
	ADD CONSTRAINT `PK_select_complete_boards` -- ä�ÿϷ� ���̺� �⺻Ű
		PRIMARY KEY (
			`business_boards_idx`, -- �ε���
			`business_idx`         -- ����о��Ϸù�ȣ
		);

-- ����
CREATE TABLE `tip_boards` (
	`tip_idx`    INT          NOT NULL COMMENT '�ε���', -- �ε���
	`title`      VARCHAR(255) NOT NULL COMMENT '����', -- ����
	`content`    VARCHAR(255) NULL     COMMENT '����', -- ����
	`result`     VARCHAR(255) NULL     COMMENT '���ȿ��', -- ���ȿ��
	`files`      VARCHAR(255) NULL     COMMENT '����', -- ����
	`hits`       INT          NOT NULL COMMENT '��ȸ��', -- ��ȸ��
	`scraps`     INT          NOT NULL COMMENT '��ũ����', -- ��ũ����
	`email`      VARCHAR(40)  NULL     COMMENT '�̸���', -- �̸���
	`entry_date` VARCHAR(20)  NOT NULL COMMENT '�ۼ���' -- �ۼ���
)
COMMENT '����';

-- ����
ALTER TABLE `tip_boards`
	ADD CONSTRAINT `PK_tip_boards` -- ���� �⺻Ű
		PRIMARY KEY (
			`tip_idx` -- �ε���
		);

-- ���� �����̵�����̺�
CREATE TABLE `my_idea_boards2` (
	`tip_idx` INT NOT NULL COMMENT '�ε���' -- �ε���
)
COMMENT '���� �����̵�����̺�';

-- ���� �����̵�����̺�
ALTER TABLE `my_idea_boards2`
	ADD CONSTRAINT `PK_my_idea_boards2` -- ���� �����̵�����̺� �⺻Ű
		PRIMARY KEY (
			`tip_idx` -- �ε���
		);

-- ���� ���ǽ�ũ�� ���̺�
CREATE TABLE `scraps_boards2` (
	`tip_idx` INT         NOT NULL COMMENT '�ε���', -- �ε���
	`email`   VARCHAR(40) NOT NULL COMMENT '�̸���' -- �̸���
)
COMMENT '���� ���ǽ�ũ�� ���̺�';

-- ���� ���ǽ�ũ�� ���̺�
ALTER TABLE `scraps_boards2`
	ADD CONSTRAINT `PK_scraps_boards2` -- ���� ���ǽ�ũ�� ���̺� �⺻Ű
		PRIMARY KEY (
			`tip_idx`, -- �ε���
			`email`    -- �̸���
		);

-- ������հԽ���
ALTER TABLE `business_boards`
	ADD CONSTRAINT `FK_business_TO_business_boards` -- ����о� -> ������հԽ���
		FOREIGN KEY (
			`business_idx` -- ����о��Ϸù�ȣ
		)
		REFERENCES `business` ( -- ����о�
			`business_idx` -- ����о��Ϸù�ȣ
		);

-- ������հԽ���
ALTER TABLE `business_boards`
	ADD CONSTRAINT `FK_members_TO_business_boards` -- ȸ�� -> ������հԽ���
		FOREIGN KEY (
			`email` -- �̸���
		)
		REFERENCES `members` ( -- ȸ��
			`email` -- �̸���
		);

-- ������ŰԽ���
ALTER TABLE `it_boards`
	ADD CONSTRAINT `FK_members_TO_it_boards` -- ȸ�� -> ������ŰԽ���
		FOREIGN KEY (
			`email` -- �̸���
		)
		REFERENCES `members` ( -- ȸ��
			`email` -- �̸���
		);

-- �̵��Խ���
ALTER TABLE `media_boards`
	ADD CONSTRAINT `FK_members_TO_media_boards` -- ȸ�� -> �̵��Խ���
		FOREIGN KEY (
			`email` -- �̸���
		)
		REFERENCES `members` ( -- ȸ��
			`email` -- �̸���
		);

-- ����/������ �Խ���
ALTER TABLE `market_boards`
	ADD CONSTRAINT `FK_members_TO_market_boards` -- ȸ�� -> ����/������ �Խ���
		FOREIGN KEY (
			`email` -- �̸���
		)
		REFERENCES `members` ( -- ȸ��
			`email` -- �̸���
		);

-- ��Ÿ�Խ���
ALTER TABLE `etc_boards`
	ADD CONSTRAINT `FK_members_TO_etc_boards` -- ȸ�� -> ��Ÿ�Խ���
		FOREIGN KEY (
			`email` -- �̸���
		)
		REFERENCES `members` ( -- ȸ��
			`email` -- �̸���
		);

-- �ؽ��±����̺�
ALTER TABLE `hashtags`
	ADD CONSTRAINT `FK_business_boards_TO_hashtags` -- ������հԽ��� -> �ؽ��±����̺�
		FOREIGN KEY (
			`business_idx`,        -- ����о��Ϸù�ȣ
			`business_boards_idx`  -- �ε���
		)
		REFERENCES `business_boards` ( -- ������հԽ���
			`business_idx`,        -- ����о��Ϸù�ȣ
			`business_boards_idx`  -- �ε���
		);

-- ���ǽ�ũ�� ���̺�
ALTER TABLE `scraps_boards`
	ADD CONSTRAINT `FK_business_boards_TO_scraps_boards` -- ������հԽ��� -> ���ǽ�ũ�� ���̺�
		FOREIGN KEY (
			`business_idx`,        -- ����о��Ϸù�ȣ
			`business_boards_idx`  -- �ε���
		)
		REFERENCES `business_boards` ( -- ������հԽ���
			`business_idx`,        -- ����о��Ϸù�ȣ
			`business_boards_idx`  -- �ε���
		);

-- ä�������� ���̺�
ALTER TABLE `select_boards`
	ADD CONSTRAINT `FK_business_boards_TO_select_boards` -- ������հԽ��� -> ä�������� ���̺�
		FOREIGN KEY (
			`business_idx`,        -- ����о��Ϸù�ȣ
			`business_boards_idx`  -- �ε���
		)
		REFERENCES `business_boards` ( -- ������հԽ���
			`business_idx`,        -- ����о��Ϸù�ȣ
			`business_boards_idx`  -- �ε���
		);

-- �����̵�����̺�
ALTER TABLE `my_idea_boards`
	ADD CONSTRAINT `FK_business_boards_TO_my_idea_boards` -- ������հԽ��� -> �����̵�����̺�
		FOREIGN KEY (
			`business_idx`,        -- ����о��Ϸù�ȣ
			`business_boards_idx`  -- �ε���
		)
		REFERENCES `business_boards` ( -- ������հԽ���
			`business_idx`,        -- ����о��Ϸù�ȣ
			`business_boards_idx`  -- �ε���
		);

-- ä�ÿϷ� ���̺�
ALTER TABLE `select_complete_boards`
	ADD CONSTRAINT `FK_business_boards_TO_select_complete_boards` -- ������հԽ��� -> ä�ÿϷ� ���̺�
		FOREIGN KEY (
			`business_idx`,        -- ����о��Ϸù�ȣ
			`business_boards_idx`  -- �ε���
		)
		REFERENCES `business_boards` ( -- ������հԽ���
			`business_idx`,        -- ����о��Ϸù�ȣ
			`business_boards_idx`  -- �ε���
		);

-- ���� �����̵�����̺�
ALTER TABLE `my_idea_boards2`
	ADD CONSTRAINT `FK_tip_boards_TO_my_idea_boards2` -- ���� -> ���� �����̵�����̺�
		FOREIGN KEY (
			`tip_idx` -- �ε���
		)
		REFERENCES `tip_boards` ( -- ����
			`tip_idx` -- �ε���
		);

-- ���� ���ǽ�ũ�� ���̺�
ALTER TABLE `scraps_boards2`
	ADD CONSTRAINT `FK_tip_boards_TO_scraps_boards2` -- ���� -> ���� ���ǽ�ũ�� ���̺�
		FOREIGN KEY (
			`tip_idx` -- �ε���
		)
		REFERENCES `tip_boards` ( -- ����
			`tip_idx` -- �ε���
		);

-- ���� ���ǽ�ũ�� ���̺�
ALTER TABLE `scraps_boards2`
	ADD CONSTRAINT `FK_members_TO_scraps_boards2` -- ȸ�� -> ���� ���ǽ�ũ�� ���̺�
		FOREIGN KEY (
			`email` -- �̸���
		)
		REFERENCES `members` ( -- ȸ��
			`email` -- �̸���
		);