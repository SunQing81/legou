package com.legou.entry;

import java.util.ArrayList;
import java.util.List;

public class GoodsExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public GoodsExample() {
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

        public Criteria andGIdIsNull() {
            addCriterion("g_id is null");
            return (Criteria) this;
        }

        public Criteria andGIdIsNotNull() {
            addCriterion("g_id is not null");
            return (Criteria) this;
        }

        public Criteria andGIdEqualTo(String value) {
            addCriterion("g_id =", value, "gId");
            return (Criteria) this;
        }

        public Criteria andGIdNotEqualTo(String value) {
            addCriterion("g_id <>", value, "gId");
            return (Criteria) this;
        }

        public Criteria andGIdGreaterThan(String value) {
            addCriterion("g_id >", value, "gId");
            return (Criteria) this;
        }

        public Criteria andGIdGreaterThanOrEqualTo(String value) {
            addCriterion("g_id >=", value, "gId");
            return (Criteria) this;
        }

        public Criteria andGIdLessThan(String value) {
            addCriterion("g_id <", value, "gId");
            return (Criteria) this;
        }

        public Criteria andGIdLessThanOrEqualTo(String value) {
            addCriterion("g_id <=", value, "gId");
            return (Criteria) this;
        }

        public Criteria andGIdLike(String value) {
            addCriterion("g_id like", value, "gId");
            return (Criteria) this;
        }

        public Criteria andGIdNotLike(String value) {
            addCriterion("g_id not like", value, "gId");
            return (Criteria) this;
        }

        public Criteria andGIdIn(List<String> values) {
            addCriterion("g_id in", values, "gId");
            return (Criteria) this;
        }

        public Criteria andGIdNotIn(List<String> values) {
            addCriterion("g_id not in", values, "gId");
            return (Criteria) this;
        }

        public Criteria andGIdBetween(String value1, String value2) {
            addCriterion("g_id between", value1, value2, "gId");
            return (Criteria) this;
        }

        public Criteria andGIdNotBetween(String value1, String value2) {
            addCriterion("g_id not between", value1, value2, "gId");
            return (Criteria) this;
        }

        public Criteria andGDetailinfoIsNull() {
            addCriterion("g_detailInfo is null");
            return (Criteria) this;
        }

        public Criteria andGDetailinfoIsNotNull() {
            addCriterion("g_detailInfo is not null");
            return (Criteria) this;
        }

        public Criteria andGDetailinfoEqualTo(String value) {
            addCriterion("g_detailInfo =", value, "gDetailinfo");
            return (Criteria) this;
        }

        public Criteria andGDetailinfoNotEqualTo(String value) {
            addCriterion("g_detailInfo <>", value, "gDetailinfo");
            return (Criteria) this;
        }

        public Criteria andGDetailinfoGreaterThan(String value) {
            addCriterion("g_detailInfo >", value, "gDetailinfo");
            return (Criteria) this;
        }

        public Criteria andGDetailinfoGreaterThanOrEqualTo(String value) {
            addCriterion("g_detailInfo >=", value, "gDetailinfo");
            return (Criteria) this;
        }

        public Criteria andGDetailinfoLessThan(String value) {
            addCriterion("g_detailInfo <", value, "gDetailinfo");
            return (Criteria) this;
        }

        public Criteria andGDetailinfoLessThanOrEqualTo(String value) {
            addCriterion("g_detailInfo <=", value, "gDetailinfo");
            return (Criteria) this;
        }

        public Criteria andGDetailinfoLike(String value) {
            addCriterion("g_detailInfo like", value, "gDetailinfo");
            return (Criteria) this;
        }

        public Criteria andGDetailinfoNotLike(String value) {
            addCriterion("g_detailInfo not like", value, "gDetailinfo");
            return (Criteria) this;
        }

        public Criteria andGDetailinfoIn(List<String> values) {
            addCriterion("g_detailInfo in", values, "gDetailinfo");
            return (Criteria) this;
        }

        public Criteria andGDetailinfoNotIn(List<String> values) {
            addCriterion("g_detailInfo not in", values, "gDetailinfo");
            return (Criteria) this;
        }

        public Criteria andGDetailinfoBetween(String value1, String value2) {
            addCriterion("g_detailInfo between", value1, value2, "gDetailinfo");
            return (Criteria) this;
        }

