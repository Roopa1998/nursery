<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CONFIRM ORDER</title>
<style>
*
{
	margin:0px;
	padding:0px;
	box-sizing: border-box;
	
}
.topnav {
    overflow: hidden;
    background-color: brown;;
    
}

/* Style the topnav links */
.topnav a {
    float: left;
    display: block;
    color: #f2f2f2;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
    font-family:Baskerville, "Palatino Linotype", Palatino, "Century Schoolbook L", "Times New Roman", serif;
	
}

/* Change color on hover */
.topnav a:hover {
    background-color: #CCFFCC;
    color: black;
}
.box
{
	width:100%;
	height:798px;
	/*border:solid 1px black;*/
	margin:auto;
	
}
.head
{
	/*width:1024px;*/
	width:100%;
	height:98px;
	border:solid 1px brown;
	text-align:center;
	line-height:100px;
	background:#CCFFCC;

}
.button
{
width:100px;
height:50px;
line-height:50px;
text-align:center;
font-family:Baskerville, "Palatino Linotype", Palatino, "Century Schoolbook L", "Times New Roman", serif;
	color:brown;
	background:#F7DC6F;
	border-radius:5px;
	
}
.button:hover
{
background:white;
}
.a
{
text-decoration:none;
}
.tbox
{
width:200px;
height:40px;
text-align:center;
font-family:Baskerville, "Palatino Linotype", Palatino, "Century Schoolbook L", "Times New Roman", serif;
border:solid 1px brown;
border-radius:2px;
}
.tab
{
font-family:Baskerville, 'Palatino Linotype', Palatino, 'Century Schoolbook L', 'Times New Roman', serif;
border-radius:5px;
}
.lbox
{

width:800px;
height:500px;
border:solid 1px brown;
margin:auto;
background:honeydew;
}
.space
{
width:100%;
height:40px;
}
.alert {
    padding: 20px;
    background-color: #f44336;
    color: white;
}

.closebtn {
    margin-left: 15px;
    color: white;
    font-weight: bold;
    float: right;
    font-size: 22px;
    line-height: 20px;
    cursor: pointer;
    transition: 0.3s;
}

.closebtn:hover {
    color: black;
}
.bg { 
    /* The image used */
    background-image: url("background.jpg");

    /* Full height */
    width: 100%; 

    /* Center and scale the image nicely */
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
}
</style>
</head>
<body bgcolor="#E6E6FA" background="background.jpg">
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@ page import="java.util.Random" %>

<%
String pid=(String)session.getAttribute("PlantID");
String common=(String)session.getAttribute("CommonName");
String uid=(String)request.getSession().getAttribute("userid");
String add=(String)session.getAttribute("address");
String cname=(String)session.getAttribute("name");
int total=(int)session.getAttribute("Total");
int quantity=(int)session.getAttribute("Quantity");
int cost=(int)session.getAttribute("Cost");

%>
<div class="box">

<div class="head"><h1 style="font-size:36px;font-family:Baskerville, 'Palatino Linotype', Palatino, 'Century Schoolbook L', 'Times New Roman', serif;color:brown">NURSERY</h1></div>
<div class="space"></div>
<div class="lbox">
<form >
<center><h2 style="font-size:24px;font-family:Baskerville, 'Palatino Linotype', Palatino, 'Century Schoolbook L', 'Times New Roman', serif;color:brown">CONFIRM ORDER</h2></center>
<br><br>
<table border="1" align="center" cellpadding="5" class="tab">

<tr bgcolor="#FFCCCC">

<td><b>CUSTOMER ID</b></td>
<td><b>CUSTOMER NAME</b></td>
<td><b>PLANT ID</b></td>
<td><b>PLANT NAME</b></td>
<td><b>COST</b></td>
<td><b>QUANTITY</b></td>
<td><b>TOTAL</b></td>
<td><b>DELIVERY ADDRESS</b></td>

</tr>

<tr bgcolor="#CCFFCC">

<td><%=uid%></td>
<td><%=cname%></td>
<td><%=pid%></td>
<td><%=common%></td>
<td><%=cost%></td>
<td><%=quantity%></td>
<td><%=total%></td>
<td><%=add%></td>
</tr>
</table>
<br/><br>
<center>

<input type="submit" value="PLACEORDER" name="place" class="button"></center><br/>
<br>

</form>
<center>
<a href="logout.jsp">
<input type="submit" value="logout" name="LOGOUT" class="button"></a></center>
<br>

<center><p>CASH ON DELIVERY</p></center>

<%
if(request.getParameter("place") != null){
%>

<center><p>Order Placed</p></center>
<%}
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "nursery";
String userId = "root";
String password = "1234";

try {
Class.forName(driverName).newInstance();
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection con = null;
PreparedStatement ps = null;
//ResultSet resultSet = null;
ResultSet rs =null;
Statement stmt=null;
ResultSet rs1 =null;
Statement stmt1=null;
ResultSet rs2 =null;
Statement stmt2=null;
ResultSet rs3 =null;
Statement stmt3=null;
ResultSet rs4 =null;
Statement stmt4=null;
PreparedStatement ps1=null;

%>
<%
try{ 
con = DriverManager.getConnection(connectionUrl+dbName, userId, password);
System.out.println("Successfully connected to MySQL server...");
//UUID idOne = UUID.randomUUID();

	
	
String sql ="INSERT into ORDERS(UserID,PlantID,QuantityOrdered) values(?,?,?);";
ps=con.prepareStatement(sql);
ps.setString(1,uid);
ps.setString(2,pid);
ps.setInt(3,quantity);
ps.execute();
System.out.println("Successfully Inserted");
String query="Update PLANT set QuantityAvailable=QuantityAvailable-? where PlantID=?;";
ps1=con.prepareStatement(query);
ps1.setInt(1,quantity);
ps1.setString(2,pid);
ps1.execute();

System.out.println("Successfully updated");

	
	




} catch (Exception e) {
e.printStackTrace();
}

        con.close();

%>

</div>
</div>
</body>
</html>