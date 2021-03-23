import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.DecimalFormat;

public class utilsTest {
    public static Boolean ignoreCase() {
        String str = "weR9";
        return str.equalsIgnoreCase("WEr9");
    }

    public static void str_split() {
        String str = "4cb0d1d7-s";
        String[] s = str.split("-");
        for (int i = 0; i < s.length; i++) {
            System.out.println("a:" + s[i]);
        }
    }

    public static void getSession(HttpServletRequest request) {
        HttpSession session = request.getSession();
        System.out.println(session.getAttribute("isIndex"));
    }

    public static void main(String[] args) {
//        System.out.println(utilsTest.ignoreCase());
        DecimalFormat decimalFormat = new DecimalFormat(".00");//构造方法的字符格式这里如果小数不足2位,会以0补足.
        String total_amount = decimalFormat.format(1.2);
        System.out.println(total_amount);
    }
}


