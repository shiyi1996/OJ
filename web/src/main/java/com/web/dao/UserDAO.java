package com.web.dao;

import com.web.entity.User;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by TongYiMing on 2017/6/2.
 */
@Repository("UserDAO")
public interface UserDAO extends BasicDao {
    public List<Integer> getIdByAc_num();
}
