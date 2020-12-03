<!DOCTYPE html>

<%@page import="book_table.Staff_Book_Table_Model"%>
<%@page import="common_use_bean.Book_Use_Bean"%>
<%@page import="home_page_model.Home_Page_Model"%>
<%@page import="common_use_bean.Home_Page_Use_Bean"%><html class="no-js">

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
                            <h3 class="no-margin">All Books </h3>
                        </div> 
                      <a href="<%=Common_Things.url %>/staff-add-book/" class="btn btn-info">Add Book</a>
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
                                <div class="panel-heading">View All Books 
                                    
                                </div>
                                <ul class="list-group">
                                
                                
                                	 <table class="table table-hover no-margin">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Book Title </th>
                                                <th>Category </th>
                                                <th>Author </th>
                                                <th>Publisher</th>
                                                <th>ISBN</th>
                                                <th>Action</th>
                                                
                                            </tr>
                                        </thead>
                                        <tbody>

                                 
                                	<% 
                                	
                                	Staff_Book_Table_Model obj_Staff_Book_Table_Model=new Staff_Book_Table_Model();  
                       	                  	List<Book_Use_Bean> list_books=obj_Staff_Book_Table_Model.view_all_books(int_lim);
                       	                                	 
                       	                                	
                       	                                	if(list_books!=null){
                       	                                		Iterator<Book_Use_Bean> it_list_books=list_books.iterator();
                       	                                		Book_Use_Bean obj_Book_Use_Bean=new Book_Use_Bean();
                       	                                		while(it_list_books.hasNext()){
                       	                                			obj_Book_Use_Bean=it_list_books.next();
                           	%>
 
                                	                                    
                                   			 <tr> 
                                                <td><%=temp_count++ %></td>
                                                <td><%=obj_Book_Use_Bean.getBook_title() %></td>
                                              	<td><%=obj_Book_Use_Bean.getCategory_name()%></td>
                                               	<td><% if(obj_Book_Use_Bean.getAuthor_name()!=null){out.println(obj_Book_Use_Bean.getAuthor_name());} %></td>
                                               	<td><% if(obj_Book_Use_Bean.getPublisher_name()!=null){out.println(obj_Book_Use_Bean.getPublisher_name());} %></td>
                                              	<td><% if(obj_Book_Use_Bean.getIsbn()!=null){out.println(obj_Book_Use_Bean.getIsbn());} %></td>
                                              	<td><a href="<%=Common_Things.url %>/complete-details-of-book/?s=<%=obj_Book_Use_Bean.getBook_id_no() %>"  class="btn btn-success btn-xs" >Detail</a></td>
                                              
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
		            	          						 <a href="<%=Common_Things.url %>/view-all-books/?lim=<%=0 %>"  class="btn btn-danger btn-xs">Previous</a>
                     											
		                              <%						
		                              					}else if(int_lim!=0){    
		                              %>
		            	          								<a href="<%=Common_Things.url %>/view-all-books/?lim=<%=int_lim-2 %>"  class="btn btn-danger btn-xs">Previous</a>
                    
		                              <%						
		                             						
		                              					}
		                              %>  			
		                                			
		                                				 
		                                			</td>
		                							<td>
		                                				   <a href="<%=Common_Things.url %>/view-all-books/?lim=<%=int_lim+1 %>"  class="btn btn-danger btn-xs">Next</a>
                    
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
