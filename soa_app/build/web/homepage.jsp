
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
        <div class="container-homepage">
        <div class="content">    
          <div class="user-details" >
              
        <form method="POST" action="${pageContext.request.contextPath}/login">
            <div class="input-box">
                <input name="loginpass" type ="password" size="30" placeholder="Search Bar (Reference Number)"/>
            </div>
            <div class="button">
                <input type="submit" value = "Search"/>
            </div>
        </form>
          
              
            
        <form method="POST" action="${pageContext.request.contextPath}/login">
            <div class="input-box">
                <input name="loginpass" type ="password" size="30" placeholder="Date A"/>
            </div>
            
            <h4 class="detail">To</h4>
      
            <div class="input-box">
                <input name="loginpass" type ="password" size="30" placeholder="Date B"/>
            </div>
                
            <div class="button">
                <input type="submit" value = "Search"/>
            </div>
        </form>
            
          </div> 
            
<div class="user-details" >
              
        <form method="POST" action="${pageContext.request.contextPath}/login">
            <div class="input-box">
                <input name="loginpass" type ="password" size="30" placeholder="Client/Company Name"/>
            </div>
            <div class="button">
                <input type="submit" value = "Search"/>
            </div>
        </form>
          
              
            
        <form method="POST" action="${pageContext.request.contextPath}/login">
            <div class="button">
                <input type="submit" value = "Display All"/>
            </div>
        </form>
            
          </div> 

            <div class="container-grey">
                <table>
                <tr class="header-table">
                        <td width="11%" style="text-align:center" text-align="Center"> SOA NO. </td>
                        <td width="11%" style="text-align:center"> Date Created </td>
                        <td width="11%" style="text-align:center"> Client/Company </td>
                        <td width="11%" style="text-align:center"> OR Number </td>
                        <td width="11%" style="text-align:center"> Payable </td>
                        <td width="11%" style="text-align:center"> Payment Status </td>
                        <td width="11%" style="text-align:center"> Date of Payment </td>
                        <td width="11%" style="text-align:center"> Created By </td>
                </tr>
                
                <tr class="tableeven">
                        <td width="11%" style="text-align:center" text-align="Center"> SOA NO. </td>
                        <td width="11%" style="text-align:center"> Date Created </td>
                        <td width="11%" style="text-align:center"> Client/Company </td>
                        <td width="11%" style="text-align:center"> OR Number </td>
                        <td width="11%" style="text-align:center"> Payable </td>
                        <td width="11%" style="text-align:center"> Payment Status </td>
                        <td width="11%" style="text-align:center"> Date of Payment </td>
                        <td width="11%" style="text-align:center"> Created By </td>
                </tr>
                
                <tr class="tableodd">
                        <td width="11%" style="text-align:center" text-align="Center"> SOA NO. </td>
                        <td width="11%" style="text-align:center"> Date Created </td>
                        <td width="11%" style="text-align:center"> Client/Company </td>
                        <td width="11%" style="text-align:center"> OR Number </td>
                        <td width="11%" style="text-align:center"> Payable </td>
                        <td width="11%" style="text-align:center"> Payment Status </td>
                        <td width="11%" style="text-align:center"> Date of Payment </td>
                        <td width="11%" style="text-align:center"> Created By </td>
                </tr>
                    
                </table>
                
            </div>
            </div>
            </div>

   <footer>
        <a class="logos">Footer</a>
        <ul class="right">
            <li> Footer 1 </a></li>
            <li> Footer 2 </a></li>
            <li> Footer 3 </a></li>
<!--                <li><a href="<%out.println(getServletContext().getInitParameter("Footer-Value6"));%>"><%out.println(getServletContext().getInitParameter("Footer-Value3"));%></a></li>
                <li><a href="<%out.println(getServletContext().getInitParameter("Footer-Value7"));%>"><%out.println(getServletContext().getInitParameter("Footer-Value4"));%></a></li>-->
            </ul>
                 
    </footer>
    </body>
</html>
