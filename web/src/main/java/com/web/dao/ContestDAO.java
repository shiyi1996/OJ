package com.web.dao;

import com.web.entity.Contest;
import org.springframework.stereotype.Repository;

/**
 * Created by Administrator on 2017/5/23 0023.
 */
@Repository("ContestDAO")
public interface ContestDAO {
    public Contest selectContest(int id);
    public int insertContest(Contest contest);
}
