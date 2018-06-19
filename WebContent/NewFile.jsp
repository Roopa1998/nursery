<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PLANTS</title>
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
padding:20px;
font-family:Baskerville, "Palatino Linotype", Palatino, "Century Schoolbook L", "Times New Roman", serif;
border:solid 1px brown;
border-radius:2px;
}
.lbox
{

width:500px;
height:600px;
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
.tab
{
font-family:Baskerville, 'Palatino Linotype', Palatino, 'Century Schoolbook L', 'Times New Roman', serif;
border-radius:5px;
}
.bg { 
    /* The image used */
    background-image: url("bck.jpg");

    /* Full height */
     

    /* Center and scale the image nicely */
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
}
</style>
</head>
<body bgcolor="#E6E6FA" background="i1.jpg">
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.*"%>

<%
//String id = request.getParameter("userId");
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

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
ResultSet rs =null;
Statement stmt=null;
ResultSet rs1 =null;
Statement stmt1=null;
ResultSet rs2 =null;
Statement stmt2=null;
ResultSet rs3 =null;
Statement stmt3=null;
List<String> x = new ArrayList<String>();

%>
<div class="box">

<div class="head"><h1 style="font-size:36px;font-family:Baskerville, 'Palatino Linotype', Palatino, 'Century Schoolbook L', 'Times New Roman', serif;color:brown">NURSERY</h1></div>
<div class="space"></div>
<div class="lbox">
<h2 align="center" style="font-family:Baskerville, 'Palatino Linotype', Palatino, 'Century Schoolbook L', 'Times New Roman', serif; color:brown;"><font><strong>PLANTS</strong></font></h2>
<form action="NewFile.jsp">
<table align="center" cellpadding="5" border="1" class="tab">
<tr>

</tr>
<tr bgcolor="#FFCCCC">
<td><b>Plantid</b></td>
<td><b>CommonName</b></td>
<td><b>ScientificName</b></td>
<td><b>Cost</b></td>
<td><b>Quantity</b></td>
<td><b>Select</b></td>

</tr>
<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM PLANT";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
String pid=resultSet.getString("PlantID");
x.add(pid);
%>
<tr bgcolor="#CCFFCC">

<td><%= pid%></td>
<td><%=resultSet.getString("CommonName") %></td>
<td><%=resultSet.getString("ScientificName") %></td>
<td><%=resultSet.getInt("Cost") %></td>
<td><%=resultSet.getInt("QuantityAvailable") %></td>
<td><p><input type="radio" name="id" value="<%=pid%>"></td>

</tr>

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
<br>
 <center><input type="text" name="Quantity" placeholder="Quantity" class="tbox"></center>
 <br>
 <center>
<input type="submit" value="Submit" class="button"></center>
</form>
 <center><a href="logout.jsp">
<input type="submit" value="logout" class="button"></a></center>
</div>
</div>

<%
stmt=connection.createStatement();
String query1="Select count(*) from PLANT;";
rs=stmt.executeQuery(query1);
while(rs.next()){
int count=rs.getInt(1);
for(int i=0;i<count;i++)
{
	if(request.getParameter("id")!=null && request.getParameter("id").equals(x.get(i))) {
        String q=request.getParameter("Quantity");
        int n=Integer.parseInt(q);
        stmt1=connection.createStatement();
        String query2="Select Cost from PLANT where PlantID="+x.get(i)+";";
        rs1=stmt1.executeQuery(query2);
        //out.println(x.get(i));
        while(rs1.next()){
        int cost=rs1.getInt(1);
        //out.println(cost);
        int Total=cost*n;
        stmt2=connection.createStatement();
        String query3="Select CommonName from PLANT where PlantID="+x.get(i)+";";
        rs2=stmt2.executeQuery(query3);
        while(rs2.next()){
            String common =rs2.getString(1);
            stmt3=connection.createStatement();
            String uid=(String)session.getAttribute("userid");
            String query4="Select Address,Fname from CUSTOMER where UserID="+uid+";";
            rs3=stmt3.executeQuery(query4);
            while(rs3.next()){
                String address =rs3.getString(1);
                String name=rs3.getString(2);
        
       //out.println("total="+Total); 
       if (Total != 0 && Total > 0) {
  session.setAttribute("Total", Total);
}
       if (x.get(i) != null && x.get(i).length() > 0) {
  session.setAttribute("PlantID", x.get(i));
}
       if (common != null && common.length() > 0) {
    	   session.setAttribute("CommonName", common);
    	 }
       if (address != null && address.length() > 0) {
    	   session.setAttribute("address", address);
    	 }
       if (name != null && name.length() > 0) {
    	   session.setAttribute("name", name);
    	 }
       if (n!=0 && n > 0) {
    	   session.setAttribute("Quantity", n);
    	 }
       if (cost!=0 && cost > 0) {
    	   session.setAttribute("Cost", cost);
    	 }
       if ((int)session.getAttribute("Total")!=0)
       {
       	response.sendRedirect("placeorder.jsp");}
       }
        
    }}}}}



%>
</body>
</html>