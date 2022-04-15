<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<style type="text/css">

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}
a:link,
a:visited {
  text-decoration: none;
  color: inherit;
}
nav ul {
  list-style: none;
}

header {
  width: 1440px;
  height: 150px;
  position: relative;
  margin: 0 auto;
  margin-top: 20px;
}

header img {
  position: absolute;
  width: 194px;
  height: 82px;
  right: 66vh;
  top: 20%;
}

#tnb {
  display: flex;
  column-gap: 1rem;
  list-style: none;
  position: absolute;
  top: 0;
  right: 0;
  font-size: 13px;
  color: #9a9a9a;
}

</style>
    <header>
        <nav>
            <ul id="tnb">
                <li><a href='<c:url value="/"/>'>홈</a></li>
                <!-- 로그인 하지 않은 경우 -->
                <c:if test="${empty loginInfo }">
               		 <li><a href='<c:url value="/login.bss"/>'>로그인</a></li>
               		 <li><a href='<c:url value="/join.bss"/>'>회원가입</a></li>
                </c:if>
                <!-- 로그인의 경우 -->
                    <c:if test="${!empty loginInfo }">
               			 <li>${loginInfo.id }님</li>
                   		<li><a href='<c:url value="/logout"/>'>로그아웃</a></li>
                </c:if>
            </ul>  
        </nav>
        <a href='<c:url value="/"/>'><img src="imgs/logo_ai.svg"></a>
    </header>