        public Criteria andGDetailinfoNotBetween(String value1, String value2) {
            addCriterion("g_detailInfo not between", value1, value2, "gDetailinfo");
            return (Criteria) this;
        }

        public Criteria andGPriceIsNull() {
            addCriterion("g_price is null");
            return (Criteria) this;
        }

        public Criteria andGPriceIsNotNull() {
            addCriterion("g_price is not null");
            return (Criteria) this;
        }

        public Criteria andGPriceEqualTo(Float value) {
            addCriterion("g_price =", value, "gPrice");
            return (Criteria) this;
        }

        public Criteria andGPriceNotEqualTo(Float value) {
            addCriterion("g_price <>", value, "gPrice");
            return (Criteria) this;
        }

        public Criteria andGPriceGreaterThan(Float value) {
            addCriterion("g_price >", value, "gPrice");
            return (Criteria) this;
        }

        public Criteria andGPriceGreaterThanOrEqualTo(Float value) {
            addCriterion("g_price >=", value, "gPrice");
            return (Criteria) this;
        }

        public Criteria andGPriceLessThan(Float value) {
            addCriterion("g_price <", value, "gPrice");
            return (Criteria) this;
        }

        public Criteria andGPriceLessThanOrEqualTo(Float value) {
            addCriterion("g_price <=", value, "gPrice");
            return (Criteria) this;
        }

        public Criteria andGPriceIn(List<Float> values) {
            addCriterion("g_price in", values, "gPrice");
            return (Criteria) this;
        }

        public Criteria andGPriceNotIn(List<Float> values) {
            addCriterion("g_price not in", values, "gPrice");
            return (Criteria) this;
        }

        public Criteria andGPriceBetween(Float value1, Float value2) {
            addCriterion("g_price between", value1, value2, "gPrice");
            return (Criteria) this;
        }

        public Criteria andGPriceNotBetween(Float value1, Float value2) {
            addCriterion("g_price not between", value1, value2, "gPrice");
            return (Criteria) this;
        }

        public Criteria andGCreattimeIsNull() {
            addCriterion("g_creatTime is null");
            return (Criteria) this;
        }

        public Criteria andGCreattimeIsNotNull() {
            addCriterion("g_creatTime is not null");
            return (Criteria) this;
        }

        public Criteria andGCreattimeEqualTo(String value) {
            addCriterion("g_creatTime =", value, "gCreattime");
            return (Criteria) this;
        }

        public Criteria andGCreattimeNotEqualTo(String value) {
            addCriterion("g_creatTime <>", value, "gCreattime");
            return (Criteria) this;
        }

        public Criteria andGCreattimeGreaterThan(String value) {
            addCriterion("g_creatTime >", value, "gCreattime");
            return (Criteria) this;
        }

        public Criteria andGCreattimeGreaterThanOrEqualTo(String value) {
            addCriterion("g_creatTime >=", value, "gCreattime");
            return (Criteria) this;
        }

        public Criteria andGCreattimeLessThan(String value) {
            addCriterion("g_creatTime <", value, "gCreattime");
            return (Criteria) this;
        }

        public Criteria andGCreattimeLessThanOrEqualTo(String value) {
            addCriterion("g_creatTime <=", value, "gCreattime");
            return (Criteria) this;
        }

        public Criteria andGCreattimeLike(String value) {
            addCriterion("g_creatTime like", value, "gCreattime");
            return (Criteria) this;
        }

        public Criteria andGCreattimeNotLike(String value) {
            addCriterion("g_creatTime not like", value, "gCreattime");
            return (Criteria) this;
        }

        public Criteria andGCreattimeIn(List<String> values) {
            addCriterion("g_creatTime in", values, "gCreattime");
            return (Criteria) this;
        }

        public Criteria andGCreattimeNotIn(List<String> values) {
            addCriterion("g_creatTime not in", values, "gCreattime");
            return (Criteria) this;
        }

        public Criteria andGCreattimeBetween(String value1, String value2) {
            addCriterion("g_creatTime between", value1, value2, "gCreattime");
            return (Criteria) this;
        }

        public Criteria andGCreattimeNotBetween(String value1, String value2) {
            addCriterion("g_creatTime not between", value1, value2, "gCreattime");
            return (Criteria) this;
        }

        public Criteria andGEndtimeIsNull() {
            addCriterion("g_endTime is null");
            return (Criteria) this;
        }

