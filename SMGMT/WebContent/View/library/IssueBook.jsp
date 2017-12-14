<!DOCTYPE html>
<%@page import="com.servletStore.library.model.BookCatPojo"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.servletStore.library.model.BookCatImpl"%>
<%@page import="com.servletStore.library.model.BookDAO"%>
<%@page import="com.servletStore.library.model.AddBookImpl"%>
<%@page import="com.servletStore.library.model.AddBookDao"%>
<%@page import="com.servletStore.library.model.AddBookPojo"%>
<%@page import="java.util.List"%>
<%@page import=" utility.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

<head>
<!-- =======================	CSS Include ======================= -->
  <%--   <jsp:include page="/Common/cssJs.jsp"></jsp:include> --%>
<!-- =======================	End CSS Include ======================= -->

 



</head>

<body class="theme-red">
<!-- =======================	Header Include ======================= -->
    <jsp:include page="/View/common/header.jsp"></jsp:include>
<!-- =======================	End Header Include ======================= -->
<!-- =======================	Left Navbar Include ======================= -->
    <jsp:include page="/View/common/left-navbar.jsp"></jsp:include>
<!-- =======================	End Left Navbar Include ======================= -->
  

    <section class="content">
        <div class="container-fluid">
            <!-- Basic Validation --> 
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card"> 
                        <ol class="breadcrumb breadcrumb-col-orange">
			              <li><a href="javascript:void(0);"><i class="material-icons">home</i> Home</a></li>
			              <li><a href="javascript:void(0);"><i class="material-icons">library_books</i> Library</a></li>
			              <li class="active"><i class="material-icons">archive</i> Data</li>
			            </ol>
			          
			         
                        <div class="body">
                         <form id="bookissue-form" action="/index.php/library/bookissue/create" method="post">  
                          <div class="col-sm-12">
     						  
       						   <ul class="nav nav-tabs tab-nav-right" role="tablist">
                                <li role="presentation" class="active"><a href="#stud" data-toggle="tab">Student</a></li>
                                <li role="presentation"><a href="#teacher" data-toggle="tab">Teacher</a></li>
                                <li role="presentation"><a href="#list" data-toggle="tab">Book Issue List</a></li>
                             </ul>
       					 			<h6 class="content-group text-semibold"></h6>
   							 </div>
    					</form>
                       <!--  <h4 class="panel-title">Book Issue Details </h4> -->
                        
                        <div class="tab-content">
                                <div role="tabpanel" class="tab-pane fade in active" id="stud">
                                    <b>Book Details </b>
                                   	<div id="demo" style="display:block">
                        				 <form action="/SMGMT/MainServlet" method="post">
                          					 <div class="row clearfix">
                                               	<div class="col-md-8">
                                               		 <input type="text" class="form-control" id="searchId" name="search" placeholder="Search by Name/Author Name" >
                                                 </div> 			
                                                 <div class="col-md-4">
                                                	<label></label>
                                                	<a onclick="getbookdetails()" class="btn btn-info" name="searchbook">Search</a>
                                            	 </div>
                                   			  </div>
                                   		  </form>
                                     </div>
                                   
                                   					  <h5>
                               							 Book List
                           							 </h5>
                                     <div class="table-responsive">
                             			<form action="/SMGMT/MainServlet" method="post">
                              				  <table class="table table-bordered table-striped table-hover dataTable js-exportable">
                              			  <thead>
                             			 <tr>
                                            <!-- <th>Sr.No</th> -->
                                            <th>Book No</th>
                                            <th>Book Name</th>
                                            <th>Publisher Name</th>
                                            <th>Author Name</th>
                                            <th>Edition </th>
                                            <th>Cupboard No. </th>
                                            <th>Due Date</th>
                                        </tr>
				        			  </thead>
				        			  <tbody>
				        			 <%  AddBookDao casteDAO=new AddBookImpl();
										request.setAttribute("display_book", casteDAO.getBookDetails());
										int j=0;%>
										<c:forEach items="${display_book}" var="d">
											<tr>
												<td><%=(++j) %></td>
												<td><c:out value="${d.bookNo}"></c:out></td>
												<td><c:out value="${d.bookName}"></c:out></td>
												<td><c:out value="${d.authorName}"></c:out></td>
												<td><c:out value="${d.publisherName}"></c:out></td>
												<td><c:out value="${d.edition}"></c:out></td>
												<td><c:out value="${d.price}"></c:out></td>
												<td><c:out value="${d.cupboardNo}"></c:out></td>
												<td><c:out value="${d.quantity}"></c:out></td>
												<td><c:out value="${d.language}"></c:out></td>
											</tr>
										</c:forEach>
                                    </tbody>
                   </table>
                   
                                     	
                               
                                   
                                 </form>
                               
            
                            </div>
                            
                            
                        
                   
                
             
             
                                    <b>Student Info </b>
                                    <div>
                                       
                           <div id="demo" style="display:block">
                        		 <form action="/SMGMT/MainServlet" method="post">
                          			 <div class="row clearfix">
                                               	<div class="col-md-8">
                                               		 <input type="text" class="form-control" name="search" placeholder="Search by name/ID" >
                                                 </div> 			
                                                 <div class="col-md-4">
                                                	<label>&nbsp;</label>
                                                	<a href="javascript:getbookdetails()" class="btn btn-info">Search</a>
                                            	</div>
                                     
                                      <div class="col-md-6">
										<div class="form-group form-float">
											<div class="form-line">
												<input type="text" class="form-control" name="date" required="required">
												<label class="form-label">Name</label>
												
											</div>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group form-float">
											<div class="form-line">
												<input type="text" class="form-control" name="date" required="required" > 
												<label class="form-label">ID</label>
												
											</div>
										</div>
										</div>
										<div class="col-md-6">
										<div class="form-group form-float">
											<div class="form-line">
												<input type="text" class="form-control" name="date" required="required" > 
												<label class="form-label">Standard</label>
												
											</div>
										</div>
										</div>
										<div class="col-md-6">
										<div class="form-group form-float">
											<div class="form-line">
												<input type="text" class="form-control" name="date" required="required" > 
												<label class="form-label">Division </label>
												
											</div>
										</div>
										</div>
										</div>
								
                                      
                                  
					    		
					  			 <button class="btn btn-primary waves-effect" type="submit" name="addbook">Save</button> 
                       </form>
                                    </div>
                                </div>
                                </div>
                              
                                <div role="tabpanel" class="tab-pane fade" id="teacher">
                                    <b>Teacher info</b>
                                    <div class="row clearfix">
                                    	<div class="col-md-8">
                                               		 <input type="text" class="form-control" name="search" placeholder="Search by name/ID" >
                                                 </div> 			
                                                 <div class="col-md-4">
                                                	<label>&nbsp;</label>
                                                	<a href="javascript:getbookdetails()" class="btn btn-info">Search</a>
                                            	</div>
                                     <div class="col-md-6">
										<div class="form-group form-float">
											<div class="form-line">
												<input type="text" class="form-control" name="date" required="required">
												<label class="form-label">Name</label>
												
											</div>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group form-float">
											<div class="form-line">
												<input type="text" class="form-control" name="date" required="required" > 
												<label class="form-label">ID</label>
												
											</div>
										</div>
										</div>
                                </div>
                                </div>
                                 <div role="tabpanel" class="tab-pane fade" id="list">
                                    <b>Book Issue List</b>
                                    <p>
                                        
										List
										
                                    </p>
                                </div>
                            </div>
                 </div>
         </div>
           </div>             
     </div>
 </div>
		
