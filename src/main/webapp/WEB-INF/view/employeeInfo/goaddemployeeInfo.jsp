<%@ include file="../includes.jsp" %>
<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>人员信息管理系统</title>
    <style>
        /**treeselect*/
        .layui-form-select .layui-tree {
            display: none;
            position: absolute;
            left: 0;
            top: 42px;
            padding: 5px 0;
            z-index: 999;
            min-width: 100%;
            border: 1px solid #d2d2d2;
            max-height: 300px;
            overflow-y: auto;
            background-color: #fff;
            border-radius: 2px;
            box-shadow: 0 2px 4px rgba(0,0,0,.12);
            box-sizing: border-box;
        }
        .layui-form-selected .layui-tree {
            display: block;
        }
    </style>
    <script>
        layui.config({
            base: '${ctx}/static/js/lay/' //假设这是你存放拓展模块的根目录
        }).extend({ //设定模块别名
            mymod: 'treeselect' //如果 mymod.js 是在根目录，也可以不用设定别名
        });

        layui.use('laydate', function () {
            var laydate = layui.laydate;

            laydate.render({
                elem: '#brithday'
            });
            laydate.render({
                elem: '#completion_time'
            });

        });
        layui.use(['form', 'layedit', 'laydate'], function () {
            var form = layui.form
                , layer = layui.layer
                , layedit = layui.layedit
                , laydate = layui.laydate;

            //日期
            laydate.render({
                elem: '#date'
            });
            laydate.render({
                elem: '#date1'
            });

            var post = 0;  
            var postname = '';  
            form.on('select(level)', function (data) {  
            	post = data.value;  
                postname = data.elem[data.elem.selectedIndex].value;  
        		if(postname=='1'){
        		      $("#basicwages").val("5000");
        		}else if(postname=='2'){
        			  $("#basicwages").val("3000");
        		}else if(postname=='3'){
        			  $("#basicwages").val("2500");
        		}else if(postname=='4'){
        			  $("#basicwages").val("3200");
        		}else if(postname=='5'){
        			  $("#basicwages").val("3800");
        		}else if(postname=='6'){
        			  $("#basicwages").val("2000");
        		}
                form.render('select');   
            });  


            //自定义验证规则
            form.verify({
            	department: function (value) {
                    if (value.length < 1) {
                        return '部门不能为空啊';
                    }
                },
                name: function (value) {
                    if (value.length < 1) {
                        return '姓名不能为空啊';
                    }
                },
                password: function (value) {
                    if (value.length < 1) {
                        return '密码不能为空啊';
                    }
                }
                , pass: [/(.+){6,12}$/, '密码必须6到12位']
                , content: function (value) {
                    layedit.sync(editIndex);
                }
            });

            //监听提交
            form.on('submit(demo1)', function (data) {
                var jsondata = JSON.stringify(data.field);
                console.log(jsondata);
                var index = parent.layer.getFrameIndex(window.name);
                var param1 = $("#dbForm").serialize();
                var url = "${ctx}/doaddemployeeInfo?" + param1;
                var param1 = $("#dbForm").serialize();//序列化表单值，创建 URL 编码文本字符串。
                var param = jsondata;
                $.post(url, param, function (data) {
                    parent.layer.msg(data.msg);
                    parent.layer.close(index);
                }, "json");
                sleep(1000);
                parent.productsearch(1, 1, 10);
                return false;
            });


        });

        function sleep(numberMillis) {
            var now = new Date();
            var exitTime = now.getTime() + numberMillis;
            while (true) {
                now = new Date();
                if (now.getTime() > exitTime)
                    return;
            }
        }

       
        

    </script>
</head>

<body class="">
<fieldset class="layui-elem-field layui-field-title" style="margin: 20px;">
    <legend style="margin: 20px  auto  0  auto;">新增～职员信息管理</legend>
</fieldset>
<form class="layui-form" id="dbForm">
    <div style="width:60%;margin:20px  auto;border:0px solid #ccc;">
        <div class="layui-form-item">
            <label class="layui-form-label">
                <lable style="color:red">&nbsp;</lable>
              所属部门:</label>
            <div class="layui-input-block">
                <input type="text" name="department" lay-verify="department" id="department"  autocomplete="off"
                       placeholder="请输入所属部门"
                       class="layui-input">
            </div>
            <br/>
            <label class="layui-form-label">
                <lable style="color:red">&nbsp;</lable>
                密码:</label>
            <div class="layui-input-block">
                <input type="password" name="password" lay-verify="password" id="password" value="11111" autocomplete="off" placeholder="请输入密码"
                       class="layui-input">
            </div>
            <br/>
            <label class="layui-form-label">
                <lable style="color:red">&nbsp;</lable>
                岗位:</label>
            <div class="layui-input-block">
                <select name="post" id="post" lay-verify="required" lay-filter="level" lay-search="">
				      <option value="1">研发岗位</option>
				      <option value="2">测试岗位</option>
				      <option value="3">人事岗位</option>
				      <option value="4">行政岗位</option>
				      <option value="5">财务岗位</option>
				      <option value="6">其他岗位</option>
				      
         		</select>
            </div>
            <br/>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label"> 性别:</label>
                <div class="layui-input-block">
                    <input type="radio" name="sex" value="0" title="男" checked="">
                    <input type="radio" name="sex" value="1" title="女">
                </div>
            </div>

            <label class="layui-form-label">
                <lable style="color:red">&nbsp;</lable>
                基本工资:</label>
            <div class="layui-input-block">
                <input type="text" name="basicwages" readonly="readonly" id="basicwages" value="5000" autocomplete="off"
                       class="layui-input">
            </div>
            <br/>
            <label class="layui-form-label">
                <lable style="color:red">&nbsp;</lable>
               姓名:</label>
            <div class="layui-input-block">
                <input type="text" name="name" id="name" lay-verify="name" onchange="judgename()" autocomplete="off" placeholder="请输入姓名"
                       class="layui-input">
            </div>
            <br/>

            <!-- <label class="layui-form-label">
                <lable style="color:red">&nbsp;</lable>
                浮动奖金:</label>
            <div class="layui-input-block">
                <input type="text" name="floatingbonus" id="floatingbonus" autocomplete="off" placeholder="请输入浮动奖金"
                       class="layui-input">
            </div>
            <br/> -->
            <br/>
            <label class="layui-form-label">
                <lable style="color:red">&nbsp;</lable>
                出生日期:</label>
            <div class="layui-input-block">
                <input type="text" name="brithday" id="brithday" lay-verify="date" placeholder="请输入出生日期"
                       autocomplete="off"
                       class="layui-input">
            </div>
            <br/>
            
            <label class="layui-form-label">
                <lable style="color:red">&nbsp;</lable>
                政治面貌:</label>
            <div class="layui-input-block">
                 <select name="politicalaspects" id="politicalaspects" lay-verify="required" lay-search="">
				      <option value="中共党员">中共党员</option>
				      <option value="国民党员">国民党员</option>
				      <option value="其他政党">其他政党</option>
				      <option value="群众">群众</option>
         		</select>
            </div>
           
           
            <br/>
        

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </div>
    </div>
</form>
<script>
	function judgename(){
		var name = $("#name").val();
		$.ajax({
				url:"${ctx}/judgenameemployeeInfo",
				data:{name:name},
				success:function(data){
					if(data.code==0){
                    	parent.layer.msg(data.msg);
					}else{
						parent.layer.msg(data.msg);
					}
				}
			})
	}
</script>
</body>
</html>
