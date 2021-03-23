package com.legou.entry;

import java.util.ArrayList;
import java.util.List;

public class AddressExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public AddressExample() {
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

        public Criteria andAIdIsNull() {
            addCriterion("a_id is null");
            return (Criteria) this;
        }

        public Criteria andAIdIsNotNull() {
            addCriterion("a_id is not null");
            return (Criteria) this;
        }

        public Criteria andAIdEqualTo(String value) {
            addCriterion("a_id =", value, "aId");
            return (Criteria) this;
        }

        public Criteria andAIdNotEqualTo(String value) {
            addCriterion("a_id <>", value, "aId");
            return (Criteria) this;
        }

        public Criteria andAIdGreaterThan(String value) {
            addCriterion("a_id >", value, "aId");
            return (Criteria) this;
        }

        public Criteria andAIdGreaterThanOrEqualTo(String value) {
            addCriterion("a_id >=", value, "aId");
            return (Criteria) this;
        }

        public Criteria andAIdLessThan(String value) {
            addCriterion("a_id <", value, "aId");
            return (Criteria) this;
        }

        public Criteria andAIdLessThanOrEqualTo(String value) {
            addCriterion("a_id <=", value, "aId");
            return (Criteria) this;
        }

        public Criteria andAIdLike(String value) {
            addCriterion("a_id like", value, "aId");
            return (Criteria) this;
        }

        public Criteria andAIdNotLike(String value) {
            addCriterion("a_id not like", value, "aId");
            return (Criteria) this;
        }

        public Criteria andAIdIn(List<String> values) {
            addCriterion("a_id in", values, "aId");
            return (Criteria) this;
        }

        public Criteria andAIdNotIn(List<String> values) {
            addCriterion("a_id not in", values, "aId");
            return (Criteria) this;
        }

        public Criteria andAIdBetween(String value1, String value2) {
            addCriterion("a_id between", value1, value2, "aId");
            return (Criteria) this;
        }

        public Criteria andAIdNotBetween(String value1, String value2) {
            addCriterion("a_id not between", value1, value2, "aId");
            return (Criteria) this;
        }

        public Criteria andANameIsNull() {
            addCriterion("a_name is null");
            return (Criteria) this;
        }

        public Criteria andANameIsNotNull() {
            addCriterion("a_name is not null");
            return (Criteria) this;
        }

        public Criteria andANameEqualTo(String value) {
            addCriterion("a_name =", value, "aName");
            return (Criteria) this;
        }

        public Criteria andANameNotEqualTo(String value) {
            addCriterion("a_name <>", value, "aName");
            return (Criteria) this;
        }

        public Criteria andANameGreaterThan(String value) {
            addCriterion("a_name >", value, "aName");
            return (Criteria) this;
        }

        public Criteria andANameGreaterThanOrEqualTo(String value) {
            addCriterion("a_name >=", value, "aName");
            return (Criteria) this;
        }

        public Criteria andANameLessThan(String value) {
            addCriterion("a_name <", value, "aName");
            return (Criteria) this;
        }

        public Criteria andANameLessThanOrEqualTo(String value) {
            addCriterion("a_name <=", value, "aName");
            return (Criteria) this;
        }

        public Criteria andANameLike(String value) {
            addCriterion("a_name like", value, "aName");
            return (Criteria) this;
        }

        public Criteria andANameNotLike(String value) {
            addCriterion("a_name not like", value, "aName");
            return (Criteria) this;
        }

        public Criteria andANameIn(List<String> values) {
            addCriterion("a_name in", values, "aName");
            return (Criteria) this;
        }

        public Criteria andANameNotIn(List<String> values) {
            addCriterion("a_name not in", values, "aName");
            return (Criteria) this;
        }

        public Criteria andANameBetween(String value1, String value2) {
            addCriterion("a_name between", value1, value2, "aName");
            return (Criteria) this;
        }

        public Criteria andANameNotBetween(String value1, String value2) {
            addCriterion("a_name not between", value1, value2, "aName");
            return (Criteria) this;
        }

