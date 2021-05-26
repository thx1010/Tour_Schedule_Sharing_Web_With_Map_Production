package net.developia.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import net.developia.board.dao.MapDAO;
import net.developia.board.dto.MapDTO;
import net.developia.board.dto.PlaceDTO;

@Slf4j
@Service
public class MapServiceImpl implements MapService {
	@Autowired
	private MapDAO mapDAO;

	@Override
	public long getNextMapNo() throws Exception {
		long no = -1;
		try {
			no = mapDAO.getNextMapNo();
		} catch(Exception e) {
			log.info(e.getMessage());
			throw e;
		}
		return no;
	}

	@Override
	public void addMap(MapDTO mapDTO) throws Exception {
		try {
			mapDAO.addMap(mapDTO);
		} catch(Exception e) {
			log.info(e.getMessage());
			throw e;
		}
		
	}

	@Override
	public void addPlace(PlaceDTO placeDTO) throws Exception {
		try {
			mapDAO.addPlace(placeDTO);
		} catch(Exception e) {
			log.info(e.getMessage());
			throw e;
		}
		
	}
}
