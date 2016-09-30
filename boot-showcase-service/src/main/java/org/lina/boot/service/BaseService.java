package org.lina.boot.service;

import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: Foy Lian
 * Date: 2016-09-30
 * Time: 16:34
 */
public abstract class BaseService<T>   {
    @Autowired
    protected Mapper<T> mapper;

    public T get(Object key){
        return mapper.selectByPrimaryKey(key);
    }
    public T selectOne(T entity){
        return mapper.selectOne(entity);
    }
    public int save(T entity){
        return mapper.insert(entity);
    }

    public int update(T entity){
        return mapper.updateByPrimaryKeySelective(entity);
    }

    public int delete(T entity){
        return mapper.deleteByPrimaryKey(entity);
    }

    public int deleteByPrimaryKey(Object key){
        return mapper.deleteByPrimaryKey(key);
    }

    public List<T> getAll(){
        return mapper.selectAll();
    }

    public List<T> selectByExample(T entity){
        return mapper.selectByExample(entity);
    }

    /**
     * 单表分页查询
     *
     * @param pageNum
     * @param pageSize
     * @return
     */
    public List<T> selectPage(int pageNum,int pageSize){
        PageHelper.startPage(pageNum, pageSize);
        //Spring4支持泛型注入
        return mapper.select(null);
    }
}
