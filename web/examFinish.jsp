<%-- 
    Document   : examFinish
    Created on : Aug 21, 2018, 7:45:48 PM
    Author     : NafiS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Aust Exams</title>
    </head>
    <body>
        <%
            HttpSession sess = request.getSession();
            int userId = (int)sess.getAttribute("id");
            //out.println(userId);
            String userName = (String) sess.getAttribute("userName");
            out.println("UserID: "+userName+"<br><br>");
         %>
        <h1>Exam Finished</h1>
        <p>Your exam is finished.</p>
        <p>You will get your marks after evaluation is done<p>
        <p>Go Home<p>
        <br><br>
        <a href="student.jsp">Home</a>
    </body>
</html>
