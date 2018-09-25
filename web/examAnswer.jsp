<%-- 
    Document   : examAnswer
    Created on : Sep 7, 2018, 9:45:09 PM
    Author     : NafiS
--%>

<%@page import="java.util.Enumeration"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dbHandler.dbOperations"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exam Answers</title>
    </head>
    <body>
        
         <%!
        public String htmlFilter(String message) {
                if (message == null) return null;
                int len = message.length();
                StringBuffer result = new StringBuffer(len + 20);
                char aChar;
                for (int i = 0; i < len; ++i) {
                aChar = message.charAt(i);
                switch (aChar) {
                case '<': result.append("&lt;"); break;
                case '>': result.append("&gt;"); break;
                case '&': result.append("&amp;"); break;
                case '"': result.append("&quot;"); break;
                default: result.append(aChar);
                }
                }
                return (result.toString());
        }  
        %>
        
        <%
            
            HttpSession sess = request.getSession();
            int userId = (int)sess.getAttribute("id");
            //out.println(userId);
            String userName = (String) sess.getAttribute("userName");
            out.println("UserID: "+userName+"<br><br><br>");
            dbOperations dbo = new dbOperations();
            String marksGivenSub = request.getParameter("marksGiven");
            
            if(marksGivenSub!=null){
                String sid = request.getParameter("sid");
                out.println("Studrnt Id: "+ sid+"<br>");
                Enumeration names = request.getParameterNames();
                String element = "",ans = "";
                ArrayList<Integer> aid = new ArrayList<Integer>();
                ArrayList<Integer> res = new ArrayList<Integer>();
                while(names.hasMoreElements()){
                    element = htmlFilter(names.nextElement().toString());
                    
                    if(element.toLowerCase().contains("ans")){
                        ans = request.getParameter(element);
                        element = element.replace("ans","");
                        aid.add(Integer.parseInt(element));
                        //out.println(element+"<br>");
                        //out.println(ans+"<br>");
                        res.add(Integer.parseInt(ans));
                    }
                   
                }
                boolean up = dbo.updateResult(Integer.parseInt(sid),aid,res);
                
                if(up==true){
                    %>
                       <p2>Marks Updated</p2>
                       
                    <%
                     
                }
                else{
                    out.println("problem assigning marks<br>");
                }
                
            }
            else{
                String examName = request.getParameter("examName");
                String sid = request.getParameter("sid");
                out.println("Exam Name: "+ examName+"<br>");
                out.println("Studrnt Id: "+ sid+"<br>");

                
                ArrayList<String> questions = dbo.getAllQues(examName);
                ArrayList<String> answers = dbo.getAllAns(examName,sid);

                %>
                <form name="GradePaper" action="examAnswer.jsp" method="POST">        
                <%

                for(int quesNo=0,q=1,ansNo=1;quesNo<questions.size();quesNo=quesNo+2,q++,ansNo=ansNo+2){
                    out.println("<br><p2>Question no: "+q+"<p2><br>"+questions.get(quesNo) +"<br><p2>Alloted Marks: "+questions.get(quesNo+1)+"<p2><br>");
                    out.println("Answer: "+answers.get(ansNo) +"<br>");

                    %>

                    Enter Marks:<br>
                    <input type="text" name="ans<%=answers.get(ansNo-1)%>" >
                    <br>


                    <%


                }

                %>
                <input type="hidden" name="sid" value="<%=sid%>">
                <input type="submit" value="marks" name="marksGiven"/>
                </form>
            <%
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
