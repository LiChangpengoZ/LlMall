//订单的js
$(function() {
	var jsonstr=$("#jorderlist").text();
	var jorderlist=eval('('+jsonstr+')');
	loadorder(jorderlist);
	
})

//加载页面的方法，把订单的各个商品追加
function loadorder(jorderlist) {
	var o="";
	for (var i = 0; i < jorderlist.length; i++) {
		var products=jorderlist[i].productList;
		var p="";
		for (var j = 0; j < products.length; j++) {
			var url=products[j].url;
			var productname=products[j].productname;
			var money=products[j].money;
			var productNumber=products[j].productNumber;
			p+='<ul class="item-list" >'+
					'<li class="td td-item">'+
					'<div class="item-pic">'+
						'<a href="#" class="J_MakePoint">'+
							'<img width="80px" src="'+CONST.WEB_URL+url+'" class="itempic J_ItemImg">'+
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
						'<span>×</span>'+
						productNumber+
					'</div>'+
				'</li>'+
				'<li class="td td-operation">'+
					'<div class="item-operation">'+
					'</div>'+
				'</li>'+
			'</ul>';	
		}
		
		var code=jorderlist[i].code;
		var createtime=jorderlist[i].createtime;
		var money=jorderlist[i].money;
		
		o+='<div class="order-title">'+
				'<div class="dd-num">订单编号：<a href="javascript:;">'+code+'</a></div>'+
				'<span>成交时间：'+createtime+'</span>'+
				'<a style="float: right;margin-right: 26px;" href="'+CONST.WEB_URL+'/UserController/orderInfo.do?code='+code+'">订单详情</a>'+
			'</div>'+
			'<div class="order-content">'+
				'<div class="order-left">'+
				p+
				'</div>'+
				'<div class="order-right">'+
					'<ul>'+
					'<li class="td td-amount">'+
						'<div class="item-amount">'+
							'合计:'+money+'元'+
							'<p>含运费：<span>10.00</span></p>'+
						'</div>'+
					'</li>'+
					'</ul>'+
					'<div class="move-right">'+
						'<ul>'+
						'<li class="td td-status">'+
							'<div class="item-status">'+
								'<p class="Mystatus">交易成功</p>'+
							'</div>'+
						'</li>'+
						'<li class="td td-change">'+
							'<div  onclick="remove(\''+code+'\')" class="am-btn am-btn-danger anniu">'+
								'删除订单</div>'+
						'</li>'+
						'</ul>'+
					'</div>'+
				'</div>'+
			'</div>';
	}
	$("#orderlist").html(o);
}

//删除的方法
function remove(code) {
	var param=CONST.WEB_URL+"/UserController/removeOrder.do";
	$.ajax({
    url:param,
    type:"POST",
    data: {
    	code:code
    	},
    dataType:"text",
    contentType: 'application/x-www-form-urlencoded; charset=UTF-8',//防止乱码
    success:function(data){
    	location.reload(true)		
    }
});
	
	
	
}
