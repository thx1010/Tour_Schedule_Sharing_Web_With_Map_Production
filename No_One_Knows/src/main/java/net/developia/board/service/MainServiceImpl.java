package net.developia.board.service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import lombok.extern.slf4j.*;
import net.developia.board.dao.*;
import net.developia.board.dto.*;

@Slf4j
@Service
public class MainServiceImpl implements MainService{
	
	@Autowired
	private MainDAO mainDAO;
	
	@Override
	public List<UserDTO> getUserList(UserDTO userDTO) throws Exception {
		try {
			return mainDAO.getUserList(userDTO);
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public List<PointDTO> getPointList(UserDTO userDTO) throws Exception {
		try {
			return mainDAO.getPointList(userDTO);
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public List<MapRegisterDTO> getMapList() throws Exception {
		try {
		List<MapRegisterDTO> mainMapInfo = mainDAO.getMapList();
		return mainMapInfo;
		}catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public List<MapRegisterDTO> getMapNewList() throws Exception {
		try {
			List<MapRegisterDTO> mainMapInfo = mainDAO.getMapNewList();
			return mainMapInfo;
			}catch (Exception e) {
				log.info(e.getMessage());
				throw e;
			}
	}

	@Override
	public List<PlaceDTO> getImageSlide(MapDTO mapDTO) throws Exception {
		try {
			List<PlaceDTO> imageslide = mainDAO.getImageSlide(mapDTO);
			return imageslide;
			}catch (Exception e) {
				log.info(e.getMessage());
				throw e;
			}
	}

	@Override
	public List<MapRegisterDTO> getMapData(MapDTO mapDTO) throws Exception {
		try {
			List<MapRegisterDTO> mapdata = mainDAO.getMapData(mapDTO);
			return mapdata;
			}catch (Exception e) {
				log.info(e.getMessage());
				throw e;
			}
	}

	@Override
	public void addtoCart(MapRegisterDTO mapregisterDTO) throws Exception {
		try {
			mainDAO.addtoCart(mapregisterDTO);
			}catch (Exception e) {
				log.info(e.getMessage());
				throw e;
			}
	}

	@Override
	public void addtoLike(MapRegisterDTO mapregisterDTO) throws Exception {
		try {
			mainDAO.addtoLike(mapregisterDTO);
			}catch (Exception e) {
				log.info(e.getMessage());
				throw e;
			}
		
	}

	@Override
	public List<MapDTO> getLikeContent(UserDTO userno) throws Exception {
		try {
			List<MapDTO> mapdata = mainDAO.getLikeContent(userno);
			return mapdata;
			}catch (Exception e) {
				log.info(e.getMessage());
				throw e;
			}
	}

	@Override
	public List<MapDTO> getCartContent(UserDTO userno) throws Exception {
		try {
			List<MapDTO> mapdata = mainDAO.getCartContent(userno);
			return mapdata;
			}catch (Exception e) {
				log.info(e.getMessage());
				throw e;
			}
	}

}
