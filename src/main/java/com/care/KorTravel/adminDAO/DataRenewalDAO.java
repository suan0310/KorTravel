package com.care.KorTravel.adminDAO;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.care.KorTravel.dto.FacilityDTO;

@Mapper
public interface DataRenewalDAO {
	// API 데이터 가져 올 때 메서드
	public void data(ArrayList<FacilityDTO> datas);
//	public ArrayList<Integer> getContentId();
//	public void insertOverview(String overview, int contentId);

}
