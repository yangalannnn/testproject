<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="index/css/header.css" />
<title>Insert title here</title>
<style>
	.main_div{
		text-align: center;
	}
	.div_h1{
		margin-top:70px;
	}
	.error_div{
		position: absolute;
		left:calc(50% - 300px );
		top:200px;
	}
	#btn_submit{
		margin-top:20px;
		margin-left:-15px;
	}
	#my_input{
		margin-top:10px;
		margin-left:-80px;
	}
	table{
		position: absolute;
		top:350px;
        left: calc(50% - 230px );
		border:1px black solid;
	}
	tr{
		border:1px white solid;
	}
	td,th{
		padding:30px;
	}
	#inputmemname{
		width:100px;
		margin-top:-10px;
		margin-left:-15px;
	}
	#inputmememail{
		width:100px;
		margin-top:-10px;
		margin-left:-13px;
	}
	#btn_update{
		padding:5px;
		margin-top:-20px;
		margin-left:-5px;
	}
</style>
</head>
<body>
	<%@include file="/WEB-INF/jsp/header.jsp" %>
	<c:if test="${not empty errorMsgList}">
		<div class="error_div">
			<font style="color:red">請修正以下錯誤:</font>
			<ul>
				<c:forEach var="message" items="${errorMsgList}">
					<li style="color:red">${message}</li>
				</c:forEach>
			</ul>
		</div>
	</c:if>
	<div class="main_div">
		<h1 class="div_h1">修改頁面</h1>
		
		<form method="get" action="updatemember">
			<label >會員ID / 會員Email</label>
			<br>
			<input type="text" name="findinput" id="my_input"><br>
			<input type="submit" value="查詢" id="btn_submit">
		</form>
	</div>
	<c:choose>
		<c:when test="${findmember!=null}">
			<table class="my_table">
			<tr>
				<th>會員 ID</th>
				<th>會員姓名</th>
				<th>會員Email</th>
				<th>編輯</th>
			</tr>
			<tr>
			<form method="post" action="updatemember">
				<td>${findmember.memselfid}</td>
				<td><input type="text" name="inputmemname" value=${findmember.memname} id="inputmemname"></td>
				<td><input type="text" name="inputmememail" value=${findmember.mememail} id="inputmememail"></td>
				<td>
						<input type="hidden" name="memselfid"  value="${findmember.memselfid}">
						<input type="submit" value="修改" id="btn_update">
				</td>
			</form>
			</tr>
		</table>
		</c:when>
		<c:otherwise>
		
		</c:otherwise>
	</c:choose>
	<script>
		const inputmemname = document.querySelector('#inputmemname');
		const inputmememail = document.querySelector('#inputmememail');
		const updatebtn = document.querySelector('#btn_update');
		var errormsg='';
		var error_memname  = '會員姓名不得為空白\n';
	    var error_mememail  = 'email格式不相符\n';
	    var error_mememail1  = 'email不得為空白\n';
	    updatebtn.addEventListener('click',function(){
			//驗證name
			if(inputmemname.value===''){
				errormsg+=error_memname;
			}
			//驗證email
			const namerule = /\w+@\w+$/;
	        if(!namerule.test(inputmememail.value)){
	            if(inputmememail.value===''){
	            	errormsg+=error_mememail1;
	            }else{
	            	errormsg+=error_mememail;
	            }
	        }else{
	        	
	        }
			
			
			if(errormsg!==''){
				alert(errormsg);
				errormsg='';
				event.preventDefault();
			}else{
				alert("修改成功");
			}
		})
	</script>
</body>
</html>