<%-- 
    Document   : examPapers
    Created on : Sep 7, 2018, 9:31:01 PM
    Author     : NafiS
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dbHandler.dbOperations"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
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
    </body>
</html>
