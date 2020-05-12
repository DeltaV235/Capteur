package com.wuyue.model.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class SensorDataExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public SensorDataExample() {
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

        public Criteria andDateIsNull() {
            addCriterion("date is null");
            return (Criteria) this;
        }

        public Criteria andDateIsNotNull() {
            addCriterion("date is not null");
            return (Criteria) this;
        }

        public Criteria andDateEqualTo(Date value) {
            addCriterion("date =", value, "date");
            return (Criteria) this;
        }

        public Criteria andDateNotEqualTo(Date value) {
            addCriterion("date <>", value, "date");
            return (Criteria) this;
        }

        public Criteria andDateGreaterThan(Date value) {
            addCriterion("date >", value, "date");
            return (Criteria) this;
        }

        public Criteria andDateGreaterThanOrEqualTo(Date value) {
            addCriterion("date >=", value, "date");
            return (Criteria) this;
        }

        public Criteria andDateLessThan(Date value) {
            addCriterion("date <", value, "date");
            return (Criteria) this;
        }

        public Criteria andDateLessThanOrEqualTo(Date value) {
            addCriterion("date <=", value, "date");
            return (Criteria) this;
        }

        public Criteria andDateIn(List<Date> values) {
            addCriterion("date in", values, "date");
            return (Criteria) this;
        }

        public Criteria andDateNotIn(List<Date> values) {
            addCriterion("date not in", values, "date");
            return (Criteria) this;
        }

        public Criteria andDateBetween(Date value1, Date value2) {
            addCriterion("date between", value1, value2, "date");
            return (Criteria) this;
        }

        public Criteria andDateNotBetween(Date value1, Date value2) {
            addCriterion("date not between", value1, value2, "date");
            return (Criteria) this;
        }

        public Criteria andTempIsNull() {
            addCriterion("temp is null");
            return (Criteria) this;
        }

        public Criteria andTempIsNotNull() {
            addCriterion("temp is not null");
            return (Criteria) this;
        }

        public Criteria andTempEqualTo(Double value) {
            addCriterion("temp =", value, "temp");
            return (Criteria) this;
        }

        public Criteria andTempNotEqualTo(Double value) {
            addCriterion("temp <>", value, "temp");
            return (Criteria) this;
        }

        public Criteria andTempGreaterThan(Double value) {
            addCriterion("temp >", value, "temp");
            return (Criteria) this;
        }

        public Criteria andTempGreaterThanOrEqualTo(Double value) {
            addCriterion("temp >=", value, "temp");
            return (Criteria) this;
        }

        public Criteria andTempLessThan(Double value) {
            addCriterion("temp <", value, "temp");
            return (Criteria) this;
        }

        public Criteria andTempLessThanOrEqualTo(Double value) {
            addCriterion("temp <=", value, "temp");
            return (Criteria) this;
        }

        public Criteria andTempIn(List<Double> values) {
            addCriterion("temp in", values, "temp");
            return (Criteria) this;
        }

        public Criteria andTempNotIn(List<Double> values) {
            addCriterion("temp not in", values, "temp");
            return (Criteria) this;
        }

        public Criteria andTempBetween(Double value1, Double value2) {
            addCriterion("temp between", value1, value2, "temp");
            return (Criteria) this;
        }

        public Criteria andTempNotBetween(Double value1, Double value2) {
            addCriterion("temp not between", value1, value2, "temp");
            return (Criteria) this;
        }

        public Criteria andHumiIsNull() {
            addCriterion("humi is null");
            return (Criteria) this;
        }

        public Criteria andHumiIsNotNull() {
            addCriterion("humi is not null");
            return (Criteria) this;
        }

        public Criteria andHumiEqualTo(Double value) {
            addCriterion("humi =", value, "humi");
            return (Criteria) this;
        }

        public Criteria andHumiNotEqualTo(Double value) {
            addCriterion("humi <>", value, "humi");
            return (Criteria) this;
        }

        public Criteria andHumiGreaterThan(Double value) {
            addCriterion("humi >", value, "humi");
            return (Criteria) this;
        }

        public Criteria andHumiGreaterThanOrEqualTo(Double value) {
            addCriterion("humi >=", value, "humi");
            return (Criteria) this;
        }

        public Criteria andHumiLessThan(Double value) {
            addCriterion("humi <", value, "humi");
            return (Criteria) this;
        }

        public Criteria andHumiLessThanOrEqualTo(Double value) {
            addCriterion("humi <=", value, "humi");
            return (Criteria) this;
        }

        public Criteria andHumiIn(List<Double> values) {
            addCriterion("humi in", values, "humi");
            return (Criteria) this;
        }

        public Criteria andHumiNotIn(List<Double> values) {
            addCriterion("humi not in", values, "humi");
            return (Criteria) this;
        }

        public Criteria andHumiBetween(Double value1, Double value2) {
            addCriterion("humi between", value1, value2, "humi");
            return (Criteria) this;
        }

        public Criteria andHumiNotBetween(Double value1, Double value2) {
            addCriterion("humi not between", value1, value2, "humi");
            return (Criteria) this;
        }

        public Criteria andLightIsNull() {
            addCriterion("light is null");
            return (Criteria) this;
        }

        public Criteria andLightIsNotNull() {
            addCriterion("light is not null");
            return (Criteria) this;
        }

        public Criteria andLightEqualTo(Double value) {
            addCriterion("light =", value, "light");
            return (Criteria) this;
        }

        public Criteria andLightNotEqualTo(Double value) {
            addCriterion("light <>", value, "light");
            return (Criteria) this;
        }

        public Criteria andLightGreaterThan(Double value) {
            addCriterion("light >", value, "light");
            return (Criteria) this;
        }

        public Criteria andLightGreaterThanOrEqualTo(Double value) {
            addCriterion("light >=", value, "light");
            return (Criteria) this;
        }

        public Criteria andLightLessThan(Double value) {
            addCriterion("light <", value, "light");
            return (Criteria) this;
        }

        public Criteria andLightLessThanOrEqualTo(Double value) {
            addCriterion("light <=", value, "light");
            return (Criteria) this;
        }

        public Criteria andLightIn(List<Double> values) {
            addCriterion("light in", values, "light");
            return (Criteria) this;
        }

        public Criteria andLightNotIn(List<Double> values) {
            addCriterion("light not in", values, "light");
            return (Criteria) this;
        }

        public Criteria andLightBetween(Double value1, Double value2) {
            addCriterion("light between", value1, value2, "light");
            return (Criteria) this;
        }

        public Criteria andLightNotBetween(Double value1, Double value2) {
            addCriterion("light not between", value1, value2, "light");
            return (Criteria) this;
        }

        public Criteria andPressIsNull() {
            addCriterion("press is null");
            return (Criteria) this;
        }

        public Criteria andPressIsNotNull() {
            addCriterion("press is not null");
            return (Criteria) this;
        }

        public Criteria andPressEqualTo(Double value) {
            addCriterion("press =", value, "press");
            return (Criteria) this;
        }

        public Criteria andPressNotEqualTo(Double value) {
            addCriterion("press <>", value, "press");
            return (Criteria) this;
        }

        public Criteria andPressGreaterThan(Double value) {
            addCriterion("press >", value, "press");
            return (Criteria) this;
        }

        public Criteria andPressGreaterThanOrEqualTo(Double value) {
            addCriterion("press >=", value, "press");
            return (Criteria) this;
        }

        public Criteria andPressLessThan(Double value) {
            addCriterion("press <", value, "press");
            return (Criteria) this;
        }

        public Criteria andPressLessThanOrEqualTo(Double value) {
            addCriterion("press <=", value, "press");
            return (Criteria) this;
        }

        public Criteria andPressIn(List<Double> values) {
            addCriterion("press in", values, "press");
            return (Criteria) this;
        }

        public Criteria andPressNotIn(List<Double> values) {
            addCriterion("press not in", values, "press");
            return (Criteria) this;
        }

        public Criteria andPressBetween(Double value1, Double value2) {
            addCriterion("press between", value1, value2, "press");
            return (Criteria) this;
        }

        public Criteria andPressNotBetween(Double value1, Double value2) {
            addCriterion("press not between", value1, value2, "press");
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