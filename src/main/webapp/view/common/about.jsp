<%@ include file="/view/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/view/head.jsp" %>
	<title>Despre - Studbox.ro</title>
	<link type="text/css" rel="stylesheet" href="css/main.css">
	<link type="text/css" rel="stylesheet" href="css/bootstrap.css">	
</head>
<body>
<div id="wrap">
	<!-- Header -->
	<%@ include file="/view/header.jsp" %>
	
	<div id="content-wrap">				
		<!-- Content -->
		<div id="content">	
			<div class="leftside">
				<div id="story">
					<h3>Despre Studbox</h3>
					<h4>Cum a luat na&#x219;tere Studbox ?</h4>
					<p>
					Studbox a luat na&#x219;tere &#238;n toiul nop&#x21B;ii c&#226;nd doi tineri se preg&#x103;teau pentru un examen ce urma a doua zi. Unul se enerva, altul plangea. Pe atunci ei se g&#226;ndeau: "ce bine ar fi dac&#x103; am vedea ni&#x219;te exemple de subiecte de examen &#x219;i bine&#238;n&#x21B;eles &#x219;i rezolvarea dac&#x103; s-ar putea :)". Pornind de la aceast&#x103; nevoie a luat na&#x219;tere acest site &#x219;i cu g&#226;ndul c&#x103; va fi de folos &#x219;i altora afla&#x21B;i &#238;n acea&#x219;i situa&#x21B;ie. 
					</p>
					
					<h4>Scopul Studbox</h4>
					<p>
					Studbox a fost dezvoltat &#238;n ideea de a ajuta studen&#x21B;ii s&#x103; &#238;mpart&#x103; informa&#x21B;iile &#238;ntre ei, dar cel mai important este c&#x103; aceste informa&#x21B;ii r&#x103;m&#226;n peste genera&#x21B;ii. Nu de pu&#x21B;ine ori, mul&#x21B;i simt nevoia de a vedea ce s-a f&#x103;cut &#x219;i &#238;n alte genera&#x21B;ii.
					</p>
					
					<h4>Realizatori</h4>
					<p>Andrei Mladin - Coordonator, Arhitect, Developer<br>
					Alex Mladin - Web Designer<br>
					Cristina Bledea - Support
					</p>
				</div>
			</div>
			
			<div class="rightside">
				<div class="socialshare" >
					<div class="socialsharetitle">
						Arat&#x103;-le &#x219;i prieteniilor
					</div>
					<div class="sociallinks">
						<a href="#" 
			  				onclick=
			  					"window.open(
			    					'https://www.facebook.com/sharer/sharer.php?u='+encodeURIComponent(location.href), 
			      					'facebook-share-dialog', 
			      					'width=626,height=436'); 
			      				return false;">
							<img src="/images/social_facebook_box_blue.png" style="width:35px;height:35px;">
						</a>			
					</div>
				</div>
			</div>			
		</div>
	</div>
	
	<!-- Footer -->
	<%@ include file="/view/footer.jsp" %>
</div>
</body>
</html>