<%-- 
    Document   : examAnswer
    Created on : Sep 7, 2018, 9:45:09 PM
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
        <title>Exam Answers</title>
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
            %><h1 class="h3 mb-3 font-weight-normal text-capitalize">Answer Paper</h1><br><%
            HttpSession sess = request.getSession();
            int userId = (int)sess.getAttribute("id");
            //out.println(userId);
            String userName = (String) sess.getAttribute("userName");
            //out.println("UserID: "+userName+"<br><br><br>");
            dbOperations dbo = new dbOperations();
            String marksGivenSub = request.getParameter("marksGiven");
            
            if(marksGivenSub!=null){
                String sid = request.getParameter("sid");
                //out.println("Studrnt Id: "+ sid+"<br>");
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
                //out.println("Exam Name: "+ examName+"<br>");
                //out.println("Studrnt Id: "+ sid+"<br>");

                
                ArrayList<String> questions = dbo.getAllQues(examName);
                ArrayList<String> answers = dbo.getAllAns(examName,sid);

                %>
                <form name="GradePaper" action="examAnswer.jsp" method="POST">        
                <%

                for(int quesNo=0,q=1,ansNo=1;quesNo<questions.size();quesNo=quesNo+2,q++,ansNo=ansNo+2){
                    %><div class="alert alert-primary " role="alert" style="height: auto%; width: 60%"><%
                    out.println("<br><p2><b>Question no: "+q+"</b><p2><br><b>"+questions.get(quesNo) +"</b><br><p2><b>Alloted Marks: "+questions.get(quesNo+1)+"</b><p2><br><br>");
                    out.println("Answer: <b>"+answers.get(ansNo) +"</b><br><br>");

                    %>

                    Enter Marks:<br>
                    <input type="text" name="ans<%=answers.get(ansNo-1)%>" >
                    <br>
                    </div>

                    <%


                }

                %>
                <input type="hidden" name="sid" value="<%=sid%>">
                
                <button type="submit" class="btn btn-default" value="marks" name="marksGiven">Submit</button>
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