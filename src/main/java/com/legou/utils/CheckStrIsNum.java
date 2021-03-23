package com.legou.utils;

public class CheckStrIsNum {
    /**
     * 利用Java的character.isDigit方法进行处理
     */
    public static boolean checkStrIsNum(String str) {
        for (int i = 0; i < str.length(); i++) {
            if (!Character.isDigit(str.charAt(i))) {
                return false;
            }
        }
        return true;
    }
}
