
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
        Problem problem = new Problem(0,0,"贪心","树结构","简单","字符串统计","Bat是一个淘气的小朋友，有一天他得到了一个字符串，他想统计一下字符串中的小写字母(‘a’-’z’)的个数，快来帮帮他吧。","输入一个字符串",
                "输出一个整数，代表小写字母的个数。",
                "AabcBB",
                "3",
                "字符串中不包含空格、字符串长度<10000",
                "2017-06-03 20:00:00",1,2);
        int pos = problemDAO.save(problem);
        System.out.println(pos);
    }

    @Test
    public void saveBatchTest() {
        Date date = new Date();
        //Problem problem = ('1', '0', '贪心', '树结构', '难', '彩色丝带', 'Bat有一个彩色的丝带，它可以表示为一个只包含小写字母字符串，每个字母代表一个颜色。现在他想把丝带分成几部分，保证每个部分没有重复的颜色。请你告诉他划分彩带一共有多少种不同的方式。', '输入一个字符串，表示彩色的丝带。(字符串只包含小写字母，字符串长度<10^5)', '输出一个数字n，表示对答案取模后的数字。', 'abbc', '4', '由于数字会非常大，输出的答案对 1000000007 取余.', '2017-06-03 20:00:00', '1', 2);
        Problem problem1 = new Problem(0,0,"KMP","tree","hard","a","miaoshu","sdadd","ssss","ddddd","ffffff","eeeeee","2000-02-20 20:20:20",213,123);
        Problem problem2 = new Problem(0,0,"KMP","tree","hard","a","miaoshu","sdadd","ssss","ddddd","ffffff","eeeeee","2000-02-20 20:20:20",213,123);
        Problem problem3 = new Problem(0,0,"KMP","tree","hard","a","miaoshu","sdadd","ssss","ddddd","ffffff","eeeeee","2000-02-20 20:20:20",213,123);
        Problem problem4 = new Problem(0,0,"KMP","tree","hard","a","miaoshu","sdadd","ssss","ddddd","ffffff","eeeeee","2000-02-20 20:20:20",213,123);
        List<BasicVo> problems = new ArrayList<BasicVo>();
        //problems.add(problem);
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
        Problem problem = new Problem(3,0,"a","a","a","a","a","a","a","a","a","a","2000-02-20 20:20:20",100,22);
        int pos = problemDAO.update(problem);
        System.out.println(pos);
    }

    @Test
    public void updateBatch(){
        List<BasicVo> problems = new ArrayList<BasicVo>();
        Problem problem = new Problem(4,0,"a","a","a","a","a","a","a","a","a","a","2000-02-20 20:20:20",11,11);
        Problem problem1 = new Problem(5,0,"a","a","a","a","a","a","a","a","a","a","2000-02-20 20:20:20",11,11);
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