//卖家的商品管理页面
$(function() {
	var jsonstr=$("#sellerproduct").text();
	var sellerproduct=eval('('+jsonstr+')');
	load(sellerproduct);
	
	var jsonstr1=$("#jonetypelist").text();
	var jonetypelist=eval('('+jsonstr1+')');
	loadone(jonetypelist);
	
})

//加载一级分类
function loadone(jonetypelist) {
	var one='<option value="sheng" selected="selected"  >请选择--</option>';
	for (var i = 0; i < jonetypelist.length; i++) {
		var code=jonetypelist[i].code;
		var typename=jonetypelist[i].typename;
		one+='<option value="'+code+'">'+typename+'</option>';
	}
	$("select[name=one]").html(one);
}

//加载产品
function load(sellerproduct) {
	var sp="";
	for (var i = 0; i < sellerproduct.length; i++) {
		var code=sellerproduct[i].code;
		var createtime=sellerproduct[i].createtime
		var money=sellerproduct[i].money
		var number=sellerproduct[i].number
		var productname=sellerproduct[i].productname
		var url=sellerproduct[i].url
		
		sp+='<div class="order-status5">'+
				'<div class="order-title">'+
				'<div class="dd-num">产品编号：<a href="javascript:;">'+code+'</a></div>'+
				'<span>上传时间：'+createtime+'</span>'+
			'</div>'+
			'<div class="order-content">'+
				'<div class="order-left">'+
					'<ul class="item-list">'+
						'<li class="td td-item">'+
							'<div class="item-pic">'+
								'<a href="#" class="J_MakePoint">'+
									'<img width="100%" src="'+CONST.WEB_URL+url+'" class="itempic J_ItemImg">'+
								'</a>'+
							'</div>'+
							'<div class="item-info">'+
								'<div class="item-basic-info">'+
									'<a href="#">'+
										'<font>'+productname+'</font>'+
									'</a>'+
								'</div>'+
							'</div>'+
						'</li>'+
						'<li class="td td-price">'+
							'<div class="item-price">'+
								money+
							'</div>'+
						'</li>'+
						'<li class="td td-number">'+
							'<div class="item-number">'+
								'<span></span>'+number+
							'</div>'+
						'</li>'+
						'<li class="td td-operation" onclick="update(\''+i+'\')"><a  href="#tab3">'+
							'<div  class="am-btn am-btn-danger anniu" style="margin-top: 13px;">'+
						'修改商品</div>'+
						'</a></li>'+
					'</ul>'+
				'</div>'+
				'<div class="order-right">'+
					'<div class="move-right">'+
						'<ul>'+
						'<li class="td td-status">'+
							'<div class="item-status">'+
							'</div>'+
						'</li>'+
						'<li class="td td-change">'+
							'<div class="am-btn am-btn-danger anniu">'+
								'删除商品</div>'+
						'</li>'+
						'</ul>'+
					'</div>'+
				'</div>'+
			'</div>'+
		'</div>';
	}
	$("#productlist").html(sp);
	$("#tab2").hide();
	$("#tab3").hide();
}

//点击增加商品的超链接
function changehid2() {
	if('none'==$("#tab2").css('display')){
		$("#tab2").show();		
	}
	if('block'==$("#tab3").css('display')){		
		$("#tab3").hide();
	}
	if('block'==$("#tab1").css('display')){		
		$("#tab1").hide();
	}
}

//全部商品的超链接
function changehid() {
	if('none'==$("#tab1").css('display')){
		$("#tab1").show();		
	}
	if('block'==$("#tab2").css('display')){		
		$("#tab2").hide();
	}
	if('block'==$("#tab3").css('display')){		
		$("#tab3").hide();
	}
}

//修改商品的超链接
function update(i) {

	//把通过全局的对象获取
	var jsonstr=$("#sellerproduct").text();
	var sellerproduct=eval('('+jsonstr+')');
	var money=sellerproduct[i].money;
	var number=sellerproduct[i].number;
	var code=sellerproduct[i].code;
	var productname=sellerproduct[i].productname;
	$("#upname").val(productname);
	$("#upmoney").val(money);
	$("#upnumber").val(number);
	$("#code").val(code);
	
	//得给第三个tab追加这两个类，不然 不显示
	$("#tab3").addClass("am-active am-in");
	if('none'==$("#tab3").css('display')){
		$("#tab3").show();		
	}
	if('block'==$("#tab1").css('display')){		
		$("#tab1").hide();
	}
	if('block'==$("#tab2").css('display')){		
		$("#tab2").hide();
	}
	
}

//加载二级的ajax
function onechange(temp) {
	var one="";
	if("inone"==temp){
		one=$("#inone").val();
	}
	if("upone"==temp){
		one=$("#upone").val();
	}
	
	var param=CONST.WEB_URL+"/ProductController/loadTwo.do";
	$.ajax({
	    url:param,
	    type:"POST",
	    data: {
	    	code:one
	    	},
	    dataType:"json",
	    contentType: 'application/x-www-form-urlencoded; charset=UTF-8',//防止乱码
	    success:function(data){
	    	loadtwo(data,temp);	
	    }
	});
}

//加载二级分类的具体追加
function loadtwo(twolist,temp) {
	var two='<option value="two" selected="selected"  >请选择--</option>';
	for (var i = 0; i < twolist.length; i++) {
		var typename=twolist[i].typename;
		var code=twolist[i].code;		
		two+='<option value="'+code+'">'+typename+'</option>';	
	}
	if("inone"==temp){
		$("#intwo").html(two);
	}
	if("upone"==temp){
		$("#uptwo").html(two);
	}
	
	
}