        public Criteria andGEndtimeIsNotNull() {
            addCriterion("g_endTime is not null");
            return (Criteria) this;
        }

        public Criteria andGEndtimeEqualTo(String value) {
            addCriterion("g_endTime =", value, "gEndtime");
            return (Criteria) this;
        }

        public Criteria andGEndtimeNotEqualTo(String value) {
            addCriterion("g_endTime <>", value, "gEndtime");
            return (Criteria) this;
        }

        public Criteria andGEndtimeGreaterThan(String value) {
            addCriterion("g_endTime >", value, "gEndtime");
            return (Criteria) this;
        }

        public Criteria andGEndtimeGreaterThanOrEqualTo(String value) {
            addCriterion("g_endTime >=", value, "gEndtime");
            return (Criteria) this;
        }

        public Criteria andGEndtimeLessThan(String value) {
            addCriterion("g_endTime <", value, "gEndtime");
            return (Criteria) this;
        }

        public Criteria andGEndtimeLessThanOrEqualTo(String value) {
            addCriterion("g_endTime <=", value, "gEndtime");
            return (Criteria) this;
        }

        public Criteria andGEndtimeLike(String value) {
            addCriterion("g_endTime like", value, "gEndtime");
            return (Criteria) this;
        }

        public Criteria andGEndtimeNotLike(String value) {
            addCriterion("g_endTime not like", value, "gEndtime");
            return (Criteria) this;
        }

        public Criteria andGEndtimeIn(List<String> values) {
            addCriterion("g_endTime in", values, "gEndtime");
            return (Criteria) this;
        }

        public Criteria andGEndtimeNotIn(List<String> values) {
            addCriterion("g_endTime not in", values, "gEndtime");
            return (Criteria) this;
        }

        public Criteria andGEndtimeBetween(String value1, String value2) {
            addCriterion("g_endTime between", value1, value2, "gEndtime");
            return (Criteria) this;
        }

        public Criteria andGEndtimeNotBetween(String value1, String value2) {
            addCriterion("g_endTime not between", value1, value2, "gEndtime");
            return (Criteria) this;
        }

        public Criteria andGNumIsNull() {
            addCriterion("g_num is null");
            return (Criteria) this;
        }

        public Criteria andGNumIsNotNull() {
            addCriterion("g_num is not null");
            return (Criteria) this;
        }

        public Criteria andGNumEqualTo(Integer value) {
            addCriterion("g_num =", value, "gNum");
            return (Criteria) this;
        }

        public Criteria andGNumNotEqualTo(Integer value) {
            addCriterion("g_num <>", value, "gNum");
            return (Criteria) this;
        }

        public Criteria andGNumGreaterThan(Integer value) {
            addCriterion("g_num >", value, "gNum");
            return (Criteria) this;
        }

        public Criteria andGNumGreaterThanOrEqualTo(Integer value) {
            addCriterion("g_num >=", value, "gNum");
            return (Criteria) this;
        }

        public Criteria andGNumLessThan(Integer value) {
            addCriterion("g_num <", value, "gNum");
            return (Criteria) this;
        }

        public Criteria andGNumLessThanOrEqualTo(Integer value) {
            addCriterion("g_num <=", value, "gNum");
            return (Criteria) this;
        }

        public Criteria andGNumIn(List<Integer> values) {
            addCriterion("g_num in", values, "gNum");
            return (Criteria) this;
        }

        public Criteria andGNumNotIn(List<Integer> values) {
            addCriterion("g_num not in", values, "gNum");
            return (Criteria) this;
        }

        public Criteria andGNumBetween(Integer value1, Integer value2) {
            addCriterion("g_num between", value1, value2, "gNum");
            return (Criteria) this;
        }

        public Criteria andGNumNotBetween(Integer value1, Integer value2) {
            addCriterion("g_num not between", value1, value2, "gNum");
            return (Criteria) this;
        }

        public Criteria andGImageIsNull() {
            addCriterion("g_image is null");
            return (Criteria) this;
        }

        public Criteria andGImageIsNotNull() {
            addCriterion("g_image is not null");
            return (Criteria) this;
        }

        public Criteria andGImageEqualTo(String value) {
            addCriterion("g_image =", value, "gImage");
            return (Criteria) this;
        }

        public Criteria andGImageNotEqualTo(String value) {
            addCriterion("g_image <>", value, "gImage");
            return (Criteria) this;
        }

