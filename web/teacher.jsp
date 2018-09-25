<%-- 
    Document   : teacher
    Created on : Aug 1, 2018, 8:55:00 PM
    Author     : NafiS
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dbHandler.dbOperations"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

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
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  </body>
</html>
