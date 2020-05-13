drop database capteur;
create database if not exists capteur;

use capteur;

# 传感器的数据
drop table if exists sensor_data;
create table if not exists sensor_data
(
    id    int primary key auto_increment,
    date  timestamp unique not null comment '采集的时间',
    temp  double(4, 1) comment '温度',
    humi  double(4, 1) comment '湿度',
    light double comment '亮度',
    press double comment '气压'
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

# 告警规则列表
drop table if exists rule_list;
create table if not exists rule_list
(
    id          int primary key auto_increment,
    name        varchar(64) not null comment '告警名称',
    status      char(1)     not null comment '告警状态',
    level       char(1)     not null comment '告警等级',
    description text default null comment '告警描述',
    create_time timestamp   not null comment '告警创建时间'
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

# 告警列表
drop table if exists warn_list;
create table if not exists warn_list
(
    id                  int primary key auto_increment,
    status              char(1)   not null comment '告警状态',
    start_time          timestamp not null default CURRENT_TIMESTAMP comment '告警开始时间',
    last_trigger_time   timestamp not null default CURRENT_TIMESTAMP comment '最近触发时间',
    recover_time        timestamp null comment '告警恢复时间',
    suppress_start_time timestamp null comment '抑制开始的时间',
    suppress_time       timestamp null comment '抑制的时长',
    rule_id             int       not null comment '告警规则id,外键',
    constraint fk_warn_list_rule_id foreign key (rule_id) references rule_list (id),
    key idx_last_trigger_time (last_trigger_time) # 单值索引,告警最近触发时间
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

# 条件列表,与告警规则表的关系是多对一
drop table if exists conditions;
create table if not exists conditions
(
    id      int primary key auto_increment,
    param   char(1) not null comment '环境参数',
    symbol  char(1) not null comment '比较符号',
    data    double  not null comment '阈值',
    rule_id int     not null comment '告警规则id,外键',
    constraint fk_conditions_rule_id foreign key (rule_id) references rule_list (id)
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

# 联系人列表
drop table if exists contact;
create table if not exists contact
(
    id    int primary key auto_increment,
    name  varchar(64) not null comment '联系人姓名',
    phone char(11)    not null comment '联系人手机号',
    email varchar(64) null comment '联系人email'
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

# 联系人与告警规则的中间表
drop table if exists contact_rule;
create table if not exists contact_rule
(
    rule_id    int not null comment '外键,告警规则id',
    contact_id int not null comment '外键,联系人id',
    primary key (contact_id, rule_id),
    constraint fk_rule_id foreign key (rule_id) references rule_list (id),
    constraint fk_contact_id foreign key (contact_id) references contact (id)
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

