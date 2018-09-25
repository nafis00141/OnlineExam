<%-- 
    Document   : createExam
    Created on : Aug 2, 2018, 7:56:37 PM
    Author     : NafiS
--%>

<%@page import="dbHandler.dbOperations"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Aust Exam</title>
    </head>
    <body>
        <h1>Create Exam</h1>
        <%
            
            HttpSession sess = request.getSession();
            int userId = (int)sess.getAttribute("id");
            //out.println(userId);
            String userName = (String) sess.getAttribute("userName");
            out.println("UserID: "+userName+"<br><br>");
            String GetNumQ = request.getParameter("totalQuestion"); 
            String examTime = request.getParameter("examTime");
            String examName = request.getParameter("examName");
            if(examTime!=null){
                GetNumQ = (String)sess.getAttribute("totalQues");
                String[] questions;
                out.println("<br>Total Questions: "+GetNumQ+"<br>");
                out.println("<be>Exam Name: "+examName+"<br>");
                out.println("<be>Exam Time: "+examTime+"<br>");
                if(GetNumQ!=null){
                    int totalQuestion = Integer.parseInt(GetNumQ);
                    dbOperations dbo = new dbOperations();
                    String examId = dbo.addExam(examName, examTime, GetNumQ, userId+"");
                    out.println("ExamID : "+examId+"<br>");
                    for(int que=1;que<=totalQuestion;que++){
                        String ques = request.getParameter("ques"+que);
                        String allotedMarks = request.getParameter("markForQues"+que);
                        dbo.addQuestion(examId, userId+"", ques, allotedMarks);
                        out.println("<br><p2>Question no: "+que+"<p2><br>"+ques+"<br><p2>Alloted Marks: "+allotedMarks+"<p2><br>");
                    }
                }
                else{
                    out.println("Enter data Properly<br>");
                    //out.println(examTime+"<br>");
                }
            }
            else if(GetNumQ==null){
                
            
         %>
                <p2>Enter Total Number Of Question<p2>
                <form name="getNumberOfQues" action="createExam.jsp" method="POST">
                    <input type="text" name="totalQuestion" value="" size="20" />
                    <input type="submit" value="Submit" name="getNumQ"/>
                </form>
         
        <%
            }
            else if(GetNumQ!=null){

         %>
         
                <form name="question" action="createExam.jsp" method="POST">
         
        <%
                int totalQuestion = Integer.parseInt(GetNumQ);
                sess.setAttribute("totalQues", GetNumQ);
                for(int i=1;i<=totalQuestion;i++){
         %>
                
                    <p2>Question no <%=i%><p2><br>
                    <textarea style="height:80px;font-size:14pt" rows="4" cols="80" name="ques<%=i%>"></textarea><br>
                    <p2>Enter Alloted Marks for This Question<p2><br>
                    <input type="text" name="markForQues<%=i%>" value="" size="20" /><br><br><br>
                    
          
        <%
                } 
         %>
                <p2>Enter Exam Name<p2><br>
                <input type="text" name="examName" value="" size="20" /><br><br>
                <p2>Enter Total Time For Exam (Formate HH:MM)<p2><br>
                <input type="text" name="examTime" value="" size="20" />
                <input type="submit" value="Generate Question" name="genQuestion"/>
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
