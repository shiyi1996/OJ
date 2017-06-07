package com.web.service;

import com.alibaba.druid.filter.FilterManager;
import com.web.dao.SubmitDAO;
import com.web.dao.UserDAO;
import com.web.entity.BasicVo;
import com.web.entity.Submit;
import com.web.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileWriter;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

/**
 * Created by Administrator on 2017/6/3 0003.
 */
@Service("SubmitService")
public class SubmitService {

    @Autowired
    private SubmitDAO submitDAO;
    @Autowired
    private UserDAO userDAO;

    public int addSubmit(int problem_id,int user_id,int language, String code){
        int id = -1;
        if(problem_id>0 && user_id>0 && language>0) {
            Calendar cal = Calendar.getInstance();
            SimpleDateFormat formats = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String date = formats.format(cal.getTime());

            Submit submit = new Submit();
            submit.setProblem_id(problem_id);
            submit.setUser_id(user_id);
            submit.setSubmit_time(date);
            submit.setLanguage(language);
//            submit.setResult_description("");
            String name = ""+user_id+"_"+System.currentTimeMillis();
            switch (language){
                case 1:
                    name += ".cpp";
                    break;
                case 2:
                    name += ".java";
                    break;
            }

            HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
            String path = request.getSession().getServletContext().getRealPath("/");
            saveCode(path, name, code);

            submit.setCode(name);

            int flag = submitDAO.save(submit);
            if(flag >= 1)
                id = submit.getSubmit_id();
            else
                id = -1;
        }
        return id;
    }

    public Submit getSubmitById(int id){
        Submit submit = null;
        if(id>0)
            submit = (Submit) submitDAO.getEntityById(id);
        return submit;
    }

    public void saveCode(String path, String name,String code)
    {
        try
        {
            File codeFilm = new File(path + "code" +File.separator + name);
            if(!codeFilm.exists()){
                codeFilm.createNewFile();
            }
            FileWriter fileWriter = new FileWriter(codeFilm);
            fileWriter.write(code);
            fileWriter.close();
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return;
    }

    public int countSubmitFromUser(User user)
    {
        int sum = 0 ;
        if(user.getUser_id() != 0)
        {
            sum = submitDAO.countSubmitNum(user.getUser_id());
        }
        else if(user.getUsername()!=null)
        {
            User user0 = new User();
            user0.setUsername(user.getUsername());
            int user_id = userDAO.save(user0);
            sum = submitDAO.countSubmitNum(user_id);
        }
        else if(user.getNickname()!=null)
        {
            User user0 = new User();
            user0.setNickname(user.getNickname());
            int user_id = userDAO.save(user0);
            sum = submitDAO.countSubmitNum(user_id);
        }

        return sum;
    }
}
