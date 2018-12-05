<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <meta charset="utf-8" />
  <title>人员管理系统</title>
   <link rel="shortcut icon" href="images/bitbug_favicon.ico">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
 
<link rel="stylesheet" href="static/layui/css/layui.css">
<script src="static/js/jquery-1.9.1.js"></script>
<script src="static/layui/layui.js"></script>
<script src="static/js/date-format.js"></script>
<script src="static/my-layui-js.js"></script>


<style type="text/css">
    *{
        margin:0;
        padding:0;
        }
    #content{
        background:url(static/images/img/background_pic.png) no-repeat;
        background-size:cover;
        width:100vw;
        height:100vh;
        background-position:center center;
        position:relative;
        overflow:hidden;
        }
    .logo{
        position:absolute;
        top:3%;
        left:10%;
        
        }
    .p1{
        float:right;
        margin-left:16px;
        font-size:20px;
        line-height:32px;
        font-family:"微软雅黑";
        font-weight:bold;
        color:#d9d9d9;
        }
    .loginBox{
        position:absolute;
        top:22%;
        right:13%;
        background:url(static/images/img/login_pic.png) no-repeat;
        width:492px;
        height:402px;
        
        }
    .span{
        font-size:24px;
        font-family:"微软雅黑";
        color:#00567c;
        
        position:relative;
        left:197px;
        top:36px;
        }
    form{
    
        margin-top:68px;
        margin-right:82px;
        }
    form>div{
        text-align:right;
        margin-top:10px;
        height:48px;
        
        }
    form>div>input{
        width:285px;
        height:44px;
        border:1px solid #fff;
        background-image: -moz-linear-gradient(top, #90d4e8, #FFF); 
        background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #90d4e8), color-stop(1,#FFF)); 
        filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#90d4e8', endColorstr='#FFF', GradientType='0');
        border-radius:4px;
        box-shadow:1px 1px 2px #78c0ed;
        text-indent:22px;
        }
    form>div>input::-webkit-input-placeholder,
           textarea::-webkit-input-placehoder{
            color:#597884;
            font-size:16px;
            font-family:"微软雅黑"
        }
    form>div>label{
        font-size:16px;
        color:#00567c;
        font-family:"微软雅黑";
        
        }
    form>div>img{
        position:absolute;
        left:134px;
        border:1px solid #f00;
    
        }
    .img_pic1{
        vertical-align:middle;
        width:25px;
        height:25px;
        }
    
    .remember{
        float:left;
        margin-left:124px;
        margin-top:18px;
        
        }

        
    .remember>input,.forget>input{
        width:19px;
        height:19px;
        }
    form>div>.forget{
        
        margin-top:-30px;
    
    }
        
        
        
    .yzmBox{
        width:93px;
        height:44px;
        display:inline-block;
        text-align:center;
        font-size:18px;
        font-weight:bold;
        line-height:44px;
        cursor:pointer;
        background:#fff;
        border-radius:4px;
        position:relative;
        top:-44px;
        }
    
    
    .login{
        width:330px;
        height:76px;
        background:url(static/images/img/login_pic2.png) no-repeat;
        margin-left:80px;
        margin-top:-8px;
        }
    .login>p{
        font-size:18px;
        line-height:32px;
        text-align:center;
        
        
        }
    .login>p:hover{
        cursor:pointer;
        color:#f00;
        }
    #mask{
        width:100%;
        height:100%;
        background:rgba(0,0,0,0.6);
         z-index: 100;
         position:absolute;
         top:0;
         left:0;    
         display:none;
        }
    .border{
        width:400px;
        height:200px;
        background:#fff;
        margin:0 auto;
        margin-top:15%;
        border-radius:10px;
        line-height:200px;
        text-align:center;
        font-size:20px;
        }
    .copyright{
        position:relative;
        bottom:-86%;
        left:-90%;
        
    }
</style>

</head>
<body class="login-layout light-login">
<div id="content">
        <div class="logo">
<!--            <img src="images/img/logo.png"/> -->
            <p class="p1"></p>
        </div>
        <div class="loginBox">
            <span class="span">欢迎登录</span>
            <form id="loginForm"  >
                <div class="userName">
                    <label>用户名：</label>
                    <input type="text" class="text" placeholder="请输入用户名" name="userName" iscookie='true' id="userName"/>
                </div>
                <div class="password">
                    <label>密码：</label>
                    <input type="password" class="text" placeholder="请输入密码" name="password" id="password"/>
					
                </div>
             </form>   
                 <div class="login" id="login" style="margin-top:30px;">
                    <p id="but_login" onclick="doSubmit()">登录</p>
                    </div>
        </div>
        <div class="copyright" >
            <img src="static/images/img/copyright.png"/>
        </div>
    </div>
    <div id="mask" onclick="optErrMsg()">
        <div id="errormsg" class="border">
            用户名错误
        </div>
    </div>
<script src="static/js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="static/plug-in/mutiLang/en.js"></script>
<script type="text/javascript" src="static/plug-in/mutiLang/zh-cn.js"></script>
<script type="text/javascript" src="static/plug-in/login/js/jquery.tipsy.js"></script>
<script type="text/javascript" src="static/plug-in/login/js/iphone.check.js"></script>
<script type="text/javascript">

    $(function(){
        optErrMsg();
    });
    $("#errMsgContiner").hide();
    function optErrMsg(){
        $("#errormsg").html('');
        $("#mask").hide();
    }

   //输入验证码，回车登录
  $(document).keydown(function(e){
    if(e.keyCode == 13) {
        $("#but_login").click();
    }
  });

  //验证用户信息
  function checkUser(){
    if(!validForm()){
      return false;
    }
    newLogin();
  }
  //表单验证
  function validForm(){
    if($.trim($("#userName").val()).length==0){
        
      showErrorMsg("请输入用户名");
      return false;
    }
  }
    if($.trim($("#password").val()).length==0){
      showErrorMsg("请输入密码");
      return false;
    }

 

 
  
</script>
<script>
function doSubmit() {
    var name = $('#userName').val();
    var password = $('#password').val();
    if(name ==""){
        showErrorMsg("用户名不能为空!");
//      alert("用户名不能为空!");  
        return;
    }
    if(password ==""){
        showErrorMsg("密码不能为空!");
//      alert("密码不能为空!");  
        return;
    }
    $.ajax({
        url:"${ctx}/userLogin?userName="+name+"&password="+password,
        type:"post",
        success:function(data){
        	if(data.count==1){
        		 window.location.href = '${ctx}/listemployeeInfo';
        	}else if(data.count==2){
        		 $('#userName').val("");
        	     $('#password').val("");
        		 parent.layer.msg(data.msg);
        	}else{
        		$('#userName').val("");
       	    	$('#password').val("");
        		parent.layer.msg(data.msg);
        	}
         
		}
    });  
}


</script>
</body>
</html>