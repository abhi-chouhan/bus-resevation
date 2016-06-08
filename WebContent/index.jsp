<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ page import ="java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <%
String s1="";
 try {
	 String source=request.getParameter("source");
	 String destination=request.getParameter("destination");
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","root");
			PreparedStatement ps=con.prepareStatement("select * from busticket where source=? AND destination=? ");
		ps.setString(1, source);
		ps.setString(2, destination);
			
	ResultSet  rs=	ps.executeQuery();
	%>
	<table width="200" border="1">
  
		<%
	while(rs.next())
	{
		%>
		<tr>
    <th scope="row"><%= rs.getString(1) %></th>
    <td><%= rs.getString(2) %></td>
    <td><%= rs.getString(3) %></td>
    <td><a href="home.jsp?busid=<%= rs.getString(4) %>&source=<%= rs.getString(2) %>&destination=<%= rs.getString(3) %>">Click Here</a></td>
  </tr>

		
		
	
	<% 
}
		session.setAttribute("source",rs.getString(2) );
		session.setAttribute("destination",rs.getString(3) );
		%>	
</table>
<% 
 }
		catch(Exception e)
		{
			System.out.println(e);
		} %>
    


<form action="" method="post">

Source<input type="text" name="source">
<p>
Destination<input type="text" name="destination" >
<p>
<input type="submit" value="Search"/>

</form>
</body>
</html>