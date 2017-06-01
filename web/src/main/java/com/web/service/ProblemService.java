package com.web.service;

import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by Administrator on 2017/5/31 0031.
 */
public class ProblemService {
    @Autowired
    private ProblemDAO problemDAO;

    public List<Problem> listProblem(Problem problem, int start, int size){
        return problemDAO.listBatch(problem,start,size);
    }
}
