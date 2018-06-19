<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>LOGIN</title>
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
.lbox
{

width:500px;
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
</style>
</head>
<body bgcolor="#E6E6FA" background="background3.jpg">
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "nursery";
String userId = "root";
String password = "1234";
int valid=0;


try {
Class.forName(driverName).newInstance();
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection con = null;
//Statement statement = null;
//ResultSet resultSet = null;
PreparedStatement ps = null;
ResultSet rs =null;
Statement stmt=null;
//ResultSet rs1 =null;
//Statement stmt1=null;
//ResultSet rs2 =null;
//Statement stmt2=null;
//List<String> x = new ArrayList<String>();

%>
<!--  <div class="topnav">
  <a href="#">Link</a>
  <a href="#">Link</a>
  <a href="#">Link</a>
</div>-->
<div class="box">

<div class="head"><h1 style="font-size:36px;font-family:Baskerville, 'Palatino Linotype', Palatino, 'Century Schoolbook L', 'Times New Roman', serif;color:brown">NURSERY</h1></div>
<div class="space"></div>
<div class="lbox">
<form method="post" action="login.jsp" >
<br><br>
<center><h2 style="font-family:Baskerville, 'Palatino Linotype', Palatino, 'Century Schoolbook L', 'Times New Roman', serif; color:brown;">LOGIN</h2></center>

<br><br>
<center>
<input type="text" name="name" placeholder="UserID" class="tbox" required/><br><br>
<input type="password" name="password" placeholder="Password" class="tbox" required/>
</center>
<br/><br>
<center>
<input type="submit" value="LOGIN" name="login" class="button"></center><br/>
</form>
<br/>
<center><a href="signup.html"><input type="submit" value="REGISTER" class="button"></a></center><br/>

<%
String name = request.getParameter("name");
String pwd = request.getParameter("password");

String query="select UserID,Password from CUSTOMER where UserID=? and Password=?;";
//if(!(name.equals(null) || name.equals("")) && !(pwd.equals(null) || pwd.equals(""))){
try{ 
con = DriverManager.getConnection(connectionUrl+dbName, userId, password);
ps = con.prepareStatement(query);
ps.setString(1, name);
ps.setString(2, pwd);
rs = ps.executeQuery();
if(rs.next())
{ 
String un = rs.getString("UserID");
String up = rs.getString("Password");
if(name.equals(un) && pwd.equals(up))
{
	valid=1;
session.setAttribute("userid",un);
response.sendRedirect("NewFile.jsp"); 
} 

}
rs.close();

ps.close(); 

if(request.getParameter("login") != null && valid==0)
{%>
<div class="alert">
  <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
  <strong>INVALID LOGIN</strong> <br> Click on register if new user.
</div>

<% }



}
catch(SQLException sqe)

{

out.println(sqe);

} 

//}
//else

//{

%>
</div>

</div>

</body>
</html>