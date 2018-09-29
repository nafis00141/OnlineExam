<%-- 
    Document   : register
    Created on : Aug 1, 2018, 6:26:31 PM
    Author     : NafiS
--%>

<%@page import="dbHandler.dbOperations"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">


        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AUST Exams</title>
    </head>
    <body class="text-center" style="margin:auto; padding: 150px;">
        
        <h1 class="h3 mb-3 font-weight-normal">Register</h1>
        
        <%
            String clicked = request.getParameter("reg"); 
            dbOperations dbo = new dbOperations();
            if( "Reg".equals(clicked) ){
                String clickedSt = request.getParameter("student"); 
                String clickedTe = request.getParameter("teacher");
                String userName = request.getParameter("userName");
                String password = request.getParameter("password");
                if(userName.equals("")||password.equals("")){
                    out.println("Please Enter UserName and Password");
                }
                else if(clickedSt==null && clickedTe==null){
                    out.println("Please Select an Option");
                }
                else if(clickedSt!=null && clickedSt.equals("student") && clickedTe==null){
                    out.println(clickedSt);
                    String res = dbo.addUser(userName, password, "student");
                    if(res.equals("Successfully Added New User!")){
                        RequestDispatcher requestDispatcher; 
                        requestDispatcher = request.getRequestDispatcher("/index.jsp");
                        requestDispatcher.forward(request, response);
                        //response.sendRedirect("index.jsp");
                    }
                    else{
                        
                    }
                }
                else if(clickedTe!=null && clickedTe.equals("teacher") && clickedSt==null){
                    out.println(clickedTe);
                    String res = dbo.addUser(userName, password, "teacher");
                    if(res.equals("Successfully Added New User!")){
                        RequestDispatcher requestDispatcher; 
                        requestDispatcher = request.getRequestDispatcher("/index.jsp");
                        requestDispatcher.forward(request, response);
                        //response.sendRedirect("index.jsp");
                    }
                    else{
                        out.println("here");
                    }
                }
                else if(clickedSt.equals("student") && clickedTe.equals("teacher")){
                    out.println("Can not Choose both Options");
                }
                
            }

        %>
        
            <div class="col-lg-2 center-block" style="margin:auto; padding: auto;">               
               <form name="regForm" action="register.jsp" method="POST">
                   <input type="text" class="form-control"  name="userName" placeholder="username" size="20"  /> <br>
                   <input type="password" class="form-control"  name="password" placeholder="password" size="20" /><br>
                   <div class="h4 mb-3 font-weight-normal">
                       <input type="radio" name="student" value="student"> Student<br><br>
                       <input type="radio" name="teacher" value="teacher"> Teacher<br><br>
                    </div>
                   <button class="btn btn-default btn-lg" type="submit" value="Reg" name="reg">Register</button><br><br>

               </form>
            </div>
            <a class="btn btn-default" href="index.jsp" role="button">LogIn</a>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  </body>
</html>

