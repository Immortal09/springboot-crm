package com.immortal.service;

import com.immortal.entity.po.BaseDict;

import java.util.List;

public interface BaseDictService extends BaseService{
    List<BaseDict> queryBaseDictById(String typeCode);
}
