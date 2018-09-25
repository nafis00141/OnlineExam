<%-- 
    Document   : index
    Created on : Aug 1, 2018, 5:33:06 PM
    Author     : NafiS
--%>

<%@page import="dbHandler.dbOperations"%>
<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AUST Exams</title>
    </head>
    <body>
        <h1>AUST Exams</h1>
        
        
        
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
        
        <form name="loginForm" action="index.jsp" method="POST">
            <input type="text" name="userName" placeholder="username" size="20" value="<%= uname %>" /> <br></br>
            <input type="password" name="password" placeholder="password" size="20" /><br></br>
            <input type="submit" value="LogIn" name="log"/>
        </form>
         
        
        <br>
        <form name="register" action="register.jsp" method="POST">
            <input type="submit" value="Register" name="reg"/>
        </form>    
    </body>
</html>
