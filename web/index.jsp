<%-- 
    Document   : index
    Created on : Aug 1, 2018, 5:33:06 PM
    Author     : NafiS
--%>

<%@page import="dbHandler.dbOperations"%>
<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <!-- Bootstrap CSS -->
        
        <title>AUST Exams</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

        <link href="signin.css" rel="stylesheet">
        
        <meta http-equiv="Content-Type" content="text/html;">
        
    </head>
    <body class="text-center" style="margin:auto; padding: 150px;">
        <h1 class="h3 mb-3 font-weight-normal">AUST Exams</h1>
        
        
        
        <%
            LocalDate date = LocalDate.now();
            
        %>
        
        <p>Today's Date: <%= date %><p>
            
        <%      
            String clicked = request.getParameter("log");
            //out.print("val "+clicked);
            //out.println("<br>");
            if( "LogIn".equals(clicked) ){
                String userName = request.getParameter("userName");
                String password = request.getParameter("password");
                if(userName.equals("")||password.equals("")){
                    out.println("Please Enter UserName and Password");
                    out.println("<br>");
                }
                else{
                    /**
                     *connect to database and check login
                     */
                    dbOperations dbo = new dbOperations();
                    String[] type = dbo.isUser(userName, password);
                    
                    if(type[1].equals("false")){
                        out.println("Please Enter Valid UserName and Password");
                        out.println("<br>");
                          
                    }
                    else if(type[1].equals("student")){
                        HttpSession sess = request.getSession();
                        sess.setAttribute("id", Integer.parseInt(type[0]));
                        sess.setAttribute("userName", userName);
                        response.sendRedirect("student.jsp");
                        System.out.println("here" + type[0]);
                    }
                    else if(type[1].equals("teacher")){
                        HttpSession sess = request.getSession();
                        sess.setAttribute("id", Integer.parseInt(type[0]));
                        sess.setAttribute("userName", userName);
                        response.sendRedirect("teacher.jsp");
                        System.out.println("here" + type[0]);
                    }
                    
                    
                }
            }
            
            String uname = request.getParameter("userName");
            
            if(uname==null){
                uname = "";
            }
            
        %>
        <div class="col-lg-3 center-block" style="margin:auto; padding: auto;">
            
            <form class="form-signin" name="loginForm" action="index.jsp" method="POST">
                <h1 class="h3 mb-3 font-weight-normal">Please sign in</h1>
                <label for="userName" class="sr-only">User Name</label>
                <input type="text" name="userName" class="form-control" placeholder="username" value="<%= uname %>" required> <br>
                <label for="password" class="sr-only">Password</label>
                <input type="password" name="password" class="form-control" placeholder="password" size="20" required><br></br>

                <button class="btn btn-lg btn-primary btn-lg" type="submit" value="LogIn" name="log">Sign in</button>
            </form>
        
        
            <br>
            <form class="form-signin" name="register" action="register.jsp" method="POST">
                <button class="btn btn-lg btn-primary btn-lg" type="submit" value="Register" name="reg">Register</button>
            </form> 
        
        </div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  </body>
</html>
