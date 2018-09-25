<%-- 
    Document   : logout
    Created on : Sep 8, 2018, 12:25:18 AM
    Author     : NafiS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout</title>
        <%
            HttpSession sess = request.getSession();
            //int userId = (int)sess.getAttribute("id");
            //out.println(userId);
            String userName = (String) sess.getAttribute("userName");
            //out.println(userName);
            sess.invalidate();
            out.print("<br><br>");
            out.print("--------------------------<br>");
            out.print("Have a nice day "+userName +" :) ");
            out.print("<br>-------------------------<br>");
            out.print("<br><br>");
            out.print("<br><br>");
            RequestDispatcher requestDispatcher; 
            requestDispatcher = request.getRequestDispatcher("/index.jsp");
            requestDispatcher.include(request, response);
            
         %>
    </head>
</html>
