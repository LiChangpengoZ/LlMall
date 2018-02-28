//主页的js
$(function(){
	var path=CONST.WEB_URL+"/ProductController/loadpdlist.do";
	$.ajax({
		type:"post",
		url:path,
		dataType:"json",
		success:function(data){
			load(data)		
		}
	});			
})

//加载,一级分类页面固定，只需赋值，二级追加
function load(data) {
	for (var i = 0; i < data.length; i++) {
		var onetypename=data[i].typename;
		$("#one"+(i+1)).text(onetypename);
		var two=data[i].list;
		var twotext='<dt><span>'+onetypename+'</span></dt>';
		for (var j = 0; j < two.length; j++) {
			var twoname=two[j].typename;
			var code=two[j].code;
			twotext+='<dd><a href="'+CONST.WEB_URL+'/ProductController/search.do?productname='+twoname+'"><span class="dxdg1" value="'+code+'">'+twoname+'</span></a></dd>';
		}
		$("#two"+(i+1)).html(twotext);
	}
}



	