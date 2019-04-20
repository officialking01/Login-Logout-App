<%@page errorPage="Error.jsp"%>

<%
    java.util.HashMap userDetails = (java.util.HashMap) session.getAttribute("userDetails");
    if (userDetails != null) {
        String e = (String) userDetails.get("email");
        String n = (String) userDetails.get("name");
        String p = (String) userDetails.get("phone");
        Integer a = (Integer) userDetails.get("age");
%>
<html>
    <head>
        <title>Login-Logut App</title>
    </head>
    <body bgcolor ='#ff8080'>
        <h1><center>Login-Logut App</center></h1>
        <h1 align='right'><a href='Logout.jsp'>Logout</a></h1>
        <hr><br>
        
        Welcome : <%=n%>
        <br> Email :<%=e%>
        <br> Phone : <%=p%>
        <br> Age : <%=a%>
    </body>
</html>	
<%
    }
        else{   
                session.setAttribute("msg","Plz Login First!");
                response.sendRedirect("loginD.jsp");
    }
%>