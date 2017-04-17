<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="org.json.simple.JSONArray"%>
<%@ page import="org.json.simple.JSONObject"%>
<%@ page import="java.io.PrintWriter"%>
<%
	String value = request.getParameter("value");
	JSONArray list = new JSONArray();
	JSONObject object = null;

	if (value.indexOf("혼자") > -1) {
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

	} else if (value.indexOf("가성") > -1) {
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

	else if (value.indexOf("서울") > -1) {
		object = new JSONObject();
		object.put("data", "서울");
		list.add(object);
		object = new JSONObject();
		object.put("data", "서울역");
		list.add(object);
		object = new JSONObject();
		object.put("data", "서울 맛집");
		list.add(object);
		object = new JSONObject();
		object.put("data", "서울 데이트 맛집");
		list.add(object);

	}

	else if (value.indexOf("부산") > -1) {
		object = new JSONObject();
		object.put("data", "부산 맛집");
		list.add(object);
		object = new JSONObject();
		object.put("data", "부산 추천 맛집");
		list.add(object);
		object = new JSONObject();
		object.put("data", "자갈치 시장");
		list.add(object);
		object = new JSONObject();
		object.put("data", "해운대 맛집");
		list.add(object);
	}

	else if (value.indexOf("강남") > -1) {
		object = new JSONObject();
		object.put("data", "강남역");
		list.add(object);
		object = new JSONObject();
		object.put("data", "강남역 소개팅");
		list.add(object);
		object = new JSONObject();
		object.put("data", "강남역 맛집");
		list.add(object);
		object = new JSONObject();
		object.put("data", "강남역 회식");
		list.add(object);
	}

	else if (value.indexOf("사당") > -1) {
		object = new JSONObject();
		object.put("data", "사당 맛집");
		list.add(object);
		object = new JSONObject();
		object.put("data", "사당역 주변");
		list.add(object);
		object = new JSONObject();
		object.put("data", "사당 분위기 좋은");
		list.add(object);
		object = new JSONObject();
		object.put("data", "이수 맛집");
		list.add(object);
	}

	PrintWriter pw = response.getWriter();
	pw.print(list);
	pw.flush();
	pw.close();
%>



</body>
</html>