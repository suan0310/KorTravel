package com.care.KorTravel.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.care.KorTravel.dto.CalendarDTO;
import com.care.KorTravel.dto.FacilityDTO;
import com.care.KorTravel.dto.RouteDTO;
import com.care.KorTravel.service.IRouteService;


@Mapper
public interface RouteDAO {

	public ArrayList<RouteDTO> getFood();
	public ArrayList<FacilityDTO> getSearchResult(String searchText);
	public ArrayList<FacilityDTO> getRecommendFacilities();
//	public void deleteCalendar(String id);
	public void saveCalendar(ArrayList<CalendarDTO> saveCalendar, String id);
	public ArrayList<CalendarDTO> getCalendar(String id);
	public ArrayList<FacilityDTO> getSpecPlace(String neLat, String neLng, String swLat, String swLng, String cat);
	public int subjectDuplicateCheck(String subject, String id);
	public void deleteCalendar(String id);
	public ArrayList<CalendarDTO> getMyRouteDetail(String id, String subject);
	public ArrayList<CalendarDTO> getMyRoute(String id);
	public ArrayList<CalendarDTO> getSavedCalendar(String id, String subject);
	public void deleteCalendar(String id,String subject);
	public int routeSubjectUpdate(String id, String subject, String memo,String preSubject);
	public void updateCalendar(ArrayList<CalendarDTO> updateCalendar);
	public void deleteSpecCalendar(String id, String subject);
	public ArrayList<CalendarDTO> checkSubject(String id, String subject);
}
