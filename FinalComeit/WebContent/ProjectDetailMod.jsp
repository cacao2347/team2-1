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
<title>ProjectDetailMod.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/bootstrap.min.css" >
<link rel="stylesheet"  href="<%=cp %>/assets/css/blog-post.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/projectcreate.css">

<script type="text/javascript" src="<%=cp %>/js/jquery-ui.js"></script>
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

<!-- 프로젝트 개설 문구 -->	
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<div class="boardName">
				<h1>프로젝트 개설</h1>
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
			<!-- 프로젝트방 제목 -->
			<div class="stuTitle">
				<h4>제목<span class="ePoint">*</span></h4>
			</div>
			<div class="stuTitle">
				<input type="text" class="studyTitle form-control" id="studyTitle" 
				value="기존 프로젝트방 제목" readonly="readonly"/>
				<span class="titleErr">
					제목은 필수 입력항목입니다.
				</span>
			</div>
			<!-- 프로젝트방 상세 내용 -->
			<div class="stuContent form-inline">
				<h4>상세내용<span class="ePoint">*</span></h4>
			</div>
			<div class="stuContent">
				<textarea id="studyContent" class="form-control" rows="8"
				>기존 프로젝트방 상세 커리큘럼</textarea>
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
					<input type="button" value="추가" class="keyBtn btn btn-primary" disabled="disabled"/>
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
				<div class="areaMemNum">
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
				
				
					<h4>모집인원<span class="ePoint">*</span></h4>
					<input type="text" class="memNum form-control" id="memNum" 
					placeholder="ex) 3"/> <span class="m">명</span>
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
				
				<div class="levelScret">
					<div class="level">
					<h4>레벨<span class="ePoint">*</span></h4>
						<select name="week" id="week" class="levelSel form-control">
							<option value="0">레벨 선택</option>
							<option value="1">초급</option>
							<option value="2">중급</option>
							<option value="3">고급</option>
						</select>
					</div><!-- end .level -->
				
					<div class="scret">
						<h4>비밀방 여부</h4>
						<input type="text" class="scretBox form-control" id="scretNum" 
							placeholder="ex) 4자리 숫자 입력" />
					</div><!-- end .scret -->
				</div><!-- end .levelScret -->
				
				<div class="posiImg">
					<div class="position">
						<h4>신분</h4>
						<select name="week" id="week" class="posiSel form-control">
							<option value="0">신분 선택</option>
							<option value="1">취준생</option>
							<option value="2">대학생</option>
							<option value="3">직장인</option>
						</select>
					</div><!-- end .position -->
					
					<div class="image">
						<h4>대표이미지</h4>
												
					</div><!-- end .image -->
				</div><!-- end .posiImg -->
				
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