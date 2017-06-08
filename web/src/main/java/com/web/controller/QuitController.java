package com.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by TongYiMing on 2017/6/7.
 */
@Controller("QuitController")
@RequestMapping("/quit")
public class QuitController {

    @RequestMapping("")
    public ModelAndView quit(HttpServletRequest request)
    {
        ModelAndView mav = null;
        HttpSession session = request.getSession();
        session.invalidate();
        mav = new ModelAndView("redirect:/login");
//        mav.addObject("error","退出成功");
        return mav;

    }
}
