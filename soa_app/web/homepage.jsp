
<%@page import="java.sql.ResultSet"%>
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
            <div class="search-bar1">  
            <form method="POST" action="${pageContext.request.contextPath}/search">
                    <div class="input-box">
                        <input name="loginpass" type ="text" size="30" placeholder="Search Bar (Reference Number)"/>
                    </div>
                <div class="button">
                    <input name="button-search"  type="submit" value = "Reference Search"/>
                </div>
            </form>
            </div>


            <form method="POST" action="${pageContext.request.contextPath}/search">
                <div class="input-box">
                    <input name="Date1" type ="date" id="demo" size="30" placeholder="Date A"/>
                </div>

                <h4 class="detail">To</h4>

                <div class="input-box">
                    <input name="Date2" type ="date" id="demo" size="30" placeholder="Date B"/>
                   
                </div>
                <div class="button">
                    <input name="button-search" type="submit" value = "Date Search"/>
                </div>
            </form>
          </div>
          
            
        
        <div class="user-details" >
        <div class="search-bar2">
        <form method="POST" action="${pageContext.request.contextPath}/search">
            <div class="input-box">
                <input name="loginpass" type ="text" size="30" placeholder="Client/Company Name"/>
            </div>
            <div class="button">
                <input name="button-search" type="submit" value = "Client Search"/>
            </div>
        </form>
        </div>
          
              
            
        <form method="POST" action="${pageContext.request.contextPath}/search">
            <div class="button">
                <input name="button-search" type="submit" value = "Display All"/>
            </div>
        </form>
            
          </div> 

         <div class="container-parent"> 
            <div class="container-grey" style="overflow-x:auto;">
                <table>
                <tr class="header-table">
                        <th width="11%" style="text-align:center" text-align="Center"> SOA NO. </th>
                        <th width="11%" style="text-align:center"> Date Created </th>
                        <th width="11%" style="text-align:center"> Client/Company </th>
                        <th width="11%" style="text-align:center"> OR Number </th>
                        <th width="11%" style="text-align:center"> Payable </th>
                        <th width="11%" style="text-align:center"> Payment Status </th>
                        <th width="11%" style="text-align:center"> Date of Payment </th>
                        <th width="11%" style="text-align:center"> Created By </th>
                </tr>
                
                <tr class="tableeven">
                    <% String hello = "    hellosr   ";%>
                        <td width="10%" style="text-align:center" text-align="Center"> SOA NO. </td>
                        <td width="10%" style="text-align:center"> Date Created </td>
                        <td width="10%" style="text-align:center"> Client/Company </td>
                        <td width="10%" style="text-align:center"> OR Number </td>
                        <td width="10%" style="text-align:center"> Payable </td>
                        <td width="10%" style="text-align:center"> Payment Status </td>
                        <td width="10%" style="text-align:center"> Date of Payment </td>
                        <td width="10%" style="text-align:center"> Created By </td>
                        <td width="6%" style="text-align:center"> 
                            <form method="POST" action="${pageContext.request.contextPath}/search">
                                <input type="hidden" name="maind-id" value= <% out.println(hello); %>> 
                                <div class="row-button">
                                <input name="button-search" type="submit" value = "Edit"/>
                                </div>
                             </form>
                        </td>
                        <td width="6%" style="text-align:center"> 
                            <form method="POST" action="${pageContext.request.contextPath}/login">
                                <div class="row-button">
                                <input type="submit" value = "View"/>
                                </div>
                             </form>
                        </td>
                        <td width="6%" style="text-align:center"> 
                            <form method="POST" action="${pageContext.request.contextPath}/login">
                                <div class="row-button">
                                <input type="submit" value = "Generate"/>
                                </div>
                             </form>
                        </td>
                        
                </tr>   
              <%ResultSet results = (ResultSet)session.getAttribute("results");
                while(results.next()) {
                 %>
                
                <tr class="tableodd">
                        <td width="10%" style="text-align:center" text-align="Center"> <%= results.getString("soa_num") %> </td>
                        <td width="10%" style="text-align:center">   <%= results.getString("soa_date") %> </td>
                        <td width="10%" style="text-align:center">  <%= results.getString("cust_name") %> </td>
                        <td width="10%" style="text-align:center">  <%= results.getString("or_num") %> </td>
                        <td width="10%" style="text-align:center">  <%= results.getString("payable") %>  </td>
                        <td width="10%" style="text-align:center"><%= results.getString("payment_stat") %> </td>
                        <td width="10%" style="text-align:center">  <%= results.getString("payment_date") %>  </td>
                        <td width="10%" style="text-align:center">  <%= results.getString("username") %> </td>
                        <td width="6%" style="text-align:center"> 
                            <form method="POST" action="${pageContext.request.contextPath}/search">
                                <input type="hidden" name="maind-id" value= <% out.println(hello); %>> 
                                <div class="row-button">
                                <input name="button-search" type="submit" value = "Edit"/>
                                </div>
                             </form>
                        </td>
                        <td width="6%" style="text-align:center"> 
                            <form method="POST" action="${pageContext.request.contextPath}/login">
                                <div class="row-button">
                                <input type="submit" value = "View"/>
                                </div>
                             </form>
                        </td>
                        <td width="6%" style="text-align:center"> 
                            <form method="POST" action="${pageContext.request.contextPath}/login">
                                <div class="row-button">
                                <input type="submit" value = "Generate"/>
                                </div>
                             </form>
                        </td>
                        <%} %>
                        
                </tr>
                
                </table>
            </div>
            <div class="child">
            <form method="POST" action="${pageContext.request.contextPath}/login">
                <div class="row-button">
                <input type="submit" value = "Create"/>
                </div>
            </form>
                
            <form method="POST" action="${pageContext.request.contextPath}/login">
                <div class="row-button">
                <input type="submit" value = "Reports"/>
                </div>
            </form>
                
            <form method="POST" action="${pageContext.request.contextPath}/login">
                <div class="row-button">
                <input type="submit" value = "Constants"/>
                </div>
            </form>
            </div>
         </div>

            <h2> Total Receivable: 0           Total Paid: 500          Total Amount: 500</h2>

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
