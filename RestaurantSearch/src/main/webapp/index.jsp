<%
//request.getContextPath() -> http  ~  프로젝트명 정보
 response.sendRedirect(request.getContextPath()+"/restaurantMain.do"); //시작시 레스토랑 메인화면 호출
%>