<!DOCTYPE html>

<%@page import="book_table.Staff_Book_Table_Model"%>
<%@page import="common_use_bean.Book_Use_Bean"%>
<%@page import="category_table.Category_Table"%>
<%@page import="common_use_bean.Category_Use_Bean"%>
<%@page import="member_table.Member_Table_Model"%>
<%@page import="common_use_bean.Member_Use_Bean"%>
<%@page import="copy_table_model.Copy_Table_Model"%><html class="no-js">

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
		    var x = document.forms["myForm"]["barcode"].value;
		    if (x==null || x=="") {
		        alert("Please enter Barcode");
		        return false;
		    }

		}
	</script>
    
    
</head>

<body>

    <div class="app" data-sidebar="locked">

         <%@include file="../../common/tab.jsp" %>

			<%
			String member_id=(String)request.getParameter("id");
			String Member_name=(String)request.getParameter("n");
			//String admission_no=(String)request.getParameter("ad");
			
			
			%>
 
            <section class="main-content">

                <div class="content-wrap">

                    <div class="row mg-b">
                        <div class="col-xs-6"> 
                            <h3 class="no-margin">Borrow Book: <%=Member_name%></h3>
                             
                        </div> 
                         
                    </div>             

                    <div class="col-lg-6">

                  			  <%
							String message=(String)session.getAttribute("borrow_book_member_message");
							if(message!=null){
							%>
								
								 <div class="alert alert-success">
                                        <%=message%>
                                    </div>


							<%			session.removeAttribute("borrow_book_member_message");
							}
							%>

                                            <section class="panel">
                                                <header class="panel-heading">Borrow Book</header>
                                                <div class="panel-body">

                                                    <form action="<%=Common_Things.url%>/borrow-book-member-controller/" class="form-horizontal" role="form" method="post" name="myForm"  onsubmit="return validateForm()">
                                                    
                                                    	<input type="hidden" name="member_id" value="<%=member_id %>">
                                                    
                                                        <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">Name </label>
                                                            	<div class="col-sm-10">
                                                               	<input type="text" class="form-control" name="member_name"  data-parsley-required="true" value="<%=Member_name %>" data-parsley-trigger="change" placeholder="Book Title" readonly="readonly">
                                                               </div> 
                                                             
                                                        </div> 
                                                     <hr> 
                                                         <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">Member ID </label>
                                                            	<div class="col-sm-10">
                                                               	<input type="text" class="form-control" name="member_id"  data-parsley-required="true" value="<%=member_id %>" data-parsley-trigger="change" placeholder="Member ID" readonly="readonly">
                                                               </div> 
                                                             
                                                        </div> 
                                                     
                                                     <hr> 
                                                         <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">Barcode No</label>
                                                            	<div class="col-sm-10">
                                                               	<input type="text" class="form-control" name="barcode" id="search" data-parsley-required="true" data-parsley-trigger="change" placeholder="Barcode">
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
                                                                    <input type="text" class="form-control" value="<%=date4 %>" name="borrow_date">
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

                                                                <div class="input-group mg-b-md input-append date datepicker" data-date="<%=date4 %>" data-date-format="dd-mm-yyyy">
                                                                    <input type="text" class="form-control" value="<%=date4 %>" name="return_date">
                                                                    <span class="input-group-btn">
                                                                        <button class="btn btn-white add-on" type="button">
                                                                            <i class="fa fa-calendar"></i>
                                                                        </button>
                                                                    </span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        
                                                        
                                                     <hr> 
                                                     
                                                        </div> 
                                                        <div class="form-group">   
                                                            <div class="col-sm-offset-2 col-sm-15">
                                                                <button type="submit" class="btn btn-warning">Borrow Book</button>
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