        public Criteria andAPhoneIsNull() {
            addCriterion("a_phone is null");
            return (Criteria) this;
        }

        public Criteria andAPhoneIsNotNull() {
            addCriterion("a_phone is not null");
            return (Criteria) this;
        }

        public Criteria andAPhoneEqualTo(String value) {
            addCriterion("a_phone =", value, "aPhone");
            return (Criteria) this;
        }

        public Criteria andAPhoneNotEqualTo(String value) {
            addCriterion("a_phone <>", value, "aPhone");
            return (Criteria) this;
        }

        public Criteria andAPhoneGreaterThan(String value) {
            addCriterion("a_phone >", value, "aPhone");
            return (Criteria) this;
        }

        public Criteria andAPhoneGreaterThanOrEqualTo(String value) {
            addCriterion("a_phone >=", value, "aPhone");
            return (Criteria) this;
        }

        public Criteria andAPhoneLessThan(String value) {
            addCriterion("a_phone <", value, "aPhone");
            return (Criteria) this;
        }

        public Criteria andAPhoneLessThanOrEqualTo(String value) {
            addCriterion("a_phone <=", value, "aPhone");
            return (Criteria) this;
        }

        public Criteria andAPhoneLike(String value) {
            addCriterion("a_phone like", value, "aPhone");
            return (Criteria) this;
        }

        public Criteria andAPhoneNotLike(String value) {
            addCriterion("a_phone not like", value, "aPhone");
            return (Criteria) this;
        }

        public Criteria andAPhoneIn(List<String> values) {
            addCriterion("a_phone in", values, "aPhone");
            return (Criteria) this;
        }

        public Criteria andAPhoneNotIn(List<String> values) {
            addCriterion("a_phone not in", values, "aPhone");
            return (Criteria) this;
        }

        public Criteria andAPhoneBetween(String value1, String value2) {
            addCriterion("a_phone between", value1, value2, "aPhone");
            return (Criteria) this;
        }

        public Criteria andAPhoneNotBetween(String value1, String value2) {
            addCriterion("a_phone not between", value1, value2, "aPhone");
            return (Criteria) this;
        }

        public Criteria andAProvinceIsNull() {
            addCriterion("a_province is null");
            return (Criteria) this;
        }

        public Criteria andAProvinceIsNotNull() {
            addCriterion("a_province is not null");
            return (Criteria) this;
        }

        public Criteria andAProvinceEqualTo(String value) {
            addCriterion("a_province =", value, "aProvince");
            return (Criteria) this;
        }

        public Criteria andAProvinceNotEqualTo(String value) {
            addCriterion("a_province <>", value, "aProvince");
            return (Criteria) this;
        }

        public Criteria andAProvinceGreaterThan(String value) {
            addCriterion("a_province >", value, "aProvince");
            return (Criteria) this;
        }

        public Criteria andAProvinceGreaterThanOrEqualTo(String value) {
            addCriterion("a_province >=", value, "aProvince");
            return (Criteria) this;
        }

        public Criteria andAProvinceLessThan(String value) {
            addCriterion("a_province <", value, "aProvince");
            return (Criteria) this;
        }

        public Criteria andAProvinceLessThanOrEqualTo(String value) {
            addCriterion("a_province <=", value, "aProvince");
            return (Criteria) this;
        }

        public Criteria andAProvinceLike(String value) {
            addCriterion("a_province like", value, "aProvince");
            return (Criteria) this;
        }

        public Criteria andAProvinceNotLike(String value) {
            addCriterion("a_province not like", value, "aProvince");
            return (Criteria) this;
        }

        public Criteria andAProvinceIn(List<String> values) {
            addCriterion("a_province in", values, "aProvince");
            return (Criteria) this;
        }

        public Criteria andAProvinceNotIn(List<String> values) {
            addCriterion("a_province not in", values, "aProvince");
            return (Criteria) this;
        }

        public Criteria andAProvinceBetween(String value1, String value2) {
            addCriterion("a_province between", value1, value2, "aProvince");
            return (Criteria) this;
        }

