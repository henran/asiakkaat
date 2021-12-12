<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/main.css">
<script src="scripts/main.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.min.js"></script>
<title>Lisää asiakas</title>
</head>
<body>
<form id="tiedot">
<table>
<thead>
<tr>
<th colspan="5"><span id="lista">Takaisin asiakaslistaukseen</span></th>
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
<td><input type="submit" id="tallenna" value="Lisää"></td>
</tr>
</tbody> 
</table>
</form>
<span id="ilmo"></span>
</body>
<script>
$(document).ready(function(){
	
	$("#lista").click(function(){
		document.location="listaaasiakkaat.jsp";
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
lisaaTiedot();
}
});
});


function lisaaTiedot() {
	var formJsonStr = formDataJsonStr($("#tiedot").serializeArray());
	$.ajax({url:"asiakkaat", data:formJsonStr, type:"POST", dataType:"json", success:function(result){
	
	if(result.response==0){
		$("#ilmo").html("Asiakkaan lisääminen epäonnistui.");
	} else if (result.response==1) {
		$("#ilmo").html("Asiakkaan lisääminen onnistui.");
		$("#asiakas_id", "#etunimi", "#sukunimi", "#puhelin", "#sposti").val("");
	}
	}});
}
</script>
</html>   