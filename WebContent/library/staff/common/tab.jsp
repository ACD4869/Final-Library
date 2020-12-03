<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%@page import="java.util.List"%>
<%@page import="common_use_bean.Staff_Use_Bean"%>
<%@page import="common.Common_Things"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.TimeZone"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>


	<%
	List<Staff_Use_Bean> list1=(List<Staff_Use_Bean>)session.getAttribute("ss_STAFF_bean");
	Staff_Use_Bean obj_Staff_Use_Bean=new Staff_Use_Bean();
	if(list1==null){
		
		
		
		session.setAttribute("ss_school_index_message","Opps..Your session expired,Please Login Again");
	%>
		<script type="text/javascript">
			window.location.href="<%=Common_Things.url %>";
		</script>
	<%
	}else{
	
	Iterator<Staff_Use_Bean> it_list=list1.iterator();
	obj_Staff_Use_Bean=it_list.next();
	
	%>

<title>Library Management | ColourChalk</title>


				<header class="header header-fixed navbar bg-white">

            <div class="brand bg-success">
                <a href="#" class="fa fa-bars off-left visible-xs" data-toggle="off-canvas" data-move="ltr"></a>

                 <a href="<%=Common_Things.url %>/staff-home" class="navbar-brand text-white">
                    <i class="fa fa-user mg-r-xs"></i> 
                    <span>
                        <b>LIBRARY</b> AREA 51
                    </span>
                </a>
            </div>
					<div class="collapse navbar-collapse pull-left no-padding" id="hor-menu">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="#">

					<%
					TimeZone.setDefault(TimeZone.getTimeZone("Asia/Jakarta")); 
					SimpleDateFormat format = new SimpleDateFormat("dd-MMM-yyyy hh:mm a");
					 
					  Date today4 = new Date();
						
						
				       String date4 = format.format(today4);
					
					%>

                            <span><%=date4 %></span>
                           
                        </a>
                      
                    </li>
                    
                   
                </ul>
            </div>
            

            <ul class="nav navbar-nav navbar-right off-right">
                <li class="quickmenu mg-r-md">
                    <a href="<%=Common_Things.url %>/Staff_Sign_Out_Controller">
                        <i>Logout</i>
                    </a>
                   
                </li>
            </ul>
        </header>
        <section class="layout">
            <aside class="sidebar canvas-left bg-dark">

															 <nav class="main-navigation">
								                    <ul>
								                        <li>
								                            <a href="<%=Common_Things.url %>/view-all-books/">
								                                <i class="fa fa-book"></i>
								                                <span>Book</span> 
								                            </a>         
								                        </li>
								                       
  													 <li>
								                            <a href="<%=Common_Things.url %>/staff-add-category">
								                                <i class="fa fa-tags"></i>
								                                <span>Category</span> 
								                            </a>
								                            
								                        </li>
								                       
  													
								                     	 <li>
								                            <a href="<%=Common_Things.url %>/add-author">
								                                <i class="fa fa-coffee"></i>
								                                <span>Author</span>  
								                            </a>
								                        </li>
								                       	 <li>
								                            <a href="<%=Common_Things.url %>/view-all-member/">
								                                <i class="fa fa-users"></i>
								                                <span>Member</span>  
								                            </a>
								                        </li>
								                       
  													
								                       	 <li>
								                            <a href="<%=Common_Things.url %>/complete-borrow-history/">
								                                <i class="fa fa-legal"></i>
								                                <span>Borrow</span>  
								                            </a>
								                        </li>
								                        <li>
								                            <a href="<%=Common_Things.url %>/view-all-librarian/">
								                                <i class="fa fa-users"></i>
								                                <span>Librarian</span>  
								                            </a>
								                        </li>
								                        <li>
								                            <a href="<%=Common_Things.url %>/add-publisher/">
								                                <i class="fa fa-edit"></i>
								                                <span>Publisher</span>  
								                            </a>
								                        </li>
								                        
														<%
														
														
														%>

								                    </ul>
								                </nav>
              
	 </aside>
            <!-- /sidebar menu -->
	
	<%
	}
	%>
	
	
</body>
</html>