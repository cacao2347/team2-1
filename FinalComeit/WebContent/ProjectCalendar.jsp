<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ProjectCalendar.jsp</title>

<link rel="stylesheet" type="text/css" href="<%=cp%>/assets/css/bootstrap-theme.min.css" />
<link rel="stylesheet" type="text/css" href="<%=cp%>/assets/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="<%=cp%>/assets/util/core/main.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/assets/util/daygrid/main.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/assets/util/timegrid/main.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/assets/util/interaction/main.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/projectcalendar.css" >


<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/assets/js/bootstrap.min.js"></script>


<script src='fullcalendar/core/locales/ko.js'></script>
<script type="text/javascript" src="<%=cp%>/assets/util/core/main.js"></script>
<script type="text/javascript" src="<%=cp%>/assets/util/daygrid/main.js"></script>
<script type="text/javascript" src="<%=cp%>/assets/util/timegrid/main.js"></script>
<script type="text/javascript" src="<%=cp%>/assets/util/interaction/main.js"></script>

<script type="text/javascript">
      
      
// 실제 캘린더 뿌려주는 영역
document.addEventListener('DOMContentLoaded', function() {
   
     //var events = readData();
     var calendarEl = document.getElementById('calendar');
     
     var calendar = new FullCalendar.Calendar(calendarEl, {     

       eventDidMount: function(info) {
         var tooltip = new Tooltip(info.el, {
           title: info.event.extendedProps.description,
           placement: 'top',
           trigger: 'hover',
           container: 'body'
         });
       },
        
       plugins: [ 'interaction', 'dayGrid', 'timeGrid'],
       defaultView: 'dayGridMonth',
       defaultDate: new Date(),
       dateClick: function() {
           //alert('수진');
           
         },
       header: {
         left: 'prev,next',
         center: 'title',
         right: 'today'
       },

       // 일정 등록
       selectable: true,
       selectMirror: true,
        select: function(arg) 
        {
			var title = prompt('일정을 등록하세요 :');
			if (title)
			{
				calendar.addEvent
				({
					title: title,
					start: arg.start,
					end: arg.end,
					allDay: arg.allDay
				})
			}
			
			calendar.unselect()
		},
		/* dateClick: function(info) {
			alert('Clicked on: ' + info.dateStr);
		}, */
		eventClick: function(info) 
		{
			
			if(confirm("정말 삭제하시겠습니까?"))
			{
				info.event.remove();
			}
			
		},
       
       tizeZone: 'local',
       locale: 'ko',
       eventSources: [{
          
          events: function(info, callback, failureCallback)   // 이 이벤트 영역에 제이슨 형태로 뿌려주려고 ajax
          {
             $.ajax(
                   {
                      type:"POST"
                      ,url : "calimsi.jsp" 		// 데이터 가지고 올 곳. 요청 url
                      ,dataType: "json"
                      ,success:function(args)
                      {
                    	  
                         callback(args);
                         //alert(args);
                         
                      }
                   
                   });                
             
          }       
          
       }]
       
       
     });
     calendar.render();
   });


</script>

</head>
<body>


<!-- content  -->

<div class="container-fluid">
   <div class="row">
      <div class="col-md-12">
         <div id="calendar" style="width: 100%; height: 100%;" class="text-center">
         <div ></div>
         </div>
      </div>
   </div>
</div>

<!-- content end -->



</body>
</html>