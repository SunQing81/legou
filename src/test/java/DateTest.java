import org.apache.commons.lang3.time.DateUtils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateTest {
    public static void main(String[] args) {

        //创建SimpleDateFormat对象实例并定义好转换格式
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        System.out.println("把当前时间：" + new Date());
        System.out.println("把当前时间转换成字符串：" + sdf.format(new Date()));

        Date date = null;

        String timestamp = null;

        try {
            // 注意格式需要与上面一致，不然会出现异常
            date = DateUtils.parseDateStrictly("2005-12-15", "yyyy-MM-dd");

            Long longTime = sdf.parse(sdf.format(new Date())).getTime();
            timestamp = Long.toString(longTime);
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("字符串转换成时间:" + date);
        System.out.println("成时间戳转换字符串:" + timestamp);
    }
}
