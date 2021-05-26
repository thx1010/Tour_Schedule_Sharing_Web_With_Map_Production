package net.developia.board.dao;

import java.sql.SQLException;

import net.developia.board.dto.MapDTO;
import net.developia.board.dto.PlaceDTO;

public interface MapDAO {

	public long getNextMapNo() throws SQLException;

	public void addMap(MapDTO mapDTO) throws SQLException;

	public void addPlace(PlaceDTO placeDTO) throws SQLException;

}
