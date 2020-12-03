<!DOCTYPE html>

<%@page import="borrow_table_model.Borrow_Table_Model"%>
<%@page import="common_use_bean.Book_Use_Bean"%>
<%@page import="common_use_bean.Borrow_Use_Bean"%><html class="no-js">

<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="<%=Common_Things.url %>/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=Common_Things.url %>/css/main.css">
    <link rel="stylesheet" href="<%=Common_Things.url %>/css/animate.min.css">
    <link rel="stylesheet" href="<%=Common_Things.url %>/vendor/offline/theme.css">
    <link rel="stylesheet" href="<%=Common_Things.url %>/vendor/bootstrap-select/bootstrap-select.css">
    <link rel="stylesheet" href="<%=Common_Things.url %>/vendor/dropzone/dropzone.css">
    <link rel="stylesheet" href="<%=Common_Things.url %>/vendor/slider/slider.css">
    <link rel="stylesheet" href="<%=Common_Things.url %>/vendor/bootstrap-datepicker/datepicker.css">
    <script src="<%=Common_Things.url %>/vendor/modernizr.js"></script>
    <script type="text/javascript">
		function validateForm() {
		    var x = document.forms["myForm"]["member_id"].value;
		    if (x==null || x=="") {
		        alert("Please enter Member ID");
		        return false;
		    }

		}
	</script>
    
    
</head>

<body>

    <div class="app" data-sidebar="locked">
          <%@include file="../../common/tab.jsp" %>
               
           
			<%
			String inventry_sl=(String)request.getParameter("jin");
			String bn=(String)request.getParameter("bn");

			%>
            <section class="main-content">
                <div class="content-wrap">

                    <div class="row mg-b">
                        <div class="col-xs-8"> 
                            <h3 class="no-margin">Borrow History: <%=inventry_sl %>(<%=bn %>)</h3>
                             
                        </div> 
                      
                    </div>             
                    <%
							String message=(String)session.getAttribute("delete_borrow_message");
							if(message!=null){
							%>
								
								 <div class="alert alert-success">
                                        <%=message%>
                                    </div>


							<%			session.removeAttribute("delete_borrow_message");
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
                                                <th>Member ID </th>
                                                <th>Name</th>
                                                <th>Borrow Date</th>
                                                <th>Return Date</th> 
                                                <th>Status</th>
                                                <th>Update</th>
                                                
                                            </tr>
                                        </thead>
                                        <tbody>

                                	<% 
                                	
                                	Borrow_Table_Model obj_Borrow_Table_Model=new Borrow_Table_Model();
                                	
                                	List<Borrow_Use_Bean> list_borrow_history=obj_Borrow_Table_Model.borrow_history_for_a_barcode(bn);
                       	                                	 
                       	                                	
                       	                                	if(list_borrow_history!=null){
                       	                                		Iterator<Borrow_Use_Bean> it_list_borrow_history=list_borrow_history.iterator();
                       	                                		Borrow_Use_Bean obj_Borrow_Use_Bean=new Borrow_Use_Bean();
                       	                                	int temp_count=1;
                       	                                		while(it_list_borrow_history.hasNext()){
                       	                                			obj_Borrow_Use_Bean=it_list_borrow_history.next();
                           	%>
 
                                	                                    
                                   			 <tr>
                                                <td><%=temp_count++ %></td>
                                                <td><%=obj_Borrow_Use_Bean.getMember_id() %></td>
                                               <td> 
                                               
                                                <%=obj_Borrow_Use_Bean.getMember_name() %></a> 
                                               </td>
                                               <td><%=obj_Borrow_Use_Bean.getBorrow_date() %></td>
                                               
                                               <td><%=obj_Borrow_Use_Bean.getReturn_date() %></td>
                                               <td><%=obj_Borrow_Use_Bean.getStatus() %></td>
                                               <td><a href="<%=Common_Things.url %>/update-borrow-book/?lololo=<%=obj_Borrow_Use_Bean.getBorrow_id_no() %> " class="btn btn-success btn-xs">Update</a> </td> 
                                               
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
                    
                 <%
                    }
                 
                 %>   
                    
                    
                </div>
            </section>
        </section>

    </div>
    <script src="<%=Common_Things.url %>/vendor/jquery-1.11.0.min.js"></script>
    <script src="<%=Common_Things.url %>/bootstrap/js/bootstrap.js"></script>
    <script src="<%=Common_Things.url %>/vendor/bootstrap-select/bootstrap-select.js"></script>
    <script src="<%=Common_Things.url %>/vendor/dropzone/dropzone.js"></script>
    <script src="<%=Common_Things.url %>/vendor/parsley.min.js"></script>
    <script src="<%=Common_Things.url %>/vendor/jquery.maskedinput.min.js"></script>
    <script src="<%=Common_Things.url %>/vendor/fuelux/checkbox.js"></script>
    <script src="<%=Common_Things.url %>/vendor/fuelux/radio.js"></script>
    <script src="<%=Common_Things.url %>/vendor/fuelux/wizard.js"></script>
    <script src="<%=Common_Things.url %>/vendor/fuelux/pillbox.js"></script>
    <script src="<%=Common_Things.url %>/vendor/fuelux/spinner.js"></script>
    <script src="<%=Common_Things.url %>/vendor/slider/bootstrap-slider.js"></script>
    <script src="<%=Common_Things.url %>/vendor/bootstrap-datepicker/bootstrap-datepicker.js"></script>
    <script src="<%=Common_Things.url %>/vendor/wysiwyg/jquery.hotkeys.js"></script>
    <script src="<%=Common_Things.url %>/vendor/wysiwyg/bootstrap-wysiwyg.js"></script>
    <script src="<%=Common_Things.url %>/vendor/switchery/switchery.js"></script>
    <script src="<%=Common_Things.url %>/js/off-canvas.js"></script>
    <script src="<%=Common_Things.url %>/vendor/offline/offline.min.js"></script>
    <script src="<%=Common_Things.url %>/js/main.js"></script>
    <script src="<%=Common_Things.url %>/js/forms.js"></script>
      
</body>
</html>
