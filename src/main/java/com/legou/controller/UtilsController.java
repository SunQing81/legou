package com.legou.controller;

import com.legou.entry.Msg;
import com.legou.utils.LocationInfo;
import com.legou.utils.RandomValidateCode;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class UtilsController {
    /**
     * 跳转页面
     *
     * @param url
     * @return
     */
    @RequestMapping(value = "/forwordPage", method = RequestMethod.GET)
    public String forwordPage(@RequestParam("url") String url, HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.removeAttribute("url");
        session.setAttribute("url", url);
        return url;
    }

    /**
     * 获取生成验证码显示到 UI 界面
     *
     * @param request
     * @param response
     */
    @RequestMapping(value = "/checkCode")
    public void checkCode(HttpServletRequest request, HttpServletResponse response) {
        //设置相应类型,告诉浏览器输出的内容为图片
        response.setContentType("image/jpeg");
        //设置响应头信息，告诉浏览器不要缓存此内容
        response.setHeader("pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expire", 0);
        HttpSession session = request.getSession();
        RandomValidateCode randomValidateCode = new RandomValidateCode();
        try {
            randomValidateCode.getRandcode(request, response);//输出图片方法
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 校验注册验证码是否正确
     *
     * @param verify
     * @return
     */
    @RequestMapping(value = "/checkVerify", method = RequestMethod.GET)
    @ResponseBody
    public Msg checkVerify(@RequestParam("verify") String verify, HttpServletRequest request) {
        HttpSession session = request.getSession();
        System.out.println("前台ajax发过来的验证码：" + verify);
        Boolean b = verify.equalsIgnoreCase((String) session.getAttribute(RandomValidateCode.RANDOMCODEKEY));
        System.out.println("与后台的session内的验证码是否相同" + b);
        if (b) {
            return Msg.success();
        } else {
            return Msg.fail();
        }
    }

    /**
     * 安全退出
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "/safety_exit")
    public String safety_exit(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.removeAttribute("customer");
        return "Login";
    }

    /**
     * 通过本机外网IP来定位当前城市并显示在前台
     *
     * @return
     */
    @RequestMapping(value = "/getCityInfo", method = RequestMethod.GET)
    @ResponseBody
    public Msg getCityInfo() throws Exception {
        /*if (!LocationInfo.getCityLocation().equals("")){
            String cityLocationInfo = LocationInfo.getCityLocation();
            return Msg.success().add("cityLocationInfo",cityLocationInfo);
        }else {
            return Msg.success().add("cityLocationInfo","北京");
        }*/
        return Msg.success().add("cityLocationInfo", "北京");
    }
}
