<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/main.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Asiakkaiden listaus</title>
</head>
<body>
<table id="lista">
<thead>
<tr>
<th id="haku">Hakusana:</th>
<th><input type="text" id="hakusana"></th>
<th><input type="button" value="Hae" id="hae"></th>
</tr>
<tr>

<th id="ot">Etunimi</th>
<th id="ot">Sukunimi</th>
<th id="ot">Puhelin</th>
<th id="ot">Sposti</th>
</tr>
</thead>
<tbody>
</tbody>
</table>
<script>
/*$(document).ready(function(){
	$.ajax({url:"asiakkaat", type:"GET", dataType"json", success:function(result){
		console.log(result);
	}});
	});*/



$(document).ready(function(){
	//haeAsiakkaat();
//	$("#hakunappi").click(function(){
		//haeAsiakkaat();
	//});
	$(document.body).on("keydown", function(event){
		if(event.which==13){
			haeAsiakkaat();
		} 
	});
	
	$("#hae").click(function(){
		haeAsiakkaat();
	});
	$("#hakusana").focus();
	haeAsiakkaat();
});
function haeAsiakkaat(){
	$("#lista tbody").empty();
	

	$.ajax({url:"asiakkaat/"+$("#hakusana").val(), type="GET", dataType:"json", success:function(result){
		//console.log(result);
		$.each(result.asiakkaat, function(i, field){
		var htmlStr;	
		 htmlStr +="<tr>";
		//htmlStr +="<td>"+field.asiakas_id+"</td>";
		 htmlStr +="<td>"+field.etunimi+"</td>";
		 htmlStr +="<td>"+field.sukunimi+"</td>";
		 htmlStr +="<td>"+field.puhelin+"</td>";
		 htmlStr +="<td>"+field.sposti+"</td>";
		 htmlStr +="</tr>";
		 $("#lista tbody").append(htmlStr);
		});
	}});

	}
	
</script>
</body>
</html>