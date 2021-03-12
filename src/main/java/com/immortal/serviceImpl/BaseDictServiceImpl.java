package com.immortal.serviceImpl;

import com.immortal.dao.BaseDictMapper;
import com.immortal.entity.po.BaseDict;
import com.immortal.entity.po.BaseDictExample;
import com.immortal.service.BaseDictService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("baseDict")
public class BaseDictServiceImpl implements BaseDictService {
    @Resource
    private BaseDictMapper baseDictMapper;

    @Override
    public List queryElementList() {
        return null;
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
    public void deleteElementById(Long id) {

    }

    @Override
    public List<BaseDict> queryBaseDictById(String typeCode) {
        BaseDictExample baseDictExample = new BaseDictExample();
        BaseDictExample.Criteria criteria = baseDictExample.createCriteria();
        criteria.andDictTypeCodeEqualTo(typeCode);
        List<BaseDict> baseDicts = baseDictMapper.selectByExample(baseDictExample);
        return baseDicts;
    }
}
