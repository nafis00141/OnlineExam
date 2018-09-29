<%-- 
    Document   : results
    Created on : Sep 8, 2018, 12:34:07 AM
    Author     : NafiS
--%>

<%@page import="dbHandler.dbOperations"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Results</title>
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
                            <a class="nav-link" href="student.jsp">Home <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="logout.jsp">Log Out</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        <div style="margin-top:20%; padding: auto;">
        <%
            HttpSession sess = request.getSession();
            int userId = (int)sess.getAttribute("id");
            
            String userName = (String) sess.getAttribute("userName");
            
            
            String eid = request.getParameter("eid"); 
            
            String sid = request.getParameter("sid"); 
            
            dbOperations dbo = new dbOperations();
            
            ArrayList<String> ans = dbo.getNumber(eid,sid);
            
            String examName = dbo.getExamName(eid);
            
            
            
            int res = Integer.parseInt(ans.get(0));
            
            int tot = Integer.parseInt(ans.get(1));
            
            if(res<0){
                %><div class="alert alert-danger text-center" role="alert" style="height: auto%; width: 35%; left: 35%"><%
                    out.println("<h2 class=\"text-capitalize\">"+userName+" your result is not Published yet</h2>");
                %></div><%
            }
            else{
                %><div class="alert alert-success text-center" role="alert" style="height: auto%; width: 35%; left: 35%; "><%
                    out.println("<h2 class=\"text-capitalize\">"+userName+" you got "+res+" out of "+tot+" in "+examName+"</h2>");
                %></div><%
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
