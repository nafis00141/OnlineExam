<%-- 
    Document   : examPage
    Created on : Aug 20, 2018, 11:59:04 PM
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
        <title>Exam Page</title>
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
        
        <div style="margin-top: 2%; padding: 70px;">
        
            <%
                HttpSession sess = request.getSession();
                int userId = (int)sess.getAttribute("id");

                dbOperations dbo = new dbOperations();
                
                String userName = (String) sess.getAttribute("userName");
                int ExamId = (int) sess.getAttribute("ExamId");
                String ExamTime = (String) sess.getAttribute("ExamTime");
                String[] parts = ExamTime.split(":");
                int sec = Integer.parseInt(parts[0])*60*60+ Integer.parseInt(parts[1])*60+Integer.parseInt(parts[2]);

                String FinishExamClick = request.getParameter("Finish Exam");

                ArrayList<Integer> QuesId = new ArrayList<Integer>();


                String examName = dbo.getExamName(ExamId+"");

                out.println("<h3>"+examName+ "Exam Page</h3>");
                
                if("ExamFin".equals(FinishExamClick)==false){


            %>
                    <br>
                    <h3 id="totalTime">Total Time: <%=ExamTime%></h3>
                    <h2><time>00:00:00</time></h2>
                
               
                
            <%
                
                
                    ArrayList<String> questions = dbo.getAllQues(ExamId);
                
            %>
                    <form name="Finish Exam" action="examPage.jsp" method="POST">

            <%

                    for(int quesNo=0,q=1;quesNo<questions.size();quesNo=quesNo+3,q++){
                        %><div class="alert alert-primary" role="alert" style="height: auto%; width: auto%"><%
                        out.println("<p2><b>Question no: "+q+"</b><p2><br><b>"+questions.get(quesNo) +"<br><p2><b>Alloted Marks: "+questions.get(quesNo+1)+"<b><p2><br>");
                        %>
                        <textarea style="height:185px;font-size:14pt;width: 70%" rows="4" cols="80" name="ans<%=Integer.parseInt(questions.get(quesNo+2))%>"></textarea><br>
                        <br>
                        <br>
                        <%
                        QuesId.add(Integer.parseInt(questions.get(quesNo+2)));
                        //out.println("ans"+Integer.parseInt(questions.get(quesNo+2)));
                        %></div><%
                    }
                    sess.setAttribute("QuesIds", QuesId);
                    %>



                       <button type="submit" class="btn btn-default" id ="FinishExam" value="ExamFin" name="Finish Exam">Finish Exam</button>
                   </form>
                
                    <script>
                        var h1 = document.getElementsByTagName('h2')[0],
                            stop = document.getElementById('FinishExam'),
                            seconds = 0, minutes = 0, hours = 0,
                            t,
                            totalTime = "<%out.print(sec+"");%>";
                            time = 0;

                        function add() {
                            seconds++;
                            time++;
                            if (seconds >= 60) {
                                seconds = 0;
                                minutes++;
                                if (minutes >= 60) {
                                    minutes = 0;
                                    hours++;
                                }
                            }



                            if(time>=totalTime) {
                              stop.click();
                              console.log("here" + totalTime);
                              h1.textContent = null;
                              return;
                            }
                            else{
                                h1.textContent = (hours ? (hours > 9 ? hours : "0" + hours) : "00") + ":" + (minutes ? (minutes > 9 ? minutes : "0" + minutes) : "00") + ":" + (seconds > 9 ? seconds : "0" + seconds);
                                timer();  
                            }

                        }
                        function timer() {
                            t = setTimeout(add, 1000);
                        }
                        timer();




                    </script>
                
            <%
                    
                
                }
                else{
                    QuesId = (ArrayList<Integer>) sess.getAttribute("QuesIds");

                    dbo.addExamStudent(userId, ExamId);
                    for(int i=0;i<QuesId.size();i++){
                       String ans = (String) request.getParameter("ans"+QuesId.get(i));
                       //out.println("QuesID = "+ QuesId.get(i) +" "+ans);
                       boolean a = dbo.addAnswer(QuesId.get(i)+"", userId+"", ans);
                    }
                    response.sendRedirect("examFinish.jsp");
                }
         
            %>
        </div>
         
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  </body>
</html>