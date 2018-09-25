<%-- 
    Document   : examPapers
    Created on : Sep 7, 2018, 9:31:01 PM
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
        <title>Exam Papers Evaluation</title>
    </head>
    <body>
        <%
            HttpSession sess = request.getSession();
            int userId = (int)sess.getAttribute("id");
            //out.println(userId);
            String userName = (String) sess.getAttribute("userName");
            out.println("UserID: "+userName+"<br><br><br>");
            String examName = request.getParameter("examName");
            out.println("Exam Name: "+ examName+"<br>");
            
            dbOperations dbo = new dbOperations();
            ArrayList<ArrayList> fin = dbo.getAllSubmittedAnswes(examName);
            
            ArrayList<String> names = fin.get(0);
            ArrayList<String> ids = fin.get(1);
            
        %>
            <br><br><p2>List of Answer Papers</p2><br><br>
        <%
            
            for (int i = 0; i < ids.size(); i++) { 
                
                String name = names.get(i);
                String idd = ids.get(i);
        %>
               <a href="examAnswer.jsp?examName=<%=examName%>&sid=<%=idd%>"><%=name%></a><br><br>
        <%
            } 
        %>  
        
        <%
            out.println("---------------------------------------------------------------------------------------------<br>");
           
             %>
        <a href="teacher.jsp">Home</a>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  </body>
</html>