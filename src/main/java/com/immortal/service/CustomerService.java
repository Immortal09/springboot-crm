package com.immortal.service;

import com.immortal.entity.po.Customer;
import com.immortal.entity.vo.PageDataResult;

public interface CustomerService extends BaseService {
    //分页查询列表
    PageDataResult queryElementListByPage(Integer page, Integer rows, Customer customer);
}
