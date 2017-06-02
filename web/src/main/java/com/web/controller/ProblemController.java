package com.web.controller;

import com.web.entity.BasicVo;
import com.web.entity.Problem;
import com.web.service.ProblemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller("ProblemController")
@RequestMapping("/p")
public class ProblemController {

    @Autowired
    private ProblemService problemService;

    @RequestMapping("")
    public ModelAndView listProblem(HttpServletRequest request)
    {
        int thenstart=1;
        int num=2;
        Problem problem = new Problem();
        ModelAndView mdv = new ModelAndView("problem");

        String algorithm = null;
        String difficulty = null;
        String structure = null;

        if(request.getParameter("algorithm")!=null && request.getParameter("algorithm")!="")
        {
            algorithm = request.getParameter("algorithm");
            try {
                algorithm = new String(algorithm.getBytes("iso-8859-1"), "UTF-8");
            }catch (Exception e){
                e.printStackTrace();
            }
            problem.setAlgorithm(algorithm);
        }

        if(request.getParameter("difficulty")!=null && request.getParameter("difficulty")!="")
        {
            difficulty = request.getParameter("difficulty");
            try {
                difficulty = new String(difficulty.getBytes("iso-8859-1"), "UTF-8");
            }catch (Exception e){
                e.printStackTrace();
            }
            problem.setDifficulty(difficulty);
        }

        if(request.getParameter("structure")!=null && request.getParameter("structure")!="")
        {
            structure = request.getParameter("structure");
            try {
                structure = new String(structure.getBytes("iso-8859-1"), "UTF-8");
            }catch (Exception e){
                e.printStackTrace();
            }
            problem.setData_structure(structure);
        }

        if(request.getParameter("thenstart")!=null
                && request.getParameter("thenstart")!="")
        {
            thenstart = Integer.parseInt(request.getParameter("thenstart"));
        }

        int problemNum = problemService.getProblemNum(problem);
        int pageNum = (problemNum%num==0)?problemNum/num:problemNum/num+1;
        if (pageNum==0){
            mdv.addObject("error", "暂无题目");
        }else{
            if (thenstart > pageNum)
                thenstart = pageNum;
            else if (thenstart < 1)
                thenstart = 1;
            List<BasicVo> basicVoList = problemService.listProblem(problem, (thenstart-1)*num, num);
            mdv.addObject("problemList", basicVoList);
            mdv.addObject("pagemax", pageNum);
            mdv.addObject("pagenow", thenstart);
        }
        if(algorithm!=null && algorithm!="")
            mdv.addObject("algorithm",algorithm);
        else
            mdv.addObject("algorithm","nullone");
        if(difficulty!=null && difficulty!="")
            mdv.addObject("difficulty",difficulty);
        else
            mdv.addObject("difficulty","nulltwo");
        if(structure!=null && structure!="")
            mdv.addObject("structure",structure);
        else
            mdv.addObject("structure","nullthree");
        return mdv;
    }

    @RequestMapping("{problemId}")
    public ModelAndView showOneLostMess(@PathVariable int problemId)
    {

        ModelAndView mdv = new ModelAndView("problemmess");
        Problem problem = null;
        if(problemId > 0){
            problem = problemService.getProblemById(problemId);
        }
        mdv.addObject("problem",problem);
        return mdv;
    }

}
