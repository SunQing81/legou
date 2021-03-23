
package com.legou.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.legou.entry.Address;
import com.legou.entry.Customer;
import com.legou.entry.Msg;
import com.legou.service.AddressService;
import com.legou.utils.DateUtil;
import com.legou.utils.UUIDUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class AddressController {
    @Autowired
    AddressService addressService;

    /**
     * 修改地址
     */
    @RequestMapping(value = "/updateAddressByCid", method = RequestMethod.GET)
    @ResponseBody
    public Msg updateAddressByCid(@RequestParam("adsData") String adsData) {
        if (adsData.contains("-")) {
//            System.out.println(adsData);
            String[] addressInfo = adsData.split("-");
//            System.out.println(addressInfo.length);
            if (addressInfo.length == 10) {
                Address address = new Address();
                address.setaId(addressInfo[0]);
                address.setaName(addressInfo[1]);
                address.setaPhone(addressInfo[2]);
                address.setaProvince(addressInfo[3] + "-" + addressInfo[4]);
                address.setaCity(addressInfo[5] + "-" + addressInfo[6]);
                address.setaDistrict(addressInfo[7] + "-" + addressInfo[8]);
                address.setaInfo(addressInfo[9]);
                addressService.updateAddressByCid(address);
                return Msg.success();
            } else {
                return Msg.fail().add("checkAdsInfo", "请完善收货信息");
            }
        } else {
            return Msg.fail().add("checkAdsInfo", "请完善收货信息");
        }
    }

    /**
     * 用户所属的某一地址设为默认
     *
     * @return
     */
    @RequestMapping(value = "/setDefaultAdsWithCid", method = RequestMethod.GET)
    @ResponseBody
    public Msg setDefaultAdsWithCid(@RequestParam("aid") String aid, HttpServletRequest request) {
//        System.out.println("所要设置的默认地址ID "+aid);
        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("customer");
        List<Address> addressList = addressService.getAllAddressByCid(customer.getcId());
        List<String> aidsList = new ArrayList<>();
        for (int i = 0; i < addressList.size(); i++) {
            aidsList.add(addressList.get(i).getaId());
        }
//        先将用户所有的地址状态设置为非默认状态，再把需要设置的设为1
        addressService.setDefaultAdsWithCid(aidsList, aid);
        return Msg.success();
    }

    /**
     * 新增地址
     */
    @RequestMapping(value = "/saveAddressByCid", method = RequestMethod.GET)
    @ResponseBody
    public Msg saveAddressByCid(@RequestParam("adsData") String adsData, HttpServletRequest request) {
//        System.out.println("新增地址信息"+adsData);
        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("customer");
        if (adsData.contains("-")) {
            String[] addressInfo = adsData.split("-");
            String aid = UUIDUtils.getUUID(8);
            String cid = customer.getcId();
            if (addressInfo.length == 9) {
                Address address = new Address();
                address.setaId(aid);
                address.setaName(addressInfo[0]);
                address.setaPhone(addressInfo[1]);
                address.setaProvince(addressInfo[2] + "-" + addressInfo[3]);
                address.setaCity(addressInfo[4] + "-" + addressInfo[5]);
                address.setaDistrict(addressInfo[6] + "-" + addressInfo[7]);
                address.setaInfo(addressInfo[8]);
                //判断该用户的地址是否为空，若为空，则添加的第一条地址为默认地址
                List<Address> list = addressService.getAllAddressByCid(cid);
                if (list.size() == 0) {
                    address.setaStatus(1);
                } else {
                    address.setaStatus(0);
                }
                address.setaAddtime(DateUtil.getTimestamp(new Date()));
                address.setcId(cid);
                addressService.saveAddressByCid(address);
                return Msg.success();
            } else {
                return Msg.fail().add("checkAdsInfo", "地址信息不完善");
            }
        } else {
            return Msg.fail().add("checkAdsInfo", "地址信息不完善");
        }
    }

    /**
     * 不选择循环单次删除是因为每次循环都会打开和关闭数据库
     * 单个和批量结合
     * @param aids
     * @return
     */
    @RequestMapping(value = "/deleteAddressByAid/{aids}", method = RequestMethod.DELETE)
    @ResponseBody
    public Msg deleteEmpById(@PathVariable("aids") String aids) {
        if (aids.contains("-")) {
            List<String> del_ids = new ArrayList<>();
            String[] ids = aids.split("-");
            for (String string : ids) {
                del_ids.add(string);
            }
            addressService.deleteBatch(del_ids);
        } else {
            addressService.deleteAddressByAid(aids);
        }
        return Msg.success();
    }

    /**
     * 通过地址id获取地址信息
     *
     * @param aid
     * @return
     */
    @RequestMapping(value = "/getAddressByAid", method = RequestMethod.GET)
    @ResponseBody
    public Msg getAddressByAid(@RequestParam("aid") String aid, HttpServletRequest request) {
        HttpSession session = request.getSession();
        Address address = addressService.getAddressByAid(aid);
        return Msg.success().add("updateAddressInfo", address);
    }


    /**
     * 根据用户ID查询地址数据
     *
     * @return
     */
    @RequestMapping(value = "/getAllAddressByCidInOrder", method = RequestMethod.GET)
    @ResponseBody
    public Msg getAllAddressByCidInOrder(HttpServletRequest request) {
        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("customer");
        List<Address> addressList = addressService.getAllAddressByCid(customer.getcId());
        return Msg.success().add("addressListInfo", addressList);
    }

    /**
     * 根据用户查询地址数据（分页查询）
     *
     * @param pn
     * @return
     */
    @RequestMapping(value = "/getAllAddressByCid", method = RequestMethod.GET)
    @ResponseBody
    public Msg getAllAddressByCid(@RequestParam(value = "pn", defaultValue = "1") Integer pn, HttpServletRequest request) {
        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("customer");
        //        引入PageHelper分页插件
//        在查询之前只需要调用，传入页码,以及每页的大小
        PageHelper.startPage(pn, 5);
//        startPage后面紧跟的这个查询就是一个分页查询
        List<Address> addressList = addressService.getAllAddressByCid(customer.getcId());
//        使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行
//        封装了详细的分页信息，包括有我们查询出来的数据,传入连续显示的页数
        PageInfo pageInfo = new PageInfo(addressList, 5);
        return Msg.success().add("pageInfo", pageInfo);
    }
}
