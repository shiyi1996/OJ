package com.web.controller;

import org.springframework.beans.factory.parsing.Problem;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller("ProblemController")
@RequestMapping("/p")
public class ProblemController {

    @RequestMapping("")
    public ModelAndView listProblem(HttpServletRequest request)
    {
        int thenstart=1;
        int num=20;
        Problem problem = new Problem();
        ModelAndView mdv = new ModelAndView("problem");

        if(request.getParameter("algorithm")!=null && request.getParameter("algorithm")!="")
        {

        }

        if(request.getParameter("thenstart")!=null
                && request.getParameter("thenstart")!="")
        {
            thenstart = Integer.parseInt(request.getParameter("thenstart"));
        }

        Lostmess lostmess = new Lostmess();
        lostmess.setFind_type(type);
        List<Lostmess> lostList = lostActionService.getLostMess(lostmess, (thenstart-1)*num, num);
        mdv.addObject("lostList", lostList);

        int lostNum = lostActionService.getLostMessCount(new Lostmess());
        int pageNum = lostNum%num==0?lostNum/num:lostNum/num+1;
        mdv.addObject("lostMessCount", lostNum);
        mdv.addObject("pagemax", pageNum);
        mdv.addObject("pagenow", thenstart);

        return mdv;
    }


}
