import com.web.dao.SubmitDAO;
import com.web.dao.UserDAO;
import com.web.entity.BasicVo;
import com.web.entity.Submit;
import com.web.entity.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by TongYiMing on 2017/6/2.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:config/spring-MVC.xml"
        ,"classpath:config/spring-mybatis.xml"})
public class UserTest {
    @Autowired
    private UserDAO userDAO;

    @Test
    public void saveTest() {

        User user = new User("as","sa","123@qq.com","weweq","2.jpg",12,2,"xupt",1);
        int pos = userDAO.save(user);
        System.out.println(pos);
    }
    @Test
    public void saveBatchTest() {

        User user1 = new User("as","sa","123@qq.com","weweq","2.jpg",12,2,"xupt",2);
        User user2 = new User("as","sa","123@qq.com","weweq","2.jpg",12,2,"xupt",1);
        User user3 = new User("as","sa","123@qq.com","weweq","2.jpg",12,2,"xupt",3);
        User user4 = new User("as","sa","123@qq.com","weweq","2.jpg",12,2,"xupt",6);
        User user5 = new User("as","sa","123@qq.com","weweq","2.jpg",12,2,"xupt",7);
        User user6 = new User("as","sa","123@qq.com","weweq","2.jpg",12,2,"xupt",3);
        List<BasicVo> users = new ArrayList<BasicVo>();
        users.add(user1);
        users.add(user2);
        users.add(user3);
        users.add(user4);
        users.add(user5);
        users.add(user6);

        int pos = userDAO.saveBatch(users);
        System.out.println(pos);
    }

    @Test
    public void removeTest(){
        int pos = userDAO.remove(1);
        System.out.println(pos);
    }

    @Test
    public void removeBatchTest(){
        int a[] = {2,3};
        int pos = userDAO.removeBatch(a);
        System.out.println(pos);
    }

    @Test
    public void update(){
        User user1 = new User(5,"as","sa","123@qq.com","weweq","2.jpg",12,2,"xupt",2);
        int pos = userDAO.update(user1);
        System.out.println(pos);
    }


    @Test
    public void get()
    {
        User user=(User) userDAO.getEntityById(4);
        System.out.println(user.getAge() + "" + user.getSex());
    }

    @Test
    public void getListTest()
    {
        List<BasicVo> lists = new ArrayList<BasicVo>();
        User user = new User();
        user.setUsername("shiyi");
        lists = userDAO.listBatch(user, 0,1);
        System.out.println(lists.size());
    }

    @Test
    public void countAll()
    {
        int count=userDAO.countAll();
        System.out.println(count);
    }
    @Test
    public void ac_num()
    {
        List<Integer>  lists= userDAO.getIdByAc_num();
        for (int  a:lists) {
            System.out.print(a+" ");
        }
    }
}
