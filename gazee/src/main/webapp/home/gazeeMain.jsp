<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가지가지</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="../resources/css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../resources/js/jquery-3.6.4.js"></script>
<script type="text/javascript">
	$(function() { //body 읽어왔을때
		$.ajax({
			url : "../product/best",
			success : function(res) {
				$('#best').append(res)
			}
		}) 
		$('#searchButton').click(function() {
			var search = $('#searchBar').val()
			location.href = "../product/searchList?page=1&search=" + search
		})
		$('.categoryMenu').click(function() {
			var category = $(this).text()
			location.href = "../product/categoryList?page=1&category=" + category
		})
	}) 
</script>
<style type="text/css">
	#banner {
		height: 300px;
		background-image: url(../resources/img/banner.jpg);
		background-size: 100% 100%;
		text-align: center;
		color: white;
		margin-bottom: 50px;
	}
	#sell {
		height: 40px;
		width: 80px;
		background: white;
		color: #693FAA;
		border-radius: 30px;
	}
	.title {
		text-align: center;
		font-size: 1rem;
		font-weight: bold;
		margin-top: 8px;
	}
	#best {
		height: 300px;
	}
	
	.categoryMenu {
		cursor: pointer;
	}
	
	#recentView {
		width:90px;
		border: 1px solid black;
		position: fixed;
    	top: 330px;
    	right: calc(50% - 630px);
	}
	
	.recentViewItem {
		padding: 10px;
	    border: 1px solid rgb(204, 204, 204);
	    background: rgb(255, 255, 255);
	    margin-bottom: 6px;
	}
	
	.recentViewTxt {
	    font-size: 12px;
	    font-weight: 600;
	    color: rgb(102, 102, 102);
	    text-align: center;
	    margin-bottom: 8px;
	}
	.recentViewCount {
		display: flex;
	    justify-content: center;
	    margin-bottom: 10px;
	}
	.viewCount {
		display: flex;
	    justify-content: center;
	    font-size: 12px;
	    color: rgb(247, 0, 0);
	    font-weight: 600;
	    width: 38px;
	    border-bottom: 2px dotted rgb(136, 136, 136);
	    padding-bottom: 10px;
	}
</style>
</head>
<body>
<div id = "header">
	<div class = "headerContent">
		<a href="gazeeMain.jsp">
			<img src="../resources/img/gazee_logo.png" id = "logo">
		</a>
		<div id="search">
			<input type="text" id="searchBar" placeholder="검색어를 입력하세요.">
			<input type="submit" id="searchButton" value="검색">
		</div>
		<ul class = "menu">
			<%
				String nickName = (String)session.getAttribute("nickName");
				if(nickName!=null){
			%>
			<li id="login">${nickName}님</li>
			<li class= "line">|</li>
			<li>판매하기</li>
			<li class= "line">|</li>
			<li>고객센터</li>
			<li class= "line">|</li>
			<li>
			<%
				} else {
			%>
			<li id="login"><a href="login.jsp">로그인</a></li>
			<li class= "line">|</li>
			<li>회원가입</li>
			<li class= "line">|</li>
			<li>고객센터</li>
			<li class= "line">|</li>
			<li>
			<%} %>
				<div class="mobile_btn">
					<input type="checkbox" id="hamburger" />
					<label for="hamburger">
					  	<span></span>
					  	<span></span>
					  	<span></span>
					</label>
					<div class="sidebar">
					    <h2 style="text-align: center; position: relative; top: 60px; color: #693FAA;">카테고리</h2>
					    <hr style="position: relative; top:60px; border: solid 1px black;">
					    <ul class="nav_mobile">
					      <li><a class="categoryMenu">의류</a><a class="categoryMenu">잡화</a><a class="categoryMenu">도서</a></li>
					      <li><a class="categoryMenu">디지털기기</a><a class="categoryMenu">생활가전</a><a class="categoryMenu">가구/인테리어</a></li>
					      <li><a class="categoryMenu">뷰티/미용</a><a class="categoryMenu">스포츠/레저</a><a class="categoryMenu">생활/주방</a></li>
					      <li><a class="categoryMenu">취미/게임/음반</a><a class="categoryMenu">반려동물용품</a><a class="categoryMenu">기타</a></li>
					    </ul>
					</div>
				</div>
			</li>
		</ul>
	</div>
</div>
<div id = "content">
	<div id="banner">
		<h3 style="margin-bottom: 0; padding-top : 120px; font-size: 2rem;">가지가지</h3>
		<button id="sell">판매하기</button>
	</div>
	<div id="best">
		<h3 class="title">오늘의 인기상품</h3>
			
	</div>
	<div id="items">
		<h3 class="title">이런 상품은 어때요?</h3>
			세션에 등록된 아이디 닉네임 값: ${nickName}
	</div>
	
</div>
<%
	if(nickName!=null){
%>
<div id="recentView">
	<div class="recentViewItem">
		<div class="recentViewTxt">채팅방</div>
	</div>
	<div class="recentViewItem">
		<div class="recentViewTxt">최근본상품</div>
		<div class="recentViewCount">
			<div class="viewCount">
				6
			</div>
		</div>
		<div class="recentItem">
			
		</div>
	</div>
</div>
<%
	} 
%>
<div id = "footer">
	<div>
		<p style = "margin: 0; font-size: 12px;">Copyrightⓒ 2023. gazee. All rights reserved.</p>
	</div>
</div>
	
</body>
</html>