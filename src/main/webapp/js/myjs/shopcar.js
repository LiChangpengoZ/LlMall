//购物车的js
$(function() {
	var jsonstr=$("#shopcarbox").text();
	var shopcar=eval('('+jsonstr+')');
	show(shopcar);
})

var allmoney=0;		//所有的钱
var listcount=0;	//选中几个
var procount=0;		//有多少商品

//全选按钮，因为全选用的onclick，需要计数
function allxz() {
	if($('#J_SelectAllCbx2').is(':checked')){
		listcount=procount;		
		$("input[type='checkbox']").each(function(index,dom){
			$(this).prop("checked",true);
		})
	}else{
		listcount=0;
		$("input[type='checkbox']").each(function(index,dom){
			$(this).removeAttr("checked");
		})
	}
	$("#J_SelectedItemsCount").text(listcount);
	//遍历所有的商品，把他们的价钱加起来
	allmoney=0;
	for (var i = 0; i < procount; i++) {
		if(($('.check'+i).is(':checked'))) {
			var onemoney=$(".onemoney"+i).text();
//			allmoney=(allmoney+parseFloat(onemoney)).toFixed(2);
			allmoney=((allmoney*100+parseFloat(onemoney)*100)/100).toFixed(2);
		}
	}
	$("#J_Total").text(allmoney)
	
}

//增加减少或者删除的ajax
function actions(actions,usercode,productcode) {
	var param=CONST.WEB_URL+"/OrderController/showShopCarAjax.do";
		$.ajax({
        url:param,
        type:"POST",
        data: {
        	actions:actions,
        	usercode:usercode,
        	productcode:productcode
        	},
        dataType:"json",
        contentType: 'application/x-www-form-urlencoded; charset=UTF-8',//防止乱码
        success:function(data){
        	showajax(data,productcode,actions)		
        }
    });
}

var temp=1;
//增加减少或者删除的具体实现
function showajax(shopcar,productcode,actions) {
	if("delete"==actions){
		var onemoney=$("#onemoney"+productcode).text();
		allmoney=((allmoney*100-parseFloat(onemoney)*100)/100).toFixed(2);
		$("#J_Total").text(allmoney);
		$("#ul"+productcode).remove();
		procount=procount-1;
		
	}
	//定义temp，如果商品数是1的话，temp就-1=0，下次点击就会删除该商品，因为商品的数量=0娶不到，或者刷新页面的话多选框会失效
	if(temp==0){
		var pmoney=$("#pmoney"+productcode).text();
		allmoney=((allmoney*100-parseFloat(pmoney)*100)/100).toFixed(2);
		$("#J_Total").text(allmoney);
		$("#ul"+productcode).remove();
		temp=1;
	}
	var number=shopcar[0].number;
	var onemoney=shopcar[0].onemoney;
	if(number==1){
		temp-=1;
	}
	$("#number"+productcode).val(number);
	$("#onemoney"+productcode).text(onemoney);
	//在被选中的前提下，增加和减少才会改变钱
	if($('#check'+productcode).is(':checked')) {
		var pmoney=$("#pmoney"+productcode).text();
		if ("add"==actions) {
//			allmoney=(allmoney+parseFloat(pmoney)).toFixed(2);
			allmoney=((allmoney*100+parseFloat(pmoney)*100)/100).toFixed(2);
			$("#J_Total").text(allmoney);
		}
		if ("sub"==actions) {
//			allmoney=(allmoney-parseFloat(pmoney)).toFixed(2);
			allmoney=((allmoney*100-parseFloat(pmoney)*100)/100).toFixed(2);
			$("#J_Total").text(allmoney);
		}
		
	}

}

