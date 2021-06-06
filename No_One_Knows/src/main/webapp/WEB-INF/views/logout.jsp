<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dto" value="${articleDTO}" />
<%
	//현재 클라이언트의 모든 세션 정보를 파기
	session.invalidate();
%>
<script>
	alert('로그아웃 되었습니다.');
	location.href = 'main'
</script>