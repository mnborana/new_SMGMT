<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
    <meta charset="UTF-8">
    <title>Form Validations | Admire</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="/SMGMT/config/img/xlogo1.ico.pagespeed.ic.ONh6qx31g4.html"/>
    <!-- global styles-->
    <link type="text/css" rel="stylesheet" href="/SMGMT/config/css,_components.css+css,_custom.css+vendors,_jquery-validation-engine,_css,_validationEngine.jquery.css+vendors,_datepicker,_css,_bootstrap-datepicker.min.css+vendors,_datepicker,_css"/>
    <link type="text/css" rel="stylesheet" href="/SMGMT/config/css,_components.css+css,_custom.css+vendors,_select2,_css,_select2.min.css+css,_pages,_dataTables.bootstrap.css+css,_pages,_tables.css.pagespeed.cc._6lRWz19bZ.css"/>

    <!-- end of global styles-->
   
</head>
<body>
<div class="preloader" style=" position: fixed;
  width: 100%;
  height: 100%;
  top: 0;
  left: 0;
  z-index: 100000;
  backface-visibility: hidden;
  background: #ffffff;">
    <div class="preloader_img" style="width: 200px;
  height: 200px;
  position: absolute;
  left: 48%;
  top: 48%;
  background-position: center;
  z-index: 999999">
        <img src="/SMGMT/config/img/loader.gif.pagespeed.ce.pu_lpoGKrw.gif" style=" width: 40px;" alt="loading...">
    </div>
