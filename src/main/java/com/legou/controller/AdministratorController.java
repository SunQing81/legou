package com.legou.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.legou.entry.Administrator;
import com.legou.entry.Msg;
import com.legou.service.AdministratorService;
import com.legou.utils.ImageUtils;
import com.legou.utils.UUIDUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.*;

@Controller
public class AdministratorController {
    @Autowired
    AdministratorService administratorService;

    /**
     * 修改头像
     *
     * @param adminId
     * @param pictureFile
     * @param request
     * @return
     */
    @RequestMapping(value = "/updateAdminImage", method = RequestMethod.POST)
    @ResponseBody
    public Msg updateAdminImage(@RequestParam String adminId, MultipartFile pictureFile, HttpServletRequest request) {
        Administrator administrator = new Administrator();
        administrator.setAdminId(adminId);
        if (pictureFile != null) {
            // 得到上传图片的地址
            String imgPath;
            try {
                //ImageUtils为之前添加的工具类
                imgPath = ImageUtils.upload(request, pictureFile);
                if (imgPath != null) {
                    // 将上传图片的地址封装到实体类
                    administrator.setAdminImage("/" + imgPath);
                    System.out.println("-----------------图片上传成功！");
                } else {
                    System.out.println("-----------------图片上传失败！1");
                }
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
                System.out.println("----------------图片上传失败！2");
            }
        }
        administratorService.updateEmployee(administrator);
        HttpSession session = request.getSession();
        Administrator administrator1 = administratorService.getEmployeeByAdminId(adminId);
        session.removeAttribute("admin");
        session.setAttribute("admin", administrator1);
        return Msg.success();
    }

    /**
     * 修改密码
     *
     * @param pwd
     * @param request
     * @return
     */
    @RequestMapping(value = "/updateAdminPwd/{pwd}", method = RequestMethod.PUT)
    @ResponseBody
    public Msg updateAdminPwd(@PathVariable String pwd, HttpServletRequest request) {
        HttpSession session = request.getSession();
        Administrator admin = (Administrator) session.getAttribute("admin");
        Administrator administrator = new Administrator();
        administrator.setAdminId(admin.getAdminId());
        administrator.setAdminPassword(pwd);
        administratorService.updateAdminPwd(administrator);
        return Msg.success();
    }

    /**
     * 个人信息修改
     *
     * @param administrator
     * @return
     */
    @RequestMapping(value = "/updateAdmin", method = RequestMethod.PUT)
    @ResponseBody
    public Msg updateAdmin(Administrator administrator, HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.removeAttribute("admin");
        administratorService.updateEmployee(administrator);
        Administrator administrator1 = administratorService.getEmployeeByAdminId(administrator.getAdminId());
        session.setAttribute("admin", administrator1);
        return Msg.success();
    }


    /**
     * 条件查询员工信息
     *
     * @param administrator
     * @return
     */
    @RequestMapping(value = "/detailSelectEmployee", method = RequestMethod.GET)
    @ResponseBody
    public Msg detailSelectEmployee(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Administrator administrator) {
//        administrator.setAdminGender(Integer.);
//        administrator.setAdminTypeId(2);
//        System.out.println(administrator);
        PageHelper.startPage(pn, 5);
//        startPage后面紧跟的这个查询就是一个分页查询
        List<Administrator> list = administratorService.detailSelectEmployee(administrator);
//        System.out.println(list);
//        使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行
//        封装了详细的分页信息，包括有我们查询出来的数据,传入连续显示的页数
        PageInfo pageInfo = new PageInfo(list, 5);
        return Msg.success().add("pageInfo", pageInfo);
    }

    /**
     * 创建新员工
     *
     * @param administrator
     * @param result
     * @return
     */
    @RequestMapping(value = "/createEmployee", method = RequestMethod.POST)
    @ResponseBody
    public Msg createEmployee(@Valid Administrator administrator, BindingResult result) {
        if (result.hasErrors()) {
            //校验失败，应该返回失败，在模态框中显示校验失败的错误信息
            Map<String, Object> map = new HashMap<>();
            List<FieldError> errors = result.getFieldErrors();
            for (FieldError fieldError : errors) {
                System.out.println("错误的字段名：" + fieldError.getField());
                System.out.println("错误信息：" + fieldError.getDefaultMessage());
                map.put(fieldError.getField(), fieldError.getDefaultMessage());
            }
            return Msg.fail().add("errorFields", map);
        } else {
//            System.out.println(administrator.getAdminCreatetime());
            administrator.setAdminId(UUIDUtils.getUUID(5));
            administrator.setAdminPassword("11111111");
            administrator.setAdminTypeId(2);
            administrator.setAdminImage("/images/userImage.jpg");
            administratorService.createEmployee(administrator);
            return Msg.success();
        }
    }

