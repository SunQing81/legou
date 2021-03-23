import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

/**
 * 使用Spring测试模块提供的请求测试功能，测试crud请求的正确性
 * Spring4测试的时候，需要servlet3.0的支持
 */
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:applicationContext.xml", "classpath:springMVC.xml"})
public class MvcTest {
    //    传入SpringMVC的IOC
    @Autowired
    WebApplicationContext context;
    //    虚拟MVC请求，获取到处理结果
    MockMvc mockMvc;

    @Before
    public void initMockMvc() {
        mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
    }

    @Test
    public void testPage() throws Exception {
//        模拟请求拿到返回值
       /* MvcResult result = mockMvc.perform(MockMvcRequestBuilders.post("/checkUser")
                .param("cName","lucy").param("cPassword","123456")).andReturn();*/
//        请求成功以后，请求域中会有pageInfo；我们可以取出pageInfo进行验证
//        MockHttpServletRequest request = result.getRequest();
//        MvcResult result = mockMvc.perform(MockMvcRequestBuilders.post("/saveCustomer")).andReturn();
        MvcResult result = mockMvc.perform(MockMvcRequestBuilders.post("/getAllOrderByCid")).andReturn();

    }
}
