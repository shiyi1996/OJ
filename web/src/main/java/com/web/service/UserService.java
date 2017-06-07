package com.web.service;

import com.web.dao.SubmitDAO;
import com.web.dao.UserDAO;
import com.web.entity.BasicVo;
import com.web.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by TongYiMing on 2017/6/2.
 */
@Service("UserService")
public class UserService {

    @Autowired
    private UserDAO userDAO;

    private SubmitDAO submitDAO;

    public int login(String email, String username, String password){
        User user = new User();
        if(email == null)
        {
            user.setEmail(email);
        }
        else
        {
            user.setUsername(username);
        }

        List<BasicVo> userlist = userDAO.listBatch(user,0,1);

        if(userlist.size() == 0)
        {
            return -1; //用户名不存在
        }

        User user0 = (User)userlist.get(0);
        if(!user0.getPassword().equals(password))
        {
            return -2; //密码错误
        }
        else
        {
            return 0; //成功
        }

    }

    public boolean isEmailExist(String email)
    {
        boolean flag = false;
        User user = new User();
        user.setEmail(email);
        List<BasicVo> lists = userDAO.listBatch(user,0,1);
        if(lists.size()!=0)
        {
            flag = true;
        }
        return flag;
    }

    public boolean isUsernameExist(String username)
    {
        boolean flag = false;
        User user = new User();
        user.setUsername(username);

        List<BasicVo> lists = userDAO.listBatch(user,0,1);

        if(lists.size()!=0)
        {
            flag = true;
        }
        return flag;
    }

    public int getidByEmail(String email){
        int id = -1;
        User user=new User();
        user.setEmail(email);
        List<BasicVo> users=userDAO.listBatch(user,0,1);
        if(users.size()!=0)
        {
            User user0 = (User)users.get(0);
            id = user0.getUser_id();
        }


        return id;
    }

    public User getUserByUsername(String username)
    {
        User user =null;
        if(username!=null && username!="")
        {
            user = new User();
            user.setUsername(username);
            List<BasicVo> users=userDAO.listBatch(user,0,1);

            if(users.size()!=0)
            {
                user = (User)users.get(0);
            }

        }
        return user;

    }
    public User getUserByUserId(int userid)
    {
        User user =null;
        if(userid!=0) {
            return (User)userDAO.getEntityById(userid);
        }
        return null;


    }
    public User getUserMessByUserId(int userid)
    {
        User user=null;
        if(userid>0)
        {
            User usermess=new User();
            usermess.setUser_id(userid);
            if((userDAO.listBatch(usermess,0,1)).size()!=0) {
                user=(User) userDAO.listBatch(usermess, 0, 1).get(0);
            }
        }
        return user;
    }

    public User getUserMessByUserName(String username)
    {
        User user=null;
        try {
            username = new String(username.getBytes("iso-8859-1"), "utf-8");
            if(username!=null && username!="")
            {
                User usermess=new User();
                usermess.setUsername(username);
                if((userDAO.listBatch(usermess,0,1)).size()!=0) {
                    user=(User)userDAO.listBatch(usermess, 0, 1).get(0);
                }
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return user;
    }
    public int register(String username,String useremail, String userpass)
    {
        User user = new User();
        user.setUsername(username);
        user.setEmail(useremail);
        user.setPassword(userpass);

        int flag = userDAO.save(user);

        if(flag==1)
            return 1;
        return 0;
    }


    public List<Integer> SortAc_num()
    {
        List<Integer> list = userDAO.getIdByAc_num();
        return list;
    }


}