    /**
     * 单个和批量结合
     *
     * @param adminId
     * @return
     */
    @RequestMapping(value = "/deleteEmployee/{adminId}", method = RequestMethod.DELETE)
    @ResponseBody
    public Msg deleteEmployee(@PathVariable String adminId) {
        if (adminId.contains("-")) {
            String[] ids = adminId.split("-");
            List<String> del_ids = new ArrayList<>(Arrays.asList(ids));
            administratorService.deleteBatch(del_ids);
        } else {
            administratorService.deleteEmployee(adminId);
        }
        return Msg.success();
    }

    /**
     * 修改员工名，判断是否存在
     *
     * @param adminName
     * @return
     */
    @RequestMapping(value = "/checkAdminNameExist", method = RequestMethod.GET)
    @ResponseBody
    public Msg checkAdminNameExist(@RequestParam String adminName) {
        List<Administrator> list = administratorService.checkAdminNameExist(adminName);
        if (list.size() == 0) {
            return Msg.success();
        } else {
            return Msg.fail();
        }
    }

    /**
     * 员工信息修改
     *
     * @param employeeInfo
     * @return
     */
    @RequestMapping(value = "/updateEmployee/{employeeInfo:.+}", method = RequestMethod.PUT)
    @ResponseBody
    public Msg updateEmployee(@PathVariable("employeeInfo") String employeeInfo) {
        System.out.println(employeeInfo);
        if (employeeInfo.contains("-")) {
            String[] employee = employeeInfo.split("-");
            Administrator administrator = new Administrator();
            administrator.setAdminId(employee[0]);
            administrator.setAdminName(employee[1]);
            administrator.setAdminGender(Integer.parseInt(employee[2]));
            administrator.setAdminEmail(employee[3]);
            administrator.setAdminPhone(employee[4]);
            administratorService.updateEmployee(administrator);
            return Msg.success();
        }
        return Msg.fail().add("checkEmployeeMsg", "信息异常，请重新修改");
    }

    /**
     * 获取员工信息（ID）
     *
     * @param adminId
     * @return
     */
    @RequestMapping(value = "/getEmployeeByAdminId", method = RequestMethod.GET)
    @ResponseBody
    public Msg getEmployeeByAdminId(@RequestParam("adminId") String adminId) {
        Administrator administrator = administratorService.getEmployeeByAdminId(adminId);
        return Msg.success().add("employee", administrator);
    }

    /**
     * 查询所有员工信息
     *
     * @param pn
     * @return
     */
    @RequestMapping(value = "/getAllEmployees", method = RequestMethod.GET)
    @ResponseBody
    public Msg getAllEmployees(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
        PageHelper.startPage(pn, 5);
//        startPage后面紧跟的这个查询就是一个分页查询
        List<Administrator> list = administratorService.getAllEmployees(2);
//        使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行
//        封装了详细的分页信息，包括有我们查询出来的数据,传入连续显示的页数
        PageInfo pageInfo = new PageInfo(list, 5);
        return Msg.success().add("pageInfo", pageInfo);
    }


    /**
     * 管理员登录
     *
     * @param adminLoginInfo
     * @param request
     * @return
     */
    @RequestMapping(value = "/adminLogin", method = RequestMethod.GET)
    @ResponseBody
    public Msg adminLogin(@RequestParam("adminLoginInfo") String adminLoginInfo, HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.removeAttribute("admin");
        String[] adminInfo = adminLoginInfo.split("-");
        if (adminInfo.length == 2) {
            Administrator administrator = new Administrator();
            administrator.setAdminName(adminInfo[0]);
            administrator.setAdminPassword(adminInfo[1]);
            List<Administrator> list = administratorService.adminLogin(administrator);
            if (list.size() == 1) {
                session.setAttribute("admin", list.get(0));
                return Msg.success();
            } else {
                return Msg.fail().add("checkLogin", "用户名错误或密码错误");
            }
        } else {
            return Msg.fail().add("checkLogin", "登录信息异常，请重新填写");
        }
    }
}
