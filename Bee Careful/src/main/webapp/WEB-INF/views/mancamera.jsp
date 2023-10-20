</style>
		<script type="text/javascript">
			var pageNum=1;
	        var pageAll=0;
			$(document).ready(function() {
				userList(pageNum);
			});
			function userList(pageNum) {
				$('#cctvsearch').css('display', 'block');
				$('#paging').css('display','block');
				$.ajax({
					url : "${cPath}/alluser",
					type : "get",
					dataType : "json",
					success: function(data) {
						pageAll=Object.keys(data).length;
						var aList = "<table class='table table-hover' id='userview' style='border: 1px solid black;'>";
						aList += "<tr class='first' style='background-color: rgba(0, 0, 0, 0.1);'>";
						aList += "<td>번호</td>";
						aList += "<td>아이디</td>";
						aList += "<td>사용중인 카메라 개수</td>";
						aList += "</tr>";
						var i = 1;
						var search=document.getElementById("cctvsearch").value;
						$.each(data, function(index, obj) {
							var cameraNum=0;
							if (search==""){
								if(index>=(pageNum-1)*10&&index<10*pageNum){
									aList += "<tr id='c"+obj.user_id+"' class='second'>";
									aList += "<td>" + i + "</td>";
									aList += "<td><a href='javascript:cameraList(\""+obj.user_id+"\")'>" + obj.user_id + "</a></td>";
									$.ajax({
										url:"${cPath}/allcamera/"+obj.user_id,
										type:"get",
										dataType:"json",
										async: false,
										success:function(data){
											cameraNum=Object.keys(data).length;
											console.log(cameraNum);
										},
										error: function() {
											alert("ajax 통신 실패1");
										}
									})
									aList +="<td>"+cameraNum+"</td>";
									aList += "</tr>";
									i += 1;
								}
							}
							else{
								if(obj.user_id.includes(search)){
									if(index>=(pageNum-1)*10&&index<10*pageNum){
										aList += "<tr id='c"+obj.user_id+"' class='second'>";
										aList += "<td>" + i + "</td>";
										aList += "<td><a href='javascript:cameraList(\""+obj.user_id+"\")'>" + obj.user_id + "</a></td>";
										$.ajax({
											url:"${cPath}/allcamera/"+obj.user_id,
											type:"get",
											dataType:"json",
											success:function(data){
												cameraNum=Object.keys(data).length;
											},
											error: function() {
												alert("ajax 통신 실패1");
											}
										})
										aList +="<td>"+cameraNum+"</td>";
										aList += "</tr>";
										i += 1;
									}
								}
							}
						});
						aList += "</table>";
						$('#cctv').html(aList);
						var cList="";
		                 for (var i=1;i<pageAll/10+1;i++){
		                    cList += "<button value='"+i+"' onclick='userList(this.value)'>"+i+"</button>"
		                 }
		                 $('#paging').html(cList);
					},
					error: function() {
						alert("ajax 통신 실패1");
					}
				});
			}
			function cameraList(user_id) {
				console.log(user_id)
				$('#paging').css('display','none');
				$('#search').css('display', 'none');
				$.ajax({
					url : "${cPath}/allcamera/"+user_id,
					type : "get",
					dataType : "json",
					success : function(data){
						var aList = "회원 아이디 : <span class='user_id'>"+user_id+"</span>";
						aList += "<table class='table table-hover' id='cameraview'>";
						aList += "<tr>";
						aList += "<td>카메라 순번</td>";
						aList += "<td>카메라 상태</td>";
						aList += "<td>알람 설정(초)</td>";
						aList += "<td><button class='btn btn-sm btn-warning' onclick='userList("+pageNum+")'>돌아가기</button></td>"
						aList += "</tr>";
						$.each(data,function(index, obj) {		
							aList += "<tr>";
							aList += "<td>"+obj.camera_idx+"</td>";
							aList += "<td><input type='text' value='"+obj.camera_status+"' id='camera_status"+obj.camera_idx+"'></td>";
							aList += "<td><input type='text' value='"+obj.alarm_status+"' id='alarm_status"+obj.camera_idx+"'></td>";
							aList += "<td><button class='btn btn-sm btn-success' onclick='goUpdate(\""+obj.camera_idx+"\")'>수정</button>&nbsp;<button  class='btn btn-sm btn-primary' onclick='goDel(\""+obj.camera_idx+"\")'>삭제</button>"
							aList += "</td>";
							aList += "</tr>";						
						});
						aList += "<tr><td colspan='4'>";
						aList += "카메라 상태 :<select id='insertSt'><option value='N' selected>N</option><option value='E'>E</option></select>";
						aList += "<button onclick='insert(\""+user_id+"\")'>카메라 생성</button>";
						aList += "</td></tr>";
						aList += "</table>";
						$('#cctv').html(aList);
					},
					error:function(request,status,error){
				        alert("cacode:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				   }
				});
			}
			function insert(user_id){
				$.ajax({
					url : "${cPath}/cameraset",
					type : "post", 
					contentType:'application/json;charset=utf-8',
					data : JSON.stringify({"user_id":user_id,"camera_status":'N'}),
					success : function(){
						cameraList(user_id);
					},
					error:function(request,status,error){
				        alert("incode:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				    }
				});
			}
			function goDel(idx){
				var user_id=$('.user_id').text();
				$.ajax({
					url : "${cPath}/cameraset/"+idx,
					type : "delete", 
					success : function(){
						cameraList(user_id);
					},
					error:function(request,status,error){
				        alert("decode:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				    }
				});
				alert("삭제 완료");
			}
			function goUpdate(idx){
				var user_id=$('.user_id').text();
				var camera_status=$('#camera_status'+idx).val();
				var alarm_status=$('#alarm_status'+idx).val();
				$.ajax({
					url : "${cPath}/cameraset",
					type : "put",
					contentType:'application/json;charset=utf-8',
					data : JSON.stringify({"camera_idx":idx,"camera_status":camera_status,"alarm_status":alarm_status}),
					success : function(){
						cameraList(user_id);
					},
					error:function(request,status,error){
				        alert("upcode:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				   }
				});
				alert("수정 완료");
			}
		</script>