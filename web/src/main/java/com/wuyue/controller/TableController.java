package com.wuyue.controller;

import com.wuyue.model.entity.SensorData;
import com.wuyue.model.vo.TableData;
import com.wuyue.service.intf.SensorDataService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author DeltaV235
 * @version 1.0
 * @className TableController
 * @description 处理数据表格页面的请求
 * @date 2020/5/16 1:40
 */
@RestController
public class TableController {
    private final SensorDataService sensorDataService;

    public TableController(SensorDataService sensorDataService) {
        this.sensorDataService = sensorDataService;
    }

    /**
     * @param start  开始的记录索引,从0开始,泛型表示返回值TableData中数据域的类型
     * @param length 每页的行数
     * @param draw   校验数据
     * @return DataTable用于解析数据的POJO
     * @author DeltaV235
     * @date 2020/5/16 2:01
     * @description 返回分页数据
     */
    @PostMapping("/dataTable")
    public TableData<SensorData> getTableDataJson(@RequestParam(value = "start", defaultValue = "0") Integer start,
                                                  @RequestParam(value = "length", defaultValue = "10") Integer length,
                                                  @RequestParam("draw") Integer draw) {
        return sensorDataService.getTableData(start, length, draw);
    }
}
