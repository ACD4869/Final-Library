<!DOCTYPE html>

<%@page import="book_table.Staff_Book_Table_Model"%>
<%@page import="common_use_bean.Book_Use_Bean"%>
<%@page import="category_table.Category_Table"%>
<%@page import="common_use_bean.Category_Use_Bean"%>
<%@page import="copy_table_model.Copy_Table_Model"%><html class="no-js">

<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/animate.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/vendor/offline/theme.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/vendor/toastr/toastr.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/vendor/jvectormap/jquery-jvectormap-1.2.2.css">
    <script src="<%=request.getContextPath()%>/vendor/modernizr.js"></script>

    <script type="text/javascript">
		function validateForm() {
		    var x = document.forms["myForm"]["total_book_in_library"].value;
		    if (x==null || x=="") {
		        alert("Please enter Quantity");
		        return false;
		    }

		}
	</script>

</head>

<body>

    <div class="app" data-sidebar="locked">

               <%@include file="../../common/tab.jsp" %>

            <section class="main-content">

                <div class="content-wrap">

                    <div class="row mg-b">
                        <div class="col-xs-6"> 
                            <h3 class="no-margin">Add Copy</h3>
                            
                        </div>
                        <%
                        String book_sl_no=(String)request.getParameter("kou");
						
                        %>
                       <a href="<%=Common_Things.url %>/complete-details-of-book/?s=<%=book_sl_no %>" class="btn btn-info">Back</a>
                       
                    </div>             

                    <div class="col-lg-6">
                    
                    		<%
							String message=(String)session.getAttribute("add_copy_message");
							if(message!=null){
							%> 
								
								 <div class="alert alert-success">
                                        <%=message%>
                                    </div>


							<%			session.removeAttribute("add_copy_message");
							}
							Book_Use_Bean obj_Book_Use_Bean=new Book_Use_Bean();
							Staff_Book_Table_Model obj_Staff_Book_Table_Model=new Staff_Book_Table_Model();
							
							obj_Book_Use_Bean=obj_Staff_Book_Table_Model.get_Complete_details_of_book(book_sl_no);
							%>
                    
                                            <section class="panel">
                                                <header class="panel-heading">Add Copy</header>
                                                <div class="panel-body">
 
												<form action="<%=Common_Things.url%>/copy-book-controller/" class="form-horizontal" role="form" name="myForm"  onsubmit="return validateForm()">
                                                       <input type="hidden" name="book_sl_no" value="<%=book_sl_no %>">
                                                       <input type="hidden" name="book_title" value="<%=obj_Book_Use_Bean.getBook_title() %>">
                                                       <input type="hidden" name="category_num" value="<%=obj_Book_Use_Bean.getCategory_num() %>">
                                                       
                                                       
                                                     
                                                       <%
                                                       
                                                       Copy_Table_Model obj_Copy_Table_Model=new Copy_Table_Model();
                                                       
                                                       
                                                       %>
                                                          <input type="hidden" name="total_book_available" value="<%=obj_Copy_Table_Model.get_count_copy_code(book_sl_no)%>">
                                                      
                                                       
                                                        <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">Quantity</label> 
                                                            	<div class="col-sm-10">
                                                               	<input type="text" class="form-control" name="total_book_in_library" data-parsley-required="true" data-parsley-trigger="change" placeholder="Quantity ">
                                                               </div> 
                                                             
                                                        </div> 
                                                      <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">Shelf </label> 
                                                            	<div class="col-sm-10">
                                                               	<input type="text" class="form-control" name="shelf" data-parsley-required="true" data-parsley-trigger="change" placeholder="Shelf ">
                                                               </div> 
                                                             
                                                        </div> 
                                                        
                                                     <hr> 
                                                     
                                                         
                                                        </div>
                                                        <div class="form-group">  
                                                            <div class="col-sm-offset-2 col-sm-15">
                                                                <button type="submit" class="btn btn-default">Add</button>
                                                            </div>
                                                        </div>
                                                    </form>

                                                </div> 
                                                
						
                    <div class="col-lg-6">
                            <section class="panel">
                                <div class="panel-body">
                                
                                    <div class="col-lg-12">
                                            <section class="panel panel-primary">
                                <div class="panel-heading">Copy
                                    
                                </div>
                                <ul class="list-group">
                                
                                
                                	 <table class="table table-hover no-margin">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Quantity </th>
                                                <th>Added On</th>
                                                <th>Action</th>
                                                
                                            </tr>
                                        </thead>
                                        <tbody>
                                           
                                          
                                 
                                	<% 
                                	
                                	//Copy_Table_Model obj_Copy_Table_Model=new Copy_Table_Model();  
                       	                  	List<Book_Use_Bean> list_copy=obj_Copy_Table_Model.get_copy_of_books(book_sl_no);
                       	                                	 
                       	                                	
                       	                                	if(list_copy!=null){
                       	                                		Iterator<Book_Use_Bean> it_list_copy=list_copy.iterator();
                       	                                	int temp_count=1;
                       	                                		while(it_list_copy.hasNext()){
                       	                                			obj_Book_Use_Bean=it_list_copy.next();
                           	%>
 
                                	                                   
                                   			 <tr>
                                                <td><%=temp_count++ %></td> 
                                                <td><%=obj_Book_Use_Bean.getTotal_book_available() %></td>
                                                <td><%=obj_Book_Use_Bean.getAdded_on() %></td>
                                               <td><a href="<%=Common_Things.url %>/edit-category/?sl_no=<%=obj_Book_Use_Bean.getCopy_id_no() %>" class="btn btn-success btn-xs">Edit</a> </td>
                                            </tr>
                                   
                                   
                                	<%		
                                			
                                			
                                		}
                                		
                                		
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
					<div class="row">
                        <div class="col-lg-12">
                            <section class="panel">
                                <div class="panel-body">
                                
                                    <div class="col-lg-12">
                                            <section class="panel panel-primary">
                                <div class="panel-heading">Book Details
                                    
                                </div>
                                <ul class="list-group">
                                
                                
                                	 <table class="table table-hover no-margin">
                                        <thead>
                                             <tr>
                                                <th>#</th>
                                                <th>Book Bar Code </th>
                                                <th>Status</th>
                                                <th>Borrow</th>
                                                <th>Details</th>
                                                <th>Shelf</th>
                                                <th>Added On</th>
                                                 <th>Action</th>
                                                
                                            </tr>
                                        </thead>
                                        <tbody>
                                
                                
                                	<%
                               // 	Copy_Table_Model obj_Copy_Table_Model=new Copy_Table_Model();                                                                                                                               		
                             	List<Book_Use_Bean> list_books=obj_Copy_Table_Model.get_books_status(book_sl_no);
                             	
                             	
                             	if(list_books!=null){
                             		Iterator<Book_Use_Bean> it_list_books=list_books.iterator();
                             		int temp_count=1;
                             		while(it_list_books.hasNext()){
                             			obj_Book_Use_Bean=it_list_books.next();
                                            %>
                                	
                                	 		 <tr>
                                                <td><%=temp_count++ %></td>
                                                <td><%=obj_Book_Use_Bean.getBar_code() %></td>
                                               
                                                <td>
                                                	<%
                                                	
                                                	if(obj_Book_Use_Bean.getBook_status()!=null){
                                                		if(obj_Book_Use_Bean.getBook_status().contains("Not")){
                                                	%>
                                                		<button type="button" class="btn btn-danger btn-xs">Not Available</button>
                                                	<%	
                                                		}else{
                                                	%>
                                                    		<button type="button" class="btn btn-success btn-xs">Available</button>
                                                    <%	
                                                    			
                                                			
                                                		}
                                                	}
                                                	%>
                                                </td>
                                               
                                                <td>
                                                
                                                <%
                                                	
                                                	if(obj_Book_Use_Bean.getBook_status()!=null){
                                                		if(obj_Book_Use_Bean.getBook_status().contains("Not")){
                                                	%>
                                                		
                                                		
                                                	<%	
                                                		}else{
                                                	%>
                                                    		
                                                    		<a href="<%=Common_Things.url %>/borrow-book/?jin=<%=obj_Book_Use_Bean.getId_no() %>" class="btn btn-success btn-xs">BORROW</a>
                                                
                                                    <%	
                                                    			
                                                			
                                                		}
                                                	}
                                                	%>
                                                
                                                
                                              
                                                </td>
                                                <td>
                                                <a href="<%=Common_Things.url %>/borrow-history/?jin=<%=obj_Book_Use_Bean.getBook_title() %>&bn=<%=obj_Book_Use_Bean.getBar_code() %>" class="btn btn-danger btn-xs">View Details</a>
                                                
                                                </td>
                                                <td>
                                                	<%
                                                	if(obj_Book_Use_Bean.getShelf()!=null  && !obj_Book_Use_Bean.getShelf().contains("null")){
                                                		out.println(obj_Book_Use_Bean.getShelf());
                                                	}
                                                	%>
                                                
                                                </td>
                                                
                                             
                                             <td>
                                             		<%=obj_Book_Use_Bean.getAdded_on() %>
                                             </td>
                                               <td>
                                                <a href="<%=Common_Things.url %>/edit-serial-copy/?s=<%=obj_Book_Use_Bean.getId_no() %>" class="btn btn-danger btn-xs">Edit</a>
                                               
                                               
                                               </td>
                                               
                                                
                                            </tr>
                                   
                                	<%		 
                                			
                                			
                                		}
                                		
                                		
                                	}else{ 
                                		%>
                                		 	<tr> 
                                                <td colspan="4">No Books In Library</td>
                                                
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

    <div data-phase="1" class="offline-ui">
        <div class="offline-ui-content" data-retry-in="" data-retry-in-abbr=""></div>
        <a class="offline-ui-retry"></a>
    </div>

    <script src="<%=request.getContextPath() %>/vendor/jquery-1.11.0.min.js"></script>
    <script src="<%=request.getContextPath() %>/bootstrap/js/bootstrap.js"></script>
    <script src="<%=request.getContextPath() %>/vendor/toastr/toastr.min.js"></script>
    <script src="<%=request.getContextPath() %>/vendor/moment.js"></script>
    <script src="<%=request.getContextPath() %>/vendor/skycons.js"></script>
    <script src="<%=request.getContextPath() %>/vendor/jquery.blockUI.js"></script>
    <script src="<%=request.getContextPath() %>/vendor/raphael.min.js"></script>
    <script src="<%=request.getContextPath() %>/vendor/morris/morris.js"></script>
    <script src="<%=request.getContextPath() %>/vendor/switchery/switchery.js"></script>
    <script src="<%=request.getContextPath() %>/vendor/jquery.slimscroll.js"></script>
    <script src="<%=request.getContextPath() %>/js/off-canvas.js"></script>
    <script src="<%=request.getContextPath() %>/vendor/offline/offline.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/main.js"></script>
    <script src="<%=request.getContextPath() %>/js/dashboard.js"></script>

</body>
</html>
