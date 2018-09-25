<%-- 
    Document   : register
    Created on : Aug 1, 2018, 6:26:31 PM
    Author     : NafiS
--%>

<%@page import="dbHandler.dbOperations"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AUST Exams</title>
    </head>
    <body>
        <h1>Register</h1>
        
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
        
        <form name="regForm" action="register.jsp" method="POST">
            <input type="text" name="userName" placeholder="username" size="20"  /> <br></br>
            <input type="password" name="password" placeholder="password" size="20" /><br></br>
            <input type="radio" name="student" value="student">Student<br>
            <input type="radio" name="teacher" value="teacher">Teacher<br>
            <input type="submit" value="Reg" name="reg"/>
        </form>
    </body>
</html>
