<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About Us</title>

<!-- Link Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Link about.css file -->
<link href="css/about.css" rel="stylesheet">
</head>
<body>

<!-- Link Navbar -->
<%@ include file="navbar.jsp" %>

<div class="container py-5">
	<div class="row">
		<div class=" col-md-6 sliedshow-container rounded shadow">
			<div class="image-wrapper">
   				 <img id="slideshow-img" src="images/aboutpge img/young-woman-talking-her-smartphone-while-traveling-by-train.jpg" class="slideshow-img mg-fluid w-100 rounded shadow" />
			</div>

		</div>
		<div class="col-md-6 d-flex align-items-center">
		<div>
			<h1 class="mb-4">About Us</h1>
			<p class="lead">Catch Me is a smartest solution for your all bus ticket reservations. We aim to make your travels easier, faster, amd more secure </p>	
			<p>With real-time seat availability, secure booking, and a user-friendly experience, CatchMe helps you to reach your destination without any trouble</p>
			<p>We are committed to connecting passengers and buses with transparency and convenience</p>	
		
		</div>
		
		</div>
	
	</div>

</div>

<!-- Link footer file -->
<%@ include file="footer.jsp" %>

<!-- Link slideshow.js file -->
<script src="js/slidshow.js"></script>
<script>
	const images=["images/aboutpge img/pngwing.com (3).png",
		"images/aboutpge img/empty-seats-by-window-train.jpg",
		"images/aboutpge img/seeat.jpg",
		"images/aboutpge img/pngegg.png",
		"images/aboutpge img/pngegg (1).png"
		];
	
	<!--call the funcion-->
	startslidshow("slideshow-img",images);
</script>

</body>
</html>