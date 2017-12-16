<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.servletStore.library.model.BookCatPOJO"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.servletStore.library.model.BookCatImpl"%>
<%@page import="com.servletStore.library.model.BookDAO"%>
<%@page import="com.servletStore.library.model.AddBookImpl"%>
<%@page import="com.servletStore.library.model.AddBookDAO"%>
<%@page import="com.servletStore.library.model.AddBookPOJO"%>
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
                  <div class="outer">
                    <div class="inner bg-container">
                        <div class="row">
                            <div class="col-xl-12">
                                <div class="card">
                                    <div class="card-header bg-white">
                                        <i class="fa fa-file-text-o"></i>
                                  		  Student Details
                                    </div>
                                    <div class="card-block" id="tab">
	                                     <ul class="nav nav-tabs m-t-35">
			                                <li class="nav-item">
			                                    <a class="nav-link active" href="#bookList" data-toggle="tab">Book List</a>
			                                </li>
			                                <li class="nav-item" id="themify_icon">
			                                    <a class="nav-link" href="#issuedList" data-toggle="tab">Issued List</a>
			                                </li>
			                             </ul>
					                  <div class="tab-content">
				                          <div class="tab-pane active" id="bookList">
				                              <div class="row">
				                                  <div class="col-12">
				                                       <div class="col-lg-8 m-t-20">
				                                          <form action="/SMGMT/Library" class="form-horizontal  login_validator" id="form_block_validator">
		                                     			<div class="form-group row">
		                                     				<div class="col-lg-8">
		                                     <!-- Search Book from here     ------- -->
		                                               	<input type="text" list="browseBook" autocomplete="off" onkeyup="getbookdetails(this.value)" class="form-control" id="searchId"  name="searchBook" placeholder="Search by BookNo/BookName/AuthorName">
			                                                <datalist id="browseBook">
			                                                </datalist>
			                                                </div>
		                                                 </div> 
		                                                	<div class="form-group row">	
		                                                	<div class="col-lg-8 ">
		                                                   	  <label for="required2" class="col-form-label">User Type *</label>
										                       <div class="controls">
												                 <input type="radio" value="Student" style="margin-left: 1%;" name="userType" id="userType" onclick="studentDetails('stud')" checked="checked"> Student
												                 <input type="radio" value="Teacher" style="margin-left: 1%;" name="userType" id="userType" onclick="teacherDetails('teacher')" > Teacher
												               </div>
												             </div>
			                                      	 	</div>
		                                         <!-- Search stud from here     ----- -->
		                                          	   <div class="form-group row" id="stud" style="display: none">
		                                          	      <div class="col-lg-8">
		                                                	<input type="text" list="browseStud" autocomplete="off" onkeyup="getstuddetails(this.value)" class="form-control" id="searchStud"  name="searchStud" placeholder="Search by Id/Name">
			                                                <datalist id="browseStud">
			                                                </datalist>
		                                                 </div> 
		                                              </div>
		                                             
		                                             
		                                          <!--  Student Block        -------- -->
		                                             <div class="form-group row" id="teacher" style="display: none">
		                                          	     <div class="col-lg-8">
		                                                	<input type="text" list="browseStud" autocomplete="off" onkeyup="getstuddetails(this.value)" class="form-control" id="searchStud"  name="searchStud" placeholder="Search by Id/Name">
			                                                <datalist id="browseStud">
			                                                </datalist>
		                                                 </div> 
		                                              </div>
		                                          	<div class="form-group row">
		                                          	   <div class="col-lg-8">
		                                                    <label class="col-form-label">Book Issue Date *</label>
		                                                    <input type="text" id="date"class="form-control form_val_popup_dp3" name="issueDate" placeholder="YYYY-MM-DD"/>
		                                                </div>
		                                              </div>
		                                              <div class="form-group row">
		                                                <div class="col-lg-8">
		                                                    <label class="col-form-label">Book Due Date *</label>
		                                                    <input type="text" id="date"class="form-control form_val_popup_dp3" name="dueDate" placeholder="YYYY-MM-DD"/>
		                                                </div>
		                                                </div>
		                                              
		                                                  <div class="form-actions form-group row">
			                                            	<input type="submit" value="Save Book" name="issuebook" class="btn btn-primary">
			                                         	 </div>
		                                          	 </form>
				                              </div>
				                            </div>
				                          </div>
				                        </div>
				                     	   <div class="tab-pane" id="issuedList">
				                               <div class="row">
				                                   <div class="col-12">
				                                     <div class="col-md-4 m-t-20">
				                                       <p>Issued books list..........</p>
				                                       
				                                     </div>
				                                  </div>
				                               </div>
				                           </div>
				                       </div>
				                   </div>
				                 </div>
                            </div> <!-- /.col-lg-12 -->
                        </div> <!-- /.row -->
                    </div> <!-- /.inner -->
                </div> <!-- /.outer -->
            
            
         
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
	  xhttp.open("POST", "/SMGMT/Library?detailId="+id, true);
	  xhttp.send();
	
}
function getstuddetails(id){
//	alert(id);
	var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	     var demo = this.responseText;
	     var stud=demo.split(",");
	     for(var i=0; i<stud.length; i++)
	    	 {
	    	 var text=text+"<option value=\""+stud[i]+"\"> </option>";
	    	 }
	     //alert(text);
			document.getElementById("browseStud").innerHTML = text;		 
	      
	     
	    }
	  };
	  xhttp.open("POST", "/SMGMT/Library?studDetails="+id, true);
	  xhttp.send();
	
}
function getteacherDetails(id){
//	alert(id);
	var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	     var demo = this.responseText;
	     var stud=demo.split(",");
	     for(var i=0; i<stud.length; i++)
	    	 {
	    	 var text=text+"<option value=\""+stud[i]+"\"> </option>";
	    	 }
	     //alert(text);
			document.getElementById("browseStud").innerHTML = text;		 
	      
	     
	    }
	  };
	  xhttp.open("POST", "/SMGMT/Library?studDetails="+id, true);
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

function teacherDetails(teacher)
{
	var x = document.getElementById("teacher");
	if(document.getElementById("userType").value=="Teacher")
		{
			x.style.display = "block";
		}
	else
		{
		document.getElementById("teacher").style.display = "none";
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