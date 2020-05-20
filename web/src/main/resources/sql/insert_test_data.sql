delete
from capteur.conditions;
delete
from capteur.contact_rule;
delete
from capteur.rule_list;
delete
from capteur.contact;
delete
from capteur.warn_list;
delete
from capteur.sensor_data;

use capteur;

insert into capteur.rule_list
values (null, '温度大于20℃', 'e', 'e', '可以开空调啦', now(), false),
       (null, '亮度大于300lux且湿度小于30%', 'e', 'i', '天亮了', now(), false);

insert into capteur.conditions
values (null, 't', '>', 20, 1, now(), false),
       (null, 'l', '>', 300, 2, now(), false),
       (null, 'h', '<', 30, 2, now(), false);

insert into capteur.contact
values (null, '孙一凯', '13816862974', 'sunyk@boss.com', false),
       (null, '冯纲', '13801851255', 'fenggang@boss.com', false);

insert into capteur.contact_rule
values (1, 1),
       (1, 2),
       (2, 1);

call copy_data(300);

# insert into capteur.warn_list
# values (null, 'w', now(), now(), null, null, null, 1),
#        (null, 'r', now(), now(), null, null, null, 1);

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
