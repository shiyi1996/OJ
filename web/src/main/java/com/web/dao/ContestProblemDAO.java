package com.web.dao;

import com.web.entity.ContestProblem;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2017/5/23 0023.
 */
@Repository("ContestProblemDAO")
public interface ContestProblemDAO {
    public int insertContestProblem(ContestProblem contestProblem);

    public int deleteContestProblem(int id);

    public ContestProblem selectProblem(int id);
}
