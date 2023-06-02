<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link href="../resources/css/gazee-main.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../resources/js/jquery-3.6.4.js"></script>
<script type="text/javascript">
	$(function() { //body 읽어왔을때
		
		/* 사용자 아이디 받아오기 */
		var id = '<%=id%>'
		// var id2 = '${id}'

		if(id!="null"){ //사용자가 로그인했을때
			/* 사용자 맞춤 추천 상품 */
			$.ajax({
				url : "../product/userBest",
				data : {
					memberId : id
				},
				success : function(res) {
					$('#recommend_item').append(res)
				}
			})
			
			/* Weka 추천 상품 */
			$.ajax({
				url : "../product/wekaBest",
				data : {
					memberId : id
				},
				success : function(res) {
					$('#recommend_item').append(res)
				}
			})
		}
		
		/* 인기 상품 추천 (조회수) */
		$.ajax({
			url : "../product/best",
			success : function(res) {
				$('#content').append(res)
			}
		})
		
		/* 배너 클릭 -> 판매하기 */
		$('#banner').click(function() {
			location.href = "../product/register.jsp"
		})

	}) 
</script>
<style type="text/css">
</style>
<title>가지가지</title>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<jsp:include page="../home/Header.jsp" flush="true">
				<jsp:param name="mode" value="1"/>
			</jsp:include>
		</div>
		<div id="content_wrap">
			<div id="content">
				<div class="slidebox">
				    <input type="radio" name="slide" id="slide01" checked>
				    <input type="radio" name="slide" id="slide02">
				    <ul class="slidelist">
				        <li class="slideitem">
				            <div>
				                <!-- <label for="slide02" class="left"></label>  -->
				                <label for="slide02" class="right"></label>
				                <span class="material-symbols-outlined right">
								arrow_forward_ios
								</span>
				                <a><img src="../resources/img/banner.jpg"></a>
				            </div>
				        </li>
				        <li class="slideitem">
				            <div>
				                <label for="slide01" class="left"></label>
				                <span class="material-symbols-outlined left">
								arrow_back_ios
								</span>
				                <a><img src="../resources/img/banner2.jpg"></a>
				            </div>
				        </li>
				    </ul>
				</div>
				<div id="recommend_item">
				</div>
			</div>
		</div>
		<jsp:include page="../home/SideBar.jsp" flush="true"/>
		<jsp:include page="../home/Footer.jsp" flush="true"/>
	</div>
</body>
</html>