</div>
    <div id="wrap">
        <div id="top">
            <!-- .navbar -->
            	<jsp:include page="/View/common/header.jsp"></jsp:include>
            <!-- /.navbar -->
        </div>
        <!-- /#top -->
        
        
        <div class="wrapper">
        	 <!-- /.left navbar -->
                <jsp:include page="/View/common/left-navbar.jsp"></jsp:include>
             <!-- /.left navbar -->
             
             
            <!-- /#left -->
            <div id="content" class="bg-container">
                <header class="head">
                    <div class="main-bar">
                        <div class="row no-gutters">
                            <div class="col-sm-5 col-lg-6">
                                <h4 class="nav_top_align">
                                    <i class="fa fa-pencil"></i>
                                    Form Validations
                                </h4>
                            </div>
                            <div class="col-sm-7 col-lg-6">
                                <ol class="breadcrumb float-right nav_breadcrumb_top_align">
                                    <li class="breadcrumb-item">
                                        <a href="index1.html">
                                            <i class="fa fa-home" data-pack="default" data-tags=""></i>
                                            Dashboard
                                        </a>
                                    </li>
                                    <li class="breadcrumb-item">
                                        <a href="#">Forms</a>
                                    </li>
                                    <li class="active breadcrumb-item">Form Validations</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </header>
                
             <!-- start your code from here  -->  
              <form id="bookissue-form" action="/index.php/library/bookissue/create" method="post">  
                          <div class="col-sm-12">
       						   <ul class="nav nav-tabs tab-nav-right" role="tablist">
                                <li role="presentation"><a href="#teacher" data-toggle="tab">Issue Book</a></li>&nbsp;&nbsp;
								<li role="presentation"><a href="#list" data-toggle="tab">Book Issue List</a></li>
                             	</ul>
       					 			<h6 class="content-group text-semibold"></h6>
   						   </div>
    					</form>
                <div class="outer">
                    <div class="inner bg-container">
                        <div class="row">
                            <div class="col-xl-12">
                                <div class="card">
                                    <div class="card-header bg-white">
                                        <i class="fa fa-file-text-o"></i>
                                  		  Student Details
                                    </div>
                                    <div class="card-block m-t-35">
                                     <form action="/SMGMT/MainServlet" class="form-horizontal  login_validator" id="form_block_validator">
                                     	<div class="form-group row">
                                               	<div class="col-lg-8">
                                                	<input type="text" list="browseBook" autocomplete="off" onkeyup="getbookdetails(this.value)" class="form-control" id="searchId"  name="search" placeholder="Search by BookNo/BookName/AuthorName">
	                                                <datalist id="browseBook">
	                                                </datalist>
                                                 </div> 			
                                                 <!-- <div class="col-md-4">
                                                	<label></label>
                                                	<a href="javascript:getbookdetails()" id="id1" class="btn btn-info">Search</a>
                                            	</div> -->
                                            	 <div class="col-lg-8">
                                                    <label for="category" class="col-form-label" >Select User Type *</label>
                                                	<select class="form-control show-tick" name="type" id="userType" onchange="studentDetails('stud')" title="Select Category" data-live-search="true" required="required">
                                            							<option value="" >Select Type</option>
																		<option value="Student">Student</option>
																		<option value="Teacher">Teacher</option>
                                          	 		 </select>
                                          	 	 </div>
                                          	 	</div>
                                          	 	
                                          	   <div class="form-group row" id="stud" style=" display: none;">
                                          	     <div class="form-group row">
                                          	     <div class="col-lg-6 ">
                                                    <label for="required2" class="col-form-label">Name *</label>
                                               	    <input type="text" id="required2" name="name" class="form-control" required>
                                                </div>
								             <div class="col-lg-6 ">
                                                    <label for="required2" class="col-form-label">ID *</label>
                                               	    <input type="text" id="required2" name="Id" class="form-control" required>
                                                </div>
                                                </div>
                                                 <div class="form-group row">
								             <div class="col-lg-6 ">
                                                    <label for="required2" class="col-form-label">Std *</label>
                                               	    <input type="text" id="required2" name="std" class="form-control" required>
                                                </div>
								             <div class="col-lg-6 ">
                                                    <label for="required2" class="col-form-label">Div *</label>
                                               	    <input type="text" id="required2" name="div" class="form-control" required>
                                                </div> 
                                              </div>
                                             </div>
                                             <div class="form-group row" id="stud" style=" display: none;">
                                          	     <div class="form-group row">
                                          	     <div class="col-lg-6 ">
                                                    <label for="required2" class="col-form-label">Name *</label>
                                               	    <input type="text" id="required2" name="name" class="form-control" required>
                                                </div>
								             <div class="col-lg-6 ">
                                                    <label for="required2" class="col-form-label">ID *</label>
                                               	    <input type="text" id="required2" name="Id" class="form-control" required>
                                                </div>
                                                </div>
                                                </div>
                                               <div class="form-group row">
                                          	   <div class="col-lg-8">
                                                    <label class="col-form-label">Book Issue Date *</label>
                                                    <input type="text" id="date"class="form-control form_val_popup_dp3" name="date" placeholder="YYYY-MM-DD"/>
                                                </div>
                                                <div class="col-lg-8">
                                                    <label class="col-form-label">Book Due Date *</label>
                                                    <input type="text" id="date"class="form-control form_val_popup_dp3" name="date" placeholder="YYYY-MM-DD"/>
                                                </div>
                                                </div>
                                                  <div class="form-actions form-group row">
	                                            <input type="submit" value="Save Book" name="addbook" class="btn btn-primary">
	                                         
                                           </div>
                                          	  </form>
                                </div>
                            </div> <!-- /.col-lg-12 -->
                        </div> <!-- /.row -->
                    </div> <!-- /.inner -->
                </div> <!-- /.outer -->
            
            
            <%-- <div class="outer">
                    <div class="inner bg-container">
                        <div class="card">
                            <div class="card-header bg-white">
                              Book Information
                            </div>
                            <div class="card-block m-t-35" id="user_body">
                                <div class="table-toolbar">
                                    
                                    <div class="btn-group float-right users_grid_tools">
                                        <div class="tools"></div>
                                    </div>
                                </div>
                                <div>
                                    <div>
                                        <table class="table  table-striped table-bordered table-hover dataTable no-footer" id="editable_table" role="grid">
                                            <thead>
                                            <tr role="row">
                                                <th class="sorting_asc wid-20" tabindex="0" rowspan="1" colspan="1">BookNo</th>
                                                <th class="sorting wid-25" tabindex="0" rowspan="1" colspan="1">Book Name</th>
                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Author Name</th>
                                                <th class="sorting wid-20" tabindex="0" rowspan="1" colspan="1">Publisher Name</th>
                                                <th class="sorting wid-15" tabindex="0" rowspan="1" colspan="1">edition</th>
                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Cupboard No</th>
                                                
                                            </tr>
                                            </thead>
                                            <tbody><%  AddBookDao casteDAO=new AddBookImpl();
										request.setAttribute("display_book", casteDAO.getBookDetails());
										int j=0;%>
										<c:forEach items="${display_book}" var="d">
											<tr>
												<td><%=(++j) %></td>
												
												<td><c:out value="${d.bookName}"></c:out></td>
												<td><c:out value="${d.authorName}"></c:out></td>
												<td><c:out value="${d.publisherName}"></c:out></td>
												<td><c:out value="${d.edition}"></c:out></td>
												<td><c:out value="${d.cupboardNo}"></c:out></td>
												
												
									
										
										</c:forEach></tbody>
                                        </table>
                                    </div>
                                </div>
                                <!-- END EXAMPLE TABLE PORTLET-->
                            </div>
                        </div>
                    </div>
                    <!-- /.inner -->
                </div> --%>
                <!-- /.outer -->
                <!-- Modal -->
                <div class="modal fade" id="search_modal" tabindex="-1" role="dialog" aria-hidden="true">
                    <form>
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span class="float-right" aria-hidden="true">&times;</span>
                                </button>
                                <div class="input-group search_bar_small">
                                    <input type="text" class="form-control" placeholder="Search..." name="search">
                                    <span class="input-group-btn">
							        <button class="btn btn-secondary" type="submit"><i class="fa fa-search"></i></button>
							      </span>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            
            
            </div> <!-- /#content -->
        </div>
        
       <!--wrapper-->
       
        
        
