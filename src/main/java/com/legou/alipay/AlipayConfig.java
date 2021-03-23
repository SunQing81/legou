package com.legou.alipay;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {

//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

    // 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
    public static String app_id = "2016101300677615";

    // 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCe0WzxPHnkRc24PxStTlfMHErVrEG77d0QtUXPK27qsJ1bKBTwsDFmGLHtjJ39MramuaKww6dVbG4DRjylTufKYZtvmjskWbOVI4Sm0eI+rEy8VLS/PfshIuniMO1KyzyHv94JM4KV0G0a/hXPRk/HA/jo3u0MBT1Xe3SxNyGrQfss3D66oleA8u3KSet0IKAlgBVaDBbr43xq8LczZMIjRTsIyRH2dqqzYuh+F85gOR64bCn/zZk2lD+84Uz53zPwNTuzwpk74Q/V7E0IcweBLO8utgc1eD8P/cat0hKXWxp86/rQQ0R/Qg+gi6qzn/OhuszGFGbS6A6l8K/j5mfBAgMBAAECggEAd1oFWAlNxQncPuFRBajBfEeqyYcJY1SvdFX2H2mRklel+ZJWokaW6RYX6OBq/pP1BbiuFc8DWsQArP9Epip1MPdHW4h5d6jdt2+YydEjCFxt0n6J0sqehll5kJ2aRkITvCSplRqbwUCALe/SrhE19Ob8UOzvEcCCR9Mkb+VxrQPaeouvViBjq72V/rF6xlWJc1srvmeqk2Jsmd2PzFIUY7uM33lIEvtqJ+bDPjGRUA5sLu+TdkaZruHwBeP8Q9xvloL8/bpvA3qaMlfccWV9bZcVw7CGFT2c8ovIbFHCqgvcDBg7eZpmSJkbyYjFC7YAE59vDIUAGzLJCSCtCwU3QQKBgQDTaDywxGxjlzXWwxbG+JySY30PTfgm1l68yDlTalUbo5dRPlZRYtAFijXedY0FNUFgdwAbnMbe4Taab2ClPzWBQGLf5+ky9KB1N/NsPditR25vZSQwP26EFQDTiUiIcJ5V830dTf5vvjaIrFMpyH5Zb01Mu25dcVtASWplk1jVCQKBgQDAUW67SxaNtO6kfzdLDTXZCVbAE2OfBeogtvC+qQb/WMi3Kdqvlrm9zA0qRqRZ+iKb1VwYwIvBy4qM8PWx1vzTOcfJ6MiUoM2brX92WSTxqjfSF26kFJZiNIz2QssHEpUg2eUBKsTIQ30T5AbHHkspDUVP3jeMLyxCf2yt9ZQi+QKBgBRfu1md1IRUkk+8RXmvhAdnpynObdfwWPkAouWzHbioL3EY/OCjEUE3bLGfypNx6ncNgOkoVtIsCkMf8MR8Lv/h4KWLiCHtCXnChqcr3rH0bGQ37yDnPBNmosnANUlQ8TF/YdNtLNRAFKlfUjR4qhSccWqvtZcz0YOEj8hyRuFhAoGAJdNebiQUqYZ+sYf7/hz5DFkT4O9vVqW5KPoSW82u/KYfxDbNNl/05Gmv5TLDvJbAG9pZJN0qH9HCzHnQOUxJqdnhe8r3OJRwHECBo2thIs8R75aAQnFyKpqfZwg4GooDHtT8f8BDuAfeH/1nf95rdgWQLmdMkZvtnp6lZ4m3uzECgYAB5CQHZEA3k8GKXQKIbXaYI1PAhd+/3GP8ipUvwVGzLVvNJa1y39czGugEMfP4XmY8hoevTvTb4Iy+hhLDAI+o15UImRk/O2hpOOBwFDsJLbramfzqPbh2iaPZPCRGIRi549HNYzltARNGoJjHnbPVGOEWc22uduSISMT3SRA8dg==";

    // 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAqqBHi998NlMTTK3ZZIQmXe0cq0oKDERHAOS1A6504+ffD9L7a8xZrnP4m3fQu5H5LJd+iN+dZh9EEei5s20ZuiXr/z2WRZdl1LZ3djpsLvNYalBrj904x0bhaHeMAwqPu9389QPU0lIOlAA5NshBpz0X0N/e4e4CnH3d7dlqYTVh0/NCc44TzMxZlDMmvwaTBSldefVctLqKQJW6PQcUXwxQIqYKFbSC2olaRUyfZ1QKllxYFCsxyhVT68FKtydOygDCo5wGkkKCcMJN0XLU1TQJ+WM3UZ0/LBUXchUGatZC64eMlUatte94csjiryz5CvadvPdvfPfVHST7kOi1FQIDAQAB";

    // 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String notify_url = "http://localhost:8080/legou_war_exploded/notify_url.jsp";

    // 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String return_url = "http://localhost:8080/legou_war_exploded/return_url.jsp";

    // 签名方式
    public static String sign_type = "RSA2";

    // 字符编码格式
    public static String charset = "utf-8";

    // 支付宝网关
    public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";

    // 支付宝网关
    public static String log_path = "C:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /**
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     *
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis() + ".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

