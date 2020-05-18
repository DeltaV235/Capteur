package com.wuyue.service.intf;

import com.wuyue.model.entity.Contact;
import com.wuyue.model.vo.TableData;

import java.util.List;

/**
 * @author DeltaV235
 * @version 1.0
 * @className ContactService
 * @description 处理联系人相关的业务
 * @date 2020/5/16 1:51
 */
public interface ContactService {
    TableData<Contact> getTableData(Integer start, Integer length, Integer draw);

    boolean saveContact(String contactName, String contactPhone, String contactEmail);

    boolean removeContact(Integer id);

    Contact getContact(Integer id);

    boolean editContact(Contact contact);

    List<Contact> getAllContacts();
}
