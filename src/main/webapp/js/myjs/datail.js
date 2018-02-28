//详情页的js
$(function(){
	
	$("#aaa").click(function(){
		var number=$("#text_box").val();
		$("#number").val(number);
	})
	
	var usercode =$("#hiddenuser").text();
	var productcode=$("#hiddenproduct").text();
	var number=$("#text_box").val();
	//添加购物车的方法
	var path=CONST.WEB_URL+"/OrderController/addShopCar.do";	
	$("#addshopcar").click(function(){
		var number=$("#text_box").val();
		$.ajax({
			type:"post",
			url:path,
			data:{
				number:number,
				usercode:usercode,
				productcode:productcode
			},
			dataType:"text",
			success:function(data){
				$("#showlabel").text(data);
			}
		});		
	
	})
	
	
								
})
