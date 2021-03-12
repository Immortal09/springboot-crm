package com.immortal.service;

import java.util.List;

public interface BaseService<T> {
    //查询所有元素
   List<T> queryElementList();

   //根据id查询元素
    T queryElementById();

    //插入元素
    Integer insertElement(T t);

    //根据用户条件来查询用户
    Integer selectElementByCondition(T t);


    //根据id删除用户
    void deleteElementById(Long id);

}
