package com.legou.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.legou.entry.Administrator;
import com.legou.entry.Customer;
import com.legou.entry.Msg;
import com.legou.service.CustomerService;
import com.legou.utils.Base64PasswordEncoderUtils;
import com.legou.utils.CheckStrIsNum;
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

/**
 * @author 孙庆
 */
@Controller
public class CustomerController {

    @Autowired
    CustomerService customerService = new CustomerService();

    /**
     * 修改头像
     *
     * @param cId
     * @param pictureFile
     * @param request
     * @return
     */
    @RequestMapping(value = "/updateCustomerImage", method = RequestMethod.POST)
    @ResponseBody
    public Msg updateCustomerImage(@RequestParam String cId, MultipartFile pictureFile, HttpServletRequest request) {
        Customer customer = new Customer();
        customer.setcId(cId);
        if (pictureFile != null) {
            // 得到上传图片的地址
            String imgPath;
            try {
                //ImageUtils为之前添加的工具类
                imgPath = ImageUtils.upload(request, pictureFile);
                if (imgPath != null) {
                    // 将上传图片的地址封装到实体类
                    customer.setcImage("/" + imgPath);
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
        customerService.updateCustomer(customer);
        HttpSession session = request.getSession();
        Customer customer1 = customerService.getCustomerByCid(cId);
        session.removeAttribute("customer");
        session.setAttribute("customer", customer1);
        return Msg.success();
    }

    /**
     * 条件查询用户信息
     *
     * @param customer
     * @return
     */
    @RequestMapping(value = "/selectCustomerBytiaojian", method = RequestMethod.GET)
    @ResponseBody
    public Msg detailSelectEmployee(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Customer customer) {
//        administrator.setAdminGender(Integer.);
//        administrator.setAdminTypeId(2);
//        System.out.println(administrator);
        PageHelper.startPage(pn, 5);
//        startPage后面紧跟的这个查询就是一个分页查询
        List<Customer> list = customerService.selectCustomerBytiaojian(customer);
//        System.out.println(list);
//        使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行
//        封装了详细的分页信息，包括有我们查询出来的数据,传入连续显示的页数
        PageInfo pageInfo = new PageInfo(list, 5);
        return Msg.success().add("pageInfo", pageInfo);
    }

    /**
     * 单个和批量删除
     */
    @RequestMapping(value = "/deleteCustomer/{cId}", method = RequestMethod.DELETE)
    @ResponseBody
    public Msg deleteCustomer(@PathVariable String cId) {
        if (cId.contains("-")) {
            String[] ids = cId.split("-");
            List<String> del_ids = new ArrayList<>(Arrays.asList(ids));
            customerService.deleteBatch(del_ids);
        } else {
            customerService.deleteEmployee(cId);
        }
        return Msg.success();
    }

    /**
     * 根据用户ID获取用户信息
     *
     * @param cId
     * @return
     */
    @RequestMapping(value = "/getCustomerByCid", method = RequestMethod.GET)
    @ResponseBody
    public Msg getCustomerByCid(@RequestParam("cId") String cId) {
        Customer customer = customerService.getCustomerByCid(cId);
        return Msg.success().add("customer", customer);
    }

    /**
     * 查询所有员工信息
     *
     * @param pn
     * @return
     */
    @RequestMapping(value = "/getAllCustomer", method = RequestMethod.GET)
    @ResponseBody
    public Msg getAllCustomer(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
        PageHelper.startPage(pn, 5);
//        startPage后面紧跟的这个查询就是一个分页查询
        List<Customer> list = customerService.getAllCustomer();
//        使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行
//        封装了详细的分页信息，包括有我们查询出来的数据,传入连续显示的页数
        PageInfo pageInfo = new PageInfo(list, 5);
        return Msg.success().add("pageInfo", pageInfo);
    }

    /**
     * 修改密码
     *
     * @return
     */
    @RequestMapping(value = "/updateCustPwd", method = RequestMethod.PUT)
    @ResponseBody
    public Msg updateCustPwd(HttpServletRequest request) throws Exception {
        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("customer");
        String newPwd = Base64PasswordEncoderUtils.Base64Encode(request.getParameter("newPwd"));
        customer.setcPassword(newPwd);
        customerService.updateCustomer(customer);
        return Msg.success();
    }

    /**
     * 修改用户个人信息并重置session-customer
     *
     * @param customer
     * @return
     */
    @RequestMapping(value = "/updateCustomer/{cId}", method = RequestMethod.PUT)
    @ResponseBody
    public Msg updateCustomer(Customer customer, HttpServletRequest request) {
        HttpSession session = request.getSession();
        customerService.updateCustomer(customer);
        Customer customer1 = customerService.selectCustomerByCid(customer.getcId());
        session.removeAttribute("customer");
        session.setAttribute("customer", customer1);
        return Msg.success();
    }

    /**
     * 验证注册用户，用户名或者手机号是否可用
     *
     * @param cData
     * @return
     */
    @RequestMapping(value = "/checkCnameAndCphoneExist", method = RequestMethod.GET)
    @ResponseBody
    public Msg checkCnameExist(@RequestParam("cData") String cData) {
        long count = customerService.checkCnameAndCphoneExist(cData);
        if (count == 0) {
            return Msg.success();
        } else {
            return Msg.fail();
        }
    }

    /**
     * 用户注册
     *
     * @param customer
     * @param result
     */
    @RequestMapping(value = "/saveCustomer", method = RequestMethod.POST)
    @ResponseBody
    public Msg saveCustomer(@Valid Customer customer, BindingResult result) throws Exception {
        if (result.hasErrors()) {
            //后台校验失败
            Map<String, Object> map = new HashMap<>();
            List<FieldError> errors = result.getFieldErrors();
            for (FieldError fieldError : errors) {
                System.out.println("错误的字段名：" + fieldError.getField());
                System.out.println("错误信息：" + fieldError.getDefaultMessage());
                map.put(fieldError.getField(), fieldError.getDefaultMessage());
            }
            return Msg.fail().add("errorFields", map);
        } else if (CheckStrIsNum.checkStrIsNum(customer.getcName())) {
            System.out.println("用户名是纯数字，请重新输入");
            return Msg.fail().add("cNameIsNum", "用户名不能是纯数字");
        } else {
            customer.setcId(UUIDUtils.getUUID(8));
            if (customer.getcPassword() == null || customer.getcPassword().equals("")) {
                customer.setcPassword("11111111");
                customer.setcGender(customer.getcGender());
            } else {
                customer.setcPassword(Base64PasswordEncoderUtils.Base64Encode(customer.getcPassword()));
                customer.setcGender(1);
            }
            customer.setJifen(0);
            customer.setcImage("/images/userImage.jpg");
            customerService.saveCustomer(customer);
            return Msg.success();
        }
    }

    /**
     * login验证
     *
     * @param loginTestDate
     * @param request
     * @return
     */
    @RequestMapping(value = "/checkUser", method = RequestMethod.POST)
    @ResponseBody
    public Msg checkUser(@RequestParam("loginTestDate") String loginTestDate, HttpServletRequest request) throws Exception {
        HttpSession session = request.getSession();
        //登录信息
        if (loginTestDate.contains("-")) {
            String[] str = loginTestDate.split("-");
            //若字符串数组长度为3 则登录数据完整
            if (str.length == 3) {
                int status;
                try {
                    status = Integer.parseInt(str[2]);
                } catch (Exception e) {
                    status = 0;
                }
                List<Customer> customerList = customerService.checkUser(loginTestDate);
                if (customerList != null && customerList.size() > 0) {
                    if (customerList.size() == 1) {
                        Customer customer = customerList.get(0);
                        session.removeAttribute("customer");
                        session.setAttribute("customer", customer);
                        if (status == 1) {
                            return Msg.success().add("isRemember", true).add("customerInfo", customer);
                        } else {
                            return Msg.success().add("isRemember", false).add("customerInfo", customer);
                        }
                    } else {
                        return Msg.fail().add("login_check", "登录异常，请重新输入");
                    }
                } else {
                    return Msg.fail().add("login_check", "账号或密码错误，请重新输入");
                }
            } else {
                return Msg.fail().add("login_check", "账号或密码为空，请重新输入");
            }
        } else {
            return Msg.fail().add("login_check", "账号、密码都为空，请输入");
        }
    }
}

