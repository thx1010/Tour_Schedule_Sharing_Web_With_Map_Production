package net.developia.board.service;

import java.util.List;
import java.util.Map;

import net.developia.board.dto.MapDTO;
import net.developia.board.dto.PlaceDTO;
import net.developia.board.dto.RouteDTO;

public interface MapService {
	public long getNextMapNo() throws Exception;

	public void addMap(MapDTO mapDTO) throws Exception;

	public void addPlace(PlaceDTO placeDTO) throws Exception;

	public void addRegister(Map<String, Object> register) throws Exception;

	public MapDTO getMapForMapNo(long mapno) throws Exception;
	
	public List<PlaceDTO> getPlaceListForMapNo(long mapno) throws Exception;

	public List<RouteDTO> getRouteListForMapNo(long mapno) throws Exception;
	
	public void addRoute(RouteDTO route) throws Exception;

	
}
