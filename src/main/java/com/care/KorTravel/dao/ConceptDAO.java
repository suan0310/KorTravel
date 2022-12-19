package com.care.KorTravel.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.ui.Model;

import com.care.KorTravel.dto.FacilityDTO;

@Mapper
public interface ConceptDAO {



	FacilityDTO selectRecom();

	ArrayList<FacilityDTO> selectRandom(String cat1);

	FacilityDTO selectDetail(String contentId);

	ArrayList<FacilityDTO> selectRecomFood();

	ArrayList<FacilityDTO> selectRecomTour();

	ArrayList<FacilityDTO> selectRecomRest();

	



}
