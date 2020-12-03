<!DOCTYPE html>

<%@page import="book_table.Staff_Book_Table_Model"%>
<%@page import="common_use_bean.Book_Use_Bean"%>
<%@page import="category_table.Category_Table"%>
<%@page import="common_use_bean.Category_Use_Bean"%>
<%@page import="member_table.Member_Table_Model"%>
<%@page import="common_use_bean.Member_Use_Bean"%>
<%@page import="copy_table_model.Copy_Table_Model"%>
<%@page import="borrow_table_model.Borrow_Table_Model"%>
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
    <script type="text/javascript">

	function confSubmit(form) { 
	if (confirm("Are you sure?")) {
	form.submit();
	}
	}

</script>
    
    
</head>

<body>

    <div class="app" data-sidebar="locked">

               <%@include file="../../common/tab.jsp" %>

			<%
			String borrow_sl_no=(String)request.getParameter("lololo");
			Borrow_Table_Model  obj_Borrow_Table_Model=new Borrow_Table_Model();
			
			Borrow_Use_Bean obj_Borrow_Use_Bean=obj_Borrow_Table_Model.get_complete_details_of_borrow(borrow_sl_no);
			%>

            <section class="main-content">

                <div class="content-wrap">

                    <div class="row mg-b">
                        <div class="col-xs-8"> 
                            <h3 class="no-margin">Update Borrowed Book: <%=obj_Borrow_Use_Bean.getBook_title() %></h3> 
                             
                        </div> 
                        <a href="<%=Common_Things.url %>/borrow-history/?jin=<%=obj_Borrow_Use_Bean.getBook_title() %>&bn=<%=obj_Borrow_Use_Bean.getBarcode() %>" class="btn btn-info">Back</a>
                      
                    </div>             
						
                    <div class="col-lg-6">
 
                  			  <%
							String message=(String)session.getAttribute("borrow_book_message");
							if(message!=null){
							%>
								
								 <div class="alert alert-success">
                                        <%=message%>
                                    </div>


							<%			session.removeAttribute("borrow_book_message");
							}
							%>

                                            <section class="panel">
                                                <header class="panel-heading">Borrow Book</header>
                                                <div class="panel-body">

                                                    <form action="<%=Common_Things.url%>/update-borrow-book-controller/" class="form-horizontal" role="form" method="post" name="myForm"  onsubmit="return validateForm()">
                                                    
                                                    	<input type="hidden" name="book_sl_no" value="<%=obj_Borrow_Use_Bean.getBook_id_no() %>">
                                                    <input type="hidden" name="borrow_sl_no" value="<%=borrow_sl_no %>"> 
                                                    <input type="hidden" name="bar_code" value="<%=obj_Borrow_Use_Bean.getBarcode() %>"> 
                                                    
                                                        <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">Book Title </label>
                                                            	<div class="col-sm-10">
                                                               	<input type="text" class="form-control" name="book_title"  data-parsley-required="true" value="<%=obj_Borrow_Use_Bean.getBook_title() %>" data-parsley-trigger="change" placeholder="Book Title" readonly="readonly">
                                                               </div> 
                                                             
                                                        </div> 
                                                     <hr> 
                                                         <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">Bar Code </label> 
                                                            	<div class="col-sm-10">
                                                               	<input type="text" class="form-control" name="barcode"  data-parsley-required="true" value="<%=obj_Borrow_Use_Bean.getBarcode()%>" data-parsley-trigger="change" placeholder="Bar Code" readonly="readonly">
                                                               </div> 
                                                             
                                                        </div> 
                                                     
                                                     <hr> 
                                                         <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">Member ID </label>
                                                            	<div class="col-sm-10">
                                                               	<input type="text" class="form-control" name="admission_no" id="search" value="<%if(obj_Borrow_Use_Bean.getMember_id()!=null){out.println(obj_Borrow_Use_Bean.getMember_id());}%>" data-parsley-required="true" data-parsley-trigger="change" placeholder="Member ID" readonly="readonly">
                                                               </div> 
                                                             
                                                        </div> 
                                                     <hr> 

                                                          <div class="form-group">
                                                            <label class="col-sm-2 control-label">Borrow Date</label>
                                                            <div class="col-sm-6">
																<%
																TimeZone.setDefault(TimeZone.getTimeZone("Asia/Jakarta"));
																SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy");
																 
																  Date today4 = new Date();
																  String date4 = format.format(today4);
																
																
																%>
                                                                <div class="input-group mg-b-md input-append date datepicker"  data-date="<%=date4 %>"  data-date-format="dd-mm-yyyy">
                                                                    <input type="text" class="form-control" value="<%if(obj_Borrow_Use_Bean.getBorrow_date()!=null){out.println(obj_Borrow_Use_Bean.getBorrow_date());}%>" name="borrow_date">
                                                                    <span class="input-group-btn">
                                                                        <button class="btn btn-white add-on" type="button">
                                                                            <i class="fa fa-calendar"></i>
                                                                        </button>
                                                                    </span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        
                                                        
                                                        <div class="form-group">
                                                            <label class="col-sm-2 control-label">Return Date</label>
                                                            <div class="col-sm-6">

                                                                <div class="input-group mg-b-md input-append date datepicker" data-date="<%if(obj_Borrow_Use_Bean.getReturn_date()!=null){out.println(obj_Borrow_Use_Bean.getReturn_date());}%>" data-date-format="dd-mm-yyyy">
                                                                    <input type="text" class="form-control" value="<%if(obj_Borrow_Use_Bean.getReturn_date()!=null){out.println(obj_Borrow_Use_Bean.getReturn_date());}%>" name="return_date">
                                                                    <span class="input-group-btn">
                                                                        <button class="btn btn-white add-on" type="button">
                                                                            <i class="fa fa-calendar"></i>
                                                                        </button>
                                                                    </span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        
                                                        
                                                     <hr> 
                                                       <div class="form-group">
                                                            <label class="col-sm-2 control-label">Returned Date</label>
                                                            <div class="col-sm-6">

                                                                <div class="input-group mg-b-md input-append date datepicker" data-date="<%=date4 %>"  data-date-format="dd-mm-yyyy">
                                                                    <input type="text" class="form-control" value="<%if(obj_Borrow_Use_Bean.getReturned_date()!=null){out.println(obj_Borrow_Use_Bean.getReturned_date());} %>" name="returned_date">
                                                                    <span class="input-group-btn">
                                                                        <button class="btn btn-white add-on" type="button">
                                                                            <i class="fa fa-calendar"></i>
                                                                        </button>
                                                                    </span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        
                                                        
                                                     <hr> 
                                                     
              										 <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">Total Days Delayed </label> 
                                                            	<div class="col-sm-10">
                                                            	
                                                            	<%
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
                                                            	
                                                            	
                                                               	<input type="text" class="form-control" name="barcode"  data-parsley-required="true" value="<%if(days_count!=null){out.println(days_count);} %>" data-parsley-trigger="change" placeholder="" readonly="readonly">
                                                               </div> 
                                                             
                                                        </div> 
                                                        
                                                        
                                                     <hr> 
                              
                                                      <div class="form-group">
                                                            <label class="col-sm-2 control-label">Status</label>
                                                            <div class="col-sm-6">
																<%
																String selected_pending=null;
																String selected_retuned=null;
																String selected_lost=null;
																String selected_other=null;
																if(obj_Borrow_Use_Bean.getStatus()!=null){
																	if(obj_Borrow_Use_Bean.getStatus().contains("Pending")){
																		selected_pending="selected='selected'";
																	}	
																	if(obj_Borrow_Use_Bean.getStatus().contains("Returned")){
																		selected_retuned="selected='selected'";
																	}	
																	if(obj_Borrow_Use_Bean.getStatus().contains("Lost")){
																		selected_lost="selected='selected'";
																	}	
																	if(obj_Borrow_Use_Bean.getStatus().contains("Other")){
																		selected_other="selected='selected'";
																	}	
																}
																%>
                                                                <select name="status">
                                                                	<option value="Pending" <%=selected_pending %> >Pending</option>
                                                               		 <option value="Returned" <%=selected_retuned %>>Returned</option>
                                                                	
                                                                
                                                                </select>
                                                            </div>
                                                        </div>
                                                        
                                                        
                                                     <hr> 
                                                        </div> 
                                                        <div class="form-group">   
                                                            <div class="col-sm-offset-2 col-sm-15">
                                                                
                                                                <input type="button" value="Update Borrow" class="btn btn-warning" onClick="confSubmit(this.form);"></input>	

                                                           </div>
                                                        </div>
                                                    </form>	
                                                </div> 
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
