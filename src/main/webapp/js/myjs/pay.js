//支付页面的js
$(function() {
	$("#hid").hide();
	//把地址的json传给方法
	var jaddress=$("#jaddress").text();
	var jaddress=eval('('+jaddress+')');
	showadd(jaddress);
	//把商品的json传给方法	
	var jproduct=$("#jproduct").text();
	var jproduct=eval('('+jproduct+')');
	showpro(jproduct);
})

//加载地址
function showadd(jaddress) {
	var a='';
	for (var i = 0; i < jaddress.length; i++) {
		var code=jaddress[i].code;
		var sheng=jaddress[i].sheng;
		var shi=jaddress[i].shi;
		var qu=jaddress[i].qu;
		var full=jaddress[i].full;
		var recipe=jaddress[i].recipe;
		var telephone=jaddress[i].telephone;
		
		a+='<li class="user-addresslist" onclick="xz('+i+')" >'+
				'<div class="address-left" >'+
					'<div class="user DefaultAddr">'+
						'<span class="buy-address-detail">'+   
						'<span class="buy-user">'+recipe+'</span><br/>'+
						'<span class="buy-phone">'+telephone+'</span>'+
						'</span>'+
					'</div>'+
					'<div class="default-address DefaultAddr">'+
						'<span class="buy-line-title buy-line-title-type">收货地址：</span><br/>'+
						'<span class="buy--address-detail">'+
				 		'<span class="province">'+sheng+'</span>'+
						'<span class="city">'+shi+'</span>'+
						'<span class="dist">'+qu+'</span>'+
						'<span class="street">'+full+'</span>'+
						'</span>'+
					'</div>'+
				'</div>'+								
				'<div class="clear"></div>'+
			'</li>';
	}
	$("#address").html(a);
	
}

var allmoney=0;			//总钱数

//加载商品
function showpro(jproduct) {
	var s="";
	var usercode=jproduct[0].usercode;
	$("#usercode").val(usercode);
	var productcodes="";
	for (var i = 0; i < jproduct.length; i++) {
		var number=jproduct[i].number;
		var onemoney=jproduct[i].onemoney;
		var pmoney=jproduct[i].pmoney;
		var pproductname=jproduct[i].pproductname;
		var productcode=jproduct[i].productcode;
		var purl=jproduct[i].purl;
		
		productcodes=productcodes+productcode+",";
//		allmoney=(allmoney*100+parseFloat(pmoney)*100)/100;
		allmoney+=parseFloat(onemoney);
		s+='<ul class="item-content clearfix">'+
			'<div class="pay-phone">'+
		'<li class="td td-item">'+
			'<div class="item-pic">'+
				'<a href="#" class="J_MakePoint">'+
					'<img style="width: 80px;height: 80px;" src="'+CONST.WEB_URL+purl+'" class="itempic J_ItemImg"></a>'+
			'</div>'+
			'<div class="item-info">'+
				'<div class="item-basic-info">'+
					'<a href="#" class="item-title J_MakePoint" data-point="tbcart.8.11">'+pproductname+'</a>'+
				'</div>'+
			'</div>'+
		'</li>'+		
		'<li class="td td-price">'+
			'<div class="item-price price-promo-promo">'+
				'<div class="price-content">'+
					'<em class="J_Price price-now">'+pmoney+'</em>'+
				'</div>'+
			'</div>'+
		'</li>'+
	'</div>'+
	'<li class="td td-amount">'+
		'<div class="amount-wrapper ">'+
			'<div class="item-amount ">'+
				'<span class="phone-title">购买数量</span>'+
				'<div class="sl">'+
					'<input class="text_box" name="" type="text" value="'+number+'" style="width:30px;border: 0px;" />'+
				'</div>'+
			'</div>'+
		'</div>'+
	'</li>'+
	'<li class="td td-sum">'+
		'<div class="td-inner">'+
			'<em tabindex="0" class="J_ItemSum number">'+onemoney+'</em>'+
		'</div>'+
	'</li>'+
	'</ul>'+
	'<div class="clear"></div>';
		
		$("#prodectlist").html(s);			
	}
	$("#productcode").val(productcodes);
	$("#number").val(jproduct.length);
	$("#money").val(allmoney);
	
}

//选择某个地址的方法，把要选择的地址的信息获取到，赋值给显示的
function xz(i) {
	$("#hid").show();
	$("#J_ActualFee").text(allmoney);
	var jaddress=$("#jaddress").text();
	var jaddress=eval('('+jaddress+')');
	var jproduct=$("#jproduct").text();
	var jproduct=eval('('+jproduct+')');
	$("#addresscode").val(jaddress[i].code);
	var sheng=jaddress[i].sheng;
	var shi=jaddress[i].shi;
	var qu=jaddress[i].qu;
	var full=jaddress[i].full;
	var recipe=jaddress[i].recipe;
	var telephone=jaddress[i].telephone;
	
	$("#sheng").text(sheng);
	$("#shi").text(shi);
	$("#qu").text(qu);
	$("#full").text(full);
	$("#recipe").text(recipe);
	$("#telephone").text(telephone);
	
}