        public Criteria andAProvinceNotBetween(String value1, String value2) {
            addCriterion("a_province not between", value1, value2, "aProvince");
            return (Criteria) this;
        }

        public Criteria andACityIsNull() {
            addCriterion("a_city is null");
            return (Criteria) this;
        }

        public Criteria andACityIsNotNull() {
            addCriterion("a_city is not null");
            return (Criteria) this;
        }

        public Criteria andACityEqualTo(String value) {
            addCriterion("a_city =", value, "aCity");
            return (Criteria) this;
        }

        public Criteria andACityNotEqualTo(String value) {
            addCriterion("a_city <>", value, "aCity");
            return (Criteria) this;
        }

        public Criteria andACityGreaterThan(String value) {
            addCriterion("a_city >", value, "aCity");
            return (Criteria) this;
        }

        public Criteria andACityGreaterThanOrEqualTo(String value) {
            addCriterion("a_city >=", value, "aCity");
            return (Criteria) this;
        }

        public Criteria andACityLessThan(String value) {
            addCriterion("a_city <", value, "aCity");
            return (Criteria) this;
        }

        public Criteria andACityLessThanOrEqualTo(String value) {
            addCriterion("a_city <=", value, "aCity");
            return (Criteria) this;
        }

        public Criteria andACityLike(String value) {
            addCriterion("a_city like", value, "aCity");
            return (Criteria) this;
        }

        public Criteria andACityNotLike(String value) {
            addCriterion("a_city not like", value, "aCity");
            return (Criteria) this;
        }

        public Criteria andACityIn(List<String> values) {
            addCriterion("a_city in", values, "aCity");
            return (Criteria) this;
        }

        public Criteria andACityNotIn(List<String> values) {
            addCriterion("a_city not in", values, "aCity");
            return (Criteria) this;
        }

        public Criteria andACityBetween(String value1, String value2) {
            addCriterion("a_city between", value1, value2, "aCity");
            return (Criteria) this;
        }

        public Criteria andACityNotBetween(String value1, String value2) {
            addCriterion("a_city not between", value1, value2, "aCity");
            return (Criteria) this;
        }

        public Criteria andADistrictIsNull() {
            addCriterion("a_district is null");
            return (Criteria) this;
        }

        public Criteria andADistrictIsNotNull() {
            addCriterion("a_district is not null");
            return (Criteria) this;
        }

        public Criteria andADistrictEqualTo(String value) {
            addCriterion("a_district =", value, "aDistrict");
            return (Criteria) this;
        }

        public Criteria andADistrictNotEqualTo(String value) {
            addCriterion("a_district <>", value, "aDistrict");
            return (Criteria) this;
        }

        public Criteria andADistrictGreaterThan(String value) {
            addCriterion("a_district >", value, "aDistrict");
            return (Criteria) this;
        }

        public Criteria andADistrictGreaterThanOrEqualTo(String value) {
            addCriterion("a_district >=", value, "aDistrict");
            return (Criteria) this;
        }

        public Criteria andADistrictLessThan(String value) {
            addCriterion("a_district <", value, "aDistrict");
            return (Criteria) this;
        }

        public Criteria andADistrictLessThanOrEqualTo(String value) {
            addCriterion("a_district <=", value, "aDistrict");
            return (Criteria) this;
        }

        public Criteria andADistrictLike(String value) {
            addCriterion("a_district like", value, "aDistrict");
            return (Criteria) this;
        }

        public Criteria andADistrictNotLike(String value) {
            addCriterion("a_district not like", value, "aDistrict");
            return (Criteria) this;
        }

        public Criteria andADistrictIn(List<String> values) {
            addCriterion("a_district in", values, "aDistrict");
            return (Criteria) this;
        }

        public Criteria andADistrictNotIn(List<String> values) {
            addCriterion("a_district not in", values, "aDistrict");
            return (Criteria) this;
        }

        public Criteria andADistrictBetween(String value1, String value2) {
            addCriterion("a_district between", value1, value2, "aDistrict");
            return (Criteria) this;
        }

