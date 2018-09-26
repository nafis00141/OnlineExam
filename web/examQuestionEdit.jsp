<%-- 
    Document   : examQuestionEdit
    Created on : Sep 27, 2018, 4:20:39 AM
    Author     : NafiS
--%>

<%@page import="java.util.Enumeration"%>
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
        <title>Exam Question</title>
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
            //out.println("UserID: "+userName+"<br><br><br>");
            String examName = request.getParameter("examName");
            //out.println("Exam Name: "+ examName+"<br>");
            
            dbOperations dbo = new dbOperations();
            
            String clicked = request.getParameter("editQues"); 
            String element = "",ques = "",mark = "";
            ArrayList<Integer> aid = new ArrayList<Integer>();
            ArrayList<Integer> res = new ArrayList<Integer>();
            
            if(clicked!=null){
                
                
                Enumeration names = request.getParameterNames();
                while(names.hasMoreElements()){
                    element = htmlFilter(names.nextElement().toString());
                    
                    if(element.contains("qus")){
                        element = element.replace("qus","");
                        ques = request.getParameter("qus"+element);
                        mark = request.getParameter("mark"+element);
                        dbo.updateQuestion(element, ques, mark);
                    }
                   
                }
                
                response.sendRedirect("examQuestion.jsp?examName="+clicked);
                
            }
            
            
            %><h1 class="h3 mb-3 font-weight-normal text-capitalize"><%=userName%>'s <%=examName%> Question Paper Edit</h1><br><%
            
            
            ArrayList<ArrayList<String>> ress = dbo.getAllQue(examName);
            
            
            
            ArrayList<String> id = ress.get(0);
            ArrayList<String> questions = ress.get(1);
            ArrayList<String> marks = ress.get(2);
            
            %>
            
            <form name="editExam" action="examQuestionEdit.jsp" method="POST"><%
                
                
            
            for(int quesNo=0;quesNo<questions.size();quesNo++){
                %>
                <div class="alert alert-primary" role="alert" style="height: auto%; width: auto%">
                <%out.println("<p2><b>Question no: "+quesNo+"</b><br>");%>
                <textarea class="form-control" style="height:185px;font-size:14pt;width: 70%" rows="4" cols="80" name="qus<%=id.get(quesNo)%>"><%=questions.get(quesNo)%></textarea><br>
                <b>Alloted Marks:</b>
                <input class="form-control" type="text" name="mark<%=id.get(quesNo)%>" value="<%=marks.get(quesNo)%>" size="20" style="width: 20%;"/>
                </div>
                
            <%}%>
            
                <button type="submit" class="btn btn-default" value="<%=examName%>" name="editQues">Submit</button>
            
            </form>
            
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
