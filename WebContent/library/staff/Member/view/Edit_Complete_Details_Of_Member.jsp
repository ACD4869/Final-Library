<!DOCTYPE html>


<%@page import="member_table.Member_Table_Model"%>
<%@page import="common_use_bean.Member_Use_Bean"%><html class="no-js">

<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/animate.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/vendor/offline/theme.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/vendor/bootstrap-datepicker/datepicker.css">
    <script src="<%=request.getContextPath()%>/vendor/modernizr.js"></script>
    
</head>
<body>

    <div class="app" data-sidebar="locked">
        <%@include file="../../common/tab.jsp" %>
               
           
		<%
		String Member_id=(String)request.getParameter("lm");
		Member_Table_Model obj_Member_Table_Model=new Member_Table_Model();
		
		Member_Use_Bean obj_Member_Use_Bean=obj_Member_Table_Model.get_complete_details_member(Member_id);
		%>

            <section class="main-content">
                <div class="content-wrap">

                    <div class="row mg-b">
                        <div class="col-xs-6"> 
                            <h3 class="no-margin">Member: <%=obj_Member_Use_Bean.getMember_name() %></h3>
                            
                        </div>
                        <a href="<%=Common_Things.url %>/borrow-history-member/?sid=<%=obj_Member_Use_Bean.getMember_id()%>&n=<%=obj_Member_Use_Bean.getMember_name()%>" class="btn btn-success">Borrow History</a>
                        
                    </div>

                    <div class="col-lg-8">
                    		<%
							String message=(String)session.getAttribute("add_member_message");
							if(message!=null){
							%>
								
								 <div class="alert alert-success">
                                        <%=message%>
                                    </div>


							<%			session.removeAttribute("add_member_message");
							}
							%>
                    
                                            <section class="panel">
                                                <header class="panel-heading">Details</header>
                                                <div class="panel-body">

                                                    <form action="<%=Common_Things.url%>/edit-profile-member-controller/" class="form-horizontal" role="form">
                                                      <input type="hidden" name="member_id" value="<%=Member_id %>">
                                                        <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">Member ID</label>
                                                            	<div class="col-sm-10">
                                                               	<input type="text" class="form-control" name="member_id" data-parsley-required="true" data-parsley-trigger="change" placeholder="Member ID" value="<%if(obj_Member_Use_Bean.getMember_id()!=null){out.println(obj_Member_Use_Bean.getMember_id());} %>" >
                                                               </div> 
                                                             
                                                        </div> 
                                                        
                                                       
                                                        	<hr>
                                                           
                                                         <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">Name</label>
                                                            <div class="col-sm-10">
                                                                <input type="text" class="form-control" placeholder="Name" name="member_name" value="<%if(obj_Member_Use_Bean.getMember_name()!=null){out.println(obj_Member_Use_Bean.getMember_name());} %>" >
                                                            </div>
                                                        </div>
                                                        
                                                        
                                                       		<hr> 
                                                        
                                                         <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">Telephone</label>
                                                            <div class="col-sm-10">
                                                                <input type="text" class="form-control" placeholder="Telephone" name="telephone" value="<%if(obj_Member_Use_Bean.getTelephone()!=null){out.println(obj_Member_Use_Bean.getTelephone());} %>" >
                                                            </div>
                                                        </div>
                                                          	<hr> 
                                                        
                                                         <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">ID Number</label>
                                                            <div class="col-sm-10">
                                                                <input type="text" class="form-control" placeholder="ID Number" name="number_id" value="<%if(obj_Member_Use_Bean.getNumber_id()!=null){out.println(obj_Member_Use_Bean.getNumber_id());} %>" >
                                                            </div>
                                                        </div>
                                                       <hr> 
                                                       
                                                       
                                                    <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">Status</label>
                                                            <div class="col-sm-10">
                                                         			<label>
                                                         			
                                                         			<%
                                                         			String active_selected=null;
                                                         			String inactive_selected=null;
                                                         			if(obj_Member_Use_Bean.getStatus()==1){
                                                         				active_selected="checked='checked'";
                                                         			}else{
                                                         				inactive_selected="checked='checked'";
                                                         			}
                                                         			
                                                         			%>
                                                         			
                                                         			 
                                                                        <input type="radio" name="status" value="1" <%=active_selected %>>Active
																		<input type="radio" name="status" value="0" <%=inactive_selected %>>Inactive
                                                                    </label> 
                                                              </div>
                                                        </div>
                                                       
                                                           
                                                          <hr> 
                                                     	 
                                                     
                                                     <hr>  
                                                     
                                                        </div>
                                                        <div class="form-group">  
                                                            <div class="col-sm-offset-2 col-sm-15">
                                                                <button type="submit" class="btn btn-warning">Update</button>
                                                            </div>
                                                        </div>
                                                        
                                                        </div>
                                                    </form>

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
