<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>맛집검색 - ${keyword}</title>
<!-- mobile settings -->
<meta name="viewport" content="width=device-width, maximum-scale=1, initial-scale=1, user-scalable=0" />
	<tiles:insertAttribute name="restaurantListViewCSS" />
</head>
<body style="margin: 0px;">
	<tiles:insertAttribute name="restaurantListViewHeader" />
	<tiles:insertAttribute name="restaurantListViewMainContents" />
	<tiles:insertAttribute name="restaurantListViewJS" />
</body>
</html>