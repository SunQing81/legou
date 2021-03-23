
package com.legou.service;

import com.legou.dao.AddressMapper;
import com.legou.entry.Address;
import com.legou.entry.AddressExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AddressService {
    @Autowired
    AddressMapper addressMapper;

    /**
     * 根据用户Cid查询用户的收货地址
     *
     * @param cId
     * @return
     */
    public List<Address> getAllAddressByCid(String cId) {
        AddressExample custAddressExample = new AddressExample();
        AddressExample.Criteria criteria = custAddressExample.createCriteria();
        criteria.andCIdEqualTo(cId);
        List<Address> list = addressMapper.selectByExample(custAddressExample);
        return list;
    }

    /**
     * 根据地址id查询地址信息
     *
     * @param aid
     * @return
     */
    public Address getAddressByAid(String aid) {
        return addressMapper.selectByPrimaryKey(aid);
    }


    /**
     * 根据地址id删除地址信息
     *
     * @param aid
     * @return
     */
    public void deleteAddressByAid(String aid) {
        addressMapper.deleteByPrimaryKey(aid);
    }


    /**
     * 批量删除地址信息
     *
     * @param ids
     */
    public void deleteBatch(List<String> ids) {
        AddressExample example = new AddressExample();
        AddressExample.Criteria criteria = example.createCriteria();
        criteria.andAIdIn(ids);
        addressMapper.deleteByExample(example);
    }

    /**
     * 新增地址信息根据用户ID
     *
     * @param address
     */
    public void saveAddressByCid(Address address) {
        addressMapper.insertSelective(address);
    }

    /**
     * 用户所属的某一地址设为默认
     *
     * @param aidsList
     */
    public void setDefaultAdsWithCid(List<String> aidsList, String aid) {
        //先将用户所有的地址的设置为非默认状态
        addressMapper.updateByPrimaryKeys(aidsList);
        Address address = new Address();
        address.setaStatus(1);
        AddressExample example = new AddressExample();
        AddressExample.Criteria criteria = example.createCriteria();
        criteria.andAIdEqualTo(aid);
        addressMapper.updateByExampleSelective(address, example);
    }

    /**
     * 修改地址
     *
     * @param address
     */
    public void updateAddressByCid(Address address) {
//        addressMapper.updateByPrimaryKey(address);
        addressMapper.updateByPrimaryKeySelective(address);
    }
}
