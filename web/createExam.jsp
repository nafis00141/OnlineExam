<%-- 
    Document   : createExam
    Created on : Aug 2, 2018, 7:56:37 PM
    Author     : NafiS
--%>

<%@page import="dbHandler.dbOperations"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Aust Exam</title>
    </head>
    <body>
        <header>
            <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
                <div id="navbarNavDropdown" class="navbar-collapse collapse">
                    <ul class="navbar-nav mr-auto">
                        <a class="navbar-brand" href="#">Aust Exams</a>
                    </ul>
                    <ul class="navbar-nav">
                         <li class="nav-item active">
                            <a class="nav-link" href="teacher.jsp">Home <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="logout.jsp">Log Out</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        <div style="margin:auto; padding: 70px;">
        <%
            
            HttpSession sess = request.getSession();
            int userId = (int)sess.getAttribute("id");
            //out.println(userId);
            String userName = (String) sess.getAttribute("userName");
            //out.println("UserID: "+userName+"<br><br>");
            
            String GetNumQ = request.getParameter("totalQuestion"); 
            String examTime = request.getParameter("examTime");
            String examName = request.getParameter("examName");
            if(examTime!=null){
                %><h1 class="h3 mb-3 font-weight-normal text-capitalize">Question Paper</h1><br><%
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
                        %><div class="alert alert-primary" role="alert" style="height: auto%; width: auto%"><%
                        out.println("<p2><b>Question no: "+que+"</b></p2><br><b>"+ques+"</b><br><p2>Alloted Marks: <b>"+allotedMarks+"</b><p2><br>");
                        %></div><%
                    }
                }
                else{
                    out.println("Enter data Properly<br>");
                    //out.println(examTime+"<br>");
                }
            }
            else if(GetNumQ==null){
                %><h1 class="h3 mb-3 font-weight-normal text-capitalize"><%=userName%>'s Exam Create Page</h1><br><%
            
         %>
                <div style=" width: 30%"> 
                    <p2><b>Enter Total Number Of Question</b><p2>
                    <form name="getNumberOfQues" action="createExam.jsp" method="POST">
                        <input type="text" class="form-control" name="totalQuestion" value="" size="20" /><br>
                        
                        <button class="btn btn-default btn-lg" type="submit" value="Submit" name="getNumQ">Enter</button><br><br>
                    </form>
                </div>
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
                
                    <p2><b>Question no <%=i%></b><p2><br>
                    <textarea class="form-control" style="height:185px;font-size:14pt;width: 70%" rows="4" cols="80" name="ques<%=i%>"></textarea><br>
                    <p2><b>Enter Alloted Marks for This Question</b><p2><br>
                    <input class="form-control" type="text" name="markForQues<%=i%>" value="" size="20" style="width: 20%"/><br><br><br>
                    
          
        <%
                } 
         %>
                <p2><b>Enter Exam Name<b><p2><br>
                <input class="form-control" type="text" name="examName" value="" size="20" style="width: 20%"/><br><br>
                <p2><b>Enter Total Time For Exam (Formate HH:MM:SS)<b><p2><br>
                <input class="form-control" type="text" name="examTime" value="" size="20" style="width: 20%"/><br>
                <button class="btn btn-default btn-lg" type="submit" value="Generate Question" name="genQuestion">Generate Question</button><br><br>
                </form>
                
        <%  
                
                
            
            } 
            
         %>
         <br>
         <br>
         </div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  </body>
</html>