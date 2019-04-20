<html>
    <head>
        <title>Login-Logut App</title>
    </head>
    <body bgcolor ="#ff8080">
    <marquee behavior="alternate">
        <h1>Enter Correct Credentials </h1>
    </marquee>
    <form action="Login.jsp" method="post" >
        <table align="center">
            <tr>
                <td><b>Email Id  :</b></td>
                <td><input type="email" name ="email" required></td>
            </tr>	
            <tr>
                <td><b>Password :</b></td>
                <td><input type="password" name ="pass" required></td>
            </tr>	

        </table>
        <table align="center">
            <tr>
                <td><input type="submit" name ="b1" value="Login" style="width: 125px; height: 40px;"></td>
                <td><input type="reset" name ="b2" value="Clear" style="width: 125px; height: 40px;"></td>
            </tr>
        </table>
    </form>	
    <br><br>
    <%
        String m = (String) session.getAttribute("msg");
        if (m != null) {
    %>
    <h3><%= m%></h3>
    <%
            session.setAttribute("msg", null);

        }
    %>
    <br>
    <%
        Integer c = (Integer) application.getAttribute("count");
        if (c == null) {
            c = 0;

        }
        application.setAttribute("count", ++c);
    %>
    <h1>Total No of Visitors:<b><%=c%> </b></h1>
</body>
</html>