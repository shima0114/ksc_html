/* リンクグループ（サッカー団体・チーム（船橋）など） */
create table link_group (
  code char(20),
  title varchar(20) not null,
  list_order int(3) not null,
  updated_at timestamp default current_timestamp not null on update current_timestamp,
  primary key (code)
)
  engine=InnoDB
;

/* リンク内容（URL、表示名、コメントなど） */
create table link_content (
  id int(10) auto_increment,
  group_code char(20) not null,
  name varchar(50) not null,
  url text not null,
  comment varchar(50),
  updated_at timestamp default current_timestamp not null on update current_timestamp,
  primary key (id, group_code)
)
  engine=InnoDB
;

/* 写真グループ（スタッフ・選手・アルバムなど）
   image_group.code = staff -> スタッフ
   image_group.code = 'album_' + album.id -> アルバム
   image_group.code = 'grade_' + grade.id -> 選手 */
create table image_group (
  code char(20),
  name varchar(30) not null,
  updated_at timestamp default current_timestamp not null on update current_timestamp,
  primary key (code)
)
  engine=InnoDB
;

/* 写真コンテンツ（ファイル名、alt、コメントなど） */
create table image_content (
  id int(10) auto_increment,
  group_code char(20) not null,
  title varchar(20),
  file_path char(255) not null,
  comment varchar(100),
  updated_at timestamp default current_timestamp not null on update current_timestamp,
  primary key (id, group_code)
)
  engine=InnoDB
;

create table glossary_line (
  code char(3) not null,
  name varchar(10) not null,
  updated_at timestamp default current_timestamp not null on update current_timestamp,
  primary key (code)
)
  engine=InnoDB
;

create table glossary_contents (
  id int(10) auto_increment,
  code char(3) not null,
  title varchar(30) not null,
  content text not null,
  updated_at timestamp default current_timestamp not null on update current_timestamp,
  primary key (id)
)
  engine=InnoDB
;

create table album (
  id int(3) auto_increment,
  year int(4) not null,
  title varchr(50) not null,
  primary key (id)
) engine=InnoDB;
create index idx_album_year on album (year);

create table information (
  id int(3) auto_increment,
  start_at datetime not null,
  end_of datetime not null default '9999-12-31 23:59:59',
  detail text null,
  created_at timestamp default current_timestamp not null on update current_timestamp,
  primary key (id)
) engine=InnoDB;

/* ここから未実施 */
create table grade (
  id int(3) auto_increment,
  year char(4) not null,
  name varchar(30) not null,
  primary key (id)
) engine=InnoDB;

create table player (
  id int(5) auto_increment,
  grade_id int(3) not null,
  name varchar(20) not null,
  note text null,
  primary key(id)
) engine=InnoDB;

create table match (
  id int(10) auto_increment,
  grade_id int(3) not null,
  schedule varchar(30),
  venue varchar(100),
  note text null,
  primary key(id)
) engine=InnoDB;

create table match_detail (
  id int(10) auto_increment,
  match_id int(3) not null,
  schedule varchar(30),
  venue varchar(100),
  note text,
  primary key(id)
) engine=InnoDB;

create table match_team (
  id int(10) auto_increment,
  match_id int(3) not null,
  name varchar(30),
  primary key(id)
) engine=InnoDB;

create table match_result (
  id int(10) auto_increment,
  match_detail_id int(3) not null,
  match_team_id int(10) not null,
  score_home int(2),
  score_rival int(2),
  note text,
  primary key(id)
) engine=InnoDB;

