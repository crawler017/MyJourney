package com.ocd.service.impl;


import com.ocd.mapper.BaseDictMapper;
import com.ocd.pojo.BaseDict;
import com.ocd.service.SystemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 基础信息数据字典
 * @author lx
 *
 */

@Service("systemService")
public class SystemServiceImpl implements SystemService {

	@Autowired
	private BaseDictMapper baseDictMapper;
	//根据类型编号查询数据字典
	@Override
	public List<BaseDict> findBaseDictListByType(String typecode) {
		return baseDictMapper.selectByTypecode(typecode);
	}

}
