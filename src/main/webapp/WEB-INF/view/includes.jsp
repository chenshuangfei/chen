<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<link rel="stylesheet" href="static/layui/css/layui.css">
<script src="static/js/jquery-1.9.1.js"></script>
<script src="static/layui/layui.js"></script>
<script src="static/js/date-format.js"></script>
<script src="static/my-layui-js.js"></script>



<style type="text/css">
.head{
	    width: 100%;
	    height: 112px;
	    background: url(static/img/head-background.png) no-repeat;
	    background-size: cover;
	}
	.title{
	    font-size: 2em;
	    color: #fff;
	    font-family: "黑体","宋体","微软雅黑","创艺简魏碑";
	    position: absolute;
	    top: 44px;
	    left: 160px;
	}
	.toolbar{
	    width: 100%;
	    height: 30px;
	    background-color: #254087;
	    border: 1px solid #3B5DA4;
	    background-size: cover;
	}
	.toolbar a{
	        display: block;
	        width: 104px;
	        float: left;
	        font-size: 1em;
	        line-height: 29px;
	        text-align: center;
	        height: 30px;
	        margin-left: 4px;
	        font-weight: bold;
	        background: #6B94D2;
	        color: #fff;
	}
	.form_box{
	        width: 100%;
	        height: 90px;
	        background-color:#F0F0F0;
	        margin:0px;
	}
	.query_box input{
	        width: 148px;
	        height: 28px;
	        border: 1px solid #ccc;
	        margin: 10px 0px 10px 10px;
	        background: #fff;
	}
	.table_box{
	        padding:0px;
	        margin:0px;
	        width: 100%;
	        height:calc(100%-232px);
	        height:-webkit-calc(100% - 232px);
	        height:-moz-calc(100% - 232px);
	        background-color:#F0F0F0;
	        overflow:hidden;
	}
	.footer{
	        background-color:#F0F0F0;
	        height:60px;
	        width:100%;
	        position: fixed;
	        bottom:  -20px;
	        left: 0px;
	}
	.table_data{
	        width: 97.5%;
	        font-size: 1em;
	        margin: 14px auto 70px auto;
	        text-align: center;
	        border-width: 1px 0 0 0px;
	        cursor: default;
	        border-color: grey;
	}
	.data_box{
	        padding:0px;
	        margin:0px;
	        width:100%;
	        height:calc(100%-60px);
	        height:-webkit-calc(100% - 60px);
	        height:-moz-calc(100% - 60px);
	        overflow:auto;
	}
	.table_data td{
	        height:50px;
	        border-color: #c0c6b8;
	        border-style: solid;
	}
	tbody tr{
	        background-color:white;
	}
	.table_data>tbody>tr:hover{
	        background:#E8EFF9;
	}
</style>

<script>
		
</script>