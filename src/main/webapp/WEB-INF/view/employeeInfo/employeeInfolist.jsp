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

 		<script type="text/html" id="bartablelist">
            <a class="layui-btn layui-btn-xs" onclick="editSelect()" lay-event="edit">编辑</a>
            <a class="layui-btn layui-btn-xs"  onclick="delSelect()" lay-event="edit">删除</a>
        </script>
  
    <script type="text/html" id="basicwages">
  {{#  if(d.basicwages >=3000){ }}
    <span style="color: #FFFF00;">{{ d.basicwages }}</span>
  {{#  } else { }}
    {{ d.basicwages }}
  {{#  } }}
</script>
<script type="text/javascript">
	function removeUser(){
		sys_layer.confirm('提示:确定退出登录?', {icon: 3, title:'&nbsp;'}, function(index){
			  sys_layer.close(index);
			  window.location.href ='${ctx}/login';
			});
	}

</script>
<script type="text/html" id="sex">
  {{#  if(d.sex ==0){ }}
   {{ d.sex='男' }}
  {{#  } else { }}
    {{d.sex='女'  }}
  {{#  } }}
</script>
    <script type="text/javascript">

        var limitcount = 10;
        var curnum = 1;
        //列表查询方法
        function productsearch(productGroupId, start, limitsize) {
            var name = $("#name").val() || "";
            var post = $("#post").val() || "";
            layui.use(['table', 'laypage', 'laydate'], function () {
                var table = layui.table, laypage = layui.laypage;
                table.render({
                        elem: '#tablelist'
                    ,cellMinWidth: 220
                    , url: '${ctx}/tableemployeeInfo?startPage='+start+'&tNumber='+limitsize+'&name='+name+'&post='+post
                    , cols: [[ //表头 
                         {type:'checkbox'}
                        , {field: 'id', title: '序号',type:'numbers', align:'center'}
                        , {field: 'staffno', title: '职员编号',align:'center'}
                        , {field: 'password', title: '登录密码',align:'center'}
                        , {field: 'name', title: '姓名',align:'center'}
                        , {field: 'sex', title: '性别',align:'center',templet: '#sex'}
                        , {field: 'brithday', title: '出生日期',align:'center',templet:'<div>{{Format(d.brithday,"yyyy-MM-dd")}}</div>'}
                        , {field: 'department', title: '所属部门',align:'center'}
                        , {field: 'post', title: '岗位',align:'center'}
                        , {field: 'politicalaspects', title: '政治面貌',align:'center'}
                        , {field: 'basicwages', title: '基本工资',align:'center', templet: '#basicwages'}
                        , {field: 'floatingbonus', title: '浮动奖金',align:'center'}
                        ,{fixed: 'right', title: '操作',width: 165, align:'center', toolbar: '#bartablelist'}
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
                        
                        $("[data-field='post']").children().each(function(){  
                                if($(this).text()=='1'){  
                                   $(this).text("研发岗位")  
                                }else if($(this).text()=='2'){  
                                   $(this).text("测试岗位")  
                                }else if($(this).text()=='3'){  
                                   $(this).text("人事岗位")  
                                }else if($(this).text()=='4'){  
                                   $(this).text("行政岗位")  
                                }else if($(this).text()=='5'){  
                                   $(this).text("财务岗位")  
                                }else if($(this).text()=='6'){  
                                   $(this).text("其他岗位")  
                                }     
                        }) 
                    }
                })
            });
        }
        
       
        productsearch("1", curnum, limitcount);

        /* //监听工具条
        table.on('tool(demo)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
          var data = obj.data //获得当前行数据
          ,layEvent = obj.event; //获得 lay-event 对应的值
          if(layEvent === 'detail'){
            layer.msg('查看操作');
          } else if(layEvent === 'del'){
            layer.confirm('真的删除行么', function(index){
              obj.del(); //删除对应行（tr）的DOM结构
              layer.close(index);
              //向服务端发送删除指令
            });
          } else if(layEvent === 'edit'){
            layer.msg('编辑操作');
          }
        }); */
        
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
          					url:"${ctx}/dodelemployeeInfo",
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


        function seeSelect(id) {
                layer.open({
                    type: 2,
                    shadeClose: true,
                    shade: false,
                    maxmin: true, //开启最大化最小化按钮
                    title:" ",
                    area: ['70%', '80%'],
                    content: '${ctx}/manager/pergoTosee?id='+id,

                });
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
                     content: '${ctx}/goUpdateemployeeInfo?id='+id,

                 });

            }else{
           	 layer.msg("请选中一条信息");
            }
        }


       


        function add(){
            layer.open({
                type: 2,
                shadeClose: true,
                shade: false,
                maxmin: true, //开启最大化最小化按钮
                title:" ",
                area: ['70%', '80%'],
                content: '${ctx}/goaddemployeeInfo',
            });
        }

        function info(){
            var checkStatus = table.checkStatus('tablelist');
            var data = checkStatus.data;
            if(data.length === 1){
                layer.open({
                    type: 2,
                    shadeClose: true,
                    shade: false,
                    maxMin: true, //开启最大化最小化按钮
                    title:" ",
                    area: ['70%', '80%'],
                    content: '${ctx}/info?id='+data[0].id
                });
            }else{
                layer.msg("请选择一条信息查看");
            }
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
        <a href="${ctx}/listemployeeInfo" id="listemployeeInfo" style="color: #7F7F7D;background:#FEFEFC;margin-left:4px;text-align:center;">职员信息管理</a>
        <a href="${ctx}/listattendanceManagement"  id="listattendanceManagement"  >考勤信息管理</a>
        
    </div>
    <div class="form_box">
            <P class="query_box">
            	<span style="margin-left:4px;white-space: nowrap;">
                      <label>姓名：</label>
		              <input type="text" id="name" name="name" class="" />&nbsp;&nbsp;
                  </span>

                  <span style="margin-left:4px;white-space: nowrap;">
                       <label>岗位：</label>
					   <input type="text" id="post" name="post" class="" />&nbsp;&nbsp;
                  </span>
                  &nbsp;&nbsp;&nbsp;&nbsp;
                <button class="layui-btn layui-btn-sm layui-btn-normal" onclick="productsearch(1,1,10);"
                        ><i class="layui-icon" style="font-size: 30px; color: #white;">&#xe615;</i>查询
                </button>
            </P>

        <P class="btn_box">
            <button class="layui-btn layui-btn-sm "  style="margin-left:10px;" data-type="add"><i
                    class="layui-icon" style="font-size: 30px; color: #white;">&#xe654;</i>新增
            </button>
            <button class="layui-btn layui-btn-sm " onclick="editSelect()"><i class="layui-icon"
                                                                                           style="font-size: 30px; color: #white;">&#xe642;</i>编辑
            </button>
           
            <button class="layui-btn layui-btn-sm layui-btn-warm" onclick="delSelect()"><i class="layui-icon"
                                                                                           style="font-size: 30px; color: #white;">&#xe638;</i>删除
            </button>
            
        </P>
        <table  class="layui-hide"  id="tablelist" lay-filter="test"></table>

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
	
	
//分类显示中文名称  

	
	</script>
</html>