        public Criteria andGImageGreaterThan(String value) {
            addCriterion("g_image >", value, "gImage");
            return (Criteria) this;
        }

        public Criteria andGImageGreaterThanOrEqualTo(String value) {
            addCriterion("g_image >=", value, "gImage");
            return (Criteria) this;
        }

        public Criteria andGImageLessThan(String value) {
            addCriterion("g_image <", value, "gImage");
            return (Criteria) this;
        }

        public Criteria andGImageLessThanOrEqualTo(String value) {
            addCriterion("g_image <=", value, "gImage");
            return (Criteria) this;
        }

        public Criteria andGImageLike(String value) {
            addCriterion("g_image like", value, "gImage");
            return (Criteria) this;
        }

        public Criteria andGImageNotLike(String value) {
            addCriterion("g_image not like", value, "gImage");
            return (Criteria) this;
        }

        public Criteria andGImageIn(List<String> values) {
            addCriterion("g_image in", values, "gImage");
            return (Criteria) this;
        }

        public Criteria andGImageNotIn(List<String> values) {
            addCriterion("g_image not in", values, "gImage");
            return (Criteria) this;
        }

        public Criteria andGImageBetween(String value1, String value2) {
            addCriterion("g_image between", value1, value2, "gImage");
            return (Criteria) this;
        }

        public Criteria andGImageNotBetween(String value1, String value2) {
            addCriterion("g_image not between", value1, value2, "gImage");
            return (Criteria) this;
        }

        public Criteria andGClicknumIsNull() {
            addCriterion("g_clickNum is null");
            return (Criteria) this;
        }

        public Criteria andGClicknumIsNotNull() {
            addCriterion("g_clickNum is not null");
            return (Criteria) this;
        }

        public Criteria andGClicknumEqualTo(Integer value) {
            addCriterion("g_clickNum =", value, "gClicknum");
            return (Criteria) this;
        }

        public Criteria andGClicknumNotEqualTo(Integer value) {
            addCriterion("g_clickNum <>", value, "gClicknum");
            return (Criteria) this;
        }

        public Criteria andGClicknumGreaterThan(Integer value) {
            addCriterion("g_clickNum >", value, "gClicknum");
            return (Criteria) this;
        }

        public Criteria andGClicknumGreaterThanOrEqualTo(Integer value) {
            addCriterion("g_clickNum >=", value, "gClicknum");
            return (Criteria) this;
        }

        public Criteria andGClicknumLessThan(Integer value) {
            addCriterion("g_clickNum <", value, "gClicknum");
            return (Criteria) this;
        }

        public Criteria andGClicknumLessThanOrEqualTo(Integer value) {
            addCriterion("g_clickNum <=", value, "gClicknum");
            return (Criteria) this;
        }

        public Criteria andGClicknumIn(List<Integer> values) {
            addCriterion("g_clickNum in", values, "gClicknum");
            return (Criteria) this;
        }

        public Criteria andGClicknumNotIn(List<Integer> values) {
            addCriterion("g_clickNum not in", values, "gClicknum");
            return (Criteria) this;
        }

        public Criteria andGClicknumBetween(Integer value1, Integer value2) {
            addCriterion("g_clickNum between", value1, value2, "gClicknum");
            return (Criteria) this;
        }

        public Criteria andGClicknumNotBetween(Integer value1, Integer value2) {
            addCriterion("g_clickNum not between", value1, value2, "gClicknum");
            return (Criteria) this;
        }

        public Criteria andGftIdIsNull() {
            addCriterion("gft_id is null");
            return (Criteria) this;
        }

        public Criteria andGftIdIsNotNull() {
            addCriterion("gft_id is not null");
            return (Criteria) this;
        }

        public Criteria andGftIdEqualTo(Integer value) {
            addCriterion("gft_id =", value, "gftId");
            return (Criteria) this;
        }

        public Criteria andGftIdNotEqualTo(Integer value) {
            addCriterion("gft_id <>", value, "gftId");
            return (Criteria) this;
        }

        public Criteria andGftIdGreaterThan(Integer value) {
            addCriterion("gft_id >", value, "gftId");
            return (Criteria) this;
        }

