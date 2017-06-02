
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
        Problem problem = new Problem(0,0,"贪心","树结构","超难","测试","miaoshu","第一行包含两个正整数，N和M。 接下来的M行每行包含三个正整数：x，y和v（1≤x,y≤N，0 最后一行包含两个正整数s，t，表示想知道从景点s到景点t最大最小速度比最小的路径。s和t不可能相同。",
                "第一行包含两个正整数，N和M。 接下来的M行每行包含三个正整数：x，y和v（1≤x,y≤N，0 最后一行包含两个正整数s，t，表示想知道从景点s到景点t最大最小速度比最小的路径。s和t不可能相同。",
                "样例1\\n4 2\\n1 2 1\\n3 4 2\\n1 4\\n样例1\\n4 2\\n1 2 1\\n3 4 2\\n1 4",
                "样例1\\n4 2\\n1 2 1\\n3 4 2\\n1 4\\n样例1\\n4 2\\n1 2 1\\n3 4 2\\n1 4",
                "N(1<\\N≤500)\\nM（0<\\M≤5000\\nVi在int范围内",
                10,"2000-02-20 20:20:20",213,123);
        int pos = problemDAO.save(problem);
        System.out.println(pos);
    }
    @Test
    public void saveBatchTest() {
        Date date = new Date();
        Problem problem = new Problem(0,0,"KMP","tree","hard","a","miaoshu","sdadd","ssss","ddddd","ffffff","eeeeee",10,"2000-02-20 20:20:20",213,123);
        Problem problem1 = new Problem(0,0,"KMP","tree","hard","a","miaoshu","sdadd","ssss","ddddd","ffffff","eeeeee",10,"2000-02-20 20:20:20",213,123);
        Problem problem2 = new Problem(0,0,"KMP","tree","hard","a","miaoshu","sdadd","ssss","ddddd","ffffff","eeeeee",10,"2000-02-20 20:20:20",213,123);
        Problem problem3 = new Problem(0,0,"KMP","tree","hard","a","miaoshu","sdadd","ssss","ddddd","ffffff","eeeeee",10,"2000-02-20 20:20:20",213,123);
        Problem problem4 = new Problem(0,0,"KMP","tree","hard","a","miaoshu","sdadd","ssss","ddddd","ffffff","eeeeee",10,"2000-02-20 20:20:20",213,123);
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
        Problem problem = new Problem(3,0,"a","a","a","a","a","a","a","a","a","a",100,"2000-02-20 20:20:20",100,22);
        int pos = problemDAO.update(problem);
        System.out.println(pos);
    }

    @Test
    public void updateBatch(){
        List<BasicVo> problems = new ArrayList<BasicVo>();
        Problem problem = new Problem(4,0,"a","a","a","a","a","a","a","a","a","a",11,"2000-02-20 20:20:20",11,11);
        Problem problem1 = new Problem(5,0,"a","a","a","a","a","a","a","a","a","a",11,"2000-02-20 20:20:20",11,11);
        problems.add(problem);
        problems.add(problem1);
        int pos = problemDAO.updateBatch(problems);
        System.out.println(pos);
    }

    @Test
    public void listBatch()
    {
        Problem problem = new Problem();
        problem.setProblem_type(0);
        problem.setAlgorithm("贪心");
        problem.setData_structure("树结构");
        problem.setDifficulty("超难");
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