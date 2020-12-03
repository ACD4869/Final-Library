<!DOCTYPE html>

<%@page import="book_table.Staff_Book_Table_Model"%>
<%@page import="common_use_bean.Book_Use_Bean"%>
<%@page import="category_table.Category_Table"%>
<%@page import="common_use_bean.Category_Use_Bean"%>
<%@page import="publisher_table.Publisher_Table"%>
<%@page import="common_use_bean.Publisher_Use_Bean"%><html class="no-js">

<head>

    <meta charset="utf-8">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/animate.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/vendor/offline/theme.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/vendor/toastr/toastr.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/vendor/jvectormap/jquery-jvectormap-1.2.2.css">
    <script src="<%=request.getContextPath()%>/vendor/modernizr.js"></script>
</head>
<body>
		
    <div class="app" data-sidebar="locked">
        <%@include file="../../common/tab.jsp" %>
            <section class="main-content">
                <div class="content-wrap">
                    <div class="row mg-b">
                        <div class="col-xs-6"> 
                            <h3 class="no-margin">Publisher</h3> 
                        </div>
                    </div>             
                    <div class="col-lg-6">

                    		<%
							String message=(String)session.getAttribute("add_atuhor_message");
							if(message!=null){
							%> 
								
								 <div class="alert alert-success">
                                        <%=message%>
                                    </div>


							<%			session.removeAttribute("add_atuhor_message");
							}
							%>

                                            <section class="panel">
                                                <header class="panel-heading">Add Publisher</header>
                                                <div class="panel-body">

                                                    <form action="<%=Common_Things.url%>/add-publisher-controller/" class="form-horizontal" role="form">
                                                        <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">Publisher </label>
                                                            	<div class="col-sm-10">
                                                               	<input type="text" class="form-control" name="publisher_name" data-parsley-required="true" data-parsley-trigger="change" placeholder="Publisher ">
                                                               </div> 
                                                             
                                                        </div>         
                                                     <hr> 
                                                     
                                                        </div>
                                                        <div class="form-group">  
                                                            <div class="col-sm-offset-2 col-sm-15">
                                                                <button type="submit" class="btn btn-default">Add Publisher</button>
                                                            </div>
                                                        </div>
                                                    </form>

                                                </div> 
                                                
					<div class="row">
                        <div class="col-lg-12">
                            <section class="panel">
                                <div class="panel-body">
                                
                                    <div class="col-lg-12">
                                            <section class="panel panel-primary">
                                <div class="panel-heading">Publisher 
                                    
                                </div>
                                <ul class="list-group">
                                
                                
                                	 <table class="table table-hover no-margin">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Publisher </th>
                                                <th>Edit</th>
                                                
                                            </tr>
                                        </thead>
                                        <tbody>
                                	<% 
                                	Publisher_Table obj_Publisher_Table_Model=new Publisher_Table();  
                       	                  	List<Publisher_Use_Bean> list_publisher=obj_Publisher_Table_Model.get_all_publisher();
                       	                                	 
                       	                                	
                       	                                	if(list_publisher!=null){
                       	                                		Iterator<Publisher_Use_Bean> it_list_publisher=list_publisher.iterator();
                       	                                		Publisher_Use_Bean obj_Publisher_Use_Bean=new Publisher_Use_Bean();
                       	                                	int temp_count=1;
                       	                                		while(it_list_publisher.hasNext()){
                       	                                			obj_Publisher_Use_Bean=it_list_publisher.next();
                           	%>

                                	                                   
                                   			 <tr>
                                                <td><%=temp_count++ %></td>
                                                <td><%=obj_Publisher_Use_Bean.getPublisher_name() %></td>
                                                <td><a href="<%=Common_Things.url  %>/edit-publisher/?sl_no=<%=obj_Publisher_Use_Bean.getId_no() %>&n=<%=obj_Publisher_Use_Bean.getPublisher_name() %>&d=" class="btn btn-success btn-xs">Edit</a>
                                                <a href="<%=Common_Things.url  %>/delete-publisher/?sl_no=<%=obj_Publisher_Use_Bean.getId_no() %>&n=<%=obj_Publisher_Use_Bean.getPublisher_name() %>&d=" class="btn btn-success btn-xs">Delete</a>
                                                 </td>
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
