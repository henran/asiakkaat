<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/main.css">
<script src="scripts/main.js"></script>

<title>Insert title here</title>
</head>
<body>
<form id="tiedot">
<table>
<thead>
<tr>
<th colspan="3" id="ilmo"></th>
<th colspan="5" id="lista"><a href="listaaasiakkaat.jsp">Takaisin asiakaslistaukseen</a></th>
</tr>
<tr>
<th>Asiakas_id</th>
<th>Etunimi</th>
<th>Sukunimi</th>
<th>Puhelin</th>
<th>Sposti</th>
<th></th>
</tr>
</thead>
<tbody>
<tr>
<td><input type="text" name="asiakas_id" id="asiakas_id"></td>
<td><input type="text" name="etunimi" id="etunimi"></td>
<td><input type="text" name="sukunimi" id="sukunimi"></td>
<td><input type="text" name="puhelin" id="puhelin"></td>
<td><input type="text" name="sposti" id="sposti"></td>
<td><input type="submit" id="tallenna" value="Hyväksy" onclick="tarkasta()"></td>
</tr>
</tbody> 
</table>
<input type="hidden" name="vanhaAsId" id="vanhaAsId"> 
</form>

</body>
<script>


var asiakas_id = requestURLParam("asiakas_id");
fetch("asiakkaat/haeyksi/" + asiakas_id, {
	method: 'GET'
})
.then(function (response) {
	return response.json()
})

.then(function (responseJson) {

	console.log(responseJson);
	document.getElementById("asiakas_id").value = responseJson.asiakas_id;
	document.getElementById("etunimi").value = responseJson.etunimi;
	document.getElementById("sukunimi").value = responseJson.sukunimi;
	document.getElementById("puhelin").value = responseJson.puhelin;
	document.getElementById("sposti").value = responseJson.sposti;
	document.getElementById("vanhaAsId").value = responseJson.asiakas_id;

});
	


function tarkasta(){
	var ilmo = "";
		
		if(document.getElementById("asiakas_id").value*1!=document.getElementById("asiakas_id").value){
			ilmo = "Asiakasnumero ei ole kelvollinen!";
			
		} else if (document.getElementById("etunimi").value.length<2){
			ilmo = "Etunimi ei ole kelvollinen!";
			
		}  else if (document.getElementById("sukunimi").value.length<2){
			ilmo="Sukunimi ei ole kelvollinen";
			
			
		}  else if (document.getElementById("puhelin").value.length<3){
			ilmo="Puhelin ei ole kelvollinen";
			
			
		}
		 else if (document.getElementById("sposti").value.length<5){
				ilmo="Sposti ei ole kelvollinen";
			
				
		}
		if(ilmo!=""){
			document.getElementById("ilmo").innerHTML=ilmo;
			setTimeout(function(){document.getElementById("ilmo").innerHTML=""; }, 3000);
			return;
		}
		var formJsonStr=formDataToJSON(document.getElementById("tiedot"));
		console.log(formJsonStr);
		
		fetch("asiakkaat", {
			method: 'PUT',
			body:formJsonStr
		})
		.then (function (response) {
			return response.json()
		})
		.then (function (responseJson) {
			var vastaus = responseJson.response;
			if(vastaus==0){
				document.getElementById("ilmo").innerHTML = "Asiakkaan tietojen päivitys epäonnistui";
			} else if (vastaus==1) {
				document.getElementById("ilmo").innerHTML = "Asiakkaan tietojen päivitys onnistui";
			}
			setTimeout(function(){ document.getElementById("ilmo").innerHTML=""; }, 5000);
		});
		document.getElementById("tiedot").reset();
		}
		






/*

$(document).ready(function() {
	$("#lista").click(function(){
		document.location="listaaasiakkaat.jsp";
	});	
var asiakas_id = requestURLParam("asiakas_id");
$.ajax({url:"asiakkaat/haeyksi/"+asiakas_id, type:"GET", dataType:"json", success:function(result){
	$("#vanhaAsId").val(result.asiakas_id);
	$("#asiakas_id").val(result.asiakas_id);
	$("#etunimi").val(result.etunimi);
	$("#sukunimi").val(result.sukunimi);
	$("#puhelin").val(result.puhelin);
	$("#sposti").val(result.sposti);
}});
});
$("#tiedot").validate({
	rules: {
		asiakas_id: {
			required: true,
			number: true,
	},
		etunimi: {
			required: true,
			minlength: 2
	},
		sukunimi: {
			required: true,
			minlength: 2
	},
		puhelin: {
			required: true,
			number: true,
			minlength: 3
	},
		sposti: {
			required: true,
			minlength: 5
	}
	},
	messages: {
		asiakas_id: {
			required: "Puuttuu",
			number: "vain numerot sallittuja"
	},
			etunimi: {
			required: "Puuttuu",
			minlength: "Liian lyhyt"
	},
		sukunimi: {
			required: "Puuttuu",
			minlength: "Liian lyhyt"
	},
		puhelin: {
			required: "Puuttuu",
			number: "Vain numerot sallittuja",
			minlength: "Liian lyhyt"
	},
		sposti: {
			required: "Puuttuu",
			minlength: "Liian lyhyt"
	}
	},
	submitHandler: function(form) {
	paivitaTiedot();
	}
	});
	


	function paivitaTiedot() {
		var formJsonStr = formDataJsonStr($("#tiedot").serializeArray());
		$.ajax({url:"asiakkaat", data:formJsonStr, type:"PUT", dataType:"json", success:function(result){
		
		if(result.response==0){
			$("#ilmo").html("Asiakkaan tietojen päivittäminen epäonnistui.");
		} else if (result.response==1) {
			$("#ilmo").html("Asiakkaan tietojen päivittäminen onnistui.");
			$("#asiakas_id", "#etunimi", "#sukunimi", "#puhelin", "#sposti").val("");
		}
		}});
	}
	
	
	*/
</script>
</html>