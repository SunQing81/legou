import com.google.gson.Gson;
import org.apache.commons.lang3.StringEscapeUtils;

import java.io.BufferedReader;

import java.io.IOException;
import java.io.InputStreamReader;
import java.net.*;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class LocationTest {

    //在百度地图开放平台申请的密钥
    private static final String BAIDU_AK = "SKk1R2ICqdjKMuhDk1HXPNsYBGHTGzgG";

    public static String sendGet(String url) {
        String result = "";
        BufferedReader bf = null;
        try {
            URL realUrl = new URL(url);
            // 打开和URL之间的连接
            URLConnection connection = realUrl.openConnection();
            // 设置通用的请求属性
            connection.setRequestProperty("accept", "*/*");
            connection.setRequestProperty("connection", "Keep-Alive");
            connection.setRequestProperty("user-agent",
                    "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
            // 建立实际的连接
            connection.connect();

            // 定义 BufferedReader输入流来读取URL的响应
            bf = new BufferedReader(new InputStreamReader(
                    connection.getInputStream()));
            String line;
            while ((line = bf.readLine()) != null) {
                result += line;
            }
        } catch (Exception e) {
            System.out.println("GET请求出现异常！" + e);
            e.printStackTrace();
        }
        // 使用finally块来关闭输入流
        finally {
            try {
                if (bf != null) {
                    bf.close();
                }
            } catch (IOException e2) {
                System.out.println("关闭BufferedReader出现异常！" + e2);
                e2.printStackTrace();
            }
        }
        return result;
    }

    public static Map getLocationInfo(String url, String ip) {
        String urlAndParam = url + "?ak=" + BAIDU_AK + "&ip=" + ip;
        String unicodeJsonStr = sendGet(urlAndParam);
        //反转义unicode字符串
        String jsonStr = StringEscapeUtils.unescapeJson(unicodeJsonStr);
        Gson gson = new Gson();
        Map locationInfoMap = gson.fromJson(jsonStr, HashMap.class);
        return locationInfoMap;
    }

    public static String getV4IP() {
        String ip = "";
        String chinaz = "http://ip.chinaz.com";

        StringBuilder inputLine = new StringBuilder();
        String read = "";
        URL url = null;
        HttpURLConnection urlConnection = null;
        BufferedReader in = null;
        try {
            url = new URL(chinaz);
            urlConnection = (HttpURLConnection) url.openConnection();
            in = new BufferedReader(new InputStreamReader(urlConnection.getInputStream(), "UTF-8"));
            while ((read = in.readLine()) != null) {
                inputLine.append(read + "\r\n");
            }
            //System.out.println(inputLine.toString());
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (in != null) {
                try {
                    in.close();
                } catch (IOException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            }
        }
        Pattern p = Pattern.compile("\\<dd class\\=\"fz24\">(.*?)\\<\\/dd>");
        Matcher m = p.matcher(inputLine.toString());
        if (m.find()) {
            String ipstr = m.group(1);
            ip = ipstr;
            //System.out.println(ipstr);
        }
        return ip;
    }


    public static void main(String[] args) throws Exception {
        Map map = getLocationInfo("http://api.map.baidu.com/location/ip", getV4IP());
        if ((Double) map.get("status") == 0) {
            Map content = (Map) map.get("content");
            System.out.println("address: " + content.get("address"));
        }
    }
}
