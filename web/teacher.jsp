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
        <header>
            <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
                <div id="navbarNavDropdown" class="navbar-collapse collapse">
                    <ul class="navbar-nav mr-auto">
                        <a class="navbar-brand" href="#">Aust Exams</a>
                    </ul>
                    <ul class="navbar-nav">
                         <li class="nav-item active">
                            <a class="nav-link" href="teacher.jsp">Home <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="logout.jsp">Log Out</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        
        <div style="margin:auto; padding: 70px;">
        
        <%
            HttpSession sess = request.getSession();
            int userId = (int)sess.getAttribute("id");
            //out.println(userId);
            String userName = (String) sess.getAttribute("userName");
            //out.println("UserID: "+userName+"<br><br>");
            %><h1 class="h3 mb-3 font-weight-normal text-capitalize"><%=userName%>'s home</h1><br><%
         %>
         
        <form name="createExam" action="createExam.jsp" method="POST">
            <button type="submit" class="btn btn-default" value="Create New Exam" name="crE">Create New Exam</button>
        </form><br>
         
        <div class="alert alert-info" role="alert" style="width: 20%">
                All Exam Set by You: 
        </div><br>
        
        
        
        <%
            dbOperations dbo = new dbOperations();
            ArrayList<String> exams = dbo.getAllExams(userId+"");
            
            
            
            for(String a: exams){
        %>
            <div class="alert alert-primary" role="alert" style="height: 11%; width: 60%">
                <a href="examQuestion.jsp?examName=<%=a%>"><%=a%><br></a>
                <div class="alert alert-secondary" role="alert">
                    <a href="examPapers.jsp?examName=<%=a%>">Submitted Papers On <%=a%> </a>
                </div>
            </div>
            
            
        <%
            } 
        %>  
        
        </div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  </body>
</html>
