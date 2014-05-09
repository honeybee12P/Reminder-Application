<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,java.util.*,java.text.*,java.lang.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>
<form>
<h1>Things to do</h1>
<p><label>Enter the Day</label></p>
<p><input type="text" name="Day"/></p>
<p><label>Enter the Date</label></p>
<p><input type="text" name="Date"/></p>
<p><label>Enter the Time</label></p>
<p><input type="text" name="Time"/></p>
<p><label>Work to do</label></p>
<p><input type="text" name="work"/></p>
<p><label>Set Reminder</label></p>
<p><input type="text" name="reminder"/></p>
<p><input type="submit" value="Click" /></p>

<%
String Day=request.getParameter("Day");
String Date=request.getParameter("Date");
String Time = request.getParameter("Time");
//int time = Integer.parseInt(Time);
String work=request.getParameter("work");
String reminder = request.getParameter("reminder");
//int remin = Integer.parseInt(reminder);
String url = "jdbc:mysql://localhost/reminder";
//get the data from the user and stores it the database “r”
String user = "root";
String password = "";
Connection connection = null;
Statement stmt;
try{
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    
    connection = DriverManager.getConnection(url, user, password);
if(connection != null){
    //out.println("Connection created");
    
    stmt= connection.createStatement();
    
   //inserting the data entered by the user
    //String query=" select * from db where artist='"+artist+"'";
    String queryText = "INSERT INTO r (Day, Date, Time,work,reminder) VALUES ('" + Day + "', '" + Date + "', '" + Time+ "','" + work+ "','" + reminder+ "')";
    stmt.executeUpdate(queryText);
    //ResultSet re=stmt.executeQuery(query);
    //while(re.next()){
    //out.println(re.getString("song")+"\n");
    //}
}else
    out.println("Connection refused");
    
}catch(Exception e){
out.println(e.getMessage());
} 
%>
<!---helps in redirecting the page to the work assigned previously--->
<p><a href="reminder.jsp">Work assigned previously</a>
</form>
</body>
</html>

