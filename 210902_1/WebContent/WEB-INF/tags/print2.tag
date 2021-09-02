<%@ tag language="java" pageEncoding="UTF-8" body-content="scriptless"%>
																		

<%@ attribute name = "border" %>
<%@ attribute name = "bgcolor" %>
<%@ attribute name = "color" %> 
<jsp:useBean id="dataBean" class="model.DataBean"/>
<table border="${border}"  bgcolor="${bgcolor}" color="${color}">
	<h1><jsp:doBody/></h1>
	
	<% 
		for(String v : dataBean.getDataList()){ 
			out.println("<tr><td>"+v+"</td></tr>");
		}
	%>



</table>



