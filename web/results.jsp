<%-- 
    Document   : results
    Created on : Sep 8, 2018, 12:34:07 AM
    Author     : NafiS
--%>

<%@page import="dbHandler.dbOperations"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Results</title>
    </head>
    <body>
        <%
            HttpSession sess = request.getSession();
            int userId = (int)sess.getAttribute("id");
            //out.println(userId);
            String userName = (String) sess.getAttribute("userName");
            out.println("UserID: "+userName+"<br><br>");
            
            String eid = request.getParameter("eid"); 
            //out.println(eid);
            String sid = request.getParameter("sid"); 
            //out.println(sid);
            dbOperations dbo = new dbOperations();
            
            ArrayList<String> ans = dbo.getNumber(eid,sid);
            
            //out.println(ans);
            
            int res = Integer.parseInt(ans.get(0));
            
            int tot = Integer.parseInt(ans.get(1));
            
            if(res<0){
                out.println("<br><br><p2>Your result is not Published yet</p2>");
            }
            else{
                out.println("<br><br><p2>Your got "+res+" out of "+tot+"</p2>");
            }
            
            %>
            
        <%
            out.println("<br>---------------------------------------------------------------------------------------------<br>");
           
             %>
         <a href="student.jsp">Home</a>
    </body>
</html>
