package com.care.KorTravel.adminService;

import java.util.ArrayList;

import com.care.KorTravel.dto.FacilityDTO;

public interface DataManageService {

	public String createContentId();
	public void registFacility(FacilityDTO facility);
	public ArrayList<FacilityDTO> getList(int dataViewCount, String index, String options, String searchText);
	public void recommendReg(String contentId);
	public void recommendReset(String contentId);
	public FacilityDTO getFacilityDetail(String contentId);
	public FacilityDTO getImagePath(String contentId);
	public void updateFacility(FacilityDTO facility);
	public void deleteFacility(String contentId);
	public void restoreFacility(String contentId);

}
