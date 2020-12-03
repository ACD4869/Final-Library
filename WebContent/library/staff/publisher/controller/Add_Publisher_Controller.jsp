<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">



<%@page import="common.Common_Things"%>
<%@page import="publisher_table.Publisher_Table"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>
<jsp:useBean id="obj_Publisher_Use_Bean" class="common_use_bean.Publisher_Use_Bean"></jsp:useBean>
	<jsp:setProperty property="*" name="obj_Publisher_Use_Bean"/>
	
	<%
			
	
	  
	   
	   
	Publisher_Table obj_Publisher_Table=new Publisher_Table();
	      
	   int flag=obj_Publisher_Table.insert_publisher(obj_Publisher_Use_Bean);
	   
	   if(flag==1){
		   
			
			session.setAttribute("add_publisher_message","Publisher Added Successfully");
		
			
			
	   }else{

			 session.setAttribute("add_publisher_message","Failed");
		 
	   } 
	   
	    
	   
		%>
		
		
		 
		  
		  		 <script type="text/javascript">
						window.location.href="<%=Common_Things.url%>/add-publisher";
				</script>
	
	
	  
</body>
</html>