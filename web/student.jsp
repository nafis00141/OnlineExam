<%-- 
    Document   : student
    Created on : Aug 1, 2018, 8:54:32 PM
    Author     : NafiS
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dbHandler.dbOperations"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student</title>

    </head>
    
    <body>
        <h1>Student</h1>
        <p id="demo"></p>
        <%
            HttpSession sess = request.getSession();
            int userId = (int)sess.getAttribute("id");
            //out.println(userId);
            String userName = (String) sess.getAttribute("userName");
            out.println("UserID: "+userName+"<br><br>");
            
            String clickedStExam = "";
            dbOperations dboo = new dbOperations();
            int kk = dboo.getNumOfExams();
            
            for(int i=1;i<=kk;i++){
                String p = "Start Exam"+i;
                System.out.println(p);
                clickedStExam = (String) request.getParameter(p);
                if(clickedStExam!=null) break;
            }
            
            System.out.println("clickedStExam");
            if(clickedStExam!=null)out.println("examId :" + clickedStExam);
            System.out.println("examId : " + clickedStExam);
            
            if(!(clickedStExam==null)){
                String[] partss = clickedStExam.split(":");
                int examId = Integer.parseInt(partss[1]);
                System.out.println("examId : " + examId);
                sess.setAttribute("ExamId", examId);
                String examTime = request.getParameter("ExamTime"+examId);
                sess.setAttribute("ExamTime", examTime);
                response.sendRedirect("examPage.jsp");
            }
         %>
         
        <form name="SearchExamForm" action="student.jsp" method="POST">
            <input type="text" name="examName" placeholder="examName" size="20"  /> <br>
            <input type="submit" value="Search Exam" name="Search Exam"/>
        </form>
         
        <br><br>

        <%
            String finButton =  (String) request.getParameter("Search Exam");
             
            if(finButton!=null && finButton.equals("Search Exam")){
                String examName = (String) request.getParameter("examName");
                dbOperations dbo = new dbOperations();
                ArrayList<String> res = dbo.getExam(examName );
                String ExamID = "";
                int resIndex = 0;
                
                    %>
                <form name="StExam" action="student.jsp" method="POST">
                    
                    <%
                 
                int examNum = 1;
                String examTime = "";
                for(String s:res){
                    resIndex++;
                    if(resIndex==1) {
                        ExamID = s;
                    }
                    else if(resIndex==2) out.println("Exam Name: "+s+"<br>");
                    else if(resIndex==3){
                        out.println("Exam Time: "+s+"<br>");
                        examTime = s;
                    }
                    else if(resIndex==4) continue;
                    else if(resIndex==5){
                        out.println("Exam Teacher: "+s+"<br>");
                        resIndex = 0;
                        
                        int gaveExam = dbo.studentGaveExam(userId,Integer.parseInt(ExamID));
                        
                        if(gaveExam==1){
                            out.println("<br>Exam Allready Given<br>");
                            %>
                            <a href="results.jsp?eid=<%=ExamID%>&sid=<%=userId%>">See Results</a><br><br>
                            <%
                        }
                        else{
                            
                        
                        %>
                            <br>
                            <input type="hidden" name="ExamTime<%=ExamID%>" value="<%=examTime%>">
                            <button type="submit" value="Start Exam:<%=ExamID%>" name="Start Exam<%=examNum%>">Start Exam</button>
                        <br>                    
                    <br>                        
                        <%
                        }
                        examNum++;
                    }
                    %>
                            
                    
                    <%
                    
                    //System.out.println(examNum);
                    
                }
                
            }

         %>
                 </form>
                 
         <%
            out.println("---------------------------------------------------------------------------------------------<br>");
           
             %>
                 
                 <a href="logout.jsp">LOG OUT</a>
    </body>
</html>
