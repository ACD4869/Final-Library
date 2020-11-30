<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%@page import="common.Common_Things"%>
<%@page import="borrow_table_model.Borrow_Table_Model"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>
<jsp:useBean id="obj_Borrow_Use_Bean" class="common_use_bean.Borrow_Use_Bean"></jsp:useBean>
	<jsp:setProperty property="*" name="obj_Borrow_Use_Bean"/>
	
	<%
			
	
	  
	  
	   
	Borrow_Table_Model obj_Borrow_Table_Model=new Borrow_Table_Model();
	     
	   int flag=obj_Borrow_Table_Model.borrow_from_member(obj_Borrow_Use_Bean);
	   
	   if(flag==1){
		   
			
			session.setAttribute("borrow_book_member_message","Book Borrowed Successfully");
		
	   }else if(flag==18){		
		   
		   session.setAttribute("borrow_book_member_message","Book with Bar Code "+obj_Borrow_Use_Bean.getBarcode()+" not available");
		   
	   }else if(flag==20){		
		   
		   session.setAttribute("borrow_book_member_message","Barcode "+obj_Borrow_Use_Bean.getBarcode()+" is borrowd already");
		   
	   }else{

			 session.setAttribute("borrow_book_member_message","Failed");
		 
	   } 
	   
	    
	   
		%>
		
		
		 
		  
		  		 <script type="text/javascript">
						window.location.href="<%=Common_Things.url%>/borrow-book-member/?id=<%=obj_Borrow_Use_Bean.getMember_id()%>&n=<%=obj_Borrow_Use_Bean.getMember_name()%>&ad=<%=obj_Borrow_Use_Bean.getMember_id()%>";
				</script>
	
	
	  
</body>
</html>