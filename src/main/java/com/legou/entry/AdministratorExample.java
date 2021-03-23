package com.legou.entry;

import java.util.ArrayList;
import java.util.List;

public class AdministratorExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public AdministratorExample() {
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

        public Criteria andAdminIdIsNull() {
            addCriterion("admin_id is null");
            return (Criteria) this;
        }

        public Criteria andAdminIdIsNotNull() {
            addCriterion("admin_id is not null");
            return (Criteria) this;
        }

        public Criteria andAdminIdEqualTo(String value) {
            addCriterion("admin_id =", value, "adminId");
            return (Criteria) this;
        }

        public Criteria andAdminIdNotEqualTo(String value) {
            addCriterion("admin_id <>", value, "adminId");
            return (Criteria) this;
        }

        public Criteria andAdminIdGreaterThan(String value) {
            addCriterion("admin_id >", value, "adminId");
            return (Criteria) this;
        }

        public Criteria andAdminIdGreaterThanOrEqualTo(String value) {
            addCriterion("admin_id >=", value, "adminId");
            return (Criteria) this;
        }

        public Criteria andAdminIdLessThan(String value) {
            addCriterion("admin_id <", value, "adminId");
            return (Criteria) this;
        }

        public Criteria andAdminIdLessThanOrEqualTo(String value) {
            addCriterion("admin_id <=", value, "adminId");
            return (Criteria) this;
        }

        public Criteria andAdminIdLike(String value) {
            addCriterion("admin_id like", value, "adminId");
            return (Criteria) this;
        }

        public Criteria andAdminIdNotLike(String value) {
            addCriterion("admin_id not like", value, "adminId");
            return (Criteria) this;
        }

        public Criteria andAdminIdIn(List<String> values) {
            addCriterion("admin_id in", values, "adminId");
            return (Criteria) this;
        }

        public Criteria andAdminIdNotIn(List<String> values) {
            addCriterion("admin_id not in", values, "adminId");
            return (Criteria) this;
        }

        public Criteria andAdminIdBetween(String value1, String value2) {
            addCriterion("admin_id between", value1, value2, "adminId");
            return (Criteria) this;
        }

        public Criteria andAdminIdNotBetween(String value1, String value2) {
            addCriterion("admin_id not between", value1, value2, "adminId");
            return (Criteria) this;
        }

        public Criteria andAdminNameIsNull() {
            addCriterion("admin_name is null");
            return (Criteria) this;
        }

        public Criteria andAdminNameIsNotNull() {
            addCriterion("admin_name is not null");
            return (Criteria) this;
        }

        public Criteria andAdminNameEqualTo(String value) {
            addCriterion("admin_name =", value, "adminName");
            return (Criteria) this;
        }

        public Criteria andAdminNameNotEqualTo(String value) {
            addCriterion("admin_name <>", value, "adminName");
            return (Criteria) this;
        }

        public Criteria andAdminNameGreaterThan(String value) {
            addCriterion("admin_name >", value, "adminName");
            return (Criteria) this;
        }

        public Criteria andAdminNameGreaterThanOrEqualTo(String value) {
            addCriterion("admin_name >=", value, "adminName");
            return (Criteria) this;
        }

        public Criteria andAdminNameLessThan(String value) {
            addCriterion("admin_name <", value, "adminName");
            return (Criteria) this;
        }

        public Criteria andAdminNameLessThanOrEqualTo(String value) {
            addCriterion("admin_name <=", value, "adminName");
            return (Criteria) this;
        }

        public Criteria andAdminNameLike(String value) {
            addCriterion("admin_name like", value, "adminName");
            return (Criteria) this;
        }

        public Criteria andAdminNameNotLike(String value) {
            addCriterion("admin_name not like", value, "adminName");
            return (Criteria) this;
        }

        public Criteria andAdminNameIn(List<String> values) {
            addCriterion("admin_name in", values, "adminName");
            return (Criteria) this;
        }

