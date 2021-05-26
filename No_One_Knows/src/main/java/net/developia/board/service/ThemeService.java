package net.developia.board.service;

import java.util.List;

import org.springframework.stereotype.Service;

import net.developia.board.dto.ThemeDTO;

@Service
public interface ThemeService {
	public List<ThemeDTO> getThemeList() throws Exception;
	public ThemeDTO getThemeForThemeNo(long theme_no) throws Exception;
}
