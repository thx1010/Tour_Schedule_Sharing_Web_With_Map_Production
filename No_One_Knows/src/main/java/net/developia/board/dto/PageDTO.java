package net.developia.board.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PageDTO {
	long totalArticle;
	long eachArticlePerPage = 5;
	
	long pageBlock = 10;
	
	long start;
	long end;
	
	long totalPage;
	long currentPage = 1;
	
	long startPage;
	long endPage;
	long prevPage;
	long nextPage;
	
	public void calculatePage() {
		totalPage = (long) Math.ceil((double)totalArticle/eachArticlePerPage);
		
		if(currentPage > totalPage || currentPage < 1) {
			currentPage = 1;
		}
		
		
		//prevPage = (long)(currentPage/pageBlock) * pageBlock;
		//nextPage = (long)Math.ceil((double)currentPage/pageBlock) * pageBlock + 1;
		
		prevPage = currentPage - 1;
		nextPage = currentPage + 1;
		
		startPage = (long)((currentPage-1)/pageBlock) * pageBlock + 1;
		endPage = (long)Math.ceil((double)currentPage/pageBlock) * pageBlock;
		
		
		if(endPage > totalPage)
			endPage = totalPage;
		
		if(prevPage < 1)
			prevPage = 1;
		if(nextPage > totalPage)
			nextPage = totalPage;
		
		start = (currentPage - 1) * eachArticlePerPage + 1;
		end = currentPage * eachArticlePerPage;
		
		if(end > totalArticle)
			end = totalArticle;
		
	}
}