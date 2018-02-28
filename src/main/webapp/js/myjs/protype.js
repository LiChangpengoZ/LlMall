//商品分类管理js
$(function() {
	var jsonstr=$("#jonelist").text();
	var jonelist=eval('('+jsonstr+')');
	loadone(jonelist);
})

//加载一级分类
function loadone(jonelist) {
	var one='<option value="one" selected="selected"  >请选择--</option>';
	for (var i = 0; i < jonelist.length; i++) {
		var code=jonelist[i].code;
		var typename=jonelist[i].typename;
		one+='<option value="'+code+'">'+typename+'</option>';
	}
	$("select[name=parentcode]").html(one);
}

//加载二级分类ajax
function onechange(temp) {
	var one="";
	if("upone"==temp){
		one=$("#upone").val();
	}
	if("deone"==temp){
		one=$("#deone").val();
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

//加载二级分类具体追加
function loadtwo(twolist,temp) {
	var two='<option value="two" selected="selected"  >请选择--</option>';
	for (var i = 0; i < twolist.length; i++) {
		var typename=twolist[i].typename;
		var code=twolist[i].code;		
		two+='<option value="'+code+'">'+typename+'</option>';	
	}
	if("upone"==temp){
		$("#uptwo").html(two);
	}
	if("deone"==temp){
		$("#detwo").html(two);
	}
}