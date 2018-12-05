<%@ include file="includes.jsp" %>
<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <script src="static/js/jquery.min.js"></script>
    <%-- <script src="static/js/tabweek.js"></script>--%>
    <link rel="stylesheet" href="static/css/tabweek.css"/>

    <%--<script src="${ctx}/static/js/gantt/bootstrap.min.js"></script>--%>
    <script src="static/js/gantt/prettify.min.js"></script>
    <link rel="stylesheet" href="static/css/style.css"/>
    <link rel="stylesheet" href="static/css/bootstrap.min.css"/>
    <link href="static/css/prettify.min.css" rel="stylesheet"/>
    <script src="https://img.hcharts.cn/highcharts/highcharts.js"></script>
    <script src="https://img.hcharts.cn/highcharts/modules/exporting.js"></script>
    <script src="https://img.hcharts.cn/highcharts/modules/oldie.js"></script>
    <script src="https://img.hcharts.cn/highcharts/modules/series-label.js"></script>
    <script src="https://img.hcharts.cn/highcharts-plugins/highcharts-zh_CN.js"></script>


    <title>市信息中心项目管理系统</title>
    <style>
        body {
            font-family: Helvetica, Arial, sans-serif;
            font-size: 13px;
            padding: 0 0 50px 0;
        }

        .contain {
            width: 800px;
            margin: 0 auto;
        }

        .table4_4 table {
            width: 100%;
            margin: 15px 0;
            border: 0;
        }

        .table4_4 th {
            background-color: #3296D7;
            color: #FFFFFF
        }

        .table4_4, .table4_4 th, .table4_4 td {
            font-size: 0.95em;
            text-align: center;
            padding: 4px;
            border-collapse: collapse;
        }

        .table4_4 th, .table4_4 td {
            border: 1px solid #89c3e8;
            border-width: 1px 0 1px 0
        }

        .table4_4 tr {
            border: 1px solid #89c3e8;
        }

        .table4_4 tr:nth-child(odd) {
            background-color: #badcf1;
        }

        .table4_4 tr:nth-child(even) {
            background-color: #fdfdfd;
        }

        form {
            position: relative;
            width: 200px;
            margin: 0 auto;
        }

        .d1 input {
            width: 100%;
            height: 42px;
            padding-left: 10px;
            border: 2px solid #1E9FFF;
            border-radius: 5px;
            outline: none;
            color: #9E9C9C;
        }

        .d1 button {
            position: absolute;
            top: 0;
            right: 0px;
            width: 42px;
            height: 42px;
            border: none;
            background: #1E9FFF;
            border-radius: 0 5px 5px 0;
            cursor: pointer;
        }

        .d1 button:before {
            content: "\f002";
            font-family: FontAwesome;
            font-size: 16px;
            color: #F9F0DA;
        }

        .laytable-cell-1 {
            width: 220px;
        }

    </style>
   
<script type="text/javascript">
	function removeUser(){
		sys_layer.confirm('提示:确定退出登录?', {icon: 3, title:'&nbsp;'}, function(index){
			  sys_layer.close(index);
			  window.location.href ='${ctx}/login';
			});
	}

</script>
</head>
<body class="layui-layout-body" onload="searchall()">
<div style="height:100%;width:100%; " id="divBody" >
    <div class="head">
        <p class="title">人员信管理</p>
        <p class="user" style="float:right; font-size:18px;color:black;font-weight:bold;" onclick="removeUser()">退出登录</p>
    </div>
    
    <div class="toolbar">
        <a href="${ctx}/index" id="index" style="color: #7F7F7D;background:#FEFEFC;margin-left:4px;text-align:center;">首页</a>
        <a href="${ctx}/listemployeeInfo" id="listemployeeInfo">职员信息管理</a>
        <a href="${ctx}/listattendanceManagement"  id="listattendanceManagement">考勤信息管理</a>
      、
    </div>
    
   


</div>


</body>

</html>
