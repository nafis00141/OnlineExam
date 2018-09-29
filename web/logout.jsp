<%-- 
    Document   : logout
    Created on : Sep 8, 2018, 12:25:18 AM
    Author     : NafiS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">


        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout</title>
        <div class="h3 mb-3 font-weight-normal text-capitalize">
            
            <%
                HttpSession sess = request.getSession();
                //int userId = (int)sess.getAttribute("id");
                //out.println(userId);
                String userName = (String) sess.getAttribute("userName");
                //out.println(userName);
                sess.invalidate();
                out.print("<br><br>");
                //out.print("--------------------------<br>");
                out.print("Have a nice day "+userName +" :) ");
                //out.print("<br>-------------------------<br>");
                out.print("<br><br>");
                out.print("<br><br>");
                RequestDispatcher requestDispatcher; 
                requestDispatcher = request.getRequestDispatcher("/index.jsp");
                requestDispatcher.include(request, response);

             %>
        </div>
        </head>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  </body>
</html>

