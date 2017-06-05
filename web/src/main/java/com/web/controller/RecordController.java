package com.web.controller;

import com.web.entity.Submit;
import com.web.entity.User;
import com.web.service.SubmitService;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
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
        String s = request.getParameter("code");
        System.out.println("code:"+s);
        ModelAndView mav = new ModelAndView("record");
        return mav;
    }

    @RequestMapping("addSubmit")
    @ResponseBody
    public Submit addSubmit(HttpServletRequest request)
    {
        Submit submit = null;
        if(request.getParameter("data") != null && request.getParameter("data") != "") {
            int user_id =((User)request.getSession().getAttribute("user")).getUser_id();
            String mess = request.getParameter("data");
            JSONObject jsonObject=new JSONObject(mess);
            int id = submitService.addSubmit(jsonObject.getInt("problemId"),user_id,jsonObject.getInt("language"),jsonObject.getString("code"));
            if(id != -1)
                submit = submitService.getSubmitById(id);
        }
        return submit;
    }
}
