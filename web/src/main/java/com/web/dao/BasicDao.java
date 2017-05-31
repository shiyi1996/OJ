package com.web.dao;

import com.web.entity.BasicVo;

import java.util.List;

/**
 * Created by Administrator on 2017/5/31 0031.
 */
public interface BasicDao {
    //添加
    public int save(BasicVo basicVo);

    public int saveBatch(List<BasicVo> basicVoList);

    //删除
    public int remove(int id);

    public int removeBatch(int[] id);

    //修改
    public int update(BasicVo basicVo);

    public int updateBatch(List<BasicVo> basicVoList);

    //查找
    public BasicVo getEntityById(int id);

    public List<BasicVo> list(BasicVo basicVo);

    public List<BasicVo> listBatch(BasicVo basicVo, int start, int size);

    //统计个数
    public int count(BasicVo basicVo);

    public int countAll();
}
