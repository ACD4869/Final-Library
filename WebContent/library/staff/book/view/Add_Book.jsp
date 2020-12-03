<!DOCTYPE html>

<%@page import="book_table.Staff_Book_Table_Model"%>
<%@page import="common_use_bean.Book_Use_Bean"%><html class="no-js">

<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/animate.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/vendor/offline/theme.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css" />
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.4.2.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.autocomplete.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/vendor/bootstrap-datepicker/datepicker.css">
    <script src="<%=request.getContextPath()%>/vendor/modernizr.js"></script>

    
    <script type="text/javascript">
		function validateForm() {
		    var x = document.forms["myForm"]["book_title"].value;
		    if (x==null || x=="") {
		        alert("Please enter Book Title");
		        return false;
		    }


		    var x = document.forms["myForm"]["category_name"].value;
		    if (x==null || x=="") {
		        alert("Please enter Category");
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
                            <h3 class="no-margin">Add Book</h3>   
                            
                        </div>
                         <a href="<%=Common_Things.url %>/view-all-books/" class="btn btn-info">View All Books</a>
                                
                    </div>

                    <div class="col-lg-8">

                    <%
							String message=(String)session.getAttribute("add_book_message");
							if(message!=null){
							%>
								
								 <div class="alert alert-success">
                                        <%=message%>
                                    </div>


							<%			session.removeAttribute("add_book_message");
							}
							%>
                    
                                            <section class="panel">
                                                <header class="panel-heading">Add Book Form</header>
                                                <div class="panel-body">

                                                    <form action="<%=Common_Things.url%>/staff-add-book-controller" class="form-horizontal" role="form" name="myForm"  onsubmit="return validateForm()">
                                                        <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">Book Title </label>
                                                            	<div class="col-sm-10">
                                                               	<input type="text" class="form-control" id="book_title"  name="book_title" data-parsley-required="true" data-parsley-trigger="change" placeholder="Book Title">
                                                               </div> 
                                                             
                                                        </div> 
                                                        
                                                       
                                                        	<hr>
                                                         <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">Category</label>
                                                            <div class="col-sm-10">
                                                                <input type="text" class="form-control" id="category_name"  placeholder="Category" name="category_name">
                                                            </div>
                                                        </div>
                                                        
                                                        
                                                       		<hr> 
                                                         <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">Author</label>
                                                            <div class="col-sm-10">
                                                                <input type="text" class="form-control" placeholder="Author" name="author_name">
                                                            </div>
                                                        </div>
                                                          	<hr> 
                                                         <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">Publisher</label>
                                                            <div class="col-sm-10">
                                                                <input type="text" class="form-control" placeholder="Publisher" name="publisher_name">
                                                            </div>
                                                        </div>
                                                        <hr> 
                                                        <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">ISBN</label>
                                                            <div class="col-sm-10">
                                                                <input type="text" class="form-control" placeholder="ISBN" name="isbn">
                                                            </div>
                                                        </div>
                                                         <hr> 
                                                        </div>
                                                        <div class="form-group">  
                                                            <div class="col-sm-offset-2 col-sm-15">
                                                                <button type="submit" class="btn btn-default">Add Book</button>
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
