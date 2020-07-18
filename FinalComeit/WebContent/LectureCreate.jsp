<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LectureCreate.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/bootstrap.min.css" >
<link rel="stylesheet"  href="<%=cp %>/assets/css/blog-post.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/lectureCreate.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


</head>
<body>
<!-- 헤더 -->
<div class="row">
	<div class="col-md-12">
	</div>
</div><!-- row -->

<div class="container-fluid">

<!-- 스터디 개설 문구 -->	
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<div class="boardName">
				<h1>강의 개설</h1>
				<hr />
			</div>
		</div>
		<div class="col-md-2">
		</div>
	</div>
	
<!-- 리스트 -->
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<!-- 스터디방 제목 -->
			<div class="stuTitle">
				<h4>제목<span class="ePoint">*</span></h4>
			</div>
			<div class="stuTitle">
				<input type="text" class="studyTitle form-control" id="studyTitle" 
				placeholder="강의 제목을 입력해 주세요."/>
				<span class="titleErr">
					제목은 필수 입력항목입니다.
				</span>
			</div>
			<!-- 스터디방 상세 내용 -->
			<div class="stuContent form-inline">
				<h4>강의소개<span class="ePoint">*</span></h4>
			</div>
			<div class="stuContent">
				<textarea id="studyContent" class="form-control" rows="8"
				placeholder="강의를 소개해주세요. "></textarea>
				<span class="contentErr">
					상세 커리큘럼은 필수 입력항목입니다.
				</span>
			</div>
			<!-- 키워드 -->
			<div class="stuKeyword">
				<h4>관심 키워드<span class="ePoint">*</span></h4>
				<span class="check">최대 5개</span>
			</div>
			<div class="stuKey">
				<div class="stuKeySel">
					<select name="keySelect" id="keySelect" class="form-control keySelect">
						<option value="key1">java</option>
						<option value="key2">oracle</option>
						<option value="key3">jsp</option>
						<option value="key4">spring</option>
						<option value="key5">기타</option>
					</select>
				</div>
				<div class="stuKeyInput">
					<input type="text" class="keyInput form-control" id="keyInput" 
						placeholder="관심 키워드를 입력해 주세요."/>
				</div>
				<div class="stuKeyBtn">
					<input type="button" value="추가" class="keyBtn btn btn-primary" />
				</div>
				<div class="stuKeyBox">
					<div class="tagStyle">
						<span class="keyTag">
							# 자바
							<a href="" class="tag_delete">
							X
							</a>
						</span>
					</div>
					<div class="tagStyle">
						<span class="keyTag">
							# 오라클
							<a href="" class="tag_delete">
							X
							</a>
						</span>
					</div>
					<div class="tagStyle">
						<span class="keyTag">
							# 정보처리기사
							<a href="" class="tag_delete">
							X
							</a>
						</span>
					</div>
				</div><!-- end .stuKeyBox -->
			</div><!-- end .stuKey -->
				<div class="areaMemNum" style="width: 990px;">
					<h4>활동지역<span class="ePoint">*</span></h4>
						<select name="area" id="area" class="area form-control">
							<option value="0">지역</option>
							<option value="seoul">서울</option>
							<option value="incheon">인천</option>
						</select>

						<select name="spcArea" id="spcArea" class="spcArea form-control">
							<option value="0">상세 지역</option>
							<option value="mapogu">마포구</option>
							<option value="seogu">서구</option>
						</select>
				</div> 
				<div class="areaMemNum" style="width: 990px;">
					<h4 style="display: inline;">개설인원<span class="ePoint">*</span></h4>
					<select class="form-control" style="width:50px; padding: 0px; display: inline;">
									  <option>1</option>
									  <option>2</option>
					</select>
					<span class="m">명</span>
					<br>				
					<h4>최대인원<span class="ePoint">*</span></h4>
					<select class="form-control" style="width:50px; padding: 0px; display: inline;">
									  <option>1</option>
									  <option>2</option>
					</select>
					<span class="m">명</span>
					
				</div><!-- end .areaMemNum -->
					
				<div class="period">
					<h4>시작날짜<span class="ePoint">*</span></h4>
					<input type="text" class="start form-control" id="start" 
					placeholder="ex) 시작날짜를 선택하세요." readonly="readonly"/>
					<button id="cal" class="calBtn btn btn-lg"><span class="glyphicon glyphicon-calendar"></span></button>
					
					<h4>기간<span class="ePoint">*</span></h4>
					<select name="term" id="term" class="termSel form-control">
						<option value="0">지역</option>
						<option value="1">1개월</option>
						<option value="3">3개월</option>
						<option value="6">6개월</option>
					</select>
				</div><!-- end . period -->
				
				<div class="money">
					<h4>수강료<span class="ePoint">*</span></h4>
					<input type="text" class="lecmoney form-control" id="lecmoney" 
					placeholder="수강료를 입력하세요." style="display: inline;"/>
				</div>
					
				<div class="weekTitle">
					<h4>모임 지정 요일<span class="ePoint">*</span></h4>
				</div><!-- end .weekTitle -->
				<div class="weekDay">
					<select name="week" id="week" class="weekSel form-control">
						<option value="0">요일</option>
						<option value="1">월요일</option>
						<option value="2">화요일</option>
						<option value="3">수요일</option>
					</select>
					
					<input type="button" value="추가" class="weekBtn btn btn-primary" />
					
					<div class="weekBox">
						<div class="tagStyle">
							<span class="keyTag">
								# 월요일
								<a href="" class="tag_delete">
								X
								</a>
							</span>
						</div>
						<div class="tagStyle">
							<span class="keyTag">
								# 화요일
								<a href="" class="tag_delete">
								X
								</a>
							</span>
						</div>
						<div class="tagStyle">
							<span class="keyTag">
								# 수요일
								<a href="" class="tag_delete">
								X
								</a>
							</span>
						</div>
					</div><!-- end .weekBox -->
				</div><!-- end .weekDay -->
				
				<div class="button">
					<div class="cancel">
						<input type="button" value="취소" class="btn btn-default"/>
					</div><!-- end .cancel -->
					<div class="upload">
						<input type="submit" value="개설" class="btn btn-primary"/>
					</div><!-- end .upload -->
				</div><!-- end .button -->
			
			
		</div> <!-- end .col-md-8 -->
		<div class="col-md-2">
		</div>
	</div>
	
</div><!-- end .container-fluid -->

<!-- 푸터 -->
<div class="row">
	<div class="col-md-12">
	</div>
</div>

</body>
</html>