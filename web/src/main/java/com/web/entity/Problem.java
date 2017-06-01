package com.web.entity;

import java.util.Date;

/**
 * Created by TongYiMing on 2017/6/1.
 */
public class Problem extends BasicVo {
    private int problem_id; //题目编号(主键)
    private int problem_type; //题目类型(默认为0:普通题,否则为contest_id)
    private String algorithm; //算法
    private String data_structure; //数据结构
    private String difficulty; //题目难度()
    private String title; //标题
    private String description; //题目描述
    private int test_sum; //测试数据的个数
    private Date add_time; //添加时间
    private int time_limit; //限时(ms)
    private int memory_limit; //空间限制

    public Problem() {}

    public Problem(int problem_type, String algorithm, String data_structure, String difficulty, String title, String description, int test_sum, Date add_time, int time_limit, int memory_limit) {
        this.problem_type = problem_type;
        this.algorithm = algorithm;
        this.data_structure = data_structure;
        this.difficulty = difficulty;
        this.title = title;
        this.description = description;
        this.test_sum = test_sum;
        this.add_time = add_time;
        this.time_limit = time_limit;
        this.memory_limit = memory_limit;
    }

    public Problem(int problem_id, int problem_type, String algorithm, String data_structure, String difficulty, String title, String description, int test_sum, Date add_time, int time_limit, int memory_limit) {
        this.problem_id = problem_id;
        this.problem_type = problem_type;
        this.algorithm = algorithm;
        this.data_structure = data_structure;
        this.difficulty = difficulty;
        this.title = title;
        this.description = description;
        this.test_sum = test_sum;
        this.add_time = add_time;
        this.time_limit = time_limit;
        this.memory_limit = memory_limit;
    }

    public int getProblem_id() {
        return problem_id;
    }

    public void setProblem_id(int problem_id) {
        this.problem_id = problem_id;
    }

    public int getProblem_type() {
        return problem_type;
    }

    public void setProblem_type(int problem_type) {
        this.problem_type = problem_type;
    }

    public String getAlgorithm() {
        return algorithm;
    }

    public void setAlgorithm(String algorithm) {
        this.algorithm = algorithm;
    }

    public String getData_structure() {
        return data_structure;
    }

    public void setData_structure(String data_structure) {
        this.data_structure = data_structure;
    }

    public String getDifficulty() {
        return difficulty;
    }

    public void setDifficulty(String difficulty) {
        this.difficulty = difficulty;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getTest_sum() {
        return test_sum;
    }

    public void setTest_sum(int test_sum) {
        this.test_sum = test_sum;
    }

    public Date getAdd_time() {
        return add_time;
    }

    public void setAdd_time(Date add_time) {
        this.add_time = add_time;
    }

    public int getTime_limit() {
        return time_limit;
    }

    public void setTime_limit(int time_limit) {
        this.time_limit = time_limit;
    }

    public int getMemory_limit() {
        return memory_limit;
    }

    public void setMemory_limit(int memory_limit) {
        this.memory_limit = memory_limit;
    }
}
