<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <header>
        <nav>
            <ul id="tnb">
                <li><a href='<c:url value="/"/>'>홈</a></li>
                <!-- 로그인 하지 않은 경우 -->
                <c:if test="${empty loginInfo }">
               		 <li><a href='<c:url value="/login"/>'>로그인</a></li>
               		 <li><a href='<c:url value="/join"/>'>회원가입</a></li>
                </c:if>
                <!-- 로그인의 경우 -->
                    <c:if test="${!empty loginInfo }">
               			 <li>${loginInfo.id }님</li>
                   		<li><a href='<c:url value="/logout"/>'>로그아웃</a></li>
                </c:if>
            </ul>  
        </nav>
        <a href='<c:url value="/"/>'><img src="imgs/testbss.png"></a>
    </header>











