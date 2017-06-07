package com.web.entity;

import java.util.Date;

/**
 * Created by TongYiMing on 2017/6/1.
 */
public class Submit extends BasicVo {

    private int submit_id;              //提交记录ID(主键)
    private int problem_id;             //题目编号
    private int user_id;                //提交用户ID
    private String submit_time;         //提交时间
    private int running_time;           //耗时(ms)
    private int running_memory;         //所占空间
    private int result;                 //结果(pending=0,judging=1,Compling=2,Runnuing=3,ComplieError=4,RuntimeErroe=5,TimeOut=6,Accept=7)
    private String result_description;  //结果描述
    private int language;               //提交语言(1:c/c++;2:java;3:javascript)
    private String code;                //提交代码
    private int accept_sum;             //通过用例数

    public Submit() {}

    public Submit(int submit_id, int problem_id, int user_id, String submit_time, int running_time, int running_memory, int result, String result_description, int language, String code, int accept_sum) {
        this.submit_id = submit_id;
        this.problem_id = problem_id;
        this.user_id = user_id;
        this.submit_time = submit_time;
        this.running_time = running_time;
        this.running_memory = running_memory;
        this.result = result;
        this.result_description = result_description;
        this.language = language;
        this.code = code;
        this.accept_sum = accept_sum;
    }

    public int getSubmit_id() {
        return submit_id;
    }

    public void setSubmit_id(int submit_id) {
        this.submit_id = submit_id;
    }

    public int getProblem_id() {
        return problem_id;
    }

    public void setProblem_id(int problem_id) {
        this.problem_id = problem_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getSubmit_time() {
        return submit_time;
    }

    public void setSubmit_time(String submit_time) {
        this.submit_time = submit_time;
    }

    public int getRunning_time() {
        return running_time;
    }

    public void setRunning_time(int running_time) {
        this.running_time = running_time;
    }

    public int getRunning_memory() {
        return running_memory;
    }

    public void setRunning_memory(int running_memory) {
        this.running_memory = running_memory;
    }

    public int getResult() {
        return result;
    }

    public void setResult(int result) {
        this.result = result;
    }

    public String getResult_description() {
        return result_description;
    }

    public void setResult_description(String result_description) {
        this.result_description = result_description;
    }

    public int getLanguage() {
        return language;
    }

    public void setLanguage(int language) {
        this.language = language;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public int getAccept_sum() {
        return accept_sum;
    }

    public void setAccept_sum(int accept_sum) {
        this.accept_sum = accept_sum;
    }
}
