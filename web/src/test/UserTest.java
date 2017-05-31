
import com.web.dao.ContestProblemDAO;
import com.web.entity.ContestProblem;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

/**
 * Created by shiyi on 16/9/24.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:config/spring-MVC.xml"
        ,"classpath:config/spring-mybatis.xml"})
public class UserTest {

    @Autowired
    private ContestProblemDAO contestProblemDAO;

    @Test
    public void insertContestProblem()
    {
        ContestProblem contestProblem=new ContestProblem(3,2,3);
        int flag=contestProblemDAO.insertContestProblem(contestProblem);
        System.out.println(flag);
    }

    @Test
    public void selectProblem()
    {
        ContestProblem contestProblem=contestProblemDAO.selectProblem(3);
        System.out.println(contestProblem.getProblem_id()+" "+contestProblem.getContest_id()+" "+contestProblem.getNum());
    }

    @Test
    public void deleteContestProblem()
    {
        int flag=contestProblemDAO.deleteContestProblem(1);
        System.out.println(flag);
    }

}
