<%@page errorPage="Error.jsp"%>
<%
	java.util.HashMap userDetails = (java.util.HashMap)session.getAttribute("userDetails");
	if(userDetails!=null){
		session.invalidate();
		response.sendRedirect("index.html");
	}else{
                session.setAttribute("msg","Plz Login First!");
		response.sendRedirect("loginD.jsp");
	}
%>