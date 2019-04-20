<%@page import="java.sql.*"%>
<%@page errorPage="Error.jsp"%>

<%
    String e = request.getParameter("email");
    String n = request.getParameter("name");
    String ph = request.getParameter("phone");
    int a = Integer.parseInt(request.getParameter("age"));
    String p = request.getParameter("pass");
    
    my.DataBaseBean db = (my.DataBaseBean)session.getAttribute("db");
    if(db==null){
    
        db = new my.DataBaseBean();
    }
    java.util.HashMap hm = db.insertUser(e, n, ph, a, p);
    if(hm!=null){
        String m = (String)hm.get("msg");
        if(m!=null){
            session.setAttribute("msg",m);
            response.sendRedirect("registerD.jsp");
        }else{
            session.setAttribute("userDetails",hm);
            response.sendRedirect("profile.jsp");
        } 
    }else{
        session.setAttribute("msg","Registration Failed");
        response.sendRedirect("registerD.jsp");
    }
%>