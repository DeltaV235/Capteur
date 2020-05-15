package com.wuyue.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wuyue.mapper.ContactMapper;
import com.wuyue.model.entity.Contact;
import com.wuyue.model.entity.ContactExample;
import com.wuyue.model.vo.ContactData;
import com.wuyue.model.vo.TableData;
import com.wuyue.service.intf.ContactService;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @author DeltaV235
 * @version 1.0
 * @className ContactServiceImpl
 * @description
 * @date 2020/5/16 1:51
 */
@Service
public class ContactServiceImpl implements ContactService {

    private final ContactMapper contactMapper;

    public ContactServiceImpl(ContactMapper contactMapper) {
        this.contactMapper = contactMapper;
    }

    @Override
    public TableData<ContactData> getTableData(Integer start, Integer length, Integer draw) {
        PageHelper.offsetPage(start, length, true);
        List<Contact> contactList = contactMapper.selectByExample(new ContactExample());
        PageInfo<Contact> pageInfo = ((Page<Contact>) contactList).toPageInfo();
        int recordsTotal = (int) pageInfo.getTotal();
        int recordsFiltered = (int) pageInfo.getTotal();
        int count = 1;
        ArrayList<ContactData> contactDataList = new ArrayList<>();
        for (Contact contact : contactList) {
            contactDataList.add(new ContactData(contact.getId(), contact.getName(), contact.getPhone(),
                    contact.getEmail(), count));
            count++;
        }
        return new TableData<>(draw, recordsTotal, recordsFiltered, contactDataList, null);
    }

    @Override
    public boolean saveContact(String contactName, String contactPhone, String contactEmail) {
        int insert = contactMapper.insert(new Contact(null, contactName, contactPhone, contactEmail));
        return insert > 0;
    }
}
