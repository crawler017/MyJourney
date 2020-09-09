package com.ocd.mapper;


import com.ocd.pojo.BaseDict;

import java.util.List;

public interface BaseDictMapper {

	//根据数据字典类别代码查询
    List<BaseDict> selectByTypecode(String typecode);
    //根据数据字典ID查询
    BaseDict selectByPrimaryKey(String dictId);

}