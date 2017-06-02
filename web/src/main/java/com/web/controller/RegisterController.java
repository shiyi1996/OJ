package com.web.controller;

import com.web.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by TongYiMing on 2017/6/2.
 */
@Controller("RegisterController")
@RequestMapping("")
public class RegisterController {
    @Autowired
    private UserService userService;

    @RequestMapping("/register")
    public ModelAndView register(HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mav  = new ModelAndView("/register");
        String username = request.getParameter("username");
        String useremail = request.getParameter("useremail");
        String userpass = request.getParameter("userpass");
        System.out.println(username+" "+useremail+" "+ userpass );
        if(username!=null && username!="" && useremail!=null && useremail!="" && userpass!=null && userpass!="")
        {
            if(userService.isUsernameExist(username))
            {
                mav.addObject("error","用户名已存在");
            }
            else if(userService.isEmailExist(useremail))
            {
                mav.addObject("error","邮箱已注册");
            }
            else
            {
                int flag = userService.register(username,useremail,userpass);
                if(flag == 1)
                {
                    mav = new ModelAndView("redirect:/login");
                }
                else
                {
                    mav.addObject("error","注册失败");
                }
            }

        }
        return mav;
    }
}
