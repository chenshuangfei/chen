<%@ include file="../includes.jsp" %>
<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>人员管理系统</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <style type="text/css">
        .align-center {
            margin: 0 auto;
            text-align: center;
        }
        .layui-table-cell .layui-form-checkbox[lay-skin="primary"]{
            top: 50%;
            transform: translateY(-50%);
        }
    </style>
    <script>

        //点击行选中
        $(document).on("click", ".layui-table-body table.layui-table tbody tr", function () {
            var obj = event ? event.target : event.srcElement;
            var tag = obj.tagName;
            var index = $(this).attr('data-index');
            var tableBox = $(this).parents(".layui-table-box");
//存在固定列
            if (tableBox.find('.layui-table-fixed.layui-table-fixed-l').length > 0) {
                tableDiv = tableBox.find('.layui-table-fixed.layui-table-fixed-l');
            } else {
                tableDiv = tableBox.find('.layui-table-body.layui-table-main');
            }
            var checkCell = tableDiv.find('tr[data-index=' + index + ']').find("td div.laytable-cell-checkbox div.layui-form-checkbox I");
            if (checkCell.length > 0) {
//if(tag == 'DIV') {
                checkCell.click();
//}
            }
        });
        $(document).on("click", "td div.laytable-cell-checkbox div.layui-form-checkbox", function (e) {
            e.stopPropagation();
        });
    </script>

    <script type="text/javascript">

        var limitcount = 10;
        var curnum = 1;
        //列表查询方法
        function productsearch(productGroupId, start, limitsize) {
            layui.use(['table', 'laypage', 'laydate'], function () {
                var table = layui.table, laypage = layui.laypage;
                table.render({
                        elem: '#tablelist'
                    ,cellMinWidth: 220
                    , url: '${ctx}/tableattendanceManagement?startPage='+start+'&tNumber='+limitsize
                    ,initSort:{field:'stream_time',type:'desc'}
                    , cols: [[ //表头 
                         {type:'checkbox'}
                        , {field: 'id', title: '序号',type:'numbers', align:'center'}
                        , {field: 'attendanceno', title: '考勤编号',align:'center'}
                        , {field: 'staffno', title: '职工编号',align:'center'}
                        , {field: 'attendancetime', title: '考勤时间',align:'center',templet:'<div>{{Format(d.attendancetime,"yyyy-MM-dd hh:mm:ss")}}</div>'}
                        , {field: 'latenessnumber', title: '迟到次数',align:'center'}
                        ]]
                    , page: false
                    , height: "full-320"
                    , done: function (res, curr, count) {
                        laypage.render({
                            elem: 'laypage'
                            , count: count
                            , curr: curnum
                            , limit: limitcount
                            , jump: function (obj, first) {
                                if (!first) {
                                    curnum = obj.curr;
                                    limitcount = obj.limit;
                                    productsearch(productGroupId, curnum, limitcount);
                                }
                            }
                        })
                    }
                })
            });
        }
        productsearch("1", curnum, limitcount);

        function  delSelect(){
        	 table.render({ //其它参数省略
                 id: 'tablelist'
             });
             var checkStatus = table.checkStatus('tablelist'); //list即为基础参数id对应的值

             if(checkStatus.data.length==1){
            	 var id =checkStatus.data[0].id;
            	 sys_layer.confirm('提示:确定删除选项?', {icon: 3, title:'&nbsp;'}, function(index){
          			  sys_layer.close(index);
          			  $.ajax({
          					url:"${ctx}/dodelattendanceManagement",
          					data:{id:id},
          					success:function(data){
                                parent.layer.msg(data.msg);
                                productsearch(1,1,10)
          					}
          				})
          			});
             }else{
            	 layer.msg("请选中一条信息");
             }


        }




        function editSelect() {
            table.render({ //其它参数省略
                id: 'tablelist'
            });
            var checkStatus = table.checkStatus('tablelist'); //list即为基础参数id对应的值
            if(checkStatus.data.length==1){
    			var id =checkStatus.data[0].id;
            	 layer.open({
                     type: 2,
                     shadeClose: true,
                     shade: false,
                     maxmin: true, //开启最大化最小化按钮
                     title:" ",
                     area: ['70%', '80%'],
                     content: '${ctx}/doUpdateattendanceManagement?id='+id,

                 });

            }else{
           	 layer.msg("请选中一条信息");
            }
        }


        function add(){
            $.ajax({
					url:"${ctx}/doaddattendanceManagement",
					success:function(data){
	                    parent.layer.msg(data.msg);
	                    productsearch(1,1,10)
					}
				})
        }

    </script>
    <script type="text/javascript">
	function removeUser(){
		sys_layer.confirm('提示:确定退出登录?', {icon: 3, title:'&nbsp;'}, function(index){
			  sys_layer.close(index);
			  window.location.href ='${ctx}/login';
			});
	}

</script>
</head>
<body class="layui-layout-body">
<div style="height:100%;width:100%;">
    <div class="head">
        <p class="title">人员信息管理</p>
        <p class="user" style="float:right; font-size:18px;color:black;font-weight:bold;" onclick="removeUser()">退出登录</p>
        <p class="user" style="float:right; font-size:18px;color:#DA70D6;font-weight:bold;" >[你好！${username }]</p>
    </div>
    <div class="toolbar">
       <%--  <a href="${ctx}/index" id="index">首页</a> --%>
        <a href="${ctx}/listemployeeInfo" id="listemployeeInfo" >职员信息管理</a>
        <a href="${ctx}/listattendanceManagement"  id="listattendanceManagement" style="color: #7F7F7D;background:#FEFEFC;margin-left:4px;text-align:center;">考勤信息管理</a>
        
    </div>
    <div class="form_box">
           
		<br>
        <P class="btn_box">
            <button class="layui-btn layui-btn-sm "  style="margin-left:10px;" data-type="add"><i
                    class="layui-icon" style="font-size: 30px; color: #white;">&#xe654;</i>考勤打卡
            </button>
            
        </P>
        <table  class="layui-hide"  id="tablelist" lay-filter="demo"></table>

        <div id="laypage" class="align-center"/>
   
   
    </div>
</div>
</div>
</body>
<script type="text/javascript">

layui.use('laydate', function(){
	  var laydate = layui.laydate;
	  
	  laydate.render({
		    elem: '#stream_time'
		  });
	  laydate.render({
		    elem: '#completion_time'
		  });
	});
	
	
	</script>
</html>
