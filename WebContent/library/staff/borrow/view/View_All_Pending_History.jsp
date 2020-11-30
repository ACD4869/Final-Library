<!DOCTYPE html>


<%@page import="borrow_table_model.Borrow_Table_Model"%>
<%@page import="common_use_bean.Borrow_Use_Bean"%>
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
                            <h3 class="no-margin">All Pending Borrow History</h3>
                             
                        </div> 
                       
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
                                <div class="panel-heading">Borrow History
                                    
                                </div>
                                <ul class="list-group">
                                
                                
                                	 <table class="table table-hover no-margin">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Member Name </th>
                                                <th>Book Name </th>
                                                <th>Barcode</th>
                                                <th>Borrow Date</th>
                                                <th>Return Date</th> 
                                                <th>Status</th>
                                                <th>Delay Days</th>
                                                <th>Action</th>
                                                
                                            </tr>
                                        </thead>
                                        <tbody>
                                           
                                          
                                 
                                	<% 
                                	
                                	Borrow_Table_Model obj_Borrow_Table_Model=new Borrow_Table_Model();  
                                	List<Borrow_Use_Bean> list_history=obj_Borrow_Table_Model.get_all_pending_borrows(int_lim);
                       	                                	 
                       	                                	
                       	                                	if(list_history!=null){
                       	                                		Iterator<Borrow_Use_Bean> it_list_history=list_history.iterator();
                       	                                		Borrow_Use_Bean obj_Borrow_Use_Bean=new Borrow_Use_Bean();
                       	                                	
                       	                                		while(it_list_history.hasNext()){
                       	                                			obj_Borrow_Use_Bean=it_list_history.next();
                           	%>
 
                                	                                    
                                   			  <tr>
                                                <td><%=temp_count++ %></td>
                                                 <td> <a href="<%=Common_Things.url %>/complete-details-member/?lm=<%=obj_Borrow_Use_Bean.getMember_id() %>" class="btn btn-primary btn-xs"><%=obj_Borrow_Use_Bean.getMember_name() %></a>          </td>
                                               <td><%=obj_Borrow_Use_Bean.getBook_title() %></td>
                                               <td> 
                                               <%=obj_Borrow_Use_Bean.getBarcode() %>
                                               
                                               </td>
                                               <td><%=obj_Borrow_Use_Bean.getBorrow_date() %></td>
                                               
                                               <td><%=obj_Borrow_Use_Bean.getReturn_date() %></td>
                                               <td><%=obj_Borrow_Use_Bean.getStatus() %></td>
                                               
                                               
                                             				  <%
                                             					 TimeZone.setDefault(TimeZone.getTimeZone("Asia/Qatar"));
																SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy");
																 
																  Date today4 = new Date();
																  String date4 = format.format(today4);
																
                                             				  
                                             				  
                                                            	String days_count=null;
                                                            	if(obj_Borrow_Use_Bean.getReturned_date()==null){
                                                            	
                                                            		days_count=obj_Borrow_Table_Model.get_days_delay(obj_Borrow_Use_Bean.getReturn_date(),date4);
                                                            		if(days_count!=null){
                                                            			if(days_count.contains("-")){
                                                            				days_count=null;
                                                                		}	
                                                            		}
                                                            	}
                                                            	%>
                                               <td><%if(days_count!=null){out.println(days_count);} %></td>
                                               
                                                
                                               <td><a href="<%=Common_Things.url %>/update-borrow-book/?lololo=<%=obj_Borrow_Use_Bean.getBorrow_id_no() %> " class="btn btn-success btn-xs">Update</a> </td> 
                                               
                                            </tr>
                                	<%		
                                			
                                			
                                		}
                                		
                                		
                                	}
                       	                             	if(temp_count==101){  
                       	                                	%>
                       	                                			<tr>
                       	                                					<td></td>
                       	                                			 
                       	                                					<td></td>
                       			                                			<td></td>
                       			                                			<td></td>
                       			                                			<td>
                       			                              <%
                       			                              					if(int_lim==1){
                       			                              %>
                       			            	          						 <a href="<%=Common_Things.url %>/view-all-pending-borrows/?lim=<%=0 %>"  class="btn btn-danger btn-xs">Previous</a>
                       	                     											
                       			                              <%						
                       			                              					}else if(int_lim!=0){    
                       			                              %>
                       			            	          								<a href="<%=Common_Things.url %>/view-all-pending-borrows/?lim=<%=int_lim-1 %>"  class="btn btn-danger btn-xs">Previous</a>
                       	                    
                       			                              <%						
                       			                             						
                       			                              					}
                       			                              %>  			
                       			                                			
                       			                                				 
                       			                                			</td>
                       			                                			<td></td>
                       			                							<td>
                       			                                				   <a href="<%=Common_Things.url %>/view-all-pending-borrows/?lim=<%=int_lim+1 %>"  class="btn btn-danger btn-xs">Next</a>
                       	                    
                       			                                			</td>
                       			                                			
                       			                                			<td></td>
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
