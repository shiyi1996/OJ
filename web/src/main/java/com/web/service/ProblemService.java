package com.web.service;

import com.web.dao.ProblemDAO;
import com.web.entity.BasicVo;
import com.web.entity.Problem;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by Administrator on 2017/5/31 0031.
 */
public class ProblemService {
    //显示所有的普通题目(分页)
    @Autowired
    private ProblemDAO problemDAO;

    public List<BasicVo> listProblem(Problem problem, int start, int size){
        return problemDAO.listBatch(problem,start,size);
    }
}
