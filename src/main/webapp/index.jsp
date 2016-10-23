<%-- 
    Document   : index
    Created on : Sep 28, 2014, 7:01:44 PM
    Author     : Administrator
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Instagrim</title>
        <link rel="stylesheet" type="text/css" href="Styles.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <header>
            <h1>InstaGrim ! </h1>
            <h2>Your world in Black and White</h2>
        </header>
        <%          
        LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
        if (lg != null) {
        String UserName = lg.getUsername();
        }
        %>
        <nav>
            <ul>
                <table>
                    <% if (lg != null) {
                        if (lg.getlogedin()) { %>
                    <tr>
                       <body>
                            Logged in as <%=lg.getUsername()%>
                       </body>
                    </tr>
                    <% } %>
                    <tr>
                        <th>
                            <input type="button" onclick="location.href='/Instagrim';" value="Home" />
                        </th>
                    </tr>
                    <tr>
                        <th>
                            <input type="button" onclick="location.href='upload.jsp';" value="Upload" />
                        </th>
                    </tr>
                    <% if (lg.getlogedin()) { %>
                    <tr>
                        <th>  
                            <input type="button" onclick="location.href='/Instagrim/Images/<%=lg.getUsername()%>';" value="Your Images" />
                        </th>
                    </tr>
                    <tr>
                        <th>
                            <form method="POST"  action="Logout">
                                <input type="submit" value="Logout"> 
                            </form>
                        </th>
                    </tr>
                    <% } }else { %>
                    <tr>
                        <th>
                            <input type="button" onclick="location.href='register.jsp';" value="Regester" />
                        </th>
                    </tr>
                    <tr>
                        <th>
                            <input type="button" onclick="location.href='login.jsp';" value="Login" />
                        </th>
                    </tr>
                    <% } %>
                </table>
            </ul>
        </nav>
        <footer>
            <ul>
                <body>
                    &COPY; Warren Mansell <br>
                    140009534
                </body>
            </ul>
        </footer>
    </body>
</html>
