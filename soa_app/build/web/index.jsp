
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome Page</title>
        <style><%@include file="/WEB-INF/app_css.css"%></style>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <header>
            <a class="logos" href="index.jsp">SOA Management System for Red Hotel</a>
            <ul class="right">
            <li><a> Header1 </a></li>
            <li><a> Header2 </a></li>
            <li><a> Header3 </a></li>
<!--            <li><a><%out.println(getServletContext().getInitParameter("Header-Value9"));%></a></li>-->
            </ul>
            
        </header>
        <div class="container-login">
        <h1>Login Page</h1>
        <br>
        <div class="content">
        <form method="POST" action="${pageContext.request.contextPath}/login">
          <div class="user-details">
           
            <div class="input-box">
                <h4 class="detail">Username</h4>
                <input name="loginuser" type ="text" size="30" placeholder="Username"/>
            </div>
              
            <div class="input-box">
                <h4 class="detail">Password</h4>
                <input name="loginpass" type ="password" size="30" placeholder="Password"/>
            </div>
              
            <div class="button">
                <a href="forgot_pass.jsp">Forgot Password?</a>
            </div>
            <br>
          <div class="button">
            <input type="submit" value="Log In"/>
          </div>
        </form>
          </div>
            </div>
            </div>
<!--        <footer>
                <a class="logos"><%out.println(getServletContext().getInitParameter("Footer-Value1"));%></a>
                <ul class="right">
                <li><a href="<%out.println(getServletContext().getInitParameter("Footer-Value5"));%>"><%out.println(getServletContext().getInitParameter("Footer-Value2"));%></a></li>
                <li><a href="<%out.println(getServletContext().getInitParameter("Footer-Value6"));%>"><%out.println(getServletContext().getInitParameter("Footer-Value3"));%></a></li>
                <li><a href="<%out.println(getServletContext().getInitParameter("Footer-Value7"));%>"><%out.println(getServletContext().getInitParameter("Footer-Value4"));%></a></li>
                </ul>
                 
        </footer>  -->
    </body>
</html>
