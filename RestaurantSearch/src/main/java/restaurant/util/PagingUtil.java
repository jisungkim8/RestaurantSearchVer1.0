
package restaurant.util;

import java.util.ArrayList;

public class PagingUtil {
	
	private int startCount;	 // 한 페이지에서 보여줄 게시글의 시작 번호
	private int endCount;	 // 한 페이지에서 보여줄 게시글의 끝 번호
	private StringBuffer pagingHtml;// 페이징 생성자

	/**
	 * currentPage : 현재페이지
	 * totalCount : 전체 게시물 수
	 * blockCount : 한 페이지의  게시물의 수
	 * blockPage : 한 화면에 보여줄 페이지 수
	 * pageUrl : 호출 페이지 url
	 * addKey : 부가적인 key 없을 때는 null 처리 (&num=23형식으로 전달할 것)
	 * */
	
	public PagingUtil() {
	
	}
	
	public PagingUtil(int currentPage, int totalCount, int blockCount,
			int blockPage, String pageUrl) {
		this(null,null,currentPage,totalCount,blockCount,blockPage,pageUrl,null);
	}
	public PagingUtil(int currentPage, int totalCount, int blockCount,
			int blockPage, String pageUrl, String addKey) {
		this(null,null,currentPage,totalCount,blockCount,blockPage,pageUrl,addKey);
	}
	public PagingUtil(String keyField, String keyWord, int currentPage, int totalCount, int blockCount,
			int blockPage,String pageUrl) {
		this(null,null,currentPage,totalCount,blockCount,blockPage,pageUrl,null);
	}
	public PagingUtil(String keyField, String keyWord, int currentPage, int totalCount, int blockCount,
			int blockPage,String pageUrl,String addKey) {
		
		if(addKey == null) addKey = ""; //부가키가 null 일때 ""처리
		
		// 전체 페이지 수
		int totalPage = (int) Math.ceil((double) totalCount / blockCount);
		if (totalPage == 0) {
			totalPage = 1;
		}
		// 현재 페이지가 전체 페이지 수보다 크면 전체 페이지 수로 설정
		if (currentPage > totalPage) {
			currentPage = totalPage;
		}
		// 현재 페이지의 처음과 마지막 글의 번호 가져오기.
		startCount = (currentPage - 1) * blockCount + 1;
		endCount = currentPage * blockCount;
		// 시작 페이지와 마지막 페이지 값 구하기.
		int startPage = (int) ((currentPage - 1) / blockPage) * blockPage + 1;
		int endPage = startPage + blockPage - 1;
		// 마지막 페이지가 전체 페이지 수보다 크면 전체 페이지 수로 설정
		if (endPage > totalPage) {
			endPage = totalPage;
		}
		// 이전 block 페이지
		pagingHtml = new StringBuffer();
		if (currentPage > blockPage) {
			if(keyWord==null){//검색 미사용시
				pagingHtml.append("<a href="+pageUrl+"?pageNum="+ (startPage - 1) + addKey +">");
			}else{
				pagingHtml.append("<a href="+pageUrl+"?keyField="+keyField+"&keyWord="+keyWord+"&pageNum="+ (startPage - 1) + addKey +">");
			}
			pagingHtml.append("이전");
			pagingHtml.append("</a>");
		}
		pagingHtml.append("&nbsp;|&nbsp;");
		//페이지 번호.현재 페이지는 빨간색으로 강조하고 링크를 제거.
		for (int i = startPage; i <= endPage; i++) {
			if (i > totalPage) {
				break;
			}
			if (i == currentPage) {
				pagingHtml.append("&nbsp;<b> <font color='red'>");
				pagingHtml.append(i);
				pagingHtml.append("</font></b>");
			} else {
				if(keyWord==null){//검색 미사용시
					pagingHtml.append("&nbsp;<a href='"+pageUrl+"?pageNum=");
				}else{
					pagingHtml.append("&nbsp;<a href='"+pageUrl+"?keyField="+keyField+"&keyWord="+keyWord+"&pageNum=");
				}
				pagingHtml.append(i);
				pagingHtml.append(addKey+"'>");
				pagingHtml.append(i);
				pagingHtml.append("</a>");
			}
			pagingHtml.append("&nbsp;");
		}
		pagingHtml.append("&nbsp;&nbsp;|&nbsp;&nbsp;");
		// 다음 block 페이지
		if (totalPage - startPage >= blockPage) {
			if(keyWord==null){//검색 미사용시
				pagingHtml.append("<a href="+pageUrl+"?pageNum="+ (endPage + 1) + addKey +">");
			}else{
				pagingHtml.append("<a href="+pageUrl+"?keyField="+keyField+"&keyWord="+keyWord+"&pageNum="+ (endPage + 1) + addKey +">");
			}
			pagingHtml.append("다음");
			pagingHtml.append("</a>");
		}
	}
	
