<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">




<%@page import="librarian_table.Librarian_Table_Model"%>
<%@page import="common.Common_Things"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>
<jsp:useBean id="obj_Librarian_Use_Bean" class="common_use_bean.Librarian_Use_Bean"></jsp:useBean>
	<jsp:setProperty property="*" name="obj_Librarian_Use_Bean"/>
	
	<%
			
	
	  
	  
	   
	Librarian_Table_Model obj_Librarian_Table_Model=new Librarian_Table_Model();
	     
	   int flag=obj_Librarian_Table_Model.edit_librarian(obj_Librarian_Use_Bean);
	   
	   if(flag==1){
		   
			
			session.setAttribute("add_librarian_message","Updated Successfully");
		
			
			
	   }else{

			 session.setAttribute("add_librarian_message","Failed");
		 
	   } 
	   
	    
	   
		%>
		
		
		 
		  
		  		 <script type="text/javascript">
						window.location.href="<%=Common_Things.url%>/complete-details-librarian/?lm=<%=obj_Librarian_Use_Bean.getLibrarian_id()%>";
				</script>
	
	
	  
</body>
</html>