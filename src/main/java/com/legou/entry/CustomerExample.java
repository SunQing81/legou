package com.legou.entry;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class CustomerExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public CustomerExample() {
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

        protected void addCriterionForJDBCDate(String condition, Date value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            addCriterion(condition, new java.sql.Date(value.getTime()), property);
        }

        protected void addCriterionForJDBCDate(String condition, List<Date> values, String property) {
            if (values == null || values.size() == 0) {
                throw new RuntimeException("Value list for " + property + " cannot be null or empty");
            }
            List<java.sql.Date> dateList = new ArrayList<>();
            Iterator<Date> iter = values.iterator();
            while (iter.hasNext()) {
                dateList.add(new java.sql.Date(iter.next().getTime()));
            }
            addCriterion(condition, dateList, property);
        }

        protected void addCriterionForJDBCDate(String condition, Date value1, Date value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            addCriterion(condition, new java.sql.Date(value1.getTime()), new java.sql.Date(value2.getTime()), property);
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

        public Criteria andCNameIsNull() {
            addCriterion("c_name is null");
            return (Criteria) this;
        }

        public Criteria andCNameIsNotNull() {
            addCriterion("c_name is not null");
            return (Criteria) this;
        }

        public Criteria andCNameEqualTo(String value) {
            addCriterion("c_name =", value, "cName");
            return (Criteria) this;
        }

        public Criteria andCNameNotEqualTo(String value) {
            addCriterion("c_name <>", value, "cName");
            return (Criteria) this;
        }

        public Criteria andCNameGreaterThan(String value) {
            addCriterion("c_name >", value, "cName");
            return (Criteria) this;
        }

        public Criteria andCNameGreaterThanOrEqualTo(String value) {
            addCriterion("c_name >=", value, "cName");
            return (Criteria) this;
        }

        public Criteria andCNameLessThan(String value) {
            addCriterion("c_name <", value, "cName");
            return (Criteria) this;
        }

        public Criteria andCNameLessThanOrEqualTo(String value) {
            addCriterion("c_name <=", value, "cName");
            return (Criteria) this;
        }

        public Criteria andCNameLike(String value) {
            addCriterion("c_name like", value, "cName");
            return (Criteria) this;
        }

        public Criteria andCNameNotLike(String value) {
            addCriterion("c_name not like", value, "cName");
            return (Criteria) this;
        }

        public Criteria andCNameIn(List<String> values) {
            addCriterion("c_name in", values, "cName");
            return (Criteria) this;
        }

        public Criteria andCNameNotIn(List<String> values) {
            addCriterion("c_name not in", values, "cName");
            return (Criteria) this;
        }

        public Criteria andCNameBetween(String value1, String value2) {
            addCriterion("c_name between", value1, value2, "cName");
            return (Criteria) this;
        }

        public Criteria andCNameNotBetween(String value1, String value2) {
            addCriterion("c_name not between", value1, value2, "cName");
            return (Criteria) this;
        }

        public Criteria andCPasswordIsNull() {
            addCriterion("c_password is null");
            return (Criteria) this;
        }

        public Criteria andCPasswordIsNotNull() {
            addCriterion("c_password is not null");
            return (Criteria) this;
        }

        public Criteria andCPasswordEqualTo(String value) {
            addCriterion("c_password =", value, "cPassword");
            return (Criteria) this;
        }

        public Criteria andCPasswordNotEqualTo(String value) {
            addCriterion("c_password <>", value, "cPassword");
            return (Criteria) this;
        }

        public Criteria andCPasswordGreaterThan(String value) {
            addCriterion("c_password >", value, "cPassword");
            return (Criteria) this;
        }

        public Criteria andCPasswordGreaterThanOrEqualTo(String value) {
            addCriterion("c_password >=", value, "cPassword");
            return (Criteria) this;
        }

        public Criteria andCPasswordLessThan(String value) {
            addCriterion("c_password <", value, "cPassword");
            return (Criteria) this;
        }

        public Criteria andCPasswordLessThanOrEqualTo(String value) {
            addCriterion("c_password <=", value, "cPassword");
            return (Criteria) this;
        }

        public Criteria andCPasswordLike(String value) {
            addCriterion("c_password like", value, "cPassword");
            return (Criteria) this;
        }

        public Criteria andCPasswordNotLike(String value) {
            addCriterion("c_password not like", value, "cPassword");
            return (Criteria) this;
        }

        public Criteria andCPasswordIn(List<String> values) {
            addCriterion("c_password in", values, "cPassword");
            return (Criteria) this;
        }

        public Criteria andCPasswordNotIn(List<String> values) {
            addCriterion("c_password not in", values, "cPassword");
            return (Criteria) this;
        }

        public Criteria andCPasswordBetween(String value1, String value2) {
            addCriterion("c_password between", value1, value2, "cPassword");
            return (Criteria) this;
        }

        public Criteria andCPasswordNotBetween(String value1, String value2) {
            addCriterion("c_password not between", value1, value2, "cPassword");
            return (Criteria) this;
        }

        public Criteria andCGenderIsNull() {
            addCriterion("c_gender is null");
            return (Criteria) this;
        }

        public Criteria andCGenderIsNotNull() {
            addCriterion("c_gender is not null");
            return (Criteria) this;
        }

        public Criteria andCGenderEqualTo(Integer value) {
            addCriterion("c_gender =", value, "cGender");
            return (Criteria) this;
        }

        public Criteria andCGenderNotEqualTo(Integer value) {
            addCriterion("c_gender <>", value, "cGender");
            return (Criteria) this;
        }

        public Criteria andCGenderGreaterThan(Integer value) {
            addCriterion("c_gender >", value, "cGender");
            return (Criteria) this;
        }

        public Criteria andCGenderGreaterThanOrEqualTo(Integer value) {
            addCriterion("c_gender >=", value, "cGender");
            return (Criteria) this;
        }

        public Criteria andCGenderLessThan(Integer value) {
            addCriterion("c_gender <", value, "cGender");
            return (Criteria) this;
        }

        public Criteria andCGenderLessThanOrEqualTo(Integer value) {
            addCriterion("c_gender <=", value, "cGender");
            return (Criteria) this;
        }

        public Criteria andCGenderIn(List<Integer> values) {
            addCriterion("c_gender in", values, "cGender");
            return (Criteria) this;
        }

        public Criteria andCGenderNotIn(List<Integer> values) {
            addCriterion("c_gender not in", values, "cGender");
            return (Criteria) this;
        }

        public Criteria andCGenderBetween(Integer value1, Integer value2) {
            addCriterion("c_gender between", value1, value2, "cGender");
            return (Criteria) this;
        }

        public Criteria andCGenderNotBetween(Integer value1, Integer value2) {
            addCriterion("c_gender not between", value1, value2, "cGender");
            return (Criteria) this;
        }

        public Criteria andCBirthdayIsNull() {
            addCriterion("c_birthday is null");
            return (Criteria) this;
        }

        public Criteria andCBirthdayIsNotNull() {
            addCriterion("c_birthday is not null");
            return (Criteria) this;
        }

        public Criteria andCBirthdayEqualTo(Date value) {
            addCriterionForJDBCDate("c_birthday =", value, "cBirthday");
            return (Criteria) this;
        }

        public Criteria andCBirthdayNotEqualTo(Date value) {
            addCriterionForJDBCDate("c_birthday <>", value, "cBirthday");
            return (Criteria) this;
        }

        public Criteria andCBirthdayGreaterThan(Date value) {
            addCriterionForJDBCDate("c_birthday >", value, "cBirthday");
            return (Criteria) this;
        }

        public Criteria andCBirthdayGreaterThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("c_birthday >=", value, "cBirthday");
            return (Criteria) this;
        }

        public Criteria andCBirthdayLessThan(Date value) {
            addCriterionForJDBCDate("c_birthday <", value, "cBirthday");
            return (Criteria) this;
        }

        public Criteria andCBirthdayLessThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("c_birthday <=", value, "cBirthday");
            return (Criteria) this;
        }

        public Criteria andCBirthdayIn(List<Date> values) {
            addCriterionForJDBCDate("c_birthday in", values, "cBirthday");
            return (Criteria) this;
        }

        public Criteria andCBirthdayNotIn(List<Date> values) {
            addCriterionForJDBCDate("c_birthday not in", values, "cBirthday");
            return (Criteria) this;
        }

        public Criteria andCBirthdayBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("c_birthday between", value1, value2, "cBirthday");
            return (Criteria) this;
        }

        public Criteria andCBirthdayNotBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("c_birthday not between", value1, value2, "cBirthday");
            return (Criteria) this;
        }

        public Criteria andCEmailIsNull() {
            addCriterion("c_email is null");
            return (Criteria) this;
        }

        public Criteria andCEmailIsNotNull() {
            addCriterion("c_email is not null");
            return (Criteria) this;
        }

        public Criteria andCEmailEqualTo(String value) {
            addCriterion("c_email =", value, "cEmail");
            return (Criteria) this;
        }

        public Criteria andCEmailNotEqualTo(String value) {
            addCriterion("c_email <>", value, "cEmail");
            return (Criteria) this;
        }

        public Criteria andCEmailGreaterThan(String value) {
            addCriterion("c_email >", value, "cEmail");
            return (Criteria) this;
        }

        public Criteria andCEmailGreaterThanOrEqualTo(String value) {
            addCriterion("c_email >=", value, "cEmail");
            return (Criteria) this;
        }

        public Criteria andCEmailLessThan(String value) {
            addCriterion("c_email <", value, "cEmail");
            return (Criteria) this;
        }

        public Criteria andCEmailLessThanOrEqualTo(String value) {
            addCriterion("c_email <=", value, "cEmail");
            return (Criteria) this;
        }

        public Criteria andCEmailLike(String value) {
            addCriterion("c_email like", value, "cEmail");
            return (Criteria) this;
        }

        public Criteria andCEmailNotLike(String value) {
            addCriterion("c_email not like", value, "cEmail");
            return (Criteria) this;
        }

        public Criteria andCEmailIn(List<String> values) {
            addCriterion("c_email in", values, "cEmail");
            return (Criteria) this;
        }

        public Criteria andCEmailNotIn(List<String> values) {
            addCriterion("c_email not in", values, "cEmail");
            return (Criteria) this;
        }

        public Criteria andCEmailBetween(String value1, String value2) {
            addCriterion("c_email between", value1, value2, "cEmail");
            return (Criteria) this;
        }

        public Criteria andCEmailNotBetween(String value1, String value2) {
            addCriterion("c_email not between", value1, value2, "cEmail");
            return (Criteria) this;
        }

        public Criteria andCPhoneIsNull() {
            addCriterion("c_phone is null");
            return (Criteria) this;
        }

        public Criteria andCPhoneIsNotNull() {
            addCriterion("c_phone is not null");
            return (Criteria) this;
        }

        public Criteria andCPhoneEqualTo(String value) {
            addCriterion("c_phone =", value, "cPhone");
            return (Criteria) this;
        }

        public Criteria andCPhoneNotEqualTo(String value) {
            addCriterion("c_phone <>", value, "cPhone");
            return (Criteria) this;
        }

        public Criteria andCPhoneGreaterThan(String value) {
            addCriterion("c_phone >", value, "cPhone");
            return (Criteria) this;
        }

        public Criteria andCPhoneGreaterThanOrEqualTo(String value) {
            addCriterion("c_phone >=", value, "cPhone");
            return (Criteria) this;
        }

        public Criteria andCPhoneLessThan(String value) {
            addCriterion("c_phone <", value, "cPhone");
            return (Criteria) this;
        }

        public Criteria andCPhoneLessThanOrEqualTo(String value) {
            addCriterion("c_phone <=", value, "cPhone");
            return (Criteria) this;
        }

        public Criteria andCPhoneLike(String value) {
            addCriterion("c_phone like", value, "cPhone");
            return (Criteria) this;
        }

        public Criteria andCPhoneNotLike(String value) {
            addCriterion("c_phone not like", value, "cPhone");
            return (Criteria) this;
        }

        public Criteria andCPhoneIn(List<String> values) {
            addCriterion("c_phone in", values, "cPhone");
            return (Criteria) this;
        }

        public Criteria andCPhoneNotIn(List<String> values) {
            addCriterion("c_phone not in", values, "cPhone");
            return (Criteria) this;
        }

        public Criteria andCPhoneBetween(String value1, String value2) {
            addCriterion("c_phone between", value1, value2, "cPhone");
            return (Criteria) this;
        }

        public Criteria andCPhoneNotBetween(String value1, String value2) {
            addCriterion("c_phone not between", value1, value2, "cPhone");
            return (Criteria) this;
        }

        public Criteria andCImageIsNull() {
            addCriterion("c_image is null");
            return (Criteria) this;
        }

        public Criteria andCImageIsNotNull() {
            addCriterion("c_image is not null");
            return (Criteria) this;
        }

        public Criteria andCImageEqualTo(String value) {
            addCriterion("c_image =", value, "cImage");
            return (Criteria) this;
        }

        public Criteria andCImageNotEqualTo(String value) {
            addCriterion("c_image <>", value, "cImage");
            return (Criteria) this;
        }

        public Criteria andCImageGreaterThan(String value) {
            addCriterion("c_image >", value, "cImage");
            return (Criteria) this;
        }

        public Criteria andCImageGreaterThanOrEqualTo(String value) {
            addCriterion("c_image >=", value, "cImage");
            return (Criteria) this;
        }

        public Criteria andCImageLessThan(String value) {
            addCriterion("c_image <", value, "cImage");
            return (Criteria) this;
        }

        public Criteria andCImageLessThanOrEqualTo(String value) {
            addCriterion("c_image <=", value, "cImage");
            return (Criteria) this;
        }

        public Criteria andCImageLike(String value) {
            addCriterion("c_image like", value, "cImage");
            return (Criteria) this;
        }

        public Criteria andCImageNotLike(String value) {
            addCriterion("c_image not like", value, "cImage");
            return (Criteria) this;
        }

        public Criteria andCImageIn(List<String> values) {
            addCriterion("c_image in", values, "cImage");
            return (Criteria) this;
        }

        public Criteria andCImageNotIn(List<String> values) {
            addCriterion("c_image not in", values, "cImage");
            return (Criteria) this;
        }

        public Criteria andCImageBetween(String value1, String value2) {
            addCriterion("c_image between", value1, value2, "cImage");
            return (Criteria) this;
        }

        public Criteria andCImageNotBetween(String value1, String value2) {
            addCriterion("c_image not between", value1, value2, "cImage");
            return (Criteria) this;
        }

        public Criteria andJifenIsNull() {
            addCriterion("jifen is null");
            return (Criteria) this;
        }

        public Criteria andJifenIsNotNull() {
            addCriterion("jifen is not null");
            return (Criteria) this;
        }

        public Criteria andJifenEqualTo(Integer value) {
            addCriterion("jifen =", value, "jifen");
            return (Criteria) this;
        }

        public Criteria andJifenNotEqualTo(Integer value) {
            addCriterion("jifen <>", value, "jifen");
            return (Criteria) this;
        }

        public Criteria andJifenGreaterThan(Integer value) {
            addCriterion("jifen >", value, "jifen");
            return (Criteria) this;
        }

        public Criteria andJifenGreaterThanOrEqualTo(Integer value) {
            addCriterion("jifen >=", value, "jifen");
            return (Criteria) this;
        }

        public Criteria andJifenLessThan(Integer value) {
            addCriterion("jifen <", value, "jifen");
            return (Criteria) this;
        }

        public Criteria andJifenLessThanOrEqualTo(Integer value) {
            addCriterion("jifen <=", value, "jifen");
            return (Criteria) this;
        }

        public Criteria andJifenIn(List<Integer> values) {
            addCriterion("jifen in", values, "jifen");
            return (Criteria) this;
        }

        public Criteria andJifenNotIn(List<Integer> values) {
            addCriterion("jifen not in", values, "jifen");
            return (Criteria) this;
        }

        public Criteria andJifenBetween(Integer value1, Integer value2) {
            addCriterion("jifen between", value1, value2, "jifen");
            return (Criteria) this;
        }

        public Criteria andJifenNotBetween(Integer value1, Integer value2) {
            addCriterion("jifen not between", value1, value2, "jifen");
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