        public Criteria andAdminNameNotIn(List<String> values) {
            addCriterion("admin_name not in", values, "adminName");
            return (Criteria) this;
        }

        public Criteria andAdminNameBetween(String value1, String value2) {
            addCriterion("admin_name between", value1, value2, "adminName");
            return (Criteria) this;
        }

        public Criteria andAdminNameNotBetween(String value1, String value2) {
            addCriterion("admin_name not between", value1, value2, "adminName");
            return (Criteria) this;
        }

        public Criteria andAdminPasswordIsNull() {
            addCriterion("admin_password is null");
            return (Criteria) this;
        }

        public Criteria andAdminPasswordIsNotNull() {
            addCriterion("admin_password is not null");
            return (Criteria) this;
        }

        public Criteria andAdminPasswordEqualTo(String value) {
            addCriterion("admin_password =", value, "adminPassword");
            return (Criteria) this;
        }

        public Criteria andAdminPasswordNotEqualTo(String value) {
            addCriterion("admin_password <>", value, "adminPassword");
            return (Criteria) this;
        }

        public Criteria andAdminPasswordGreaterThan(String value) {
            addCriterion("admin_password >", value, "adminPassword");
            return (Criteria) this;
        }

        public Criteria andAdminPasswordGreaterThanOrEqualTo(String value) {
            addCriterion("admin_password >=", value, "adminPassword");
            return (Criteria) this;
        }

        public Criteria andAdminPasswordLessThan(String value) {
            addCriterion("admin_password <", value, "adminPassword");
            return (Criteria) this;
        }

        public Criteria andAdminPasswordLessThanOrEqualTo(String value) {
            addCriterion("admin_password <=", value, "adminPassword");
            return (Criteria) this;
        }

        public Criteria andAdminPasswordLike(String value) {
            addCriterion("admin_password like", value, "adminPassword");
            return (Criteria) this;
        }

        public Criteria andAdminPasswordNotLike(String value) {
            addCriterion("admin_password not like", value, "adminPassword");
            return (Criteria) this;
        }

        public Criteria andAdminPasswordIn(List<String> values) {
            addCriterion("admin_password in", values, "adminPassword");
            return (Criteria) this;
        }

        public Criteria andAdminPasswordNotIn(List<String> values) {
            addCriterion("admin_password not in", values, "adminPassword");
            return (Criteria) this;
        }

        public Criteria andAdminPasswordBetween(String value1, String value2) {
            addCriterion("admin_password between", value1, value2, "adminPassword");
            return (Criteria) this;
        }

        public Criteria andAdminPasswordNotBetween(String value1, String value2) {
            addCriterion("admin_password not between", value1, value2, "adminPassword");
            return (Criteria) this;
        }

        public Criteria andAdminGenderIsNull() {
            addCriterion("admin_gender is null");
            return (Criteria) this;
        }

        public Criteria andAdminGenderIsNotNull() {
            addCriterion("admin_gender is not null");
            return (Criteria) this;
        }

        public Criteria andAdminGenderEqualTo(Integer value) {
            addCriterion("admin_gender =", value, "adminGender");
            return (Criteria) this;
        }

        public Criteria andAdminGenderNotEqualTo(Integer value) {
            addCriterion("admin_gender <>", value, "adminGender");
            return (Criteria) this;
        }

        public Criteria andAdminGenderGreaterThan(Integer value) {
            addCriterion("admin_gender >", value, "adminGender");
            return (Criteria) this;
        }

        public Criteria andAdminGenderGreaterThanOrEqualTo(Integer value) {
            addCriterion("admin_gender >=", value, "adminGender");
            return (Criteria) this;
        }

        public Criteria andAdminGenderLessThan(Integer value) {
            addCriterion("admin_gender <", value, "adminGender");
            return (Criteria) this;
        }

        public Criteria andAdminGenderLessThanOrEqualTo(Integer value) {
            addCriterion("admin_gender <=", value, "adminGender");
            return (Criteria) this;
        }

