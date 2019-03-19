<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<style>

#prev, #next {
	display: inline-block;
	text-decoration: none;
	color: black;
	padding: 5px;
	float:left;
}

#youbi{
	font-size: 20px;

}

.td{
	font-size :20px;

}

#prev,#next{
	
	font-size :20px;
	text-align: left;
}

#calendar_wrap {

	width: 250px;
	color : black;
	float : left;
	margin-left:auto;
	
	
}

#right{
	
	color : black;
	float : left;
	margin-left:auto;
	
}

caption {

	font-size: 20px;
	color: black;
	padding: 20px;
	
}

#depart_ment{

	width: 250px;
	color : black;
	float : left;
	margin-left:auto;
	
}

li{
	list-style: none;
	
}
</style>
<body>
	<div id="calendar_wrap">
		<table id="calendar" >
			<caption>
				<span class="year"></span>年 <span class="month"></span>月
			</caption>
			<tr id="youbi">
				<th>日</th>
				<th>月</th>
				<th>火</th>
				<th>水</th>
				<th>木</th>
				<th>金</th>
				<th>土</th>
			</tr>
			<tr>
				<td class="td">&nbsp;</td>
				<td class="td">&nbsp;</td>
				<td class="td">&nbsp;</td>
				<td class="td">&nbsp;</td>
				<td class="td">&nbsp;</td>
				<td class="td">&nbsp;</td>
				<td class="td">&nbsp;</td>
			</tr>
			<tr>
				<td class="td">&nbsp;</td>
				<td class="td">&nbsp;</td>
				<td class="td">&nbsp;</td>
				<td class="td">&nbsp;</td>
				<td class="td">&nbsp;</td>
				<td class="td">&nbsp;</td>
				<td class="td">&nbsp;</td>
			</tr>
			<tr>
				<td class="td">&nbsp;</td>
				<td class="td">&nbsp;</td>
				<td class="td">&nbsp;</td>
				<td class="td">&nbsp;</td>
				<td class="td">&nbsp;</td>
				<td class="td">&nbsp;</td>
				<td class="td">&nbsp;</td>
			</tr>
			<tr>
				<td class="td">&nbsp;</td>
				<td class="td">&nbsp;</td>
				<td class="td">&nbsp;</td>
				<td class="td">&nbsp;</td>
				<td class="td">&nbsp;</td>
				<td class="td">&nbsp;</td>
				<td class="td">&nbsp;</td>
			</tr>
			<tr>
				<td class="td">&nbsp;</td>
				<td class="td">&nbsp;</td>
				<td class="td">&nbsp;</td>
				<td class="td">&nbsp;</td>
				<td class="td">&nbsp;</td>
				<td class="td">&nbsp;</td>
				<td class="td">&nbsp;</td>
			</tr>
			<tr>
				<td class="td">&nbsp;</td>
				<td class="td">&nbsp;</td>
				<td class="td">&nbsp;</td>
				<td class="td">&nbsp;</td>
				<td class="td">&nbsp;</td>
				<td class="td">&nbsp;</td>
				<td class="td">&nbsp;</td>
			</tr>

		</table>
	<li>
		<ul>
			<a href="#" id="prev" >
				<svg id="prev_" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M6 6h2v12H6zm3.5 6l8.5 6V6z"/><path d="M0 0h24v24H0z" fill="none"/></svg>			
			&nbsp;&nbsp;&nbsp;&nbsp;</a>
			<a href="#" id="next">
				<svg id="next_" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M6 18l8.5-6L6 6v12zM16 6v12h2V6h-2z"/><path d="M0 0h24v24H0z" fill="none"/></svg>
			</a>
		</ul>
	</li>

	</div>
	
	
	
	<div id="select_view" style="float:inherit;">
	 </div>
	
 	<div id="right" style="float:inherit;">
		<table>
			<caption style="width:200px;">
				<span class="department_notice">ガイドライン</span>
			</caption>		
			<c:forEach var="Calendar" items="${Calendar}">
				<tr>
					<td id="schedule">${Calendar.start_day}~${Calendar.last_day}  ${Calendar.schdule_title}</td>
				</tr> 
				
	<%-- 			
				
				
 				<tr>
					<td id="schedule"></td>
				</tr>
				<tr>
					<td id="schedule">${Calendar.schdule_title}</td>
				</tr>
				<tr>
					<td id="schedule">${Calendar.place}</td>
				</tr>
				<tr>
					<td id="schedule">${Calendar.discription}</td>
				</tr>  --%>
 		</c:forEach> 
 		</table> 
	
	</div> 

</body>

<script src="resources/js/jquery-3.3.1.js"></script>
<script type="text/javascript">	

	var year = new Date().getFullYear(),
	 	month = new Date().getMonth();
	
// 	달력 클릭하면 가이드라인  이벤트

 	$(function(){		

 		var $right = $("#right");
		var $select_view = $("#select_view");
 		var $calendar_wrap =$("#calendar_wrap");
		
		
/* 		$calendar_wrap.on('click',function(e){
			e.preventDefault();
			$select_view.slideToggle();
		
		});
		
		$(window).resize(function(){
			var w =$(window).width();
			if(w>320 && $select_view.is(':hidden')){
				$select_view.removeAttr('style');
			}			
		}); */
				

//  	달력 

 		$("#prev_").on('click',function(){	 		
	
				calendar(year,--month);		
		
 				var year_= year.toString().substring(0,4)+"-"; 				
 				var month_ = "0"+month.toString().substring(0,2);								
 				var start_day = year_+month_;
 				
 			 $.ajax({
					 method : 'POST'
					, url : 'calendar'
					, data : {'start_day' : start_day
							  
					}, success : function(resp){	
						output(resp);
						console.log(resp);
					},error: function(resp){
						console.log(resp);
					}
					
			}); 
				$("#right").css('display', 'none');
				$("#right").next().css('display', 'inline-block');
											
				console.log(start_day);
			
				
				
				
				
			
		});		
 	
 		$("#next").on('click',function(){
			calendar(year,++month);		 			 		
		});	 		
 		
 		
 	});
 		

 	
 	function output(resp){
 				
 		

 		var data = '<table>';

 		$.each(resp,function(index,item) {
 			data += '<tr>';
 			data += '<td>'+item.start_day+ item.last_day +item.schdule_title+ '</td>';
 			
 			data += '</tr>';
 			data +='</table>';
 			data += '</div>';
 		});
 			
 		$('#select_view').html(data);
 

 	}
		
 	
	function calendar(new_year,new_month){
 
		var d = new Date(new_year,new_month,1),
		
		d_length = 32- new Date(new_year,new_month,32).getDate(),		
					year = d.getFullYear(),				
					month = d.getMonth()+1,
				 	date = d.getDate(),
					day = d.getDay();
				
		 
		var $caption_year = $('.year'),
			$caption_month = $('.month');
		
		
		for (var i=0; i < 50; i++) {
			$(".td").eq(i).text('');			
				
		}
		
		for (var i=day; i < day + d_length; i++) {
			$(".td").eq(i).html(date);			
			date++;				
		}
		 
		$caption_year.html(year);
		$caption_month.html(month);			
		
	} 
						
		(function(){
			calendar(year,month);
			alert(month);
		})();
					

</script>
</html>