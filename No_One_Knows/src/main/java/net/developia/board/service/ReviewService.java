package net.developia.board.service;

import java.util.List;
import java.util.Map;

import net.developia.board.dto.ReviewDTO;

public interface ReviewService {

	long countReviewForMap(long mapno) throws Exception;

	int addReview(ReviewDTO reviewDTO) throws Exception;

	List<ReviewDTO> getReviewList(Map<String, Object> param) throws Exception;
	
	ReviewDTO getMyReview(Map<String, Object> param) throws Exception;

	int updateReview(ReviewDTO reviewDTO) throws Exception;

	int checkMyReview(ReviewDTO reviewDTO) throws Exception;


}
