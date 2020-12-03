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
    
     <script type="text/javascript">
		function validateForm() {
		    var x = document.forms["myForm"]["member_id"].value;
		    if (x==null || x=="") {
		        alert("Please enter Member ID");
		        return false;
		    }

 
		    var x = document.forms["myForm"]["member_name"].value;
		    if (x==null || x=="") {
		        alert("Please enter Member Name");
		        return false;
		    }

		    var x = document.forms["myForm"]["telephone"].value;
		    if (x==null || x=="") {
		        alert("Please enter Telephone");
		        return false;
		    }

		    var x = document.forms["myForm"]["number_id"].value;
		    if (x==null || x=="") {
		        alert("Please enter ID Number");
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
                            <h3 class="no-margin">Add Member</h3>
                            
                        </div>
                        
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
                                                <header class="panel-heading">Add Member Form</header>
                                                <div class="panel-body">

                                                    <form action="<%=Common_Things.url%>/add-member-controller/" class="form-horizontal" role="form" name="myForm"  onsubmit="return validateForm()">
                                                        <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">Member ID</label>
                                                            	<div class="col-sm-10">
                                                               	<input type="text" class="form-control" name="member_id" data-parsley-required="true" data-parsley-trigger="change" placeholder="Member ID">
                                                               </div> 
                                                             
                                                        </div> 
                                                        	<hr>
                                                           
                                                         <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">Name</label>
                                                            <div class="col-sm-10">
                                                                <input type="text" class="form-control" placeholder="Name" name="member_name">
                                                            </div>
                                                        </div>
                                                        
                                                        
                                                       		<hr> 
                                                        
                                                         <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">Telephone</label>
                                                            <div class="col-sm-10">
                                                                <input type="text" class="form-control" placeholder="Telephone" name="telephone">
                                                            </div>
                                                        </div>
                                                        
                                                          	<hr> 
                                                         <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">ID Number</label>
                                                            <div class="col-sm-10">
                                                                <input type="text" class="form-control" placeholder="ID Number" name="number_id">
                                                            </div>
                                                        </div>
                                                        <hr>
                                                        <div class="form-group">
                                                             <label for="inputPassword3" class="col-sm-2 control-label">Profile Status</label>
                                                            <div class="col-sm-10">
                                                                    <label> 
                                                                        <input type="radio" name="status" value="1" checked="checked">Active
																		<input type="radio" name="status" value="0">Inactive
                                                                    </label>
                                                                </div>
                                                            </div>
                                                       
                                                    
                                                          <hr> 
                                                        <div class="form-group">  
                                                            <div class="col-sm-offset-2 col-sm-15">
                                                                <button type="submit" class="btn btn-default">Add Member</button>
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
