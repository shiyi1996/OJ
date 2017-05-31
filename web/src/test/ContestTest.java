
import com.web.dao.ContestDAO;
import com.web.dao.ContestProblemDAO;
import com.web.entity.Contest;
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
public class ContestTest {

    @Autowired
    private ContestDAO contestDAO;

    @Test
    public void selectContest()
    {
        Contest contest=contestDAO.selectContest(2);
        System.out.println(contest.is_access()+" "+contest.is_open());
    }

}
