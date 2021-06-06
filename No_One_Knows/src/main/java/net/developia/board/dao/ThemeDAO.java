package net.developia.board.dao;

import java.sql.SQLException;
import java.util.List;

import net.developia.board.dto.ThemeDTO;

public interface ThemeDAO {

	public List<ThemeDTO> getThemeList() throws SQLException;

	public ThemeDTO getThemForThemeNo(long theme_no) throws SQLException;

}
