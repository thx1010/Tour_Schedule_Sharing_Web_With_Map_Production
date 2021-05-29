package net.developia.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import net.developia.board.dao.MapDAO;
import net.developia.board.dto.MapDTO;
import net.developia.board.dto.PlaceDTO;
import net.developia.board.dto.RouteDTO;

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

	@Override
	public void addRegister(Map<String, Object> register) throws Exception {
		try {
			mapDAO.register(register);
		} catch(Exception e) {
			log.info(e.getMessage());
			throw e;
		}
		
	}

	@Override
	public MapDTO getMapForMapNo(long mapno) throws Exception {
		MapDTO mapDTO = null;
		try {
			mapDTO = mapDAO.getMapForMapNo(mapno);
		} catch(Exception e) {
			log.info(e.getMessage());
			throw e;
		}
		return mapDTO;
	}

	@Override
	public List<PlaceDTO> getPlaceListForMapNo(long mapno) throws Exception {
		List<PlaceDTO> placeList = null;
		try {
			placeList = mapDAO.getPlaceListForMapNo(mapno);
		} catch(Exception e) {
			log.info(e.getMessage());
			throw e;
		}
		return placeList;
	}

	@Override
	public void addRoute(RouteDTO route) throws Exception {
		try {
			mapDAO.addRoute(route);
		} catch(Exception e) {
			log.info(e.getMessage());
			throw e;
		}
		
	}

	@Override
	public List<RouteDTO> getRouteListForMapNo(long mapno) throws Exception {
		List<RouteDTO> routeList = null;
		try {
			routeList = mapDAO.getRouteListForMapNo(mapno);
		} catch(Exception e) {
			log.info(e.getMessage());
			throw e;
		}
		return routeList;
	}
}
