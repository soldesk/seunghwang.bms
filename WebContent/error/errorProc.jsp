<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<style>
	button{ 
	border-top-left-radius: .5em; /*왼쪽 상단 코너를 부드럽게 */
	border-bottom-left-radius: .5em; /*왼쪽 하단 코너를 부드럽게*/
	border-top-right-radius: .5em; /*오른족 상단 코너를 부드럽게*/
	border-bottom-right-radius: .5em; /*오른쪽 하단 코너를 부드럽게*/
	background-color: hotpink;
	color: white;
	font-weight: bold;
	height: 30px;
	width: 200px;
	text-decoration: none;
	margin-left: 610px;
	}
	p{color: gray; font-size: 25px;}
	#p1{margin-top: 150px; margin-left: 560px;}
	#p2{margin-left: 530px;}
</style>
</head>
<p id="p1">시스템 에러가 발생했습니다.</p>
<p id="p2">고객센터 1577-1577로 문의하세요.</p>
<button type="button" onclick="location.href='../main.jsp'">메인페이지로 이동</button>