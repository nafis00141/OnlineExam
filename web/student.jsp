<%-- 
    Document   : student
    Created on : Aug 1, 2018, 8:54:32 PM
    Author     : NafiS
--%>

<%@page import="java.util.ArrayList"%>
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
        <title>Student </title>

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
                            <a class="nav-link" href="student.jsp">Home <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="logout.jsp">Log Out</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>

        <div style="margin-top: 2%; padding: 70px;">
            

            <%
                HttpSession sess = request.getSession();
                int userId = (int)sess.getAttribute("id");
                //out.println(userId);
                String userName = (String) sess.getAttribute("userName");
                %><h1 class="h3 mb-3 font-weight-normal text-capitalize"><%=userName%>'s home</h1><br><%
                //out.println("<p >UserID: "+userName+"</p><br><br>");

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
        
            <div class="d-flex justify-content-between" style="margin:auto; padding: auto;"> 
                <form name="SearchExamForm" action="student.jsp" method="POST">
                    <input type="text" class="form-control" name="examName" placeholder="examName" size="20"  /> <br>
                    <button class="btn btn-default btn-lg" type="submit" value="Search Exam" name="Search Exam">Search Exam</button>
                </form>
            </div>

            <br>

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
                                %><div class="alert alert-primary" style="width:40%;" role="alert"><%
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

                                    <a class="btn btn-default" role="button" href="results.jsp?eid=<%=ExamID%>&sid=<%=userId%>">See Results</a><br><br>
            <%
                                }
                                else{


            %>
                                    <br>
                                    <input type="hidden" name="ExamTime<%=ExamID%>" value="<%=examTime%>">
                                    <button class="btn btn-default" value="Start Exam:<%=ExamID%>" name="Start Exam<%=examNum%>">Start Exam</button>
                                    <br><br> 

            <%
                                }
                                examNum++;
            %>
                                </div>
            <%
                            }
            %>


            <%

                            

                        }

                }

            %>
                     
                    </form>
        </div>
                 
         
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  </body>
</html>