<%@ tag language="java" pageEncoding="UTF-8" body-content="scriptless"%>


<%@ attribute name="name" %>



<jsp:useBean id="prBean" class="model.ProductBean" scope="session"/>
	<h1><jsp:doBody/></h1>	
	<select name="${name}">
			<%
				for(String v : prBean.getProduct()){
					out.println("<option>"+v+"</option>");
				}			
			%>
	</select>
