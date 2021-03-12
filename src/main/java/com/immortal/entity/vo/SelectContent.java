package com.immortal.entity.vo;

import com.immortal.entity.po.BaseDict;

import java.io.Serializable;
import java.util.List;

public class SelectContent implements Serializable {
    private List<BaseDict> custSources;
    private List<BaseDict> custIndustrys;
    private List<BaseDict> custLevels;

    public List<BaseDict> getCustSources() {
        return custSources;
    }

    public void setCustSources(List<BaseDict> custSources) {
        this.custSources = custSources;
    }

    public List<BaseDict> getCustIndustrys() {
        return custIndustrys;
    }

    public void setCustIndustrys(List<BaseDict> custIndustrys) {
        this.custIndustrys = custIndustrys;
    }

    public List<BaseDict> getCustLevels() {
        return custLevels;
    }

    public void setCustLevels(List<BaseDict> custLevels) {
        this.custLevels = custLevels;
    }
}
