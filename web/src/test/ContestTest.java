
import com.web.dao.ContestDAO;
import com.web.entity.BasicVo;
import com.web.entity.Contest;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by shiyi on 16/9/24.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:config/spring-MVC.xml"
        ,"classpath:config/spring-mybatis.xml"})
public class ContestTest {

    @Autowired
    private ContestDAO contestDAO;

    @Test
    public void save()
    {
        Contest contest = new Contest("JAVA大赛","无","2000-02-20 20:20:20","2001-02-20 20:20:20",
                20,false,false,"abc");
        int flag = contestDAO.save(contest);
        System.out.println(flag);
    }

    @Test
    public void saveBatch()
    {
        List<BasicVo> list = new ArrayList<BasicVo>();
        Contest contest1 = new Contest("aaaa","无","2000-02-20 20:20:20","2001-02-20 20:20:20",
                20,false,false,"abc");
        Contest contest2 = new Contest("bbbb","无","2000-02-20 20:20:20","2001-02-20 20:20:20",
                20,false,false,"abc");
        list.add(contest1);
        list.add(contest2);
        int flag = contestDAO.saveBatch(list);
        System.out.println(flag);
    }

    @Test
    public void remove()
    {
        int flag=contestDAO.remove(1);
        System.out.println(flag);
    }

    @Test
    public void removeBatch()
    {
        int[] a={5,6};
        int flag=contestDAO.removeBatch(a);
        System.out.println(flag);
    }

    @Test
    public void update()
    {
        Contest contest = new Contest(5,"a","b","2017-05-31 20:20:20","2001-02-20 15:53:30",
                11,true,false,"abab");
        int flag = contestDAO.update(contest);
        System.out.println(flag);
    }

    @Test
    public void updateBatch()
    {
        List<BasicVo> list = new ArrayList<BasicVo>();
        Contest contest1 = new Contest(8,"qwer","b","2017-05-31 20:20:20","2001-02-20 15:53:30",
                11,true,false,"abab");
        Contest contest2 = new Contest(9,"qwer","b","2017-05-31 20:20:20","2001-02-20 15:53:30",
                11,true,false,"abab");
        list.add(contest1);
        list.add(contest2);
        int flag=contestDAO.updateBatch(list);
        System.out.println(flag);
    }

    @Test
    public void get()
    {
        Contest contest=(Contest) contestDAO.getEntityById(7);
        System.out.println(contest.getDescription()+" "+contest.getProblem_num());
    }

    @Test
    public void countAll()
    {
        int count=contestDAO.countAll();
        System.out.println(count);
    }
}
