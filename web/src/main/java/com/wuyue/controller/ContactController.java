package com.wuyue.controller;

import com.wuyue.model.entity.Contact;
import com.wuyue.model.vo.ResultEntity;
import com.wuyue.model.vo.TableData;
import com.wuyue.service.intf.ContactService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.*;

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
    private final Logger logger = LoggerFactory.getLogger(getClass());

    public ContactController(ContactService contactService) {
        this.contactService = contactService;
    }

    /**
     * @param start  开始记录数
     * @param length 每页条数
     * @param draw
     * @return json字符串, 包含联系人的id, 姓名, 手机和邮箱
     * @author DeltaV235
     * @date 2020/5/16 20:07
     * @description 返回指定页数的联系人
     */
    @PostMapping("/contactTable")
    public TableData<Contact> getTableContactJson(@RequestParam(value = "start", defaultValue = "0") Integer start,
                                                  @RequestParam(value = "length", defaultValue = "10") Integer length,
                                                  @RequestParam("draw") Integer draw) {
        return contactService.getTableData(start, length, draw);
    }

    /**
     * @param contact post参数绑定的Contact对象
     * @return jsonString 不带数据
     * @author DeltaV235
     * @date 2020/5/16 20:51
     * @description 增加联系人
     */
    @PostMapping("/contacts")
    public ResultEntity<Object> addContact(Contact contact) {
        try {
            boolean isInsert = contactService.saveContact(contact.getName(), contact.getPhone(), contact.getEmail());
            if (isInsert)
                return ResultEntity.successWithoutData();
            return ResultEntity.error("联系人添加失败");
        } catch (Exception e) {
            logger.warn("联系人添加失败", e);
            return ResultEntity.error("联系人添加失败");
        }
    }

    /**
     * @param id
     * @return jsonString 不携带数据
     * @author DeltaV235
     * @date 2020/5/16 20:52
     * @description 删除指定id的联系人
     */
    @DeleteMapping("/contacts/{id}")
    public ResultEntity<Object> deleteContact(@PathVariable("id") Integer id) {
        boolean isRemoved = contactService.removeContact(id);
        try {
            if (isRemoved)
                return ResultEntity.successWithoutData();
            return ResultEntity.error("联系人删除失败");
        } catch (Exception e) {
            logger.warn("联系人删除失败", e);
            return ResultEntity.error("联系人删除失败");
        }
    }

    @GetMapping("/valid")
    public ResultEntity<Object> validContactName(Contact contact) {
//        if (ContactService.validContact)
        return null;
    }
}