        public Criteria andADistrictNotBetween(String value1, String value2) {
            addCriterion("a_district not between", value1, value2, "aDistrict");
            return (Criteria) this;
        }

        public Criteria andAInfoIsNull() {
            addCriterion("a_info is null");
            return (Criteria) this;
        }

        public Criteria andAInfoIsNotNull() {
            addCriterion("a_info is not null");
            return (Criteria) this;
        }

        public Criteria andAInfoEqualTo(String value) {
            addCriterion("a_info =", value, "aInfo");
            return (Criteria) this;
        }

        public Criteria andAInfoNotEqualTo(String value) {
            addCriterion("a_info <>", value, "aInfo");
            return (Criteria) this;
        }

        public Criteria andAInfoGreaterThan(String value) {
            addCriterion("a_info >", value, "aInfo");
            return (Criteria) this;
        }

        public Criteria andAInfoGreaterThanOrEqualTo(String value) {
            addCriterion("a_info >=", value, "aInfo");
            return (Criteria) this;
        }

        public Criteria andAInfoLessThan(String value) {
            addCriterion("a_info <", value, "aInfo");
            return (Criteria) this;
        }

        public Criteria andAInfoLessThanOrEqualTo(String value) {
            addCriterion("a_info <=", value, "aInfo");
            return (Criteria) this;
        }

        public Criteria andAInfoLike(String value) {
            addCriterion("a_info like", value, "aInfo");
            return (Criteria) this;
        }

        public Criteria andAInfoNotLike(String value) {
            addCriterion("a_info not like", value, "aInfo");
            return (Criteria) this;
        }

        public Criteria andAInfoIn(List<String> values) {
            addCriterion("a_info in", values, "aInfo");
            return (Criteria) this;
        }

        public Criteria andAInfoNotIn(List<String> values) {
            addCriterion("a_info not in", values, "aInfo");
            return (Criteria) this;
        }

        public Criteria andAInfoBetween(String value1, String value2) {
            addCriterion("a_info between", value1, value2, "aInfo");
            return (Criteria) this;
        }

        public Criteria andAInfoNotBetween(String value1, String value2) {
            addCriterion("a_info not between", value1, value2, "aInfo");
            return (Criteria) this;
        }

        public Criteria andAStatusIsNull() {
            addCriterion("a_status is null");
            return (Criteria) this;
        }

        public Criteria andAStatusIsNotNull() {
            addCriterion("a_status is not null");
            return (Criteria) this;
        }

        public Criteria andAStatusEqualTo(Integer value) {
            addCriterion("a_status =", value, "aStatus");
            return (Criteria) this;
        }

        public Criteria andAStatusNotEqualTo(Integer value) {
            addCriterion("a_status <>", value, "aStatus");
            return (Criteria) this;
        }

        public Criteria andAStatusGreaterThan(Integer value) {
            addCriterion("a_status >", value, "aStatus");
            return (Criteria) this;
        }

        public Criteria andAStatusGreaterThanOrEqualTo(Integer value) {
            addCriterion("a_status >=", value, "aStatus");
            return (Criteria) this;
        }

        public Criteria andAStatusLessThan(Integer value) {
            addCriterion("a_status <", value, "aStatus");
            return (Criteria) this;
        }

        public Criteria andAStatusLessThanOrEqualTo(Integer value) {
            addCriterion("a_status <=", value, "aStatus");
            return (Criteria) this;
        }

        public Criteria andAStatusIn(List<Integer> values) {
            addCriterion("a_status in", values, "aStatus");
            return (Criteria) this;
        }

        public Criteria andAStatusNotIn(List<Integer> values) {
            addCriterion("a_status not in", values, "aStatus");
            return (Criteria) this;
        }

        public Criteria andAStatusBetween(Integer value1, Integer value2) {
            addCriterion("a_status between", value1, value2, "aStatus");
            return (Criteria) this;
        }

        public Criteria andAStatusNotBetween(Integer value1, Integer value2) {
            addCriterion("a_status not between", value1, value2, "aStatus");
            return (Criteria) this;
        }

        public Criteria andAAddtimeIsNull() {
            addCriterion("a_addtime is null");
            return (Criteria) this;
        }

