<%-- 
    Document   : UsersPics
    Created on : Sep 24, 2014, 2:52:48 PM
    Author     : Administrator
--%>

<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Instagrim</title>
        <link rel="stylesheet" type="text/css" href="/Instagrim/Styles.css" />
    </head>
    <body>
        <header>
        
        <h1>InstaGrim ! </h1>
        <h2>Your world in Black and White</h2>
        </header>
        
        <%          
        LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
        String UserName = lg.getUsername();
        %>
        <nav>
            <ul>
                <table>
                    <% if (lg.getlogedin()) { %>
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
                    <% } else { %>
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
 
        <article>
            <h1>Your Pics</h1>
        <%
            java.util.LinkedList<Pic> lsPics = (java.util.LinkedList<Pic>) request.getAttribute("Pics");
            if (lsPics == null) {
        %>
        <p>No Pictures found</p>
        <%
        } else {
            Iterator<Pic> iterator;
            iterator = lsPics.iterator();
            while (iterator.hasNext()) {
                Pic p = (Pic) iterator.next();

        %>
        <a href="/Instagrim/Image/<%=p.getSUUID()%>" ><img src="/Instagrim/Thumb/<%=p.getSUUID()%>"></a><br/><%

            }
            }
        %>
        </article>
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
