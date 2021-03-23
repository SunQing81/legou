
import com.legou.dao.AddressMapper;
import com.legou.dao.AdministratorMapper;
import com.legou.entry.Administrator;
import com.legou.utils.DateUtil;
import com.legou.utils.UUIDUtils;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;

/**
 * 测试dao层的工作
 * 推荐Spring的项目就可以使用Spring的单元测试，可以自动注入我们需要的组件
 * 1.导入SpringTest模块
 * 2.@ContextConfiguration指定Spring配置文件的位置
 * 3.直接autowire要使用的组件
 */


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {
    //    @Autowired
//    CustomerMapper customerMapper;
    @Autowired
    AdministratorMapper administratorMapper;
    @Autowired
    AddressMapper addressMapper;
    //    @Autowired
//    GoodsMapper goodsMapper;
    @Autowired
    SqlSession sqlSession;

    @Test
    public void testCRUD() {
       /* //        批量插入多个顾客；批量，使用可以执行批量操作的SQLSession
        CustomerMapper mapper = sqlSession.getMapper(CustomerMapper.class);
        for (int i = 0; i <100 ; i++) {
            String cid = UUIDUtils.getUUID(8);
            String uid = UUIDUtils.getCnameStr(4,20);
            String pwd = Base64PasswordEncoderUtils.Base64Encode("12345678");
            String phone = UUIDUtils.getPhoneNum();
            mapper.insertSelective(new Customer(cid,uid,pwd,1,null,uid+"@qq.com",phone,null));
        }
        String cid = UUIDUtils.getUUID(8);
        String pwd = Base64PasswordEncoderUtils.Base64Encode("12345678");

        mapper.insertSelective(new Customer(cid,"中国加油",pwd,1,null,cid+"@qq.com","15537659105",null));


        AddressMapper mapper1 = sqlSession.getMapper(AddressMapper.class);
        for(int i = 0 ;i < 10 ;i++){
            String aid = UUIDUtils.getUUID(8);
           mapper1.insertSelective(new Address(aid,"中国加油","15537659105","信阳市信阳农林学院",0,"94a2add8"));
        }

        //        批量插入多个管理员；批量，使用可以执行批量操作的SQLSession
        AdministratorsMapper mapper = sqlSession.getMapper(AdministratorsMapper.class);
        for (int i = 0; i < 10; i++) {
            String aid = UUIDUtils.getUUID(5);
            String uid = UUIDUtils.getCnameStr(4,20);
            String phone = UUIDUtils.getPhoneNum();
            mapper.insertSelective(new Administrators(aid,uid,"123456",1,uid+"@qq.com",phone));
        }

        GoodsMapper mapper = sqlSession.getMapper(GoodsMapper.class);
        for (int i = 0 ;i < 14 ;i++){
            String gid = UUIDUtils.getUUID(8);
//            String creatTime = DateUtil.getTimestamp(new Date());
//            String endTime = DateUtil.getTimestamp(DateUtil.getEndDate(1));
            mapper.insertSelective(new Goods(gid,null,null,DateUtil.getTimestamp(new Date()),DateUtil.getTimestamp(DateUtil.getEndDate(12)),100,null,5,24,87));
        }*/
        //        批量插入多个管理员；批量，使用可以执行批量操作的SQLSession
        AdministratorMapper mapper = sqlSession.getMapper(AdministratorMapper.class);
        for (int i = 0; i < 10; i++) {
            String aid = UUIDUtils.getUUID(5);
            String uid = UUIDUtils.getCnameStr(4, 10);
            String phone = UUIDUtils.getPhoneNum();
            String createtime = DateUtil.getTimestamp(new Date());
            mapper.insertSelective(new Administrator(aid, uid, "12345678", 1, uid + "@qq.com", phone, createtime, null, 2));
        }
        System.out.println("批量完成");
    }
}
