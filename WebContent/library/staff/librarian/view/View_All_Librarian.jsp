<!DOCTYPE html>


<%@page import="common_use_bean.Book_Use_Bean"%>
<%@page import="home_page_model.Home_Page_Model"%>
<%@page import="common_use_bean.Home_Page_Use_Bean"%>
<%@page import="librarian_table.Librarian_Table_Model"%>
<%@page import="common_use_bean.Librarian_Use_Bean"%><html class="no-js">

<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/animate.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/vendor/offline/theme.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/vendor/toastr/toastr.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/vendor/jvectormap/jquery-jvectormap-1.2.2.css">
    <script src="<%=request.getContextPath()%>/vendor/modernizr.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css" />
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.4.2.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.autocomplete.js"></script>
   

</head>


<body>
		
    <div class="app" data-sidebar="locked">
        <%@include file="../../common/tab.jsp" %>
            <section class="main-content">
                <div class="content-wrap">

                    <div class="row mg-b">
                        <div class="col-xs-6">  
                            <h3 class="no-margin">Librarian</h3>
                             
                        </div> 
                       <a href="<%=Common_Things.url %>/add-librarian/" class="btn btn-info">Add Librarian</a>
                        
                    </div>             

                    <%
                    int temp_count=1;
                    int int_lim=0;
					
                    
                    String lim=(String)request.getParameter("lim");	
                    if(lim==null){
                    	int_lim=0;
                    }else{
                    	int_lim=Integer.parseInt(lim.trim());
                    }
                    
                    %>
                    
                    <div class="row">
                        <div class="col-lg-12">
                            <section class="panel">
                                <div class="panel-body">
                                
                                    <div class="col-lg-12">
                                            <section class="panel panel-primary">
                                <div class="panel-heading">Librarian
                                    
                                </div>
                                <ul class="list-group">
                                
                                
                                	 <table class="table table-hover no-margin">
                                         <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Librarian ID</th>
                                                <th>Name</th>
                                                <th>Telephone</th>
                                                <th>ID Number</th>
                                                <th>Action</th>
                                                
                                            </tr>
                                        </thead>
                                        <tbody>
                                	<% 
                                	
                                	Librarian_Table_Model obj_Librarian_Table_Model=new Librarian_Table_Model();  
                       	                  	List<Librarian_Use_Bean> list_librarians=obj_Librarian_Table_Model.get_all_librarians(int_lim);
                       	                                	 
                       	                                	
                       	                                	if(list_librarians!=null){
                       	                                		Iterator<Librarian_Use_Bean> it_list_librarians=list_librarians.iterator();
                       	                                		Librarian_Use_Bean obj_Librarian_Use_Bean=new Librarian_Use_Bean();
                       	                                		while(it_list_librarians.hasNext()){
                       	                                			obj_Librarian_Use_Bean=it_list_librarians.next();
                           	%>
 
                                	                                    
                                   			  <tr>
                                                <td><%=temp_count++ %></td>
                                                <td><%=obj_Librarian_Use_Bean.getLibrarian_id() %></td>
                                               	<td><%=obj_Librarian_Use_Bean.getLibrarian_name() %></td> 
                                               	<td><%=obj_Librarian_Use_Bean.getTelephone() %></td>
                                               	<td><%=obj_Librarian_Use_Bean.getNumber_id() %></td>
                                               	<td> 
                                               	<a href="<%=Common_Things.url %>/complete-details-librarian/?lm=<%=obj_Librarian_Use_Bean.getLibrarian_id() %>" class="btn btn-primary btn-xs">Detail</a>
                                               	<a href="<%=Common_Things.url %>/delete-librarian/?lm=<%=obj_Librarian_Use_Bean.getLibrarian_id() %>" class="btn btn-primary btn-xs">Delete</a>
                                               	</td>
                                            </tr>
                                	<%		
                                			
                                			
                                		}
                                		
                                		
                                	}
                                	 
                                		if(temp_count==101){  
                                	%>
                                			<tr>
                                					<td></td>
		                                			<td></td>
		                                			<td>
		                              <%
		                              					if(int_lim==1){
		                              %>
		            	          						 <a href="<%=Common_Things.url %>/view-all-librarians/?lim=<%=0 %>"  class="btn btn-danger btn-xs">Previous</a>
                     											
		                              <%						
		                              					}else if(int_lim!=0){    
		                              %>
		            	          								<a href="<%=Common_Things.url %>/view-all-librarians/?lim=<%=int_lim-1 %>"  class="btn btn-danger btn-xs">Previous</a>
                    
		                              <%						
		                             						
		                              					}
		                              %>  			
		                                			
		                                				 
		                                			</td>
		                							<td>
		                                				   <a href="<%=Common_Things.url %>/view-all-librarians/?lim=<%=int_lim+1 %>"  class="btn btn-danger btn-xs">Next</a>
                    
		                                			</td>
		                                			<td></td>
		                                			<td></td>
                                			
                                			</tr>
                                  <%
                                		}
                                  %>
                                        </tbody>
                                    </table>
                                </ul>

                            </section> 
                                        </div>
                                </div>
                            </section>
                        </div>
                    </div>
                    
                </div>
            </section>
        </section>

    </div>

   	<script src="<%=Common_Things.url %>/vendor/bootstrap-select/bootstrap-select.js"></script>
    <script src="<%=Common_Things.url %>/vendor/datatables/jquery.dataTables.js"></script>
    <script src="<%=Common_Things.url %>/vendor/slider/bootstrap-slider.js"></script>
    <script src="<%=Common_Things.url %>/js/off-canvas.js"></script>
    <script src="<%=Common_Things.url %>/vendor/offline/offline.min.js"></script>
    <script src="<%=Common_Things.url %>/vendor/bootstrap-datepicker/bootstrap-datepicker.js"></script> 
    <script src="<%=Common_Things.url %>/js/main.js"></script>
	<script src="<%=Common_Things.url %>/js/datatables.js"></script>
	<script src="<%=Common_Things.url %>/vendor/switchery/switchery.js"></script>
    <script src="<%=Common_Things.url %>/js/forms.js"></script>
      
</body>

</html>
