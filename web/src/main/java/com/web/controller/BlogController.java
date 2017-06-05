package com.web.controller;

import com.web.dao.UserDAO;
import com.web.entity.BasicVo;
import com.web.entity.Blogleave;
import com.web.entity.Blogmain;

import com.web.entity.User;
import com.web.service.BlogService;
import com.web.service.UserService;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;


@Controller("BlogController")
@RequestMapping("/blog")
public class BlogController {

    @Autowired
    private BlogService blogService;

    @Autowired
    private UserDAO userDAO;

    @Autowired
    private UserService userService;

    @RequestMapping("")
    public ModelAndView list(HttpServletRequest request)
    {
        int size=3;
        int MaxPage=0;
        int nowPage=1;
        ModelAndView mav = new ModelAndView("blog");
        if(request.getParameter("nowpage")!=null && request.getParameter("nowpage")!=""){
            nowPage=Integer.parseInt(request.getParameter("nowpage"));
        }
        int max=blogService.getMaxPage();
        MaxPage=max%size==0 ? max/size : max/size+1;
        List<Blogmain> blogmains=blogService.getBlogmain((nowPage-1)*size,size);
        List<User> userList = new ArrayList<User>();
        System.out.println("size:"+blogmains.size());
        if(blogmains.size()!=0)
        {
            User user = null;
//            System.out.println("blogmains.get(0).getId()"+blogmains.get(2).getId());
            for (Blogmain blogmain : blogmains) {
//                System.out.println(blogmains.get(0).getUser_id());
//                System.out.println(userDAO.getEntityById(blogmain.getUser_id())==null);
                System.out.println(userDAO.getEntityById(blogmain.getUser_id()));
                    user = (User)userDAO.getEntityById(blogmain.getUser_id());
//                user = (User) userDAO.getEntityById(blogmain.getUser_id());
                userList.add(user);
            }
        }
        System.out.println("User"+userList.size());
        System.out.println("session:"+request.getSession().getAttribute("user"));
        mav.addObject("NowPage",nowPage);
        mav.addObject("Blogmain",blogmains);
        mav.addObject("User",userList);
        mav.addObject("MaxPage",MaxPage);

        return mav;
    }

    @RequestMapping("showblog/{blogmainid}")
    public ModelAndView showblog(HttpServletRequest request,@PathVariable int blogmainid)
    {
        int size=5;
        int MaxPage=0;
        int nowPage=1;
        ModelAndView mav = new ModelAndView("lookblog");
        if(request.getParameter("nowpage")!=null && request.getParameter("nowpage")!=""){
            nowPage=Integer.parseInt(request.getParameter("nowpage"));
        }
        Blogmain blogmain=blogService.getBlogmainById(blogmainid);
        mav.addObject("Blogmain",blogmain);
        User usermess=null;
        usermess=userService.getUserMessByUserId(blogmain.getUser_id());
        mav.addObject("Usermess",usermess);
        List<Blogleave> blogleaveList=blogService.getBlogleave(-1,blogmainid,(nowPage-1)*size,size);
        List<User> usermesses=new ArrayList<User>();
        List leaves=new ArrayList();
        List User=new ArrayList();
        if(blogleaveList.size()!=0){
            for(Blogleave blogleave:blogleaveList){
                List<Blogleave> blogleaves=new ArrayList<Blogleave>();
                blogleaves=blogService.getBlogleave(blogleave.getId(),blogmainid);
                leaves.add(blogleaves);
                if (blogleaves!=null && blogleaves.size() != 0) {
                    List<User> usermesses1=new ArrayList<User>();
                    for (Blogleave b : blogleaves) {
                        User users = new User();
                        users = userService.getUserMessByUserId(b.getLeave_id());
                        usermesses.add(users);
                    }
                    User.add(usermesses);
                }else{
                    User.add(null);
                }
                User user=new User();
                user=userService.getUserMessByUserId(blogleave.getLeave_id());
                usermesses.add(user);
            }
        }
        mav.addObject("Leaves",leaves);
        mav.addObject("Users",User);
        mav.addObject("MainBlogleave",blogleaveList);
        mav.addObject("MainUsermess",usermesses);
        int max=blogService.getMaxByBlogleave(-1,blogmainid);
        MaxPage=max%size==0 ? max/size : max/size+1;
        mav.addObject("NowPage",nowPage);
        mav.addObject("MaxPage",MaxPage);
        return mav;
    }

    @RequestMapping("publish")
    public ModelAndView publish(HttpServletRequest request)
    {
        ModelAndView mav = new ModelAndView("publishblog");
        //用过滤器处理未登录的情况
        System.out.println(request.getSession().getAttribute("user"));
        if(request.getParameter("blogtitle")!=null && request.getParameter("blogtitle")!=""){
            String title=request.getParameter("blogtitle");
            String content=request.getParameter("write-mess");

            int flag=blogService.addBlogmain(1,title,content);
            if(flag!=-1){
                mav = new ModelAndView("redirect:/blog");
            }else{
                mav = new ModelAndView("errorpage");
                mav.addObject("error","添加信息失败!");
            }
        }
        return mav;
    }

    @RequestMapping("addleave")
    public ModelAndView addleave(HttpServletRequest request)
    {
        ModelAndView mav=null;
        if(request.getParameter("mainid")!=null && request.getParameter("mainid")!="") {
            int leave_id = (Integer) request.getSession().getAttribute("user");
            int receive_id = -1;
            int main_id =Integer.parseInt(request.getParameter("mainid"));
            String leave_content = request.getParameter("write-mess");
            int flag=blogService.addBlogleave(leave_id,receive_id,main_id,leave_content);
            if(flag!=-1){
                mav = new ModelAndView("redirect:/blog/showblog/"+main_id);
            }else{
                mav = new ModelAndView("errorpage");
                mav.addObject("error","添加信息失败!");
            }
        }else{
            mav = new ModelAndView("errorpage");
            mav.addObject("error","该帖子不存在!");
        }
        return mav;
    }


    @RequestMapping(value="addLeaveword",produces = "application/json; charset=utf-8")
    @ResponseBody
    public String addLeaveword(HttpServletRequest request)
    {
        String result=null;
        if(request.getParameter("data") != null && request.getParameter("data") != "") {
            int id = (Integer) request.getSession().getAttribute("user");
            int mainid=Integer.parseInt(request.getParameter("mainid"));
            String mess = request.getParameter("data");
            JSONObject jsonObject=new JSONObject(mess);
            int flag=blogService.addBlogleave(id,jsonObject.getInt("num"),mainid,jsonObject.getString("text"));
            if(flag!=-1){
                result=jsonObject.getString("text");
            }else{
                result="评论失败";
            }
        }
        return result;
    }

}