        public Criteria andAAddtimeIsNotNull() {
            addCriterion("a_addtime is not null");
            return (Criteria) this;
        }

        public Criteria andAAddtimeEqualTo(String value) {
            addCriterion("a_addtime =", value, "aAddtime");
            return (Criteria) this;
        }

        public Criteria andAAddtimeNotEqualTo(String value) {
            addCriterion("a_addtime <>", value, "aAddtime");
            return (Criteria) this;
        }

        public Criteria andAAddtimeGreaterThan(String value) {
            addCriterion("a_addtime >", value, "aAddtime");
            return (Criteria) this;
        }

        public Criteria andAAddtimeGreaterThanOrEqualTo(String value) {
            addCriterion("a_addtime >=", value, "aAddtime");
            return (Criteria) this;
        }

        public Criteria andAAddtimeLessThan(String value) {
            addCriterion("a_addtime <", value, "aAddtime");
            return (Criteria) this;
        }

        public Criteria andAAddtimeLessThanOrEqualTo(String value) {
            addCriterion("a_addtime <=", value, "aAddtime");
            return (Criteria) this;
        }

        public Criteria andAAddtimeLike(String value) {
            addCriterion("a_addtime like", value, "aAddtime");
            return (Criteria) this;
        }

        public Criteria andAAddtimeNotLike(String value) {
            addCriterion("a_addtime not like", value, "aAddtime");
            return (Criteria) this;
        }

        public Criteria andAAddtimeIn(List<String> values) {
            addCriterion("a_addtime in", values, "aAddtime");
            return (Criteria) this;
        }

        public Criteria andAAddtimeNotIn(List<String> values) {
            addCriterion("a_addtime not in", values, "aAddtime");
            return (Criteria) this;
        }

        public Criteria andAAddtimeBetween(String value1, String value2) {
            addCriterion("a_addtime between", value1, value2, "aAddtime");
            return (Criteria) this;
        }

        public Criteria andAAddtimeNotBetween(String value1, String value2) {
            addCriterion("a_addtime not between", value1, value2, "aAddtime");
            return (Criteria) this;
        }

        public Criteria andCIdIsNull() {
            addCriterion("c_id is null");
            return (Criteria) this;
        }

        public Criteria andCIdIsNotNull() {
            addCriterion("c_id is not null");
            return (Criteria) this;
        }

        public Criteria andCIdEqualTo(String value) {
            addCriterion("c_id =", value, "cId");
            return (Criteria) this;
        }

        public Criteria andCIdNotEqualTo(String value) {
            addCriterion("c_id <>", value, "cId");
            return (Criteria) this;
        }

        public Criteria andCIdGreaterThan(String value) {
            addCriterion("c_id >", value, "cId");
            return (Criteria) this;
        }

        public Criteria andCIdGreaterThanOrEqualTo(String value) {
            addCriterion("c_id >=", value, "cId");
            return (Criteria) this;
        }

        public Criteria andCIdLessThan(String value) {
            addCriterion("c_id <", value, "cId");
            return (Criteria) this;
        }

        public Criteria andCIdLessThanOrEqualTo(String value) {
            addCriterion("c_id <=", value, "cId");
            return (Criteria) this;
        }

        public Criteria andCIdLike(String value) {
            addCriterion("c_id like", value, "cId");
            return (Criteria) this;
        }

        public Criteria andCIdNotLike(String value) {
            addCriterion("c_id not like", value, "cId");
            return (Criteria) this;
        }

        public Criteria andCIdIn(List<String> values) {
            addCriterion("c_id in", values, "cId");
            return (Criteria) this;
        }

        public Criteria andCIdNotIn(List<String> values) {
            addCriterion("c_id not in", values, "cId");
            return (Criteria) this;
        }

        public Criteria andCIdBetween(String value1, String value2) {
            addCriterion("c_id between", value1, value2, "cId");
            return (Criteria) this;
        }

        public Criteria andCIdNotBetween(String value1, String value2) {
            addCriterion("c_id not between", value1, value2, "cId");
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