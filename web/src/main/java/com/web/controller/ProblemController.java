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
        int num=5;
        Problem problem = new Problem();
        ModelAndView mdv = new ModelAndView("problem");

        String algorithm = null;
        String difficulty = null;
        String structure = null;

        if(request.getParameter("algorithm")!=null && request.getParameter("algorithm")!="")
        {
            algorithm = request.getParameter("algorithm");
            problem.setAlgorithm(algorithm);
        }

        if(request.getParameter("difficulty")!=null && request.getParameter("difficulty")!="")
        {
            difficulty = request.getParameter("difficulty");
            problem.setDifficulty(difficulty);
        }

        if(request.getParameter("structure")!=null && request.getParameter("structure")!="")
        {
            structure = request.getParameter("structure");
            problem.setAlgorithm(structure);
        }

        if(request.getParameter("thenstart")!=null
                && request.getParameter("thenstart")!="")
        {
            thenstart = Integer.parseInt(request.getParameter("thenstart"));
        }

        List<BasicVo> basicVoList = problemService.listProblem(problem, (thenstart-1)*num, num);
        mdv.addObject("problemList", basicVoList);

        int problemNum = problemService.getProblemNum(problem);
        int pageNum = (problemNum%num==0)?problemNum/num:problemNum/num+1;
        mdv.addObject("algorithm",algorithm);
        mdv.addObject("difficulty",difficulty);
        mdv.addObject("structure",structure);
        mdv.addObject("pagemax", pageNum);
        mdv.addObject("pagenow", thenstart);

        return mdv;
    }

    @RequestMapping("{problemId}")
    public ModelAndView showOneLostMess(@PathVariable int problemId)
    {

        ModelAndView mdv = new ModelAndView("problemmess");
        return mdv;
    }

}