</section>
                          
  <!-- #END# Basic Validation -->
        
      
    </section>
  

<!--     Jquery Core Js -->
    <script src="/SMGMT/Config/plugins/jquery/jquery.min.js"></script>

<!--     Bootstrap Core Js -->
    <script src="/SMGMT/Config/plugins/bootstrap/js/bootstrap.js"></script>

<!--     Select Plugin Js -->
    <script src="/SMGMT/Config/plugins/bootstrap-select/js/bootstrap-select.js"></script>

<!--     Slimscroll Plugin Js -->
    <script src="/SMGMT/Config/plugins/jquery-slimscroll/jquery.slimscroll.js"></script>
    
<!--     Bootstrap Colorpicker Js -->
    <script src="/SMGMT/Config/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>

<!--     Dropzone Plugin Js -->
    <script src="/SMGMT/Config/plugins/dropzone/dropzone.js"></script>

<!--     Input Mask Plugin Js -->
    <script src="/SMGMT/Config/plugins/jquery-inputmask/jquery.inputmask.bundle.js"></script>

<!--     Multi Select Plugin Js -->
    <script src="/SMGMT/Config/plugins/multi-select/js/jquery.multi-select.js"></script>

<!--     Jquery Spinner Plugin Js -->
    <script src="/SMGMT/Config/plugins/jquery-spinner/js/jquery.spinner.js"></script>

<!--     Bootstrap Tags Input Plugin Js -->
    <script src="/SMGMT/Config/plugins/bootstrap-tagsinput/bootstrap-tagsinput.js"></script>

