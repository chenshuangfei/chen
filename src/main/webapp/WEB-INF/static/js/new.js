var oAdd=document.getElementById("addNew");
var oAddSj=document.getElementById("addSj");
var oAd=document.getElementById("add");
var oAd1=document.getElementById("add1");//录入数据
var oAd2=document.getElementById("add2");//录入用电量
var oSp1=document.getElementById("sp1");
var oSp2=document.getElementById("sp2");
var oMask=document.getElementById("mask");//获取遮罩层遮罩层
var oBtn=document.getElementById("btn");
var oYdl=document.getElementById("ydl");//获取用电量按钮
	function mask(){
		oMask.style.display="block";
		};
	function mask1(){
		oMask.style.display="none";
		};
	oAdd.onclick=function(){
		mask();
		oAd.style.display="block";
		
		}
	oAddSj.onclick=function(){
		mask();
		oAd.style.display="none";
		oAd1.style.display="block";
		};
	oYdl.onclick=function(){
		oAd2.style.display="block";
		oAd1.style.display="none";
		};
	oSp1.onclick=function(){
		oMask.style.display="none";
		}
	oSp2.onclick=function(){
		oMask.style.display="none";
		}

	oBtn.onclick=function(){
		oMask.style.display="none";
		}

