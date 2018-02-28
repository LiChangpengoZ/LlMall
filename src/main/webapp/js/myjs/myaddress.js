//地址的js
$(function() {
	var jaddress=$("#jaddress").text();
	var jaddress=eval('('+jaddress+')');
	loadssq("0000","sheng");	
	arshow(jaddress);
})

//显示地址的方法
function arshow(jaddress){
	var a="";
	//code,full,qu,recipe,sheng,shi,telephone,usercode
	var usercode=""+jaddress[0].usercode;
	for (var i = 0; i < jaddress.length; i++) {
		var code=jaddress[i].code;
		var recipe=jaddress[i].recipe;
		var sheng=jaddress[i].sheng;
		var shi=jaddress[i].shi;
		var qu=jaddress[i].qu;
		var full=jaddress[i].full;
		var telephone=jaddress[i].telephone;
		
		a+='<li id="li'+code+'" class="user-addresslist">'+
				'<p class="new-tit new-p-re">'+
					'<span id="recipe'+code+'" class="new-txt">'+recipe+'</span>'+
					'<span id="telephone'+code+'" class="new-txt-rd2">'+telephone+'</span>'+
				'</p>'+
				'<div class="new-mu_l2a new-p-re">'+
					'<p class="new-mu_l2cw">'+
						'<span class="title">地址：</span>'+
						'<span id="sheng'+code+'" class="province">'+sheng+'</span>'+
						'<span id="shi'+code+'" class="city">'+shi+'</span>'+
						'<span id="qu'+code+'" class="dist">'+qu+'</span>'+
						'<span id="full'+code+'" class="street">'+full+'</span>'+
					'</p>'+
				'</div>'+
				'<div class="new-addr-btn">'+
					'<a href="javascript:up(\''+code+'\')" class="createAddr theme-login tc-btn"><i class="am-icon-edit"></i >编辑</a>'+
					'<span class="new-addr-bar">|</span>'+
					'<a href="javascript:remove(\''+code+'\');" onclick="delClick(this);"><i class="am-icon-trash"></i>删除</a>'+
				'</div>'+
			'</li>';
		$("#addresslist").html(a);
	}
}
var thiscode;			//定义全局的变量，获取code

//修改的方法，获取当前商品的信息，赋值给修改页面
function up(code) {
	thiscode=code;
	var recipe=$("#recipe"+code).text();
	var telephone=$("#telephone"+code).text();
	$("#uprecipe").val(recipe);
	$("#uptelephone").val(telephone);
}

//删除的方法
function remove(code) {
	var param=CONST.WEB_URL+"/UserController/removeAr.do";
	$.ajax({
	    url:param,
	    type:"POST",
	    data: {
	    	code:code
	    	},
	    dataType:"text",
	    contentType: 'application/x-www-form-urlencoded; charset=UTF-8',//防止乱码
	    success:function(data){
	    	$("#li"+code).remove();
	    }
	});
}

//查询省市区，传入一个父code和省还是市还是区
function loadssq(parentcode,ssq) {
	var param=CONST.WEB_URL+"/UserController/loadssq.do";
	$.ajax({
	    url:param,
	    type:"POST",
	    data: {
	    	parentcode:parentcode
	    	},
	    dataType:"json",
	    contentType: 'application/x-www-form-urlencoded; charset=UTF-8',//防止乱码
	    success:function(data){
	    	if("sheng"==ssq){
	    		loadsheng(data);
	    	}
	    	if("shi"==ssq){
	    		loadshi(data);
	    	}
	    	if("qu"==ssq){
	    		loadqu(data);
	    	}
	    }
	});
}

//加载省
function loadsheng(data) {
	var sheng='<option value="sheng" selected="selected"  >请选择--</option>';
	for (var i = 0; i < data.length; i++) {
		var name=data[i].name;
		var code=data[i].code;
		var parentcode=data[i].parentcode;
		
		sheng+='<option value="'+code+'">'+name+'</option>';	
	}
	$("select[name=sheng]").html(sheng);	
}

//加载市
function loadshi(data) {
	var shi='<option value="shi" selected="selected"  >请选择--</option>';
	for (var i = 0; i < data.length; i++) {
		var name=data[i].name;
		var code=data[i].code;
		var parentcode=data[i].parentcode;
		shi+='<option value="'+code+'">'+name+'</option>';	
	}
	$("select[name=shi]").html(shi);	
}

//加载区
function loadqu(data) {
	var qu='<option value="qu" selected="selected"  >请选择--</option>';
	for (var i = 0; i < data.length; i++) {
		var name=data[i].name;
		var code=data[i].code;
		var parentcode=data[i].parentcode;
		qu+='<option value="'+code+'">'+name+'</option>';	
	}
	$("select[name=qu]").html(qu);	
}

//修改的方法
function updatear() {
	var recipe =$("#uprecipe").val();
	var telephone=$("#uptelephone").val();
	var sheng=$("#upsheng").val();
	var shi=$("#upshi").val();
	var qu=$("#upqu").val();
	var full=$("#upfull").val();
	var code=thiscode;
	var param=CONST.WEB_URL+"/UserController/updateAr.do";
	$.ajax({
	    url:param,
	    type:"POST",
	    data: {
	    	recipe:recipe,
	    	telephone:telephone,
	    	sheng:sheng,
	    	shi:shi,
	    	qu:qu,
	    	code:code,
	    	full:full
	    	},
	    dataType:"text",
	    contentType: 'application/x-www-form-urlencoded; charset=UTF-8',//防止乱码
	    success:function(data){
	    	location.reload(true)
	    }
	});
	
}

//省市区的下拉框的改变的方法
function sechange(ssq) {
	if("sheng"==ssq){
		var parentcode =$("#sheng").val();
		loadssq(parentcode,"shi")
	}
	if("shi"==ssq){
		var parentcode =$("#shi").val();
		loadssq(parentcode,"qu")
	}
	if("qu"==ssq){
		var parentcode =$("#sheng").val();
	}
	if("upsheng"==ssq){
		var parentcode =$("#upsheng").val();
		loadssq(parentcode,"shi")
	}
	if("upshi"==ssq){
		var parentcode =$("#upshi").val();
		loadssq(parentcode,"qu")
	}
	if("upqu"==ssq){
		var parentcode =$("#upsheng").val();
	}
}

//判断输入的PHONE格式是否正确    
function IsPhone()     
{     
    var str = $("#user-phone").val();    
    if(str.length!=0){    
	    reg=/^1[3578]\d{9}$/; 
	    if(!reg.test(str)){    
	    	$("#user-phone").css({border: "1px solid red"});
	    	$("#submit").attr("disabled","disabled");
	    }else{
	    	$("#user-phone").css({border: "1px solid #ccc"});
	    	$("#submit").removeAttr("disabled")
	    }    
    }    
}  