        public Criteria andGftIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("gft_id >=", value, "gftId");
            return (Criteria) this;
        }

        public Criteria andGftIdLessThan(Integer value) {
            addCriterion("gft_id <", value, "gftId");
            return (Criteria) this;
        }

        public Criteria andGftIdLessThanOrEqualTo(Integer value) {
            addCriterion("gft_id <=", value, "gftId");
            return (Criteria) this;
        }

        public Criteria andGftIdIn(List<Integer> values) {
            addCriterion("gft_id in", values, "gftId");
            return (Criteria) this;
        }

        public Criteria andGftIdNotIn(List<Integer> values) {
            addCriterion("gft_id not in", values, "gftId");
            return (Criteria) this;
        }

        public Criteria andGftIdBetween(Integer value1, Integer value2) {
            addCriterion("gft_id between", value1, value2, "gftId");
            return (Criteria) this;
        }

        public Criteria andGftIdNotBetween(Integer value1, Integer value2) {
            addCriterion("gft_id not between", value1, value2, "gftId");
            return (Criteria) this;
        }

        public Criteria andGstIdIsNull() {
            addCriterion("gst_id is null");
            return (Criteria) this;
        }

        public Criteria andGstIdIsNotNull() {
            addCriterion("gst_id is not null");
            return (Criteria) this;
        }

        public Criteria andGstIdEqualTo(Integer value) {
            addCriterion("gst_id =", value, "gstId");
            return (Criteria) this;
        }

        public Criteria andGstIdNotEqualTo(Integer value) {
            addCriterion("gst_id <>", value, "gstId");
            return (Criteria) this;
        }

        public Criteria andGstIdGreaterThan(Integer value) {
            addCriterion("gst_id >", value, "gstId");
            return (Criteria) this;
        }

        public Criteria andGstIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("gst_id >=", value, "gstId");
            return (Criteria) this;
        }

        public Criteria andGstIdLessThan(Integer value) {
            addCriterion("gst_id <", value, "gstId");
            return (Criteria) this;
        }

        public Criteria andGstIdLessThanOrEqualTo(Integer value) {
            addCriterion("gst_id <=", value, "gstId");
            return (Criteria) this;
        }

        public Criteria andGstIdIn(List<Integer> values) {
            addCriterion("gst_id in", values, "gstId");
            return (Criteria) this;
        }

        public Criteria andGstIdNotIn(List<Integer> values) {
            addCriterion("gst_id not in", values, "gstId");
            return (Criteria) this;
        }

        public Criteria andGstIdBetween(Integer value1, Integer value2) {
            addCriterion("gst_id between", value1, value2, "gstId");
            return (Criteria) this;
        }

        public Criteria andGstIdNotBetween(Integer value1, Integer value2) {
            addCriterion("gst_id not between", value1, value2, "gstId");
            return (Criteria) this;
        }

        public Criteria andGtIdIsNull() {
            addCriterion("gt_id is null");
            return (Criteria) this;
        }

        public Criteria andGtIdIsNotNull() {
            addCriterion("gt_id is not null");
            return (Criteria) this;
        }

        public Criteria andGtIdEqualTo(Integer value) {
            addCriterion("gt_id =", value, "gtId");
            return (Criteria) this;
        }

        public Criteria andGtIdNotEqualTo(Integer value) {
            addCriterion("gt_id <>", value, "gtId");
            return (Criteria) this;
        }

        public Criteria andGtIdGreaterThan(Integer value) {
            addCriterion("gt_id >", value, "gtId");
            return (Criteria) this;
        }

        public Criteria andGtIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("gt_id >=", value, "gtId");
            return (Criteria) this;
        }

        public Criteria andGtIdLessThan(Integer value) {
            addCriterion("gt_id <", value, "gtId");
            return (Criteria) this;
        }

        public Criteria andGtIdLessThanOrEqualTo(Integer value) {
            addCriterion("gt_id <=", value, "gtId");
            return (Criteria) this;
        }

        public Criteria andGtIdIn(List<Integer> values) {
            addCriterion("gt_id in", values, "gtId");
            return (Criteria) this;
        }

        public Criteria andGtIdNotIn(List<Integer> values) {
            addCriterion("gt_id not in", values, "gtId");
            return (Criteria) this;
        }

        public Criteria andGtIdBetween(Integer value1, Integer value2) {
            addCriterion("gt_id between", value1, value2, "gtId");
            return (Criteria) this;
        }

        public Criteria andGtIdNotBetween(Integer value1, Integer value2) {
            addCriterion("gt_id not between", value1, value2, "gtId");
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