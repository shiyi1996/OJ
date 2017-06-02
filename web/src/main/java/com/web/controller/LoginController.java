package com.web.controller;

import com.web.entity.BasicVo;
import com.web.entity.Problem;
import com.web.service.ProblemService;
import com.web.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller("LoginController")
@RequestMapping("/login")
public class LoginController {

    @Autowired
    private UserService userService;


    @RequestMapping("")
    public ModelAndView login(HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mav = new ModelAndView("/login");
        String username = request.getParameter("username");
        String password = request.getParameter("userpass");
        HttpSession session=request.getSession();
        System.out.println(username+" "+password);
        if(username!=null && username!="" && password!=null && password!="")
        {
            int flag = userService.login(username,username,password);
            System.out.println(flag);
            switch(flag)
            {
                case 0:

                    session.setAttribute("user",userService.getIdByUsername(username));
                    mav = new ModelAndView("redirect:/p");
                    break;

                case -1:

                    mav.addObject("error", "用户名不存在");
                    break;

                case -2:

                    mav.addObject("error", "密码错误");
                    break;

            }
        }
        return mav;
    }


}
