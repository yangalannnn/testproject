<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
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
	.my_input{
		margin-left:-80px;
	}
	#btn_submit{
		margin-left:-20px;
		margin-top:10px;
		padding:5px 10px 5px 10px;
	}
	.error_div{
		position: absolute;
		left:calc(50% - 300px );
		top:200px;
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
		<h1 class="div_h1">新增頁面</h1>

		<form method="post" action="addmember">
			<label >會員ID  :</label>
			<br>
			<input type="text" name="memselfid" id="memselfid" class="my_input" value="${(memselfid==null)?'':(memselfid)}"><br>
			<label>會員姓名  :</label>
			<br>
			<input type="text" name="memname" id="memname" class="my_input" value="${(memname==null)?'':(memname)}"><br>
			<label>會員Email  :</label>
			<br>
			<input type="text" name="mememail" id="mememail"class="my_input" value="${(mememail==null)?'':(mememail)}"><br>
			<input type="submit" value="新增" id="btn_submit">
		</form>
	</div>


<script>
	const memselfid = document.querySelector('#memselfid');
	const memname = document.querySelector('#memname');
	const mememail = document.querySelector('#mememail');
	const submit = document.querySelector('#btn_submit');
	var errormsg='';
	var error_memselfid  = '會員id不得為空白\n';
    var error_memname  = '會員姓名不得為空白\n';
    var error_mememail  = 'email格式不相符\n';
    var error_mememail1  = 'email不得為空白\n';
	submit.addEventListener('click',function(){
		
		//驗證id
		if(memselfid.value===''){
			errormsg+=error_memselfid;
		}
		//驗證name
		if(memname.value===''){
			errormsg+=error_memname;
		}
		//驗證email
		const namerule = /\w+@\w+$/;
        if(!namerule.test(mememail.value)){
            if(mememail.value===''){
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

		}
	})
</script>
</body>
</html>