package com.legou.service;

import com.legou.dao.AdministratorMapper;
import com.legou.entry.Administrator;
import com.legou.entry.AdministratorExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdministratorService {
    @Autowired
    AdministratorMapper administratorMapper;


    //管理员登录
    public List<Administrator> adminLogin(Administrator administrator) {
        AdministratorExample example = new AdministratorExample();
        AdministratorExample.Criteria criteria = example.createCriteria();
        criteria.andAdminNameEqualTo(administrator.getAdminName());
        criteria.andAdminPasswordEqualTo(administrator.getAdminPassword());
        List<Administrator> list = administratorMapper.selectByExample(example);
        return list;
    }

    //查询所有员工信息
    public List<Administrator> getAllEmployees(int i) {
        AdministratorExample example = new AdministratorExample();
        AdministratorExample.Criteria criteria = example.createCriteria();
        criteria.andAdminTypeIdEqualTo(i);
        return administratorMapper.selectByExample(example);
    }

    // 获取员工信息（ID）
    public Administrator getEmployeeByAdminId(String adminId) {
        return administratorMapper.selectByPrimaryKey(adminId);
    }

    //员工信息修改
    public void updateEmployee(Administrator administrator) {
        administratorMapper.updateByPrimaryKeySelective(administrator);
    }

    //修改员工名，判断是否存在
    public List<Administrator> checkAdminNameExist(String adminName) {
        AdministratorExample example = new AdministratorExample();
        AdministratorExample.Criteria criteria = example.createCriteria();
        criteria.andAdminNameEqualTo(adminName);
        return administratorMapper.selectByExample(example);
    }

    //批量删除员工
    public void deleteBatch(List<String> del_ids) {
        AdministratorExample example = new AdministratorExample();
        AdministratorExample.Criteria criteria = example.createCriteria();
        criteria.andAdminIdIn(del_ids);
        administratorMapper.deleteByExample(example);
    }

    //单个删除员工
    public void deleteEmployee(String adminId) {
        administratorMapper.deleteByPrimaryKey(adminId);
    }

    //创建新员工
    public void createEmployee(Administrator administrator) {
        administratorMapper.insertSelective(administrator);
    }

    //条件查询员工信息
    public List<Administrator> detailSelectEmployee(Administrator administrator) {
        Administrator administrator1 = new Administrator();
        if (!administrator.getAdminId().equals("") && administrator.getAdminId() != null) {
            administrator1.setAdminId(administrator.getAdminId());
        }
        if (!administrator.getAdminName().equals("") && administrator.getAdminName() != null) {
            administrator1.setAdminName(administrator.getAdminName());
        }
        if (administrator.getAdminGender() != null) {
            administrator1.setAdminGender(administrator.getAdminGender());
        }
        if (!administrator.getAdminPhone().equals("") && administrator.getAdminPhone() != null) {
            administrator1.setAdminPhone(administrator.getAdminPhone());
        }
        administrator1.setAdminTypeId(2);
        return administratorMapper.selectByEmployee(administrator1);
    }

    //修改密码
    public void updateAdminPwd(Administrator administrator) {
        administratorMapper.updateByPrimaryKeySelective(administrator);
    }
}
