package com.web.controller;

import com.web.entity.BasicVo;
import com.web.entity.Problem;
import com.web.entity.Submit;
import com.web.entity.User;
import com.web.service.ProblemService;
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
import java.util.ArrayList;
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

    @Autowired
    private ProblemService problemService;

    @RequestMapping("")
    public ModelAndView listProblem(HttpServletRequest request)
    {
        int thenstart=1;
        int num=6;
        int lang=0;
        int result=0;
        if(request.getParameter("thenstart")!=null
                && request.getParameter("thenstart")!="")
        {
            thenstart = Integer.parseInt(request.getParameter("thenstart"));
        }
        if(request.getParameter("lang")!=null
                && request.getParameter("lang")!="")
        {
            lang = Integer.parseInt(request.getParameter("lang"));
        }
        if(request.getParameter("teststatus")!=null
                && request.getParameter("teststatus")!="")
        {
            result = Integer.parseInt(request.getParameter("teststatus"));
        }
        int user_id=0;
        if(request.getSession().getAttribute("user")!=null) {
            user_id = ((User) request.getSession().getAttribute("user")).getUser_id();
        }
        List<BasicVo> list = submitService.listSubmit(user_id,lang,result,(thenstart-1)*num, num);
        List<Problem> prolist= new ArrayList<Problem>();
        if(list!=null && list.size()!=0) {
            for (BasicVo basicVo : list) {
                Problem problem = problemService.getProblemById(((Submit) basicVo).getProblem_id());
                prolist.add(problem);
            }
        }
        int SubmitNum = submitService.countSubmit(user_id,lang,result);
        int pageNum = (SubmitNum%num==0)?SubmitNum/num:SubmitNum/num+1;


        System.out.println("listtttttt::"+list.size());
        ModelAndView mav = new ModelAndView("record");
        mav.addObject("problem",prolist);
        mav.addObject("submit",list);
        mav.addObject("pagemax", pageNum);
        mav.addObject("pagenow", thenstart);
        mav.addObject("language",lang);
        mav.addObject("result",result);
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
        if(request.getParameter("id")!=null && request.getParameter("id")!=""){
            int id = Integer.parseInt(request.getParameter("id"));
            submit = submitService.getSubmitById(id);
        }
        return submit;
    }
}
