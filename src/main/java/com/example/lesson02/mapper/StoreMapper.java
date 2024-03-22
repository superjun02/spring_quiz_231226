package com.example.lesson02.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.lesson02.domain.Store;

@Mapper
public interface StoreMapper {
	public List<Store> selectStoreList();
}
