<?php include("../bussines_layer/comprobar_sesion.php");?>

<!DOCTYPE html>
<html lang="en">
<head>
<title>SICO</title>
<meta charset="utf-8">
<link rel="stylesheet" href="css/reset.css" type="text/css" media="all">
<link rel="stylesheet" href="css/layout.css" type="text/css" media="all">
<link rel="stylesheet" href="css/style.css" type="text/css" media="all">
<script type="text/javascript" src="js/jquery-1.6.js" ></script>
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-replace.js"></script>  
<script type="text/javascript" src="js/Forum_400.font.js"></script>
<script type="text/javascript" src="js/atooltip.jquery.js"></script> 

</head>
<body id="page5">
<div class="body6">
	<div class="body1">
		<div class="main">
<!-- header -->
			<header>
				<h1><a href="index.php" id="logo">Empresas</a></h1>
				<?php if($sesion) : ?>
					Welcome <?= $_SESSION['nombres'] ?>
					<a href="../bussines_layer/logout.php">Cerrar Sesion</a>
					<?php endif; ?>
				<nav>
					<ul id="menu">
						<li><a href="index.php">Inicio</a></li>
						<li><a href="busqueda.php">Busqueda</a></li>
						<li><a href="sugerencias.php">Sugerencias</a></li>
						<li><a href="registro/opcion_registro.php">Registro</a></li>
						<li><a href="login.php">Login</a></li>
					</ul>
				</nav>
			</header>
<!-- / header -->
<!-- content -->
			<article id="content">
				<div class="wrap">
					<div class="box">
						<div>
							<h2 class="letter_spacing">SUGERENCIAS</h2>
							<form id="ContactForm">
								<div>
									<div class="wrapper">
										<span>Your Name:</span>
										<input type="text" class="input" >
									</div>
									<div class="wrapper">
										<span>Your E-mail:</span>
										<input type="text" class="input" >								
									</div>
									<div class="textarea_box">
										<span>Your Message:</span>
										<textarea name="textarea" cols="1" rows="1"></textarea>								
									</div>
									<a href="#" class="button1" onClick="document.getElementById('ContactForm').submit()">Send</a>
									<a href="#" class="button1" onClick="document.getElementById('ContactForm').reset()">Clear</a>
								</div>
							</form>
						</div>
					</div>
				</div>
			</article>
		</div>
	</div>
</div>
<div class="body2">
	<div class="main">
		<article id="content2">
			<div class="wrapper">
				<section class="pad_left1">
					<div class="wrapper">
						<div class="cols">
							<h2>Our Contacts</h2>
						</div>
						<div class="col3 pad_left1">
							<h2>Miscellaneous Info</h2>
						</div>
					</div>
					<div class="line1">
						<div class="wrapper line2">
							<div class="cols">
								<div class="wrapper pad_bot1">
									<p>Sed ut perspiciatis unde omnis iunatus doloremque laudantium.</p>
									<p class="address">
										Marmora Road, Glasgow, D04 89GR.<br>
										<span>Freephone:</span>    +1 800 559 6580<br>
										<span>Telephone:</span>    +1 959 603 6035<br>
										<span>E-mail:</span>             <a href="mailto:">mail@demolink.org</a>
									</p>
								</div>
							</div>
							<div class="col3 pad_left1">
								<p>
									Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
								</p>
								Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error.
							</div>
						</div>
					</div>
				</section>
			</div>
		</article>
<!-- / content -->
	</div>
</div>
<div class="body3">
	<div class="body4">
		<div class="main">
<!-- footer -->
			<footer>
				<div class="wrapper">
					<section class="col1 pad_left1">
						<h3>Toll Free: <span>1-800 123 45 67</span></h3>
						<a rel="nofollow" href="http://www.templatemonster.com/" target="_blank">Website Template</a> by TemplateMonster.com
					</section>
					<section class="col2 pad_left1">
						<h3>Follow Us </h3>
						<ul id="icons">
							<li><a href="#" class="normaltip" title="Facebook"><img src="images/icon1.gif" alt=""></a></li>
							<li><a href="#" class="normaltip" title="Linkedin"><img src="images/icon2.gif" alt=""></a></li>
							<li><a href="#" class="normaltip" title="Twitter"><img src="images/icon3.gif" alt=""></a></li>
							<li><a href="#" class="normaltip" title="Delicious"><img src="images/icon4.gif" alt=""></a></li>
							<li><a href="#" class="normaltip" title="Technorati"><img src="images/icon5.gif" alt=""></a></li>
						</ul>
					</section>
				</div>
				<!-- {%FOOTER_LINK} -->
			</footer>
<!-- / footer -->
		</div>
	</div>
</div>
<script type="text/javascript"> Cufon.now(); </script>
</body>
</html>