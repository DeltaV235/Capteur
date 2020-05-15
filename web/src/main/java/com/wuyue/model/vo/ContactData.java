package com.wuyue.model.vo;

import com.wuyue.model.entity.Contact;

/**
 * @author DeltaV235
 * @version 1.0
 * @className ContactData
 * @description
 * @date 2020/5/16 2:42
 */
public class ContactData extends Contact {

    private String checkbox = "<div class=\"icheck-dark d-inline\"" +
            "<input type=\"checkbox\" id=\"checkboxPrimary2\"" +
            "<label for=\"checkboxPrimary2\"" +
            "</label>" +
            "</div>";

    private Integer seq;

    public ContactData(Integer id, String name, String phone, String email, Integer seq) {
        super(id, name, phone, email);
        this.seq = seq;
    }


    public String getCheckbox() {
        return checkbox;
    }

    public void setCheckbox(String checkbox) {
        this.checkbox = checkbox;
    }


    public Integer getSeq() {
        return seq;
    }

    public void setSeq(Integer seq) {
        this.seq = seq;
    }
}