<!--     noUISlider Plugin Js -->
    <script src="/SMGMT/Config/plugins/nouislider/nouislider.js"></script>

<!--     Jquery Validation Plugin Css -->
    <script src="/SMGMT/Config/plugins/jquery-validation/jquery.validate.js"></script>

<!--     JQuery Steps Plugin Js -->
    <script src="/SMGMT/Config/plugins/jquery-steps/jquery.steps.js"></script>

<!--     Sweet Alert Plugin Js -->
    <script src="/SMGMT/Config/plugins/sweetalert/sweetalert.min.js"></script>

<!--     Waves Effect Plugin Js -->
    <script src="/SMGMT/Config/plugins/node-waves/waves.js"></script>
    
 <!-- Jquery DataTable Plugin Js -->
    <script src="/SMGMT/Config/plugins/jquery-datatable/jquery.dataTables.js"></script>
    <script src="/SMGMT/Config/plugins/jquery-datatable/skin/bootstrap/js/dataTables.bootstrap.js"></script>
    <script src="/SMGMT/Config/plugins/jquery-datatable/extensions/export/dataTables.buttons.min.js"></script>
    <script src="/SMGMT/Config/plugins/jquery-datatable/extensions/export/buttons.flash.min.js"></script>
    <script src="/SMGMT/Config/plugins/jquery-datatable/extensions/export/jszip.min.js"></script>
    <script src="/SMGMT/Config/plugins/jquery-datatable/extensions/export/pdfmake.min.js"></script>
    <script src="/SMGMT/Config/plugins/jquery-datatable/extensions/export/vfs_fonts.js"></script>
    <script src="/SMGMT/Config/plugins/jquery-datatable/extensions/export/buttons.html5.min.js"></script>
    <script src="/SMGMT/Config/plugins/jquery-datatable/extensions/export/buttons.print.min.js"></script>
    
<!--      Autosize Plugin Js -->
    <script src="/SMGMT/Config/plugins/autosize/autosize.js"></script>
    
<!--      Moment Plugin Js -->
    <script src="/SMGMT/Config/plugins/momentjs/moment.js"></script>
    
<!--     Bootstrap Material Datetime Picker Plugin Js -->
    <script src="/SMGMT/Config/plugins/bootstrap-material-datetimepicker/js/bootstrap-material-datetimepicker.js"></script>

<!--     Custom Js -->
    <script src="/SMGMT/Config/js/admin.js"></script>
    <script src="/SMGMT/Config/js/pages/forms/form-validation.js"></script>
	<script src="/SMGMT/Config/js/pages/forms/basic-form-elements.js"></script>
	<script src="/SMGMT/Config/js/pages/tables/jquery-datatable.js"></script>
<!--     Demo Js -->
    <script src="/SMGMT/Config/js/demo.js"></script>
</body>

<script type="text/javascript">
     
/* function loadDoc(id) {
	alert(id);
	  var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	     var demoData = this.responseText;
	     /* //alert(demoData);
	     if(demoData!=null){
	    	 document.getElementById("demo").style.display="block"; */
	   /* var str=demoData.split(",");
	    	
	     document.getElementById("bid").value=str[0];
	   	 document.getElementById("date").value=str[1];
	   	 document.getElementById("category").value=str[2];
	     document.getElementById("bookName").value=str[3];
	     document.getElementById("pubName").value=str[4];
	     document.getElementById("authorName").value=str[5];
	     document.getElementById("edition").value=str[6];
	     document.getElementById("lang2").value=str[7];
	     
	     document.getElementById("quantity").value=str[8];
	     document.getElementById("price").value=str[9];
	     document.getElementById("cupbno").value=str[10];
	     
	    }
	  };
	  xhttp.open("POST", "/SMGMT/MainServlet?updateId="+id, true);
	  xhttp.send();
	}
	   */
	   function getbookdetails(id) {
			alert(id);
			  var xhttp = new XMLHttpRequest();
			  xhttp.onreadystatechange = function() {
			    if (this.readyState == 4 && this.status == 200) {
			     var demoData = this.responseText;
			     
			    var str=demoData.split(",");
			    	
			    	 if(document.getElementById("searchId").value=="" || document.getElementByName("bookName").value=="" ||  document.getElementById("authorName").value=="")
			    		 {
			    		 
			    		 
			    		 
			    		 }
			    		 }
			    		 
			   
			    
			  };
			  xhttp.open("POST", "/SMGMT/MainServlet?updateId="+id, true);
			  xhttp.send();
			}
			  

</script>

            
            
            



</html>