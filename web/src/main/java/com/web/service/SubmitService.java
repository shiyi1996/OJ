package com.web.service;

import com.alibaba.druid.filter.FilterManager;
import com.web.dao.SubmitDAO;
import com.web.entity.BasicVo;
import com.web.entity.Submit;
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

    public int addSubmit(int problem_id,int user_id,int language, String code){
        int res = -1;
        if(problem_id>0 && user_id>0 && language>0) {
            Calendar cal = Calendar.getInstance();
            SimpleDateFormat formats = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String date = formats.format(cal.getTime());

            Submit submit = new Submit();
            submit.setProblem_id(problem_id);
            submit.setUser_id(user_id);
            submit.setSubmit_time(date);
            submit.setLanguage(language);
            submit.setResult_description("暂无");
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

            res=submitDAO.save(submit);
        }
        return res;
    }

    public List<BasicVo> getSubmit(int language,int result){
        List<BasicVo> submitList = null;
        if(language >= 0 && result >= 0){
            Submit submit = new Submit();
            submit.setLanguage(language);
            submit.setResult(result);
            submitList = submitDAO.listBatch(submit,0,6);
        }
        return submitList;
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
}
