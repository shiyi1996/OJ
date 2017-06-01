
import com.web.dao.ContestDAO;
import com.web.dao.ProblemDAO;
import com.web.entity.BasicVo;
import com.web.entity.Contest;
import com.web.entity.Problem;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:config/spring-MVC.xml"
        ,"classpath:config/spring-mybatis.xml"})
public class ProblemTest {

    @Autowired
    private ProblemDAO problemDAO;

    @Test
    public void saveTest() {
        Date date = new Date();
        Problem problem = new Problem(0,"KMP","tree","easy","hahh","miaoshu",10,date,213,123);
        int pos = problemDAO.save(problem);
        System.out.println(pos);
    }
    @Test
    public void saveBatchTest() {
        Date date = new Date();
        Problem problem = new Problem(0,"KMP","tree","hard","a","miaoshu",10,date,213,123);
        Problem problem1 = new Problem(0,"KMP","tree","easy","b","a",10,date,213,123);
        Problem problem2 = new Problem(0,"KMP","tree","hard","c","b",10,date,213,123);
        Problem problem3 = new Problem(0,"KMP","tree","hard","d","c",10,date,213,123);
        Problem problem4 = new Problem(0,"KMP","tree","easy","e","d",10,date,213,123);
        List<BasicVo> problems = new ArrayList<BasicVo>();
        problems.add(problem);
        problems.add(problem1);
        problems.add(problem2);
        problems.add(problem3);
        problems.add(problem4);

        int pos = problemDAO.saveBatch(problems);
        System.out.println(pos);
    }

    @Test
    public void removeTest(){
        int pos = problemDAO.remove(1);
        System.out.println(pos);
    }

    @Test
    public void removeBatchTest(){
        int a[] = {2,3};
        int pos = problemDAO.removeBatch(a);
        System.out.println(pos);
    }

    @Test
    public void updateTest(){
        Date date = new Date();
        Problem problem = new Problem(5,0,"KdasM","tree","easy","hahh","miaoshu",10,date,213,123);
        int pos = problemDAO.update(problem);
        System.out.println(pos);
    }

    @Test
    public void updateBatch(){
        List<BasicVo> problems = new ArrayList<BasicVo>();
        Problem problem = new Problem(4,0,"AP","tree","easy","hahh","miaoshu",10,new Date(),213,123);
        Problem problem1 = new Problem(5,0,"MP","tree","easy","hahh","miaoshu",10,new Date(),213,123);
        problems.add(problem);
        problems.add(problem1);
        int pos = problemDAO.updateBatch(problems);
        System.out.println(pos);
    }

    @Test
    public void listBatch()
    {
        Problem problem = new Problem();
//        problem.setProblem_type(1);
//        problem.setAlgorithm("DFS");
//        problem.setData_structure("tree");
//        problem.setDifficulty("easy");
        List<BasicVo> problemList=problemDAO.listBatch(problem,0,3);
        for(BasicVo b:problemList){
            System.out.println(((Problem)b).getProblem_id());
        }
    }

    @Test
    public void count()
    {
        Problem problem = new Problem();
        problem.setProblem_type(1);
//        problem.setAlgorithm("DFS");
//        problem.setData_structure("tree");
        problem.setDifficulty("hard");
        int count=problemDAO.count(problem);
        System.out.println(count);
    }

    @Test
    public void get()
    {
        Problem problem=(Problem) problemDAO.getEntityById(4);
        System.out.println(problem.getDescription()+" "+problem.getAlgorithm());
    }

    @Test
    public void countAll()
    {
        int count=problemDAO.countAll();
        System.out.println(count);
    }

}