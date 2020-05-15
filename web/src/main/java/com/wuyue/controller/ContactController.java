package com.wuyue.controller;

import com.wuyue.model.vo.ContactData;
import com.wuyue.model.vo.ResultEntity;
import com.wuyue.model.vo.TableData;
import com.wuyue.service.intf.ContactService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author DeltaV235
 * @version 1.0
 * @className ContactController
 * @description 处理联系人页的所有请求
 * @date 2020/5/16 1:49
 */
@RestController
public class ContactController {
    private final ContactService contactService;

    public ContactController(ContactService contactService) {
        this.contactService = contactService;
    }

    @PostMapping("/contactTable")
    public TableData<ContactData> getTableContactJson(@RequestParam(value = "start", defaultValue = "0") Integer start,
                                                      @RequestParam(value = "length", defaultValue = "10") Integer length,
                                                      @RequestParam("draw") Integer draw) {
        return contactService.getTableData(start, length, draw);
    }

    @PostMapping("/contacts")
    public ResultEntity<Object> addContact(
            @RequestParam("contactName") String contactName,
            @RequestParam("contactPhone") String contactPhone,
            @RequestParam("contactEmail") String contactEmail
    ) {
        boolean isInsert = contactService.saveContact(contactName, contactPhone, contactEmail);
        if (isInsert)
            return ResultEntity.successWithoutData();
        return ResultEntity.error("联系人添加失败");
    }
}
