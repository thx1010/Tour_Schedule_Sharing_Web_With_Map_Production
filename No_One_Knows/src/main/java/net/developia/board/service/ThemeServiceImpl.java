package net.developia.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import net.developia.board.dao.ThemeDAO;
import net.developia.board.dto.ThemeDTO;


@Slf4j
@Service
public class ThemeServiceImpl implements ThemeService {

	@Autowired
	private ThemeDAO themeDAO;
	@Override
	public List<ThemeDTO> getThemeList() throws Exception {
		List<ThemeDTO> themeList = null;
		try {
			themeList = themeDAO.getThemeList();
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
		return themeList;
	}
	@Override
	public ThemeDTO getThemeForThemeNo(long theme_no) throws Exception {
		ThemeDTO theme = null;
		
		try {
			theme = themeDAO.getThemForThemeNo(theme_no);
		} catch(Exception e) {
			log.info(e.getMessage());
			throw e;
		}
		return theme;
	}

}
