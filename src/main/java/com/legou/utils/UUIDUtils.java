package com.legou.utils;

import java.util.UUID;

public class UUIDUtils {


    //生成指定位数的主键ID
    public static String getUUID(int num) {
        return UUID.randomUUID().toString().replace("-", "").substring(0, num);
    }

    //生成任意区间位数的顾客姓名
    public static String getCnameStr(int start, int end) {
        int i = (int) (Math.random() * (end - start + 1)) + start;
//        System.out.println("i="+i);
        return UUIDUtils.getUUID(i);
    }

    //随机生成号码
    public static String getPhoneNum() {
        String[] Top3 = {"133", "149", "153", "173", "177", "134", "135", "158",
                "180", "181", "189", "199", "130", "131", "132", "159", "172",
                "145", "155", "156", "166", "171", "175", "176", "185", "186",
                "136", "137", "138", "139", "147", "150", "151", "152", "157",
                "178", "182", "183", "184", "187", "188", "198", "170", "171"};
        //随机出真实号段   使用数组的length属性，获得数组长度，
        //通过Math.random（）*数组长度获得数组下标，从而随机出前三位的号段
        String firstNum = Top3[(int) (Math.random() * Top3.length)];
        //随机出剩下的8位数
        String lastNum = "";
        final int last = 8;
        for (int i = 0; i < last; i++) {
            //每次循环都从0~9挑选一个随机数
            lastNum += (int) (Math.random() * 10);
        }
        //最终将号段和尾数连接起来
        String phoneNum = firstNum + lastNum;
//        System.out.println(phoneNum);
        return phoneNum;
    }


    public static void main(String[] args) {
        for (int i = 0; i < 10; i++) {
//            System.out.println(UUIDUtils.getPhoneNum());
//            System.out.println(UUIDUtils.getUUID(20));
//            System.out.println(UUIDUtils.getCidStr(4,20));
        }

    }
}
