<%@ page import="com.catchme.db.DBconnection" %>
<%@ page import= "java.sql.Connection" %>
<%@ page import= "java.sql.PreparedStatement" %>
<%@ page import= "java.sql.ResultSet" %>

<%
	String busIDStr= request.getParameter("busId");
	int busId= Integer.parseInt(busIDStr);
	
	Connection con= DBconnection.getConnection();
	PreparedStatement ps= con.prepareStatement("select * from bus where busId=?");
	ps.setInt(1, busId);
	ResultSet rs= ps.executeQuery();
	
	int seatAvailable=0;
	double pricePerSeat=0.0;
	String plateNo="";
	String route="";
	String deptTime="";
	String arrTime="";
	if(rs.next()){
		seatAvailable= rs.getInt("seat_available");
		pricePerSeat= rs.getDouble("price_per_seat");
		plateNo= rs.getString("plateNo");
		route= rs.getString("route");
		deptTime= rs.getTime("dept_time").toString();
		arrTime= rs.getTime("arr_time").toString();
		
	}

%>


 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book a Ticket</title>

<!-- font awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

<!-- Boostrap css -->
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

<!-- Boostrap js -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>


<style>
	body{
		overflow-x: hidden;
	}
	
	body::before {
	content: "";
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-image: url('images/busform.jpg'); 
	background-size: cover;
	background-position: center;
	filter: blur(8px);
	z-index: -1; 
}

	.book-bus-container{
		display: flex;
		justify-content: center;
		align-items: center;
		min-height: 100vh;
		padding: 20px;
		
	}
	
	@keyframes fadeInUp {
	from {
		opacity: 0;
		transform: translateY(30px);
	}
	to {
		opacity: 1;
		transform: translateY(0);
	}
}

	
	.booking-form {
	background-color: transparent; 
	animation: fadeInUp 0.6s ease-in-out;
	box-sizing: border-box;
	padding: 30px;
	border-radius: 15px;
	box-shadow: none;
	max-width:500px;
	width: 100%;
	color: white; 
}

	.booking-form label {
	color: white;
}

	.booking-form input,
	.booking-form button {
		background-color: rgba(255, 255, 255, 0.2);
		border: 1px solid rgba(255, 255, 255, 0.4);
		color: white;
	}
	
	.booking-form input::placeholder {
		color: rgba(255, 255, 255, 0.7);
	}	
	
	.booking-header{
		border-bottom: 2px solid white;
		padding-bottom: 10px;
		margin-bottom: 20px;
		display: inline-block;
	}
	
	@media (max-width: 600px) {
    .booking-form {
        width: 100%;
        padding: 20px;
    }

</style>

</head>

<body>

<%
String username = (String) session.getAttribute("username");
if (username == null) {
    response.sendRedirect("login.jsp");
    return;
}

String passengerName= "";
PreparedStatement ps2= con.prepareStatement("select * from passenger where Username=?");
ps2.setString(1, username);
ResultSet rs2= ps2.executeQuery();

if(rs2.next()){
	passengerName= rs2.getString("Name");
}

%>

<div class="book-bus-container vh-100">

	<form action="/BusTicket/BookingServlet" method="post" class="booking-form">
    <h2 class="mb-4 text-center booking-header">Booking Information</h2>

    <input type="hidden" name="busID" value="<%= busId%>"/>

    <div class="row">
        <div class="mb-3 col-md-6">
            <label>Passenger Name</label>
            <input type="text" name="passenger-username" value="<%= passengerName%>" class="form-control" readonly/>
        </div>

        <div class="mb-3 col-md-6">
            <label>Plate Number</label>
            <input type="text" name="plateNo" value="<%= plateNo %>" readonly class="form-control"/>
        </div>

        <div class="mb-3 col-md-6">
            <label>Route</label>
            <input type="text" name="route" value="<%= route %>" readonly class="form-control"/>
        </div>

        <div class="mb-3 col-md-6">
            <label>Departure Time</label>
            <input type="text" name="deptTime" value="<%= deptTime %>" readonly class="form-control"/>
        </div>

        <div class="mb-3 col-md-6">
            <label>Arrival Time</label>
            <input type="text" name="arrTime" value="<%= arrTime %>" readonly class="form-control"/>
        </div>

		<hr class="my-4">
		
		<h5 class="mb-3 " style="color: #b1b1b1; font-weight: 10px; ">Please fill out these details</h5>
		
        <div class="mb-3 col-md-6" >
            <label >Travel Date</label>
            <input type="date" name="travel_date" required class="form-control" style="cursor: pointer;"/>
        </div>

        <div class="mb-3 col-md-6">
            <label>Number of Seats</label>
            <input type="number" name="numSeats" id="numSeats" min="1" max="<%= seatAvailable %>" required class="form-control"/>
            <small class="form-text text-muted">
            	Available seats: <span id="availableSeats"><%= seatAvailable %></span>
            </small>
        </div>
        
        <div class="mb-3 col-md-6" >
            <label >Card Number</label>
            <input type="text" name="card" required class="form-control" style="cursor: pointer;"/>
        </div>
        
        <div class="mb-3 col-md-6" >
            <label >CVC </label>
            <input type="text" name="cvc" required class="form-control" style="cursor: pointer;"/>
        </div>
        
        <div class="mb-3 col-md-6" >
            <label >Total Price</label>
            <input type="text" name="total" id="total"  required class="form-control" style="cursor: pointer;"/>
        </div>
    </div>

    <div class="d-flex justify-content-center gap-2 mt-3">
        <button type="submit" name="book" class="btn btn-success w50" id="book">Book Ticket</button>
        <a href="/BusTicket/webBusListServlet"><button type="button" name="cancel" class="btn btn-danger w50">Back</button></a>
    </div>
  
</form>

</div>

<!-- javascript to update seat count and total price in real time -->
<script>

	
	const pricePerSeat= <%= pricePerSeat %>;
	const originalAvailableSeats= <%= seatAvailable%>;
	
	const numSeatsInput= document.getElementById('numSeats');
	const totalPriceInput= document.getElementById('total');
	const availableSeatsSpan= document.getElementById('availableSeats');
	
	function updateTotal(){
		let seats= parseInt(numSeatsInput.value);
		if(isNaN(seats) || seats<1){
			seats=1;
			numSeatsInput.value= seats;
		}
	
		const total= (seats* pricePerSeat).toFixed(2);
		totalPriceInput.value="Rs. "+ total;
		
		const updatedSeats= originalAvailableSeats - seats;
		availableSeatsSpan.textContent= updatedSeats >= 0 ? updatedSeats: 0;
		
	}
	
	numSeatsInput.addEventListener('input', updateTotal);
	
	updateTotal();

</script>


</body>
</html>