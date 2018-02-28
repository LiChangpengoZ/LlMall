//查询的js
$(function(){
	var hi=$("#hiddenbox").text();
	var data =eval('('+hi+')');
	serach(data)		
})

//上一页下一页的ajax
function limit(pageNumber,pageSize,name) {
	var param=CONST.WEB_URL+"/ProductController/searchLimit.do";
	$.ajax({
        url:param,
        type:"POST",
        data: {
        	productname:name,
        	pageNumber:pageNumber,
        	rowsNumber:pageSize
        	},
        dataType:"json",
        contentType: 'application/x-www-form-urlencoded; charset=UTF-8',//防止乱码
        success:function(data){
        	serach(data);
        }
    });
}
	
//查询的方法
function serach(data){
	var s = "";
	var len = data.rows.length;
	var total = data.total;
	var rows = data.rows;
	var pageNumber = 0;
	var pageSize = 1;
	var name="";
		name+=data.name;
	for(var i=0;i<len;i++){
		var row = rows[i];
		pageNumber = data.pageNum;
		pageSize = data.rowsNum;
		
		var code=row.code;
		var url=row.url;
		var productname="";
		productname+=row.productname;
		var money=row.money;
		s+=('<li><a href="'+CONST.WEB_URL+'/ProductController/datail.do?code='+code+'"><div class="i-pic limit" ><img src="'+CONST.WEB_URL+url+'" /><p class="title fl">'+productname+'</p><p class="price fl"><b>¥</b><strong>'+money+'</strong></p></div></a></li>');	
	}
	
	var l="";
	
	l+=('<li><a href="javascript:limit(1,8,\''+name+'\')">first</a></li>');			
	var last = Math.ceil(total/pageSize);
	var pre=pageNumber==1?1:pageNumber-1;
	l+=('<li><a href="javascript:limit('+(pageNumber==1?1:pageNumber-1)+',8,\''+name+'\')">&laquo;</a></li>');
	l+=('<li><a href="javascript:limit(1,8,\''+name+'\')">1</a></li>');
	l+=('<li><a href="javascript:limit(2,8,\''+name+'\')">2</a></li>');
	l+=('<li><a href="javascript:limit(3,8,\''+name+'\')">3</a></li>');
	l+=('<li><a href="javascript:limit('+(pageNumber==last?last:pageNumber+1)+',8,\''+name+'\')">&raquo;</a></li>');
	l+=('<li><a href="javascript:limit('+last+',8,\''+name+'\')">last</a></li>');	
	l+=("(第<span id='pageNumber'>"+pageNumber+"</span>页/共"+last+"页)");
	$("#product").html(s);
	$("#limit").html(l);
}
				
