package net.developia.board.service;

import net.developia.board.dto.MapDTO;
import net.developia.board.dto.PlaceDTO;

public interface MapService {
	public long getNextMapNo() throws Exception;

	public void addMap(MapDTO mapDTO) throws Exception;

	public void addPlace(PlaceDTO placeDTO) throws Exception;
}
