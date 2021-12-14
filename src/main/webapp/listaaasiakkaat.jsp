
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/main.css">
<script src="scripts/main.js"></script>
<title>Asiakkaiden listaus</title>
</head>
<body>
<form action = "haeasiakkaat" method="get">
<table id="lista">
<thead>
<tr>
<th colspan="5" id="ilmo"></th>
<th><a id="uusiasiakas" href="lisaaasiakas.jsp">Lisää uusi asiakas</a></th>
</tr>
<tr>
<th id="haku">Hakusana:</th>
<th colspan="4"><input type="text" id="hakusana"></th>
<th><input type="button" value="Hae" id="hae" onclick="haeAsiakkaat()"></th>
</tr>
<tr>
<th colspan="1" id="ot"></th>
<th>Etunimi</th>
<th>Sukunimi</th>
<th>Puhelin</th>
<th>Sposti</th>
<th></th>
</tr>
</thead>
<tbody id="tbody">

</tbody>
</table>
</form>
<script>

haeAsiakkaat();
document.getElementById("hakusana").focus();

/* function varmista(asiakas_id){
	if(confirm("Haluatko varmasti poistaa asiakkaan " + asiakas_id + "?")) {
		document.location="poistaasiakas?asiakas_id=" + asiakas_id;
	}
}


$(document).ready(function(){

$("#uusiAsiakas").click(function(){
	document.location="lisaaasiakas.jsp";
});


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

*/

function haeAsiakkaat(){
	
	document.getElementById("tbody").innerHTML="";
	fetch("asiakkaat/" + document.getElementById("hakusana").value, {
		method: 'GET'
	})
	.then(function (response) {
		return response.json()
	})
	.then(function (responseJson) {
		console.log(responseJson);
		var asiakkaat = responseJson.asiakkaat;
		var htmlStr="";
		for(var i = 0; i < asiakkaat.length; i++) {
			htmlStr+="<tr>";
			htmlStr+="<td>"+asiakkaat[i].asiakas_id+"</td>";
			htmlStr+="<td>"+asiakkaat[i].etunimi+"</td>";
			htmlStr+="<td>"+asiakkaat[i].sukunimi+"</td>";
			htmlStr+="<td>"+asiakkaat[i].puhelin+"</td>";
			htmlStr+="<td>"+asiakkaat[i].sposti+"</td>";
			htmlStr+="<td><a href='muutaasiakas.jsp?asiakas_id="+asiakkaat[i].asiakas_id+"'>Muuta</a>&nbsp;";
			htmlStr+="<span class='poista' onclick=poista('asiakkaat[i].asiakas_id+')>Poista</span></td>";
			htmlStr+="</tr>";
		}
		document.getElementById("tbody").innerHTML=htmlStr;
	})
}

/*
	
	$("#lista tbody").empty();
	

	$.ajax({url:"asiakkaat/"+$("#hakusana").val(), type:"GET", dataType:"json", success:function(result){
		//console.log(result);
		$.each(result.asiakkaat, function(i, field){
		var htmlStr;	
		 htmlStr +="<tr>";
		//htmlStr +="<td>"+field.asiakas_id+"</td>";
		 htmlStr +="<td>"+field.etunimi+"</td>";
		 htmlStr +="<td>"+field.sukunimi+"</td>";
		 htmlStr +="<td>"+field.puhelin+"</td>";
		 htmlStr +="<td>"+field.sposti+"</td>";
		 htmlStr +="<td><a href='muutaasiakas.jsp?asiakas_id="+field.asiakas_id+"'>Muuta</a>&nbsp;";
		 htmlStr +="<span class='poista' onclick=poista("+field.asiakas_id+")>Poista</span></td>";
		 htmlStr +="</tr>";
		 $("#lista tbody").append(htmlStr);
		});
	}});

	}
	
	*/
	
	function poista(asiakas_id) {
	
		if(confirm("Poista asiakas " + asiakas_id + "?")) {
			fetch("asiakkaat/"+ asiakas_id, {
				method: 'DELETE'
			})
			.then(function (response) {
				return response.json()
			})
			.then(function (responseJson) {
				var vastaus = responseJson.response;
				if(vastaus==0) {
					document.getElementById("ilmo").innerHTML="Asiakkaan poisto epäonnistui.";
				} else if(vastaus==1) {
					document.getElementById("ilmo").innerHTML="Asiakkaan " + asiakas_id + " poisto onnistui.";
					haeAsiakkaat();
				}
				
			
			setTimeout(function (){ document.getElementById("ilmo").innerHTML=""; }, 5000);
			})
			
		/*	$.ajax({url:"asiakkaat/" +asiakas_id, type:"DELETE", dataType:"json", success:function(result){
				if(result.response==0){
					$("#ilmo").html("Asiakkaan poisto epäonnistui.");
				} else if (result.response==1) {
					$("#rivi_"+asiakas_id).css("background-color", "red");
				 alert("Asiakkaan " + asiakas_id + " poisto onnistui.");
				 haeAsiakkaat();
				}
			}});
			*/
		}
		}
	


</script>
</body>
</html>