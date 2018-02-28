//订单详情的js
$(function() {
	var jsonstr=$("#jorderlist1").text();
	var jorderlist=eval('('+jsonstr+')');
	loadorder(jorderlist);
	
})

//加载页面的方法，把订单的各个商品追加
function loadorder(jorderlist) {
		var o="";
		var p="";
		var code="";
		var money="";
		for (var j = 0; j < jorderlist.length; j++) {
			var url=jorderlist[j].purl;
			var productname=jorderlist[j].pproductname;
			var money=jorderlist[j].pmoney;
			var productNumber=jorderlist[j].oapnumber;
			money=jorderlist[j].omoney;
			code=jorderlist[j].ocode;
			var pmoney=jorderlist[j].pmoney;
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
					pmoney+
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
		
		o+='<div class="order-title">'+
				'<div class="dd-num">订单编号：<a href="javascript:;">'+code+'</a></div>'+
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
		$("#orderlist").html(o);
	}