        public Criteria andAdminGenderIn(List<Integer> values) {
            addCriterion("admin_gender in", values, "adminGender");
            return (Criteria) this;
        }

        public Criteria andAdminGenderNotIn(List<Integer> values) {
            addCriterion("admin_gender not in", values, "adminGender");
            return (Criteria) this;
        }

        public Criteria andAdminGenderBetween(Integer value1, Integer value2) {
            addCriterion("admin_gender between", value1, value2, "adminGender");
            return (Criteria) this;
        }

        public Criteria andAdminGenderNotBetween(Integer value1, Integer value2) {
            addCriterion("admin_gender not between", value1, value2, "adminGender");
            return (Criteria) this;
        }

        public Criteria andAdminEmailIsNull() {
            addCriterion("admin_email is null");
            return (Criteria) this;
        }

        public Criteria andAdminEmailIsNotNull() {
            addCriterion("admin_email is not null");
            return (Criteria) this;
        }

        public Criteria andAdminEmailEqualTo(String value) {
            addCriterion("admin_email =", value, "adminEmail");
            return (Criteria) this;
        }

        public Criteria andAdminEmailNotEqualTo(String value) {
            addCriterion("admin_email <>", value, "adminEmail");
            return (Criteria) this;
        }

        public Criteria andAdminEmailGreaterThan(String value) {
            addCriterion("admin_email >", value, "adminEmail");
            return (Criteria) this;
        }

        public Criteria andAdminEmailGreaterThanOrEqualTo(String value) {
            addCriterion("admin_email >=", value, "adminEmail");
            return (Criteria) this;
        }

        public Criteria andAdminEmailLessThan(String value) {
            addCriterion("admin_email <", value, "adminEmail");
            return (Criteria) this;
        }

        public Criteria andAdminEmailLessThanOrEqualTo(String value) {
            addCriterion("admin_email <=", value, "adminEmail");
            return (Criteria) this;
        }

        public Criteria andAdminEmailLike(String value) {
            addCriterion("admin_email like", value, "adminEmail");
            return (Criteria) this;
        }

        public Criteria andAdminEmailNotLike(String value) {
            addCriterion("admin_email not like", value, "adminEmail");
            return (Criteria) this;
        }

        public Criteria andAdminEmailIn(List<String> values) {
            addCriterion("admin_email in", values, "adminEmail");
            return (Criteria) this;
        }

        public Criteria andAdminEmailNotIn(List<String> values) {
            addCriterion("admin_email not in", values, "adminEmail");
            return (Criteria) this;
        }

        public Criteria andAdminEmailBetween(String value1, String value2) {
            addCriterion("admin_email between", value1, value2, "adminEmail");
            return (Criteria) this;
        }

        public Criteria andAdminEmailNotBetween(String value1, String value2) {
            addCriterion("admin_email not between", value1, value2, "adminEmail");
            return (Criteria) this;
        }

        public Criteria andAdminPhoneIsNull() {
            addCriterion("admin_phone is null");
            return (Criteria) this;
        }

        public Criteria andAdminPhoneIsNotNull() {
            addCriterion("admin_phone is not null");
            return (Criteria) this;
        }

        public Criteria andAdminPhoneEqualTo(String value) {
            addCriterion("admin_phone =", value, "adminPhone");
            return (Criteria) this;
        }

        public Criteria andAdminPhoneNotEqualTo(String value) {
            addCriterion("admin_phone <>", value, "adminPhone");
            return (Criteria) this;
        }

        public Criteria andAdminPhoneGreaterThan(String value) {
            addCriterion("admin_phone >", value, "adminPhone");
            return (Criteria) this;
        }

        public Criteria andAdminPhoneGreaterThanOrEqualTo(String value) {
            addCriterion("admin_phone >=", value, "adminPhone");
            return (Criteria) this;
        }

