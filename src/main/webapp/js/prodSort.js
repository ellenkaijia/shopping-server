jQuery(document).ready(function() {
	
	sendData();//一过来就调用
	
	$(window).scroll(function(){
		if($(this).scrollTop()>30){
			$(".fanhui_cou").fadeIn(1500);
			
		}else{
			$(".fanhui_cou").fadeOut(1500);
			
		}
	});
	$(".fanhui_cou").click(function(){
		$("body,html").animate({scrollTop:0},200);
		return false;
	});
	
	$(window).scroll(function(){
        if ($(document).height() - $(this).scrollTop() - $(this).height()<10){
        	var curPageNo = $("#curPageNO").val();
        	if(isBlank(curPageNo) || curPageNo == 0){
        		curPageNo = 0;
        	}
        	curPageNo=parseInt(curPageNo)+1;
			var totalPage=parseInt($("#ListTotallist").val());
			console.log("ListTotal",totalPage);
			if(curPageNo <= totalPage){
				$("#curPageNO").val(curPageNo);
				appendData();
				return;
			}
			$("#ajax_none").show();
        }
    });
	
	
	//绑定 点击事件
	$(".row ul li").bind("click",function() {
		var id = $(this).attr("id");
		var orderDir = "";
		$(".row ul li").each(function(i) {
			if (id != $(this).attr("id")) {
				$(this).removeClass("active");
			}
		});
		$(this).addClass("active");
		var iElement=$(this).find("i");
		if (id == 'cash') {
			if ($(iElement).hasClass("icon_sort_up")) {
				orderDir = "cash,asc";
				$(iElement).attr("class","icon_sort_down");
				
			} else if($(iElement).hasClass("icon_sort_down")){
				orderDir = "cash,desc";
				$(iElement).attr("class","icon_sort_up");
				
			}else{
				orderDir = "cash,desc";
				$(iElement).attr("class","icon_sort_up");
			}
		} else if (id == 'buys') {
			if ($(iElement).hasClass("icon_sort_down")) {
				orderDir = "buys,desc";
				$(iElement).attr("class","icon_sort_up");
				
			} else if($(iElement).hasClass("icon_sort_up")){
				orderDir = "buys,asc";
				$(iElement).attr("class","icon_sort_down");
				
			}else{
				orderDir = "buys,desc";
				$(iElement).attr("class","icon_sort_up");
			}
		} else if (id == 'comments') {
			if ($(iElement).hasClass("icon_sort_down")) {
				orderDir = "comments,desc";
				$(iElement).attr("class","icon_sort_up");
				
			} else if($(iElement).hasClass("icon_sort_up")){
				orderDir = "comments,asc";
				$(iElement).attr("class","icon_sort_down");
				
			}else{
				orderDir = "comments,desc";
				$(iElement).attr("class","icon_sort_up");
			}
		} else if (id == 'default') {
			orderDir = "date,desc";
		}
		
		$(this).siblings().find("i").attr("class","icon_sort");
		
		$("#orders").val(orderDir);
		var no_results=$.trim($("#no_results").html());
		if(no_results!="" && no_results!=null && no_results!=undefined){
			return false;
		}
		$("#curPageNO").val(0);
		sendData();
	});
});

function sendData(){
	
	$("#container").html(""); 
	$('#ajax_loading').show();
	$("#list_form").ajaxForm().ajaxSubmit({
		  success:function(result) {
			 $('#ajax_loading').hide();
			 handleJsonOverRide(result);
		   },
		   error:function(XMLHttpRequest, textStatus,errorThrown) {
			 $("#container").html(""); 
			 $('#ajax_loading').hide();
			 floatNotify.simple("查找失败");
			 return false;
		  }	
	})
}

function handleJsonOverRide(result) {
	var htmlstring = "";
	
	 if(result.length == 0) {
		 $("#ListTotallist").attr("value",0);
		 $("#container").html(" <div id=\"ajax_none\" style=\"display: block; width: 300px; margin: 10px auto 15px; text-align: center;\"> <p class=\"p-title\">没有任何数据</p></div>"); 
		 return;
	 }
	
	for(var i=0; i < result.length; i++) {
	    htmlstring += "<a href=\"/shopping-server/product/view/"+ result[i].prodId +"\">";
		htmlstring += "<div class=\"hproduct clearfix\" style=\"background: #fff; border-top: 0px;\">";
		htmlstring += "<div class=\"p-pic\"> <img style=\"max-height: 100px; margin: auto;\" class=\"img-responsive\"";
		htmlstring += "src=\"" + result[i].imgUrls[0] + "\">";
		htmlstring += "</div><div class=\"p-info\"><p class=\"p-title\">" + result[i].prodName + "</p> <p class=\"p-origin\">";
		htmlstring += "<em class=\"price\"> ￥"+ result[i].prodPrize + "</em>	</p>";
		htmlstring += "<p class=\"p-title\" style=\"color:blue\">" + result[i].prodDetail + "</p>";
		htmlstring += "</div></div></a>";
	}
	 $("#container").html(htmlstring); 
	 console.log("container",result[0].listTotal);
	 $("#ListTotallist").attr("value",result[0].listTotal);
	 $("#orders").val(result[0].orders);
}

function handleJsonAppend(result) {
	var htmlstring = "";
	for(var i=0; i < result.length; i++) {
	    htmlstring += "<a href=\"/shopping-server/product/view/"+ result[i].prodId +"\">";
		htmlstring += "<div class=\"hproduct clearfix\" style=\"background: #fff; border-top: 0px;\">";
		htmlstring += "<div class=\"p-pic\"> <img style=\"max-height: 100px; margin: auto;\" class=\"img-responsive\"";
		htmlstring += "src=\"" + result[i].imgUrls[0] + "\">";
		htmlstring += "</div><div class=\"p-info\"><p class=\"p-title\">" + result[i].prodName + "</p> <p class=\"p-origin\">";
		htmlstring += "<em class=\"price\"> ￥"+ result[i].prodPrize + "</em>	</p>";
		htmlstring += "<p class=\"p-title\" style=\"color:blue\">" + result[i].prodDetail + "</p>";
		htmlstring += "</div></div></a>";
	}
	
	 $("#container").append(htmlstring); 
}
			
function appendData(){
	console.log("dsadsa","append")
	$('#ajax_loading').show();
	$("#list_form").ajaxForm().ajaxSubmit({
		  success:function(result) {
			 $('#ajax_loading').hide();
			 handleJsonAppend(result);
		   },
		   error:function(XMLHttpRequest, textStatus,errorThrown) {
			 $('#ajax_loading').hide();
			 floatNotify.simple("拉取查找失败");
			 return false;
		  }	
	});
}

/**判断是否为空**/
function isBlank(_value){
	if(_value==null || _value=="" || _value==undefined){
		return true;
	}
	return false;
}