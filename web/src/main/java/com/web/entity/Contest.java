package com.web.entity;

/**
 * Created by Administrator on 2017/5/27 0027.
 */
public class Contest extends BasicVo {
    private int contest_id;         //比赛ID
    private String contest_name;    //大赛名称
    private String description;     //比赛描述
    private String start_time;      //开始时间(年月日时分)
    private String end_time;        //结束时间
    private int problem_num;        //试题的总数
    private boolean is_access;      //试题是否可访问:(是:1不是:0)
    private boolean is_open;        //不公开:0/公开:1
    private String password;        //密码

    public Contest() {}

    public Contest(int contest_id, String contest_name, String description, String start_time, String end_time, int problem_num, boolean is_access, boolean is_open, String password) {
        this.contest_id = contest_id;
        this.contest_name = contest_name;
        this.description = description;
        this.start_time = start_time;
        this.end_time = end_time;
        this.problem_num = problem_num;
        this.is_access = is_access;
        this.is_open = is_open;
        this.password = password;
    }

    public int getContest_id() {
        return contest_id;
    }

    public void setContest_id(int contest_id) {
        this.contest_id = contest_id;
    }

    public String getContest_name() {
        return contest_name;
    }

    public void setContest_name(String contest_name) {
        this.contest_name = contest_name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getStart_time() {
        return start_time;
    }

    public void setStart_time(String start_time) {
        this.start_time = start_time;
    }

    public String getEnd_time() {
        return end_time;
    }

    public void setEnd_time(String end_time) {
        this.end_time = end_time;
    }

    public int getProblem_num() {
        return problem_num;
    }

    public void setProblem_num(int problem_num) {
        this.problem_num = problem_num;
    }

    public boolean is_access() {
        return is_access;
    }

    public void setIs_access(boolean is_access) {
        this.is_access = is_access;
    }

    public boolean is_open() {
        return is_open;
    }

    public void setIs_open(boolean is_open) {
        this.is_open = is_open;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
