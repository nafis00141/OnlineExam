<%-- 
    Document   : teacher
    Created on : Aug 1, 2018, 8:55:00 PM
    Author     : NafiS
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dbHandler.dbOperations"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Teacher</title>
    </head>
    <body>
        <h1>Teacher</h1>
        
        <%
            HttpSession sess = request.getSession();
            int userId = (int)sess.getAttribute("id");
            //out.println(userId);
            String userName = (String) sess.getAttribute("userName");
            out.println("UserID: "+userName+"<br><br>");
         %>
         
        <form name="createExam" action="createExam.jsp" method="POST">
            <input type="submit" value="Create New Exam" name="crE"/>
        </form><br><br>
         
         
        <p2>All Exam Set by You:<p2><br><br>
        
        <%
            dbOperations dbo = new dbOperations();
            ArrayList<String> exams = dbo.getAllExams(userId+"");
            
            
            
            for(String a: exams){
        %>
            <a href="examQuestion.jsp?examName=<%=a%>"><%=a%></a><br><br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="examPapers.jsp?examName=<%=a%>">Submitted Papers On <%=a%> </a><br><br>
        <%
            } 
        %>  
        <%
            out.println("---------------------------------------------------------------------------------------------<br>");
           
             %>
        
        <a href="logout.jsp">LOG OUT</a>
    </body>
</html>
