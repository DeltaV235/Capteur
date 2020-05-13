package com.wuyue.model.entity;

public class ContactRuleKey {
    private Integer contactId;

    private Integer ruleId;

    public ContactRuleKey() {
    }

    public ContactRuleKey(Integer contactId, Integer ruleId) {
        this.contactId = contactId;
        this.ruleId = ruleId;
    }

    @Override
    public String toString() {
        return "ContactRuleKey{" +
                "contactId=" + contactId +
                ", ruleId=" + ruleId +
                '}';
    }

    public Integer getContactId() {
        return contactId;
    }

    public void setContactId(Integer contactId) {
        this.contactId = contactId;
    }

    public Integer getRuleId() {
        return ruleId;
    }

    public void setRuleId(Integer ruleId) {
        this.ruleId = ruleId;
    }
}