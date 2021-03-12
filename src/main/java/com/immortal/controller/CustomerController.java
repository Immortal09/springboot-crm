package com.immortal.controller;

import com.immortal.entity.po.BaseDict;
import com.immortal.entity.po.Customer;
import com.immortal.entity.vo.PageDataResult;
import com.immortal.entity.vo.SelectContent;
import com.immortal.service.BaseDictService;
import com.immortal.service.CustomerService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
@PropertySource("classpath:/properties/content.properties")
public class CustomerController {
    @Resource
    private CustomerService customerService;

    @Resource
    private BaseDictService baseDictService;

    @Value("${customerSource_code}")
    private String customerSource_code;

    @Value("${customerIndustry_code}")
    private String customerIndustry_code;

    @Value("${customerLevel_code}")
    private String customerLevel_code;

    /**
     * 分页条件查询顾客列表
     * @return
     */
    @RequestMapping("list")
    @ResponseBody
    public PageDataResult getCustomerList(Integer page, Integer limit,Customer customer){

        PageDataResult pageDataResult = customerService.queryElementListByPage(page, limit,customer);

        return pageDataResult;
    }

    @RequestMapping("getSelectContent")
    @ResponseBody
    public SelectContent getSelectContent() {
        List<BaseDict> custSources = baseDictService.queryBaseDictById(customerSource_code);
        List<BaseDict> custIndustrys = baseDictService.queryBaseDictById(customerIndustry_code);
        List<BaseDict> custLevels = baseDictService.queryBaseDictById(customerLevel_code);
        SelectContent selectContent = new SelectContent();
        selectContent.setCustIndustrys(custIndustrys);
        selectContent.setCustSources(custSources);
        selectContent.setCustLevels(custLevels);
        return selectContent;
    }

}
