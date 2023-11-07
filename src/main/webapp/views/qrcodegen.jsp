<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
<script src="/webjars/jquery/3.6.0/jquery.min.js"></script>
<meta charset="ISO-8859-1">
<title>QR code</title>
<style>
.space{
	padding-left: 50px;
}

.card {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  box-shadow: 0px 6px 10px rgba(0, 0, 10, 10);
background: rgb(240,240,240);
background: radial-gradient(circle, rgba(240,240,240,1) 0%, rgba(3,120,128,1) 100%);
}
.card:hover {
/*  	box-shadow: 0px 6px 10px rgba(0, 0, 10, 10);  */
 	transform: scale(1);
/*  	-webkit-box-shadow: -11px 17px 22px 11px rgba(0,0,0,0.76); */
/* -moz-box-shadow: -11px 17px 22px 11px rgba(0,0,0,0.76); */
/* box-shadow: -11px 17px 22px 11px rgba(0,0,0,0.76); */

}

.form-control[type=url]:not(:disabled):not([readonly]) {
    cursor: pointer;
  background-color: lightblue; 
}

.bn29 {
  border: none;
  padding: 0.5em 2em;
  outline: none;
  color: black;
  font-style: 1.2em;
  position: relative;
  z-index: 1;
  cursor: pointer;
  background: none;
  text-shadow: 3px 3px 10px rgba(0, 0, 0, 0.45);
}

.bn29:before,
.bn29:after {
  position: absolute;
  top: 50%;
  left: 50%;
  border-radius: 10em;
  -webkit-transform: translateX(-50%) translateY(-50%);
  transform: translateX(-50%) translateY(-50%);
  width: 90%;
  height: 90%;
  content: "";
  z-index: -2;
  background-size: 400% 400%;
  background: rgb(53,153,251);
background: linear-gradient(25deg, rgba(53,153,251,1) 0%, rgba(49,247,255,1) 50%, rgba(53,153,251,1) 100%);
box-shadow: 0px 6px 10px rgba(0, 0, 0, 0.4); 

}

.bn29:before {
  -webkit-filter: blur(7px);
  filter: blur(7px);
  -webkit-transition: all 0.25s ease;
  transition: all 0.25s ease;
  -webkit-animation: pulse 10s infinite ease;
  animation: pulse 10s infinite ease;
}

.bn29:after {
  -webkit-filter: blur(0.3px);
  filter: blur(0.3px);
}

.bn29:hover:before {
  width: 105%;
  height: 105%;
}
#urlcode{
	box-shadow: 0px 6px 10px rgba(0, 0, 0, 0.4); 
}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script type="text/javascript">
function qrgenerate(){
	
	var url = $('#urlcode').val();
	alert(url);
	var formData = new FormData();	
  	formData.append("url", url);
	$.ajax({
			type : "POST",
			url :  "/qrreceive",
			data : formData,
			cache : false,
		    scriptCharset: "utf-8",
		    contentType : false,
		    processData : false,
			async : true,
			success : function(data) {
				console.log(data);
             
			}
		});
	
}

</script>

</head>
<body style="background-color: lightgrey;  background-image: url(images/wooden-texturee.jpg);">
<div style="padding-top: 1in; padding-left: 1in; padding-right: 1in;">
<div class="card" style="width: auto;align-content: center; padding-top: 10px;">
  <div class="card-body">
    <h3 class="card-title" ><u>QR Code Generate </u></h3><br>
    <form>
  		<label for="attachFile">Enter URL:</label>
  		<input type="url"  id="urlcode"  class="form-control"  /> <br>
  		<button  class="bn29"    onclick="qrgenerate()" >Generate</button>        <button class="bn29 space" type="reset" >Reset</button> <br><br>

	</form>
  </div>
</div>
</div>
 
</body>
</html>