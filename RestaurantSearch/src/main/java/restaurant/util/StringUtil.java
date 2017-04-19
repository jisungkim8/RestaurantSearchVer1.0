package restaurant.util;

public class StringUtil {
	//글쓰기->내용을 입력->줄바꿈해서 DB에 저장
	//글상세보기 할때 ->\r\n-><br>로 변경
	//<pre></pre>->요즘
	public static String parseBr(String msg){
		
		if(msg == null) return null;
		return msg.replace("\r\n", "<br>")
                  .replace("\n", "<br>");
	}
	public static String reparseBr(String msg){
		
		if(msg == null) return null;
		return msg.replace("<br>", "\r\n");
	}
}
