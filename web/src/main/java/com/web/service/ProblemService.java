package com.web.service;

<<<<<<< HEAD
=======
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

>>>>>>> 0daf7a9a0c2e8a9e20a245c7f41a4dc51db12302
/**
 * Created by Administrator on 2017/5/31 0031.
 */
public class ProblemService {
<<<<<<< HEAD
    //显示所有的普通题目(分页)

=======
    @Autowired
    private ProblemDAO problemDAO;

    public List<Problem> listProblem(Problem problem, int start, int size){
        return problemDAO.listBatch(problem,start,size);
    }
>>>>>>> 0daf7a9a0c2e8a9e20a245c7f41a4dc51db12302
}
