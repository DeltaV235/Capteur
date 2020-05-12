package com.wuyue.model.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class WarnListExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public WarnListExample() {
        oredCriteria = new ArrayList<>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Integer value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Integer value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Integer value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Integer value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Integer value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Integer> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Integer> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Integer value1, Integer value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Integer value1, Integer value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andStatusIsNull() {
            addCriterion("status is null");
            return (Criteria) this;
        }

        public Criteria andStatusIsNotNull() {
            addCriterion("status is not null");
            return (Criteria) this;
        }

        public Criteria andStatusEqualTo(String value) {
            addCriterion("status =", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotEqualTo(String value) {
            addCriterion("status <>", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusGreaterThan(String value) {
            addCriterion("status >", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusGreaterThanOrEqualTo(String value) {
            addCriterion("status >=", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusLessThan(String value) {
            addCriterion("status <", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusLessThanOrEqualTo(String value) {
            addCriterion("status <=", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusLike(String value) {
            addCriterion("status like", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotLike(String value) {
            addCriterion("status not like", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusIn(List<String> values) {
            addCriterion("status in", values, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotIn(List<String> values) {
            addCriterion("status not in", values, "status");
            return (Criteria) this;
        }

        public Criteria andStatusBetween(String value1, String value2) {
            addCriterion("status between", value1, value2, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotBetween(String value1, String value2) {
            addCriterion("status not between", value1, value2, "status");
            return (Criteria) this;
        }

        public Criteria andStartTimeIsNull() {
            addCriterion("start_time is null");
            return (Criteria) this;
        }

        public Criteria andStartTimeIsNotNull() {
            addCriterion("start_time is not null");
            return (Criteria) this;
        }

        public Criteria andStartTimeEqualTo(Date value) {
            addCriterion("start_time =", value, "startTime");
            return (Criteria) this;
        }

        public Criteria andStartTimeNotEqualTo(Date value) {
            addCriterion("start_time <>", value, "startTime");
            return (Criteria) this;
        }

        public Criteria andStartTimeGreaterThan(Date value) {
            addCriterion("start_time >", value, "startTime");
            return (Criteria) this;
        }

        public Criteria andStartTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("start_time >=", value, "startTime");
            return (Criteria) this;
        }

        public Criteria andStartTimeLessThan(Date value) {
            addCriterion("start_time <", value, "startTime");
            return (Criteria) this;
        }

        public Criteria andStartTimeLessThanOrEqualTo(Date value) {
            addCriterion("start_time <=", value, "startTime");
            return (Criteria) this;
        }

        public Criteria andStartTimeIn(List<Date> values) {
            addCriterion("start_time in", values, "startTime");
            return (Criteria) this;
        }

        public Criteria andStartTimeNotIn(List<Date> values) {
            addCriterion("start_time not in", values, "startTime");
            return (Criteria) this;
        }

        public Criteria andStartTimeBetween(Date value1, Date value2) {
            addCriterion("start_time between", value1, value2, "startTime");
            return (Criteria) this;
        }

        public Criteria andStartTimeNotBetween(Date value1, Date value2) {
            addCriterion("start_time not between", value1, value2, "startTime");
            return (Criteria) this;
        }

        public Criteria andLastTriggerTimeIsNull() {
            addCriterion("last_trigger_time is null");
            return (Criteria) this;
        }

        public Criteria andLastTriggerTimeIsNotNull() {
            addCriterion("last_trigger_time is not null");
            return (Criteria) this;
        }

        public Criteria andLastTriggerTimeEqualTo(Date value) {
            addCriterion("last_trigger_time =", value, "lastTriggerTime");
            return (Criteria) this;
        }

        public Criteria andLastTriggerTimeNotEqualTo(Date value) {
            addCriterion("last_trigger_time <>", value, "lastTriggerTime");
            return (Criteria) this;
        }

        public Criteria andLastTriggerTimeGreaterThan(Date value) {
            addCriterion("last_trigger_time >", value, "lastTriggerTime");
            return (Criteria) this;
        }

        public Criteria andLastTriggerTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("last_trigger_time >=", value, "lastTriggerTime");
            return (Criteria) this;
        }

        public Criteria andLastTriggerTimeLessThan(Date value) {
            addCriterion("last_trigger_time <", value, "lastTriggerTime");
            return (Criteria) this;
        }

        public Criteria andLastTriggerTimeLessThanOrEqualTo(Date value) {
            addCriterion("last_trigger_time <=", value, "lastTriggerTime");
            return (Criteria) this;
        }

        public Criteria andLastTriggerTimeIn(List<Date> values) {
            addCriterion("last_trigger_time in", values, "lastTriggerTime");
            return (Criteria) this;
        }

        public Criteria andLastTriggerTimeNotIn(List<Date> values) {
            addCriterion("last_trigger_time not in", values, "lastTriggerTime");
            return (Criteria) this;
        }

        public Criteria andLastTriggerTimeBetween(Date value1, Date value2) {
            addCriterion("last_trigger_time between", value1, value2, "lastTriggerTime");
            return (Criteria) this;
        }

        public Criteria andLastTriggerTimeNotBetween(Date value1, Date value2) {
            addCriterion("last_trigger_time not between", value1, value2, "lastTriggerTime");
            return (Criteria) this;
        }

        public Criteria andRecoverTimeIsNull() {
            addCriterion("recover_time is null");
            return (Criteria) this;
        }

        public Criteria andRecoverTimeIsNotNull() {
            addCriterion("recover_time is not null");
            return (Criteria) this;
        }

        public Criteria andRecoverTimeEqualTo(Date value) {
            addCriterion("recover_time =", value, "recoverTime");
            return (Criteria) this;
        }

        public Criteria andRecoverTimeNotEqualTo(Date value) {
            addCriterion("recover_time <>", value, "recoverTime");
            return (Criteria) this;
        }

        public Criteria andRecoverTimeGreaterThan(Date value) {
            addCriterion("recover_time >", value, "recoverTime");
            return (Criteria) this;
        }

        public Criteria andRecoverTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("recover_time >=", value, "recoverTime");
            return (Criteria) this;
        }

        public Criteria andRecoverTimeLessThan(Date value) {
            addCriterion("recover_time <", value, "recoverTime");
            return (Criteria) this;
        }

        public Criteria andRecoverTimeLessThanOrEqualTo(Date value) {
            addCriterion("recover_time <=", value, "recoverTime");
            return (Criteria) this;
        }

        public Criteria andRecoverTimeIn(List<Date> values) {
            addCriterion("recover_time in", values, "recoverTime");
            return (Criteria) this;
        }

        public Criteria andRecoverTimeNotIn(List<Date> values) {
            addCriterion("recover_time not in", values, "recoverTime");
            return (Criteria) this;
        }

        public Criteria andRecoverTimeBetween(Date value1, Date value2) {
            addCriterion("recover_time between", value1, value2, "recoverTime");
            return (Criteria) this;
        }

        public Criteria andRecoverTimeNotBetween(Date value1, Date value2) {
            addCriterion("recover_time not between", value1, value2, "recoverTime");
            return (Criteria) this;
        }

        public Criteria andSuppressStartTimeIsNull() {
            addCriterion("suppress_start_time is null");
            return (Criteria) this;
        }

        public Criteria andSuppressStartTimeIsNotNull() {
            addCriterion("suppress_start_time is not null");
            return (Criteria) this;
        }

        public Criteria andSuppressStartTimeEqualTo(Date value) {
            addCriterion("suppress_start_time =", value, "suppressStartTime");
            return (Criteria) this;
        }

        public Criteria andSuppressStartTimeNotEqualTo(Date value) {
            addCriterion("suppress_start_time <>", value, "suppressStartTime");
            return (Criteria) this;
        }

        public Criteria andSuppressStartTimeGreaterThan(Date value) {
            addCriterion("suppress_start_time >", value, "suppressStartTime");
            return (Criteria) this;
        }

        public Criteria andSuppressStartTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("suppress_start_time >=", value, "suppressStartTime");
            return (Criteria) this;
        }

        public Criteria andSuppressStartTimeLessThan(Date value) {
            addCriterion("suppress_start_time <", value, "suppressStartTime");
            return (Criteria) this;
        }

        public Criteria andSuppressStartTimeLessThanOrEqualTo(Date value) {
            addCriterion("suppress_start_time <=", value, "suppressStartTime");
            return (Criteria) this;
        }

        public Criteria andSuppressStartTimeIn(List<Date> values) {
            addCriterion("suppress_start_time in", values, "suppressStartTime");
            return (Criteria) this;
        }

        public Criteria andSuppressStartTimeNotIn(List<Date> values) {
            addCriterion("suppress_start_time not in", values, "suppressStartTime");
            return (Criteria) this;
        }

        public Criteria andSuppressStartTimeBetween(Date value1, Date value2) {
            addCriterion("suppress_start_time between", value1, value2, "suppressStartTime");
            return (Criteria) this;
        }

        public Criteria andSuppressStartTimeNotBetween(Date value1, Date value2) {
            addCriterion("suppress_start_time not between", value1, value2, "suppressStartTime");
            return (Criteria) this;
        }

        public Criteria andSuppressTimeIsNull() {
            addCriterion("suppress_time is null");
            return (Criteria) this;
        }

        public Criteria andSuppressTimeIsNotNull() {
            addCriterion("suppress_time is not null");
            return (Criteria) this;
        }

        public Criteria andSuppressTimeEqualTo(Date value) {
            addCriterion("suppress_time =", value, "suppressTime");
            return (Criteria) this;
        }

        public Criteria andSuppressTimeNotEqualTo(Date value) {
            addCriterion("suppress_time <>", value, "suppressTime");
            return (Criteria) this;
        }

        public Criteria andSuppressTimeGreaterThan(Date value) {
            addCriterion("suppress_time >", value, "suppressTime");
            return (Criteria) this;
        }

        public Criteria andSuppressTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("suppress_time >=", value, "suppressTime");
            return (Criteria) this;
        }

        public Criteria andSuppressTimeLessThan(Date value) {
            addCriterion("suppress_time <", value, "suppressTime");
            return (Criteria) this;
        }

        public Criteria andSuppressTimeLessThanOrEqualTo(Date value) {
            addCriterion("suppress_time <=", value, "suppressTime");
            return (Criteria) this;
        }

        public Criteria andSuppressTimeIn(List<Date> values) {
            addCriterion("suppress_time in", values, "suppressTime");
            return (Criteria) this;
        }

        public Criteria andSuppressTimeNotIn(List<Date> values) {
            addCriterion("suppress_time not in", values, "suppressTime");
            return (Criteria) this;
        }

        public Criteria andSuppressTimeBetween(Date value1, Date value2) {
            addCriterion("suppress_time between", value1, value2, "suppressTime");
            return (Criteria) this;
        }

        public Criteria andSuppressTimeNotBetween(Date value1, Date value2) {
            addCriterion("suppress_time not between", value1, value2, "suppressTime");
            return (Criteria) this;
        }

        public Criteria andRuleIdIsNull() {
            addCriterion("rule_id is null");
            return (Criteria) this;
        }

        public Criteria andRuleIdIsNotNull() {
            addCriterion("rule_id is not null");
            return (Criteria) this;
        }

        public Criteria andRuleIdEqualTo(Integer value) {
            addCriterion("rule_id =", value, "ruleId");
            return (Criteria) this;
        }

        public Criteria andRuleIdNotEqualTo(Integer value) {
            addCriterion("rule_id <>", value, "ruleId");
            return (Criteria) this;
        }

        public Criteria andRuleIdGreaterThan(Integer value) {
            addCriterion("rule_id >", value, "ruleId");
            return (Criteria) this;
        }

        public Criteria andRuleIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("rule_id >=", value, "ruleId");
            return (Criteria) this;
        }

        public Criteria andRuleIdLessThan(Integer value) {
            addCriterion("rule_id <", value, "ruleId");
            return (Criteria) this;
        }

        public Criteria andRuleIdLessThanOrEqualTo(Integer value) {
            addCriterion("rule_id <=", value, "ruleId");
            return (Criteria) this;
        }

        public Criteria andRuleIdIn(List<Integer> values) {
            addCriterion("rule_id in", values, "ruleId");
            return (Criteria) this;
        }

        public Criteria andRuleIdNotIn(List<Integer> values) {
            addCriterion("rule_id not in", values, "ruleId");
            return (Criteria) this;
        }

        public Criteria andRuleIdBetween(Integer value1, Integer value2) {
            addCriterion("rule_id between", value1, value2, "ruleId");
            return (Criteria) this;
        }

        public Criteria andRuleIdNotBetween(Integer value1, Integer value2) {
            addCriterion("rule_id not between", value1, value2, "ruleId");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {
        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}