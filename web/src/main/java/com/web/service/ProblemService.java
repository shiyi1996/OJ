package com.web.service;

import com.web.dao.ProblemDAO;
import com.web.entity.BasicVo;
import com.web.entity.Problem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/5/31 0031.
 */
@Service("ProblemService")
public class ProblemService {

    @Autowired
    private ProblemDAO problemDAO;

    public List<BasicVo> listProblem(Problem problem, int start, int size){
        return problemDAO.listBatch(problem,start,size);
    }

    public int getProblemNum(Problem problem){
        return problemDAO.count(problem);
    }
}
