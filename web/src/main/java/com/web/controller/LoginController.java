package com.web.controller;

import com.web.entity.BasicVo;
import com.web.entity.Problem;
import com.web.entity.User;
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
@RequestMapping("")
public class LoginController {

    @Autowired
    private UserService userService;


    @RequestMapping("/login")
    public ModelAndView login(HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mav = new ModelAndView("/login");
        String username = request.getParameter("username");
        String password = request.getParameter("userpass");
        HttpSession session=request.getSession();
        if(username!=null && username!="" && password!=null && password!="")
        {
            int flag = userService.login(username,username,password);
            switch(flag)
            {
                case 0:
                    session.setAttribute("user",userService.getUserByUsername(username));
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
    @RequestMapping("/usermess")
    public ModelAndView jumpUsermess(HttpServletRequest request)
    {
        ModelAndView mav = mav = new ModelAndView("/usermess");
        String username = request.getParameter("username");
        String userpass = request.getParameter("userpass");
        String useremail = request.getParameter("useremail");
        String userdesc = request.getParameter("userdesc");
        User user= (User) request.getSession().getAttribute("user");
        if(user.getUsername()!=username && username!=null && username!="")
        {
            user.setUsername(username);
        }
        if(user.getNickname()!=userpass && userpass!=null && userpass!="")
        {
            user.setNickname(userpass);
        }
        if(user.getEmail()!=useremail && useremail!=null && useremail!="")
        {
            user.setEmail(useremail);
        }
        if(user.getSchool()!=userdesc && userdesc!=null && userdesc!="")
        {
            user.setSchool(userdesc);
        }

        if(1==userService.updataUser(user))
        {
            System.out.println("更新成功");
        }

        request.getSession().setAttribute("user",user);
//        mav.addObject("user",user);
        return mav;
    }

}
