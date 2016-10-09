package org.lina.boot.mybatis.base;

import org.apache.ibatis.annotations.InsertProvider;
import org.apache.ibatis.annotations.Options;
import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.common.MySqlMapper;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: Foy Lian
 * Date: 2016-09-13
 * Time: 17:13
 */
public interface MyMapper<T> extends Mapper<T>, MySqlMapper<T> {
    @Options(
            useGeneratedKeys = true,
            keyProperty = "id"
    )
    @InsertProvider(
            type = MyBaseInsertProvider.class,
            method = "dynamicSQL"
    )
    int insertReturnId(T var1);

    @Options(
            useGeneratedKeys = true,
            keyProperty = "id"
    )
    @InsertProvider(
            type = MyBaseInsertProvider.class,
            method = "dynamicSQL"
    )
    int insertSelectiveReturnId(T var1);

    @InsertProvider(
            type = MyBaseInsertProvider.class,
            method = "dynamicSQL"
    )
    int insertListNotKey(List<T> var1);
}