package com.legou.utils;


import org.apache.commons.codec.binary.Base64;
import org.apache.commons.codec.net.URLCodec;

public class Base64PasswordEncoderUtils {

    /**
     * 使用Base64进行加密
     *
     * @param res 密文
     * @return
     */
    public static String Base64Encode(String res) throws Exception {
//         return Base64.encode(res.getBytes("UTF-8"));
        return Base64.encodeBase64String(res.getBytes("UTF-8"));
    }

    /**
     * 使用Base64进行解密
     *
     * @param res
     * @return
     */
    public static String Base64Decode(String res) {
        return new String(Base64.decodeBase64(res));
    }

    public static void main(String[] args) throws Exception {
//        String str = Base64PasswordEncoderUtils.Base64Encode("MTIzLTEyMzQ1Njc4OTEwLSVFNSU4QyU5NyVFNCVCQSVBQyVFNSVCOCU4Mi0lRTUlQjglODIlRTglQkUlOTYlRTUlOEMlQkEtJUU0JUI4JTlDJUU1JTlGJThFJUU1JThDJUJBLTEyMzQ1NjQ");
        URLCodec urlCodec = new URLCodec();
        String str = "MTIzLTEyMzQ1Njc4OTEwLSVFNSU4QyU5NyVFNCVCQSVBQyVFNSVCOCU4Mi0lRTUlQjglODIlRTglQkUlOTYlRTUlOEMlQkEtJUU0JUI4JTlDJUU1JTlGJThFJUU1JThDJUJBLTEyMzQ1NjQ";
        System.out.println(urlCodec.decode(str, "UTF-8"));
        System.out.println(Base64Decode(urlCodec.decode(str, "UTF-8")));
    }

}
