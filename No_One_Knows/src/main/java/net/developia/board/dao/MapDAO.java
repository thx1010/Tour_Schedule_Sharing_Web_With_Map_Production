package net.developia.board.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import net.developia.board.dto.MapDTO;
import net.developia.board.dto.PlaceDTO;
import net.developia.board.dto.RouteDTO;

public interface MapDAO {

	public long getNextMapNo() throws SQLException;

	public void addMap(MapDTO mapDTO) throws SQLException;

	public void addPlace(PlaceDTO placeDTO) throws SQLException;

	public void register(Map<String, Object> register) throws SQLException;

	public MapDTO getMapForMapNo(long mapno) throws SQLException;

	public List<PlaceDTO> getPlaceListForMapNo(long mapno) throws SQLException;

	public void addRoute(RouteDTO route) throws SQLException;

	public List<RouteDTO> getRouteListForMapNo(long mapno) throws SQLException;

}
