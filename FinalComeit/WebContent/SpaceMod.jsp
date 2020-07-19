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
<title>StudyDetailMod.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/spacemod.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>
<body>

<!-- 헤더 -->
<div class="row">
	<div class="col-md-12">
	<c:import url="header.jsp"></c:import>
	</div>

</div><!-- row -->

<div class="container-fluid">

	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<div class="boardName">
				<h1>공간 수정</h1>
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
			<!-- 업체명/상호명 -->
			<div class="stuTitle">
				<h4>업체명<span class="ePoint">*</span></h4>
			</div>
			<div class="stuTitle">
				<input type="text" class="studyTitle form-control" id="studyTitle" 
				value="기존 업체명" readonly="readonly"/>
				<span class="titleErr">
					업체명은 필수 입력항목입니다.
				</span>
			</div>
			<div class="stuTitle">
				<h4>상호명<span class="ePoint">*</span></h4>
			</div>
			<div class="stuTitle">
				<input type="text" class="studyTitle form-control" id="studyTitle" 
				value="기존 상호명" readonly="readonly"/>
				<span class="titleErr">
					상호명은 필수 입력항목입니다.
				</span>
			</div>
			<div class="stuTitle">
				<h4>대표자명<span class="ePoint">*</span></h4>
			</div>
			<div class="stuTitle">
				<input type="text" class="studyTitle form-control" id="studyTitle" 
				value="기존 대표자명"/>
				<span class="titleErr">
					대표자명은 필수 입력항목입니다.
				</span>
			</div>
			<div class="stuTitle">
				<h4>전화번호<span class="ePoint">*</span></h4>
			</div>
			<div class="stuTitle form-inline">
				<select name="keySelect" id="keySelect" class="form-control keySelect">
						<option value="010">010</option>
						<option value="011">011</option>
					</select> -
				<input type="text" class="studyTitle form-control" id="studyTitle" 
				style="width: 80px;"/> -
				<input type="text" class="studyTitle form-control" id="studyTitle" 
				style="width: 80px;"/>
				<span class="titleErr">
					전화번호는 필수 입력항목입니다.
				</span>
			</div>
			
			<!-- 공간유형 -->
			<div class="stuTitle">
				<h4>공간 유형<span class="ePoint">*</span></h4>
			</div>
            <div class="stuTitle">
                <div class="form-group">
                    	카페의 유형을 선택해주세요!<br>
                 	<input maxlength="100" type="radio" name="housing" id="spa1"/><label class="control-label" for="spa1">카페</label>
                 	<input maxlength="100" type="radio" name="housing" id="spa2"/><label class="control-label" for="spa2">스터디 카페</label>
                 	
                 </div>
            </div>
            
			<!-- 공간소개 -->
			<div class="stuContent form-inline">
				<h4>공간 소개<span class="ePoint">*</span></h4>
			</div>
			한줄 소개
			<div class="stuContent">
				<textarea id="studyContent" class="form-control" rows="8"
				>기존 공간 한줄 소개</textarea>
				<span class="contentErr">
					한줄 소개는 필수 입력항목입니다.
				</span>
			</div>
			상세 소개
			<div class="stuContent">
				<textarea id="studyContent" class="form-control" rows="8"
				>기존 공간 상세 소개</textarea>
				<span class="contentErr">
					상세 소개는 필수 입력항목입니다.
				</span>
			</div>
			<!-- 키워드 -->
			<div class="stuKeyword">
				<h4>키워드<span class="ePoint">*</span></h4>
				<span class="check">최대 5개</span>
			</div>
			<div class="stuKey">
				<div class="stuKeySel">
					<select name="keySelect" id="keySelect" class="form-control keySelect">
						<option value="key1">키워드1</option>
						<option value="key2">키워드2</option>
						<option value="key3">키워드3</option>
						<option value="key4">키워드4</option>
						<option value="key5">키워드5</option>
					</select>
				</div>
				<div class="stuKeyInput">
					<input type="text" class="keyInput form-control" id="keyInput" 
						placeholder="키워드를 입력해 주세요."/>
				</div>
				<div class="stuKeyBtn">
					<input type="button" value="추가" class="keyBtn btn btn-primary" disabled="disabled"/>
				</div>
				<div class="stuKeyBox">
					<div class="tagStyle">
						<span class="keyTag">
							# 키워드1
							<a href="" class="tag_delete">
							X
							</a>
						</span>
					</div>
					<div class="tagStyle">
						<span class="keyTag">
							# 키워드3
							<a href="" class="tag_delete">
							X
							</a>
						</span>
					</div>
					<div class="tagStyle">
						<span class="keyTag">
							# 키워드5
							<a href="" class="tag_delete">
							X
							</a>
						</span>
					</div>
				</div><!-- end .stuKeyBox -->
			</div><!-- end .stuKey -->

			<!-- 공간정보 -->
			<div class="stuContent form-inline">
				<h4>공간 정보<span class="ePoint">*</span></h4>
			</div>
			<div class="stuKey">
			시설안내
			<div class="stuContent">
				<div class="stuKeyInput form-inline">
					<input type="text" class="keyInput form-control" id="keyInput" 
						placeholder="시설안내를 입력해 주세요." style="width: 800px;"/>
					<input type="button" value="추가" class="keyBtn btn btn-primary" disabled="disabled"/>
				</div>
				<div class="stuKeyBox">
					<div class="tagStyle">
						<span class="keyTag">
							시설안내1
							<a href="" class="tag_delete">
							X
							</a>
						</span>
					</div>
					<div class="tagStyle">
						<span class="keyTag">
							시설안내2
							<a href="" class="tag_delete">
							X
							</a>
						</span>
					</div>
					<div class="tagStyle">
						<span class="keyTag">
							시설안내3
							<a href="" class="tag_delete">
							X
							</a>
						</span>
					</div>
				</div><!-- end -->
				<span class="contentErr">
					시설안내는 필수 입력항목입니다.
				</span>
			</div>
			예약시 주의사항
			<div class="stuContent">
				<textarea id="studyContent" class="form-control" rows="8"
				>예약시 주의사항</textarea>
				<span class="contentErr">
					예약시 주의사항은 필수 입력항목입니다.
				</span>
			</div>
			</div>
			
			<!-- 공간유형 -->
			<div class="stuTitle">
				<h4>이미지 <span class="ePoint">*</span></h4>
			</div>
            <div class="stuTitle">
            <div class="panel-body">
                		대표이미지 
                		<button class="btn btn-primary nextBtn pull-right" type="button" style="margin-left: 10px;" >등록</button>
                		<br><br>상세이미지
                		<button class="btn btn-primary nextBtn pull-right" type="button" style="margin-left: 10px;" >등록</button>
            </div>
            </div>
			
			
			
			<!-- 사이트 -->
			<div class="stuContent form-inline">
				<h4>사이트 주소<span class="ePoint">*</span></h4>
			</div>
			사이트 url
			<div class="stuContent">
				<input id="studyContent" class="form-control" value="기존 사이트url"
				>
			</div>
			
				<div class="button">
					<div class="cancel">
						<input type="button" value="취소" class="btn btn-default"/>
					</div><!-- end .cancel -->
					<div class="upload">
						<input type="submit" value="수정" class="btn btn-primary"/>
					</div><!-- end .upload -->
				</div><!-- end .button -->
			
			
		</div> <!-- end .col-md-8 -->
		<div class="col-md-2">
		</div>
	</div>
	
</div><!-- end .container-fluid -->

<div class="row">
	<div class="col-md-12">
	<c:import url="footer.jsp"></c:import>
	</div>
</div>
</body>
</html>