//多选按钮的change事件，在选中的前提下，对总钱数的显示进行修改
function mychange(productcode) {
	if($('#J_SelectAllCbx2').is(':checked')) {
		$('#J_SelectAllCbx2').removeAttr("checked");
	}
	if($('#check'+productcode).is(':checked')) {
		var onemoney=$("#onemoney"+productcode).text();
//		allmoney=(allmoney+parseFloat(onemoney)).toFixed(2);
		allmoney=((allmoney*100+parseFloat(onemoney)*100)/100).toFixed(2);
		$("#J_Total").text(allmoney)
		listcount=listcount+1;
		$("#J_SelectedItemsCount").text(listcount);
	}
	if(!($('#check'+productcode).is(':checked'))) {
		var onemoney=$("#onemoney"+productcode).text();
//		allmoney=(allmoney-parseFloat(onemoney)).toFixed(2);
		allmoney=((allmoney*100-parseFloat(onemoney)*100)/100).toFixed(2);
		$("#J_Total").text(allmoney)
		listcount=listcount-1;
		$("#J_SelectedItemsCount").text(listcount);
	}
}

//加载各种商品的方法
function show(shopcar) {
	var s="";
	procount=shopcar.length;
//	id, usercode, productcode, number,pproductname,pmoney,purl
	for (var i = 0; i < shopcar.length; i++) {
		var number=shopcar[i].number;
		var usercode=shopcar[i].usercode;
		var productcode=shopcar[i].productcode;
		var pproductname=shopcar[i].pproductname;
		var pmoney=shopcar[i].pmoney;
		var purl=shopcar[i].purl;
		var onemoney=shopcar[i].onemoney;
		s+='<ul id="ul'+productcode+'" class="item-content clearfix">'+
			'<li class="td td-chk">'+
			'<div class="cart-checkbox ">'+
				'<input onchange="mychange(\''+productcode+'\')" id="check'+productcode+'" class="check'+i+'" name="xz" value="'+productcode+'" type="checkbox">'+
			'</div>'+
			'</li>'+
			'<li class="td td-item">'+
				'<div class="item-pic">'+
					'<a  class="J_MakePoint" data-point="tbcart.8.12">'+
						'<img style="width: 80px;height: 80px;" src="'+CONST.WEB_URL+purl+'" class="itempic J_ItemImg"></a>'+
				'</div>'+
				'<div class="item-info">'+
					'<div class="item-basic-info">'+
						'<a  class="item-title J_MakePoint" data-point="tbcart.8.11">'+pproductname+'</a>'+
					'</div>'+
				'</div>'+
			'</li>'+
			'<li class="td td-info">'+
				'<div class="item-props item-props-can"></div>'+
			'</li>'+
			'<li class="td td-price">'+
				'<div class="item-price price-promo-promo">'+
					'<div class="price-content">'+
						'<div class="price-line">'+
							'<em id="pmoney'+productcode+'" class="J_Price price-now pmoney'+i+'" >'+pmoney+'</em>'+
						'</div>'+
					'</div>'+
				'</div>'+
			'</li>'+
			'<li class="td td-amount">'+
				'<div class="amount-wrapper ">'+
					'<div class="item-amount ">'+
						'<div class="sl">'+
							'<input class="min am-btn" name="" type="button" value="-" onclick="actions(\'sub\',\''+usercode+'\',\''+productcode+'\')" />'+
							'<input id="number'+productcode+'" class="text_box" name="" type="text" value="'+number+'" style="width:30px;" />'+
							'<input class="add am-btn" name="" type="button" value="+" onclick="actions(\'add\',\''+usercode+'\',\''+productcode+'\')" />'+
						'</div>'+
					'</div>'+
				'</div>'+
			'</li>'+
			'<li class="td td-sum">'+
				'<div class="td-inner">'+
					'<em id="onemoney'+productcode+'" class="J_ItemSum number onemoney'+i+'">'+onemoney+'</em>'+
				'</div>'+
			'</li>'+
			'<li class="td td-op">'+
				'<div class="td-inner">'+
					'<a href="javascript:actions(\'delete\',\''+usercode+'\',\''+productcode+'\')" class="delete">删除</a>'+
				'</div>'+
			'</li>'+
		'</ul>';			
		$("#shopcarlist").html(s);			
	}
	$("#J_SelectedItemsCount").text(0);
}