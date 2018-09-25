<%-- 
    Document   : examQuestion
    Created on : Aug 2, 2018, 10:57:58 PM
    Author     : NafiS
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dbHandler.dbOperations"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exam Question</title>
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
            ArrayList<String> questions = dbo.getAllQues(examName);
            
            for(int quesNo=0,q=1;quesNo<questions.size();quesNo=quesNo+2,q++){
                out.println("<br><p2>Question no: "+q+"<p2><br>"+questions.get(quesNo) +"<br><p2>Alloted Marks: "+questions.get(quesNo+1)+"<p2><br>");
            }

         %>
         
         <br>
         <br>
         <%
            out.println("---------------------------------------------------------------------------------------------<br>");
           
             %>
         <a href="teacher.jsp">Home</a>
    </body>
</html>