</div>
<!-- /#wrap -->

	<script type="text/javascript" src="/SMGMT/config/js/components.js"></script>
	<script type="text/javascript" src="/SMGMT/config/js/custom.js"></script>

    <script type="text/javascript" src="/SMGMT/config/vendors/jquery-validation-engine/js/jquery.validationEngine.js"></script>
    <script type="text/javascript" src="/SMGMT/config/vendors/jquery-validation-engine/js/jquery.validationEngine-en.js"></script>
    <script type="text/javascript" src="/SMGMT/config/vendors/jquery-validation/js/jquery.validate.js"></script>
    <script type="text/javascript" src="/SMGMT/config/vendors/datepicker/js/bootstrap-datepicker.min.js"></script>
    <script type="text/javascript" src="/SMGMT/config/vendors/datetimepicker/js/DateTimePicker.min.js"></script>
    <script type="text/javascript" src="/SMGMT/config/vendors/bootstrapvalidator/js/bootstrapValidator.min.js"></script>
    <script type="text/javascript" src="/SMGMT/config/vendors/moment/js/moment.min.js"></script>
	<script type="text/javascript" src="/SMGMT/config/js/form.js"></script>
    <script type="text/javascript" src="/SMGMT/config/js/pages/form_validation.js"></script>
	<script type="text/javascript" src="js/components.js.pagespeed.jm.vxV3GQYFro.js"></script>
	<script type="text/javascript" src="js/custom.js.pagespeed.jm.CN8Ow3CJOG.js"></script>

    <script type="text/javascript" src="/SMGMT/config/vendors/select2/js/select2.js.pagespeed.jm.Eugd1Y0BmV.js"></script>
    <script src="/SMGMT/config/vendors/datatables/js/jquery.dataTables.min.js+dataTables.bootstrap.min.js.pagespeed.jc.HRNT0WoBU9.js"></script>
    <script src="/SMGMT/config/vendors/datatables/js/dataTables.responsive.min.js+dataTables.buttons.min.js+buttons.colVis.min.js+buttons.html5.min.js+buttons.bootstrap.min.js+buttons.print.min.js.pagespeed.jc.TdR_"></script>
    
    <script>eval(mod_pagespeed_g_o5ieHdNa);</script>
    <script>eval(mod_pagespeed_UzcyJ5ysoL);</script>
    <script>eval(mod_pagespeed_sB4kJD0xfI);</script>
    <script>eval(mod_pagespeed_aYQJk4iDci);</script>
    <script>eval(mod_pagespeed_wVkzf2s7YZ);</script>
    <script>eval(mod_pagespeed_Ij0pRaH8BP);</script>
    <script>eval(mod_pagespeed_wfmKXYO4Nj);</script>
    <script>eval(mod_pagespeed_EYzby3B1$L);</script>

    <script type="text/javascript" src="/SMGMT/config/js/pages/users.js"></script>

</body>
<script type="text/javascript">
function getbookdetails(id){
//	alert(id);
	var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	     var demoData = this.responseText;
	     var str=demoData.split(",");
	     for(var i=0; i<str.length; i++)
	    	 {
	    	 var text=text+"<option value=\""+str[i]+"\"> </option>";
	    	 }
	     //alert(text);
			document.getElementById("browseBook").innerHTML = text;		 
	      
	     
	    }
	  };
	  xhttp.open("POST", "/SMGMT/MainServlet?detailId="+id, true);
	  xhttp.send();
	
}

	
function studentDetails(stud)
{
	var x = document.getElementById("stud");
	if(document.getElementById("userType").value=="Student")
		{
			x.style.display = "block";
		}
	else
		{
		document.getElementById("stud").style.display = "none";
		}
}
	/* var x = document.getElementById(id);
	var y = document.getElementById(id1);
	
	if( x==null ){
		document.getElementById("chequeNo").required=false;
		document.getElementById("bankInfo").required=false;
		
		document.getElementById("chequeDetails").style.display = "none";
		document.getElementById("bankDetails").style.display = "none";
		
	}
	else if(x!=null && y!=null){
		x.style.display = "block";
		y.style.display = "block";
		
		document.getElementById("chequeNo").required=true;
		document.getElementById("bankInfo").required=true;
	}
	else{	

		document.getElementById("chequeNo").required=false;
		document.getElementById("chequeDetails").style.display = "none";
		
		x.style.display = "block";
		document.getElementById("bankInfo").required=true;
	}
}
 */


</script>



</html>