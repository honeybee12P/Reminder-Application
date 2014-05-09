<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,java.util.Date.*,java.text.*,java.lang.*,java.util.Date,java.text.DateFormat,java.text.SimpleDateFormat,java.lang.String.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>
<form>
<h1>Work Assigned previously</h1>

<p><label>Enter the Date</label></p>
<p><input type="text" name="Date"/></p>
<p><label>Enter the Time</label></p>
<p><input type="text" name="Time"/></p>
<p><input type="submit" value="Click" /></p>

<%
//date & time are taken from the user
String Date=request.getParameter("Date");
String Time = request.getParameter("Time");
//int time = Integer.parseInt(Time);

String url = "jdbc:mysql://localhost/reminder";

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
    
   // the date & time taken from are checked with the database 
    String query=" select * from r where Date='"+Date+"' AND Time='"+Time+"' ";
    
    ResultSet re=stmt.executeQuery(query);
    
    
    while(re.next()){
    // query results in extraction of the work to do
    out.println("Work to do:\t"+re.getString("work")+"\n\n\n");
   //parsing of the time & reminder to obtain the time left to do the work 
    String min1 = re.getString("reminder");
    
    String min2 = Time;
   
    
    DateFormat sdf = new SimpleDateFormat("HH:mm");

    Date parse = sdf.parse(min1);
    Date parse2 = sdf.parse(min2);
    //Date diff = new Date();
    long diff = parse2.getHours() - parse.getHours();
    
    Date date = new Date(diff);
    String format = sdf.format(date);
   // gives back the time left to do the work assigned previously
    out.println("time left to start:\t"+format+"\n\n\n");
    }
}else
    out.println("Connection refused");
    
}catch(Exception e){
out.println(e.getMessage());
} 
%>
<!---helps in redirecting the page to set the work to be done on future--->
<p><a href="assignment.jsp">Keep more Reminders</a>
</form>
</body>
</html>
