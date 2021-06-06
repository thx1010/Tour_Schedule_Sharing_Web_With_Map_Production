package net.developia.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import net.developia.board.dao.ReviewDAO;
import net.developia.board.dto.ReviewDTO;

@Slf4j
@Service
public class ReviewServiceImpl implements ReviewService {
	@Autowired
	private ReviewDAO reviewDAO;

	@Override
	public long countReviewForMap(long mapno) throws Exception {
		long count = 0;
		try {
			count = reviewDAO.countReviewForMap(mapno);
		} catch(Exception e) {
			log.info(e.getMessage());
			throw e;
		}
		return count;
	}

	@Override
	public int addReview(ReviewDTO reviewDTO) throws Exception {
		int result = 0;
		try {
			result = reviewDAO.addReview(reviewDTO);
		} catch(Exception e) {
			log.info(e.getMessage());
			return 0;
		}
		return result;
	}

	@Override
	public List<ReviewDTO> getReviewList(Map<String, Object> param) throws Exception {
		List<ReviewDTO> reviewList = null;
		try {
			reviewList = reviewDAO.getReviewList(param);
		} catch(Exception e) {
			log.info(e.getMessage());
			throw e;
		}
		return reviewList;
	}

	@Override
	public ReviewDTO getMyReview(Map<String, Object> param) throws Exception {
		ReviewDTO reviewDTO = null;
		try {
			reviewDTO = reviewDAO.getMyReview(param);
		} catch(Exception e) {
			log.info(e.getMessage());
			return null;
		}
		return reviewDTO;
	}

	@Override
	public int updateReview(ReviewDTO reviewDTO) throws Exception {
		int result = 0;
		try {
			result = reviewDAO.updateReview(reviewDTO);
		} catch(Exception e) {
			log.info(e.getMessage());
			throw e;
		}
		
		return result;
	}

	@Override
	public int checkMyReview(ReviewDTO reviewDTO) throws Exception {
		int result = 0;
		try {
			result = reviewDAO.checkMyReview(reviewDTO);
		} catch(Exception e) {
			log.info(e.getMessage());
			throw e;
		}
		return result;
	}
}
