<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%@page import="common.Common_Things"%>
<%@page import="member_table.Member_Table_Model"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>
<jsp:useBean id="obj_Member_Use_Bean" class="common_use_bean.Member_Use_Bean"></jsp:useBean>
	<jsp:setProperty property="*" name="obj_Member_Use_Bean"/>
	
	<%
			
	
	  
	  
	   
	Member_Table_Model obj_Member_Table_Model=new Member_Table_Model();
	     
	   int flag=obj_Member_Table_Model.delete_member(obj_Member_Use_Bean);
	   
	   if(flag==1){
		   
			
			session.setAttribute("delete_member_message","Member Deleted Successfully");
		
	  	   
	   }else{

			 session.setAttribute("delete_member_message","Failed");
		 
	   } 
	   
	    
	   
		%>
		
		
		 
		  
		  		 <script type="text/javascript">
		  		window.location.href="<%=Common_Things.url%>/add-member/";
				</script>
	
	
	  
</body>
</html>