        public Criteria andAdminPhoneLessThan(String value) {
            addCriterion("admin_phone <", value, "adminPhone");
            return (Criteria) this;
        }

        public Criteria andAdminPhoneLessThanOrEqualTo(String value) {
            addCriterion("admin_phone <=", value, "adminPhone");
            return (Criteria) this;
        }

        public Criteria andAdminPhoneLike(String value) {
            addCriterion("admin_phone like", value, "adminPhone");
            return (Criteria) this;
        }

        public Criteria andAdminPhoneNotLike(String value) {
            addCriterion("admin_phone not like", value, "adminPhone");
            return (Criteria) this;
        }

        public Criteria andAdminPhoneIn(List<String> values) {
            addCriterion("admin_phone in", values, "adminPhone");
            return (Criteria) this;
        }

        public Criteria andAdminPhoneNotIn(List<String> values) {
            addCriterion("admin_phone not in", values, "adminPhone");
            return (Criteria) this;
        }

        public Criteria andAdminPhoneBetween(String value1, String value2) {
            addCriterion("admin_phone between", value1, value2, "adminPhone");
            return (Criteria) this;
        }

        public Criteria andAdminPhoneNotBetween(String value1, String value2) {
            addCriterion("admin_phone not between", value1, value2, "adminPhone");
            return (Criteria) this;
        }

        public Criteria andAdminCreatetimeIsNull() {
            addCriterion("admin_createtime is null");
            return (Criteria) this;
        }

        public Criteria andAdminCreatetimeIsNotNull() {
            addCriterion("admin_createtime is not null");
            return (Criteria) this;
        }

        public Criteria andAdminCreatetimeEqualTo(String value) {
            addCriterion("admin_createtime =", value, "adminCreatetime");
            return (Criteria) this;
        }

        public Criteria andAdminCreatetimeNotEqualTo(String value) {
            addCriterion("admin_createtime <>", value, "adminCreatetime");
            return (Criteria) this;
        }

        public Criteria andAdminCreatetimeGreaterThan(String value) {
            addCriterion("admin_createtime >", value, "adminCreatetime");
            return (Criteria) this;
        }

        public Criteria andAdminCreatetimeGreaterThanOrEqualTo(String value) {
            addCriterion("admin_createtime >=", value, "adminCreatetime");
            return (Criteria) this;
        }

        public Criteria andAdminCreatetimeLessThan(String value) {
            addCriterion("admin_createtime <", value, "adminCreatetime");
            return (Criteria) this;
        }

        public Criteria andAdminCreatetimeLessThanOrEqualTo(String value) {
            addCriterion("admin_createtime <=", value, "adminCreatetime");
            return (Criteria) this;
        }

        public Criteria andAdminCreatetimeLike(String value) {
            addCriterion("admin_createtime like", value, "adminCreatetime");
            return (Criteria) this;
        }

        public Criteria andAdminCreatetimeNotLike(String value) {
            addCriterion("admin_createtime not like", value, "adminCreatetime");
            return (Criteria) this;
        }

        public Criteria andAdminCreatetimeIn(List<String> values) {
            addCriterion("admin_createtime in", values, "adminCreatetime");
            return (Criteria) this;
        }

        public Criteria andAdminCreatetimeNotIn(List<String> values) {
            addCriterion("admin_createtime not in", values, "adminCreatetime");
            return (Criteria) this;
        }

        public Criteria andAdminCreatetimeBetween(String value1, String value2) {
            addCriterion("admin_createtime between", value1, value2, "adminCreatetime");
            return (Criteria) this;
        }

        public Criteria andAdminCreatetimeNotBetween(String value1, String value2) {
            addCriterion("admin_createtime not between", value1, value2, "adminCreatetime");
            return (Criteria) this;
        }

        public Criteria andAdminImageIsNull() {
            addCriterion("admin_image is null");
            return (Criteria) this;
        }

        public Criteria andAdminImageIsNotNull() {
            addCriterion("admin_image is not null");
            return (Criteria) this;
        }

