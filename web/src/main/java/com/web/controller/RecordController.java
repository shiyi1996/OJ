package com.web.controller;

import com.web.entity.Submit;
import com.web.entity.User;
import com.web.service.SubmitService;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Arrays;
import java.util.List;

/**
 * Created by Administrator on 2017/6/3 0003.
 */
@Controller("RecordController")
@RequestMapping("/record")
public class RecordController {
    @Autowired
    private SubmitService submitService;

    @RequestMapping("")
    public ModelAndView listProblem(HttpServletRequest request)
    {
        ModelAndView mav = new ModelAndView("record");
        return mav;
    }

    @RequestMapping(value="addSubmit", method = RequestMethod.POST)
    @ResponseBody
    public int addSubmit(HttpServletRequest request) throws IOException {
        StringBuilder sb = new StringBuilder();

        BufferedReader br = request.getReader();
        char[] buff = new char[10000];
        int len;
        while((len = br.read(buff)) != -1){
            sb.append(buff, 0, len);
        }

        String mess = sb.toString();
        int id = -1;

        if(mess != null && mess != "") {

            int user_id =((User)request.getSession().getAttribute("user")).getUser_id();

            JSONObject jsonObject=new JSONObject(mess);
            id = submitService.addSubmit(
                    jsonObject.getInt("problemId"),
                    user_id,
                    jsonObject.getInt("language"),
                    URLDecoder.decode(jsonObject.getString("code"), "UTF-8"));

        }
        return id;
    }

    @RequestMapping("submitStatus")
    @ResponseBody
    public Submit submitStatus(HttpServletRequest request){
        Submit submit = null;
        System.out.println(request.getParameter("id"));
        if(request.getParameter("id")!=null && request.getParameter("id")!=""){
            int id = Integer.parseInt(request.getParameter("id"));
            System.out.println("idddddddd:"+id);
            submit = submitService.getSubmitById(id);
        }
        return submit;
    }
}
