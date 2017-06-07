package com.web.controller;

import com.web.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.support.MethodOverride;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by TongYiMing on 2017/6/7.
 */
@Controller("SortAc_NumControllerroller")
@RequestMapping("")
public class SortAc_NumController {

    @Autowired
    private UserService userService;

    @RequestMapping("/sort")
    public ModelAndView Sort(HttpServletRequest request)
    {
        ModelAndView mav = new ModelAndView("/sort");
        List<Integer> lists = userService.SortAc_num();
        for (int a:lists) {
            System.out.print(a+" ");
        }
        if(lists !=null)
            mav.addObject("sortAc_num",lists);
        return mav;
    }
}
