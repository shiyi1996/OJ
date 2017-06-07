package com.web.controller;

import com.web.dao.SubmitDAO;
import com.web.dao.UserDAO;
import com.web.entity.User;
import com.web.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.support.MethodOverride;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by TongYiMing on 2017/6/7.
 */
@Controller("SortControllerroller")
@RequestMapping("")
public class SortController {

    @Autowired
    private SubmitDAO submitDAO;
    @Autowired
    private UserService userService;

    @RequestMapping("/sort")
    public ModelAndView Sort(HttpServletRequest request)
    {
        ModelAndView mav = new ModelAndView("top");
        List<Integer> lists = userService.SortAc_num();
        List<User> users = new ArrayList<User>();
        List<Integer> sums = new ArrayList<Integer>();
        for (int a:lists) {
            User user0 = userService.getUserByUserId(a);
            users.add(user0);
            int sum = submitDAO.countSubmitNum(user0.getUser_id());
            sums.add(sum);
        }
        if(lists !=null)
            mav.addObject("sortAc_num",users);
            mav.addObject("submitnum",sums);
        return mav;
    }
}
