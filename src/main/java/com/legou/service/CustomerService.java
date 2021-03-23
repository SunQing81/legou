package com.legou.service;

import com.legou.dao.CustomerMapper;
import com.legou.entry.Administrator;
import com.legou.entry.Customer;
import com.legou.entry.CustomerExample;
import com.legou.utils.Base64PasswordEncoderUtils;
import com.legou.utils.CheckStrIsNum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.List;

@Service
public class CustomerService {
    @Autowired
    CustomerMapper customerMapper;

    /**
     * 登录查询用户名是否存在
     *
     * @param loginTestDate
     * @return
     */
    public List<Customer> checkUser(String loginTestDate) throws Exception {
        CustomerExample customer = new CustomerExample();
        CustomerExample.Criteria criteria = customer.createCriteria();
        String[] str = loginTestDate.split("-");
        //判断用户框输入的是用户名还是手机号
        if (CheckStrIsNum.checkStrIsNum(str[0])) {
            criteria.andCPhoneEqualTo(str[0]).andCPasswordEqualTo(Base64PasswordEncoderUtils.Base64Encode(str[1]));
            System.out.println("手机号登录：" + str[0]);
        } else {
            criteria.andCNameEqualTo(str[0]).andCPasswordEqualTo(Base64PasswordEncoderUtils.Base64Encode(str[1]));
            System.out.println("用户名登录：" + str[0]);
        }
        List<Customer> list = customerMapper.selectByExample(customer);
        System.out.println("list = " + list);
        return list;
    }

    /**
     * 用户注册
     *
     * @param customer
     */

    public void saveCustomer(Customer customer) {
        customerMapper.insertSelective(customer);
    }

    /**
     * 注册校验用户名是否可用
     *
     * @param cDate
     * @return
     */
    public long checkCnameAndCphoneExist(String cDate) {
        CustomerExample customerExample = new CustomerExample();
        CustomerExample.Criteria criteria = customerExample.createCriteria();
        if (CheckStrIsNum.checkStrIsNum(cDate)) {
            criteria.andCPhoneEqualTo(cDate);
        } else {
            criteria.andCNameEqualTo(cDate);
        }
        long count = customerMapper.countByExample(customerExample);
        return count;
    }

    /**
     * 修改用户个人信息
     *
     * @param customer
     * @return
     */
    public void updateCustomer(Customer customer) {
        customerMapper.updateByPrimaryKeySelective(customer);
    }

    /**
     * 通过主键获取用户信息
     *
     * @param cId
     * @return
     */
    public Customer selectCustomerByCid(String cId) {
        return customerMapper.selectByPrimaryKey(cId);
    }

    //获取所有用户信息
    public List<Customer> getAllCustomer() {
        return customerMapper.selectByExample(null);
    }

    //通过ID获取相应用户信息
    public Customer getCustomerByCid(String cId) {
        return customerMapper.selectByPrimaryKey(cId);
    }

    //批量删除
    public void deleteBatch(List<String> del_ids) {
        CustomerExample customerExample = new CustomerExample();
        CustomerExample.Criteria criteria = customerExample.createCriteria();
        criteria.andCIdIn(del_ids);
        customerMapper.deleteByExample(customerExample);
    }

    //单个删除
    public void deleteEmployee(String cId) {
        customerMapper.deleteByPrimaryKey(cId);
    }

    //条件查询
    public List<Customer> selectCustomerBytiaojian(Customer customer) {
        Customer customer1 = new Customer();
        if (!"".equals(customer.getcId()) && customer.getcId() != null) {
            customer1.setcId(customer.getcId());
        }
        if (!"".equals(customer.getcName()) && customer.getcName() != null) {
            customer1.setcName(customer.getcName());
        }
        if (customer.getcGender() != null) {
            customer1.setcGender(customer.getcGender());
        }
        if (!"".equals(customer.getcPhone()) && customer.getcPhone() != null) {
            customer1.setcPhone(customer.getcPhone());
        }
        return customerMapper.selectByCustomer(customer1);
    }
}

