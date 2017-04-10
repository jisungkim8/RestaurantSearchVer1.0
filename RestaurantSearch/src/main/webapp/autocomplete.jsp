<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.json.simple.JSONArray"%>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="java.io.PrintWriter" %>
<%
String value = request.getParameter("value");
JSONArray list = new JSONArray();
JSONObject object = null;
 
if(value.indexOf("혼자") > -1) {
    object = new JSONObject();
    object.put("data", "혼밥");
    list.add(object);
    object = new JSONObject();
    object.put("data", "혼술");
    list.add(object);
    object = new JSONObject();
    object.put("data", "테이크아웃");
    list.add(object);
    object = new JSONObject();
    object.put("data", "1인식당");
    list.add(object);
}else if(value.indexOf("가성") > -1) {
    object = new JSONObject();
    object.put("data", "가성비");
    list.add(object);      
    object = new JSONObject();
    object.put("data", "가성비 맛집");
    list.add(object);
    object = new JSONObject();
    object.put("data", "저렴한");
    list.add(object);
    
}
     
PrintWriter pw = response.getWriter();
pw.print(list);
pw.flush();
pw.close();

%>



</body>
</html>