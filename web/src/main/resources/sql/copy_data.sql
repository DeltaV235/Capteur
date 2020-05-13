drop procedure copy_data;
create procedure copy_data(IN num int)
begin
    declare `date_var` datetime default null;
    declare `temp_var` double default null;
    declare `humi_var` double default null;
    declare `press_var` double default null;
    declare `light_var` double default null;

    declare `count` int default 0;
    set count = num - 1;

    repeat

        select date, temp, humi, illuminance, pressure
        into date_var, temp_var, humi_var, light_var, press_var
        from dev_ems_sensor_data
                 .all_sensors_data
        order by date
            desc
        limit count,1;


        insert into capteur.sensor_data values (null, timestamp(date_var), temp_var, humi_var, light_var, press_var);

        set count = count - 1;

    until count < 0 end repeat;
end;