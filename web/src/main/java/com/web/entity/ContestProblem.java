package com.web.entity;

/**
 * Created by Administrator on 2017/5/23 0023.
 */
public class ContestProblem extends BasicVo {
    private int problem_id;        //题目ID
    private int contest_id;        //竞赛ID
    private int num;               //竞赛中的题目编号

    public ContestProblem() {}

    public ContestProblem(int problem_id, int contest_id, int num) {
        this.problem_id = problem_id;
        this.contest_id = contest_id;
        this.num = num;
    }

    public int getProblem_id() {
        return problem_id;
    }

    public void setProblem_id(int problem_id) {
        this.problem_id = problem_id;
    }

    public int getContest_id() {
        return contest_id;
    }

    public void setContest_id(int contest_id) {
        this.contest_id = contest_id;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }
}
