package com.immortal.serviceImpl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.immortal.dao.CustomerMapper;
import com.immortal.entity.po.Customer;
import com.immortal.entity.po.CustomerExample;
import com.immortal.entity.vo.PageDataResult;
import com.immortal.service.CustomerService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("customer")
public class CustomerServiceImpl implements CustomerService {
    @Resource
    private CustomerMapper customerMapper;
    @Override
    public List<Customer> queryElementList() {
        CustomerExample customerExample = new CustomerExample();
        List<Customer> customers = customerMapper.selectByExample(customerExample);
        return customers;
    }

    @Override
    public Object queryElementById() {
        return null;
    }

    @Override
    public Integer insertElement(Object o) {
        return null;
    }

    @Override
    public Integer selectElementByCondition(Object o) {
        return null;
    }

    @Override
    public PageDataResult queryElementListByPage(Integer page, Integer rows,Customer customer) {
        //设置分页信息
        PageHelper.startPage(page,rows);
        //执行查询
        List<Customer> customerList = customerMapper.selectByCondition(customer);

        PageDataResult pageDataResult = new PageDataResult();
        PageInfo<Customer> pageInfo = new PageInfo<>(customerList);
        pageDataResult.setRows(customerList);
        pageDataResult.setTotal(pageInfo.getTotal());
        if(null != customerList){
            pageDataResult.setStatus(200);
            pageDataResult.setMessage("查询成功");
        }
        return  pageDataResult;
    }

    @Override
    public void deleteElementById(Long id) {

    }
}
