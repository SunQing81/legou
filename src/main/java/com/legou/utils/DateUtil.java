package com.legou.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtil {
    //日期字符串转日期对象
    public static Date StringToDate(String dateSring) throws Exception {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date = sdf.parse(dateSring);
//        System.out.println(date);
        return date;
    }

    //获取指定时间戳
    public static String getTimestamp(Date date) {
        //创建SimpleDateFormat对象实例并定义好转换格式
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Long longTime = null;
        try {
            longTime = sdf.parse(sdf.format(date)).getTime();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return longTime.toString();
    }

    //获取当前时间几个月后的时间
    public static Date getEndDate(Integer addMonth) {
        Calendar calendar = Calendar.getInstance();
//        int mouth = calendar.get(Calendar.MONTH)+1;
        calendar.add(Calendar.MONTH, addMonth);
        Date date = calendar.getTime();
        return date;
    }

    public static void main(String[] args) throws Exception {
//        System.out.println("当前时间是："+new Date());
//        System.out.println("加上一个月后的时间："+getEndDate(12));
//        StringToDate("2017-08-18");
    }
}