	public void setPagingUtil(String keyField, ArrayList<String> keywordList, int pageNum, int totalCount, int pageSize,
			int blockSize,String pageUrl, String addKey) {
		
		if(addKey == null) addKey = ""; //부가키가 null 일때 ""처리
		
		// 전체 페이지 수
		int totalPageNum = (int) Math.ceil((double) totalCount / pageSize);
		if (totalPageNum == 0) {
			totalPageNum = 1;
		}
		// 현재 페이지가 전체 페이지 수보다 크면 전체 페이지 수로 설정
		if (pageNum > totalPageNum) {
			pageNum = totalPageNum;
		}
		
		int totalBlockNum = (int) Math.ceil((double) totalPageNum / blockSize);
		int currentBlockNum = (int) Math.ceil((double) pageNum / blockSize);
		
		// 현재 페이지의 처음과 마지막 글의 번호 가져오기.
		this.startCount = (pageNum - 1) * pageSize + 1;
		this.endCount = pageNum * pageSize;
		// 시작 페이지와 마지막 페이지 값 구하기.
		//int startPage = (int) ((pageNum - 1) / blockSize) * blockSize + 1;
		
		int startPage = (currentBlockNum - 1) * blockSize + 1;
		if (startPage < 1) {
			startPage = 1;
		}
		int endPage = startPage + blockSize - 1;
		// 마지막 페이지가 전체 페이지 수보다 크면 전체 페이지 수로 설정
		if (endPage > totalPageNum) {
			endPage = totalPageNum;
		}
		
		System.out.println("startPage = " + startPage);
		System.out.println("endPage = " + endPage);
		
		
		System.out.println(keywordList);
		String keyword = "";
		for (String oneKeyword : keywordList) {
			System.out.println("oneKeyword = " + oneKeyword);
			if (keyword != "") {
				keyword += "ㅗ@ㅠ";
			}
			keyword += oneKeyword;
		}
		
		// 이전 block 페이지
		this.pagingHtml = new StringBuffer();
		if (currentBlockNum > 1) {
			if(keyword == null){//검색 미사용시 
				this.pagingHtml.append("<a href="+pageUrl+"?pageNum="+ (startPage - 1) + addKey +">");
			}else{
				int targetBlockNum = currentBlockNum - 1;
				
				this.pagingHtml.append("<a href=javascript:get_restaurant_data_by_keyword_and_filter_info('" + keyword+ "'," + 1*(targetBlockNum * blockSize) +");" + addKey +">");
				System.out.println(this.pagingHtml);
			}
			this.pagingHtml.append("이전");
			this.pagingHtml.append("</a>");
		}
		this.pagingHtml.append("&nbsp;|&nbsp;");
		//페이지 번호.현재 페이지는 빨간색으로 강조하고 링크를 제거.
		
		System.out.println("pagingUtil >> pageNum = " + pageNum);
		for (int i = startPage; i <= endPage; i++) {
			if (i > totalPageNum) {
				break;
			}
			
			System.out.println("pagingUtil >> i = " + i);
			
			if (i == pageNum) {
				this.pagingHtml.append("&nbsp;<b> <font color='red'>");
				this.pagingHtml.append(i);
				this.pagingHtml.append("</font></b>");
			} else {
				if(keyword==null){//검색 미사용시
					this.pagingHtml.append("&nbsp;<a href='"+pageUrl+"?pageNum=");
				}else{
					this.pagingHtml.append("&nbsp;<a href=javascript:get_restaurant_data_by_keyword_and_filter_info('" + keyword + "'," + i +");");
					
				}
				this.pagingHtml.append(addKey+">");
				this.pagingHtml.append(i);
				this.pagingHtml.append("</a>");
			}
			this.pagingHtml.append("&nbsp;");
		}
		
		this.pagingHtml.append("&nbsp;&nbsp;|&nbsp;&nbsp;");
		// 다음 block 페이지
		if (currentBlockNum < totalBlockNum) {
			if (keyword==null) {//검색 미사용시
				this.pagingHtml.append("<a href="+pageUrl+"?pageNum="+ (endPage + 1) + addKey +">");
			}else{  
				//pagingHtml.append("<a href="+pageUrl+"?keyField="+keyField+"&keyWord="+keyWord+"&pageNum="+ (endPage + 1) + addKey +">");
				int targetBlockNum = currentBlockNum + 1;
				//pagingHtml.append("<a href="+pageUrl+"?keyword="+keyWord+"&pageNum="+ 1*(targetBlockNum * blockSize - (blockSize - 1)) + addKey + ">");
				this.pagingHtml.append("<a href=javascript:get_restaurant_data_by_keyword_and_filter_info('" + keyword+ "'," + 1*(targetBlockNum * blockSize - (blockSize - 1)) +");" + addKey + ">");
			}
			this.pagingHtml.append("다음");
			this.pagingHtml.append("</a>");
		}
	}
	
	public StringBuffer getPagingHtml() {
		return pagingHtml;
	}
	public int getStartCount() {
		return startCount;
	}
	public int getEndCount() {
		return endCount;
	}
}
