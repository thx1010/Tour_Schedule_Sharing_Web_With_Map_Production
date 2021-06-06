package net.developia.board.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import net.developia.board.dto.ReviewDTO;

public interface ReviewDAO {

	long countReviewForMap(long mapno) throws SQLException;

	int addReview(ReviewDTO reviewDTO) throws SQLException;

	List<ReviewDTO> getReviewList(Map<String, Object> param) throws SQLException;

	ReviewDTO getMyReview(Map<String, Object> param) throws SQLException;

	int updateReview(ReviewDTO reviewDTO) throws SQLException;

	int checkMyReview(ReviewDTO reviewDTO) throws SQLException;

}
