truncate capteur.conditions;
truncate capteur.contact_rule;
truncate capteur.rule_list;
truncate capteur.contact;
truncate capteur.warn_list;
truncate capteur.sensor_data;

use capteur;

insert into capteur.rule_list
values (null, '温度大于20℃', 'e', 'e', '可以开空调啦', now()),
       (null, '亮度大于300lux且湿度小于30%', 'e', 'i', '天亮了', now());

insert into capteur.conditions
values (null, 't', '>', 20, 1),
       (null, 'l', '>', 300, 2),
       (null, 'h', '<', 300, 2);

insert into capteur.contact
values (null, '孙一凯', '13816862974', 'sunyk@boss.com'),
       (null, '冯纲', '13801851255', 'fenggang@boss.com');

insert into capteur.contact_rule
values (1, 1),
       (1, 2),
       (2, 1);

call copy_data(300);

insert into capteur.warn_list
values (null, 'w', now(), now(), null, null, null, 1),
       (null, 'r', now(), now(), null, null, null, 1);

select *
from conditions;
select *
from contact;
select *
from contact_rule;
select *
from rule_list;
select *
from sensor_data;
select *
from warn_list;
