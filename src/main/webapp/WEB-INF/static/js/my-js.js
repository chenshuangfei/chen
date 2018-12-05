//  单选方法：返回   true   or    false
  function checkOne(tableId){
	  var i=$('#'+tableId+' input:checkbox:checked').length;
	  if(i!=1){
		  return false;
	  }else{
		  return true;
	  }
  }
//多选方法：返回   true   or    false
  function checkMany(tableId){
	  var i=$('#'+tableId+' input:checkbox:checked').length;
	  if(i>0){
		  return true;
	  }else{
		  return false;
	  }
  }  
//选择一条并返回值
  function checkOneValue(tableId){
	  var i=$('#'+tableId+' input:checkbox:checked').length;
	  var value;
	  if(i==1){
		  $.each($('#'+tableId+' input:checkbox:checked'),function(){
              value=$(this).val();  
          });
		  return value;
	  }else{
		  layer.msg("请选择一条数据!");
		  return;
	  }
  }
  //删除
  function deleteObj(tableId,url){
	  var ids=[];
	  $.each($('#'+tableId+' input:checkbox:checked'),function(){
          ids.push($(this).val());  
      });
	  if(ids.length==0){
		  return;
	  }
	  $.ajax({
		    type: "POST",
		    url: url,
		    data: {"ids":ids},
		    dataType:"json",
		    success: function(data) {
		    	if(data['msgcode']==0){
		    		layer.msg(data['msg']);
		    		setTimeout(function (){location.reload();},1000);
		    	}else{
		    		layer.msg(data['msg']);
		    	}
		    }
	  }); 
  }
  //重置form
//初始化form
  function resetForm(formId){
	  $("#"+formId+" :input[type='text']").val("");  
	  $("#"+formId+" :input[type='hidden']").val("");
	  $("#"+formId+" :input[type='password']").val(""); 
	  $("#"+formId+" :input[type='date']").val(""); 
	  $("#"+formId+" textarea").text(""); 
      $("#"+formId+" :input").removeAttr("checked").remove("selected"); 
  }
  //时间转换
  function todate(d){
	  if(d==null){
		  return "";
	  }
	  var date = new Date(d);
	  var month = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1) : date.getMonth() + 1;
	  var currentDate = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();
	  var str = date.getFullYear()
	    + "-"
	    + month
	    + "-"
	    + currentDate;
	  return str;
}
  
  //行业分类 石化、钢铁、新型电子信息、绿色智能汽车、高端智能装备、生物医药与节能环保新材料、未来产业
  function changetype(){
		var type=$("#change_producttype :checked").val();
		var str="";
		if(type=="石化"){
			str='<option>石化</option>';
		}else if(type=="钢铁"){
			str='<option>钢铁</option>';
		}else if(type=="新型电子信息"){
			str='<option>新型显示</option><option>集成电路</option><option>信息通信</option>';
		}else if(type=="绿色智能汽车"){
			str='<option>新能源汽车</option><option>智能网联汽车</option>';
		}else if(type=="高端智能装备"){
			str='<option>智能制造</option><option>智能电网</option><option>轨道交通</option><option>航空航天</option>';
		}else if(type=="生物医药与节能环保新材料"){
			str='<option>生物医药</option><option>节能环保</option><option>新材料</option>';
		}else if(type=="未来产业"){
			str='<option>人工智能</option><option>未来网络</option><option>增材制造</option><option>前沿新材料</option>';
		}
		$("#change_type").empty();
		$("#change_type").append("<option value=''>-产业分类-</option>");
		$("#change_type").append(str);
	}

