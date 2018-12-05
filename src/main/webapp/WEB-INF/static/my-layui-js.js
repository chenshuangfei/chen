/**
 * 页面功能：  增 改 删  详情 重载 模板下载  数据下载  上传
 * 
 * layui_table：   表格初始化唯一标示
 * upload_btn：	   上传按钮id
 * query_form：	   查询参数form
 */


var sys_layer;
var table;
var upload;
var $;
layui.use(['table','layer','upload','form'], function(){
			table = layui.table;
			sys_layer = layui.layer;
			upload = layui.upload;
			$ = layui.jquery;
			var form = layui.form; //只有执行了这一步，部分表单元素才会自动修饰成功
			form.render(null,'form-filter');
		/*	layer.config({
					extend:'myskin/myskin.css',
					skin:'layer-ext-yourskin'
			  })*/
			$('.layui-btn').on('click', function(){
				    var type = $(this).data('type');
				    var url = $(this).data('url');
				    if(type=="add"){
				    	add(url);
				    }else if(type=="upd"){
				    	upd(url);
				    }else if(type=="del"){
				    	del(url);
				    }else if(type=="view"){
				    	view(url);
				    }else if(type=="reload"){
				    	reloadTable();
				    }else if(type=="downLoadModel"){
				    	downLoadModel(url);
				    }else if(type=="downLoadData"){
				    	downLoadData(url);
				    }
			 });
			//上传接口
			upload.render({
			    elem: '#upload_btn' //绑定元素
			    ,url:  $('#upload_btn').data('url') //上传接口
			    ,accept: 'file'
			    ,exts:	'xls|xlsx'
			    ,done: function(data){
			      //上传完毕回调
			    	if(data['msgcode']==0){
						table.reload('layui_table', {
					        page: {
					          curr: 1 //重新从第 1 页开始
					        }
					        ,where:  getFormData("query_form")
					      });
					}
					sys_layer.msg(data['msg']);
			    }
			    ,error: function(){
			      //请求异常回调
			    	sys_layer.msg('未知异常!');
			    }
			  });
 }); 
 
 //获取form参数转为json格式	
 function getFormData(formid){
	 var data={};
	 var form = $("#"+formid).serialize(); 
	 if(form!=null&&form!=""){
		 var params=form.split("&");
		 for(var param in params){
			 if(params[param]!=""){
				 var j=params[param].split("=");
				 if(j.length==2){
					 data[j[0]]=j[1];
				 }
			 }
		 }
	 }
	console.info(data);
	return data; 
 }
 
 function add(url){
	 layer.open({
		    type: 2,
		    title: '&nbsp;',
		    maxmin: true,
		    area:  ['1000px', '600px'],
		    content: url,
		    end: function(){
		    	
		    },
		    btn:['确定','关闭'],
		    yes:function (index, layero){
		    	var form = layero.find("iframe")[0].contentWindow.document.getElementsByTagName("form")[0];
				var url=$(form).attr("action");
				$.ajax({
					url:url,
					data:$(form).serialize(),
					success:function(data){
						layer.close(index);
						if(data['msgcode']==0){
							table.reload('layui_table', {
						        page: {
						          curr: 1 //重新从第 1 页开始
						        }
						        ,where:  getFormData("query_form")
						      });
						}
						layer.msg(data['msg']);
					}
				})
		    },
		    btn2:function(index, layero){
		    	layer.close(index);
		    }
		 });
 }
 
 function upd(url){
	var data=$('#current_tbody input[type=checkbox]:checked');
 	if(data.length==1){
 		var id=$(data[0]).val();
 		sys_layer.open({
 		    type: 2,
 		    title: '&nbsp;',
 		    maxmin: true,
 		    area: ['1000px', '600px'],
 		    content: url+'?id='+id,
 		    end: function(){
 		    	
 		    },
 		    btn:['确定','关闭'],
 		    yes:function (index, layero){
 		    	var form = layero.find("iframe")[0].contentWindow.document.getElementsByTagName("form")[0];
 				var url=$(form).attr("action");
 				$.ajax({
 					url:url,
 					data:$(form).serialize(),
 					success:function(data){
 						layer.close(index);
 						if(data['msgcode']==0){
 							table.reload('layui_table', {
 						        page: {
 						          curr: 1 //重新从第 1 页开始
 						        }
 						        ,where:  getFormData("query_form")
 						      });
 						}
 						layer.msg(data['msg']);
 					}
 				})
 		    },
 		    btn2:function(index, layero){
 		    	layer.close(index);
 		    }
 		 });
 	}else{
 		layer.msg('请选择一条记录');
 	}
 }
 
 function del(url){
	 var data=$('#current_tbody input[type=checkbox]:checked');
	 if(data.length==0){
		 layer.msg('请选择需要删除的项目');
	 }else{
		 var ids=[];
		 $.each($('#current_table input:checkbox:checked'),function(){
				ids.push($(this).val());
         });
		 sys_layer.confirm('提示:确定删除选项?', {icon: 3, title:'&nbsp;'}, function(index){
			  sys_layer.close(index);
			  $.ajax({
					url:url,
					data:{ids:ids},
					success:function(data){
						if(data['msgcode']==0){
							table.reload('layui_table', {
						        page: {
						          curr: 1 //重新从第 1 页开始
						        }
						        ,where:  getFormData("query_form")
						      });
						}
						sys_layer.msg(data['msg']);
					}
				})
			});
	 }
 }
 function view(url){
	var data=$('#current_tbody  input[type=checkbox]:checked');
 	if(data.length==1){
 		var id=$(data[0]).val();
 		sys_layer.open({
 		    type: 2,
 		    title: '&nbsp;',
		
 		    maxmin: true,
 		    area:  ['1000px', '600px'],
 		    content: url+'?id='+id,
 		    end: function(){
 		    	
 		    },
 		    btn:['关闭'],
 		    yes:function(index, layero){
 		    	layer.close(index);
 		    }
 		 });
 	}else{
 		layer.msg('请选择一条记录');
 	}
 }
 function reloadTable(){
     table.reload('layui_table', {
       page: {
         curr: 1 //重新从第 1 页开始
       }
       ,where:  getFormData("query_form")
     });
  }
 function downLoadModel(url){  
             location.href = url;
 }
 function downLoadData(url){  
	 var param = $("#query_form").serialize();
     location.href = url+"?"+param;
 }
 //测试
 function getCheckedLength(){
		$.each($('#current_tbody input:checkbox:checked'),function(){
                window.alert("你选了："+
                    $('input[type=checkbox]:checked').length+"个，其中有："+$(this).val());
        });
 }
 function chooseAll(){
        var l=$('#current_tbody input[type=checkbox]:checked').length;
		if(l!=0){
				$('#current_tbody input[type=checkbox]:checked').click();
		}else{
				$('#current_tbody input[type=checkbox]').click();
		}
 }
 