package com.between.dao;

import java.util.List;

import com.between.dto.TbCalDto;

public interface TbCalDao {

	public List<TbCalDto> getCalList(String calTime, int groupNum);
	public TbCalDto selectOne(int calNum, int groupNum);
	public int insertEvent(TbCalDto dto, int groupNum);
	public int updateEvent(TbCalDto dto, int groupNum);
	public int deleteEvent(int calNum, int groupNum);
	
}