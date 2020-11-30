<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%@page import="java.util.List"%>
<%@page import="common_use_bean.Staff_Use_Bean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="common.Common_Things"%>
<%@page import="staff_table.Staff_Profile_Model"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>
<jsp:useBean id="obj_Staff_Use_Bean" class="common_use_bean.Staff_Use_Bean"></jsp:useBean>
	<jsp:setProperty property="*" name="obj_Staff_Use_Bean"/>
	
	<%
			
	String ip = request.getHeader("x-forwarded-for");      
	   if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {      
	       ip = request.getHeader("Proxy-Client-IP");      
	   }      
	   if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {      
	       ip = request.getHeader("WL-Proxy-Client-IP");      
	   }      
	   if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {      
	       ip = request.getRemoteAddr();      
	   }  
	 
	  
	   obj_Staff_Use_Bean.setIp_address(ip);
	  
	   
	   Staff_Profile_Model obj_Staff_Profile_Model=new Staff_Profile_Model();
	     
	   obj_Staff_Use_Bean=obj_Staff_Profile_Model.staff_sign_in(obj_Staff_Use_Bean);
	   
	   if(obj_Staff_Use_Bean!=null){
		   List<Staff_Use_Bean> list=new ArrayList<Staff_Use_Bean>();
			list.add(obj_Staff_Use_Bean);
			session.setAttribute("ss_STAFF_bean",list);
		
		%>
						<script type="text/javascript">
								window.location.href="<%=Common_Things.url%>/staff-home";
						</script>
		
		<%	
			
			
	   }else{

			 session.setAttribute("ss_index_message","Username/Password does not Match");
		  %>
		  
		  		 <script type="text/javascript">
				window.location.href="<%=Common_Things.url%>";
				</script>
	
	<%
	   }
	   
	    
	   
		%>
	  
</body>
</html>