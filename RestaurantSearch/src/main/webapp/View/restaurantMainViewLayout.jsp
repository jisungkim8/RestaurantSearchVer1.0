<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<html>
<head>
<link rel="shortcut icon" href="">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>맛집검색 - 헤헤</title>
<!-- mobile settings -->
<meta name="viewport"	content="width=device-width, maximum-scale=1, initial-scale=1, user-scalable=0" />
	<tiles:insertAttribute name="restaurantMainViewCSS" />
</head>
<body>
	<tiles:insertAttribute name="restaurantMainViewHeader" />
	<tiles:insertAttribute name="restaurantMainViewContents" />
	<tiles:insertAttribute name="restaurantMainViewFooter" />
	<tiles:insertAttribute name="restaurantMainViewJS" />
</body>
</html>