        public Criteria andAdminImageEqualTo(String value) {
            addCriterion("admin_image =", value, "adminImage");
            return (Criteria) this;
        }

        public Criteria andAdminImageNotEqualTo(String value) {
            addCriterion("admin_image <>", value, "adminImage");
            return (Criteria) this;
        }

        public Criteria andAdminImageGreaterThan(String value) {
            addCriterion("admin_image >", value, "adminImage");
            return (Criteria) this;
        }

        public Criteria andAdminImageGreaterThanOrEqualTo(String value) {
            addCriterion("admin_image >=", value, "adminImage");
            return (Criteria) this;
        }

        public Criteria andAdminImageLessThan(String value) {
            addCriterion("admin_image <", value, "adminImage");
            return (Criteria) this;
        }

        public Criteria andAdminImageLessThanOrEqualTo(String value) {
            addCriterion("admin_image <=", value, "adminImage");
            return (Criteria) this;
        }

        public Criteria andAdminImageLike(String value) {
            addCriterion("admin_image like", value, "adminImage");
            return (Criteria) this;
        }

        public Criteria andAdminImageNotLike(String value) {
            addCriterion("admin_image not like", value, "adminImage");
            return (Criteria) this;
        }

        public Criteria andAdminImageIn(List<String> values) {
            addCriterion("admin_image in", values, "adminImage");
            return (Criteria) this;
        }

        public Criteria andAdminImageNotIn(List<String> values) {
            addCriterion("admin_image not in", values, "adminImage");
            return (Criteria) this;
        }

        public Criteria andAdminImageBetween(String value1, String value2) {
            addCriterion("admin_image between", value1, value2, "adminImage");
            return (Criteria) this;
        }

        public Criteria andAdminImageNotBetween(String value1, String value2) {
            addCriterion("admin_image not between", value1, value2, "adminImage");
            return (Criteria) this;
        }

        public Criteria andAdminTypeIdIsNull() {
            addCriterion("admin_type_id is null");
            return (Criteria) this;
        }

        public Criteria andAdminTypeIdIsNotNull() {
            addCriterion("admin_type_id is not null");
            return (Criteria) this;
        }

        public Criteria andAdminTypeIdEqualTo(Integer value) {
            addCriterion("admin_type_id =", value, "adminTypeId");
            return (Criteria) this;
        }

        public Criteria andAdminTypeIdNotEqualTo(Integer value) {
            addCriterion("admin_type_id <>", value, "adminTypeId");
            return (Criteria) this;
        }

        public Criteria andAdminTypeIdGreaterThan(Integer value) {
            addCriterion("admin_type_id >", value, "adminTypeId");
            return (Criteria) this;
        }

        public Criteria andAdminTypeIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("admin_type_id >=", value, "adminTypeId");
            return (Criteria) this;
        }

        public Criteria andAdminTypeIdLessThan(Integer value) {
            addCriterion("admin_type_id <", value, "adminTypeId");
            return (Criteria) this;
        }

        public Criteria andAdminTypeIdLessThanOrEqualTo(Integer value) {
            addCriterion("admin_type_id <=", value, "adminTypeId");
            return (Criteria) this;
        }

        public Criteria andAdminTypeIdIn(List<Integer> values) {
            addCriterion("admin_type_id in", values, "adminTypeId");
            return (Criteria) this;
        }

        public Criteria andAdminTypeIdNotIn(List<Integer> values) {
            addCriterion("admin_type_id not in", values, "adminTypeId");
            return (Criteria) this;
        }

        public Criteria andAdminTypeIdBetween(Integer value1, Integer value2) {
            addCriterion("admin_type_id between", value1, value2, "adminTypeId");
            return (Criteria) this;
        }

        public Criteria andAdminTypeIdNotBetween(Integer value1, Integer value2) {
            addCriterion("admin_type_id not between", value1, value2, "adminTypeId");
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