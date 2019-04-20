<%@page import="java.sql.*"%>
<%@page errorPage="Error.jsp"%>
<%
	String e= request.getParameter("email");
	String p= request.getParameter("pass");
        my.DataBaseBean db = (my.DataBaseBean)session.getAttribute("db");
        if(db==null){
            db = new my.DataBaseBean();
        }
        
        java.util.HashMap userDetails = db.checkLogin(e,p);
        if(userDetails != null){
        session.setAttribute("userDetails",userDetails);
        response.sendRedirect("Profile.jsp");
        }else{
            session.setAttribute("msg","Wrong Entries");
            response.sendRedirect("loginD.jsp");
        
        }
%>