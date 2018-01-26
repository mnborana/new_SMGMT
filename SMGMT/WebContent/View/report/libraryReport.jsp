<%@page import="com.servletStore.setup.model.SetupPOJO"%>
<%@page import="com.servletStore.setup.model.SetupImpl"%>
<%@page import="com.servletStore.setup.model.SetupDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.servletStore.settings.section.model.SectionPojo"%>
<%@page import="java.util.List"%>
<%@page import="com.servletStore.settings.section.model.SectionImpl"%>
<%@page import="com.servletStore.settings.section.model.SectionDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>Form Validations | Admire</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
   <jsp:include page="/View/common/commonCss.jsp"></jsp:include>
    <!-- end of global styles-->
   
</head>


<%
	String schoolId = "0";
	String academicYear = "0";
	int roll=0;
	
	if (session.getAttribute("userName") == null) {
		response.sendRedirect("/SMGMT");
	} else {
		roll=(Integer)session.getAttribute("rollId");
		schoolId = session.getAttribute("schoolId").toString();
		academicYear = session.getAttribute("year").toString();
		
		//for read/write permission  Read = 1  Write = 2
		SetupDAO dao = new SetupImpl();
		List list=dao.getAccessControlDetails(roll);
		Iterator<SetupPOJO> itr= list.iterator();
		//for showing datatable according to read/write permission
		
		//choose appropriate method as per your leftNavbar form option name
		//e.g : if you are working on Attendance option in left navbar then code will be...
		
		/* SetupPOJO grant = new SetupPOJO();
		int access=grant.getAttendance(); */
		
		//if it returns read(1) then hide form and action column in dataTable
		//for write(2) show your orignal full form
				
	}
%>

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
                                    Report
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
                                        <a href="#">Report</a>
                                    </li>
                                    <li class="active breadcrumb-item">Library Report</li>
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
                                        	Library Report
                                    </div>
                                    <div class="card-block m-t-35">
                                        <form action="/SMGMT/Report" method="post" class="form-horizontal  login_validator" id="form_block_validator">
                                           		 <div class="form-group row">
		                                                <div class="col-lg-4  text-lg-right">
		                                                	<input type="hidden" name="bookNo">
		                                                   <label for="required2" class="col-form-label">Reports for <span style="color: red;">*</span></label>
		                                                </div> 
														 <div class="col-lg-4 ">
															 <select class="form-control chzn-select"
																name="reportOption" id="selectOption"  onchange="dateWiseBooks(this.value)">
																<option
																 disabled selected>Select Option</option>
																<option name="Avail" value="Avail">Available Books</option>
																<option name="cat" value="Cat">Category wise Books</option>
																<option value="Recover">Recovery Book</option>
															</select>
														</div>
													</div>
													 <div class="form-group row">
														 <div class="col-lg-4  text-lg-right">
		                                                   <label for="required2" class="col-form-label">Date </label>
		                                               	 </div>	
														  <div class="col-lg-4">
															<div class="input-group"
																style="float: left; margin-top: -2%;">
																<span class="input-group-addon"> <i
																	class="fa fa-calendar"></i>
																</span> <input type="text" name="date" class="form-control" id="reportrange"
																	placeholder="dd/mm/yyyy-dd/mm/yyyy">
															</div>
				                             			  </div>
                                           			</div>
                                            <div class="form-actions form-group row">
                                                <div class="col-lg-4 push-lg-4">
                                         		<input type="submit" value="Print report" name="report" class="btn btn-primary">
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <div id="dateWise" style="display: none;">
                                    	 <div class="form-group row"> 
		                                     <div class="col-lg-8">
		                                         <label class="col-form-label">Start Date </label>
		                                          <input type="text" id="startDateId"  class="form-control form_val_popup_dp3" name="startDate" autocomplete="off" placeholder="YYYY-MM-DD" required/>
		                                      </div>
		                                  </div>
		                                  <div class="form-group row">
		                                     <div class="col-lg-8">
		                                          <label class="col-form-label">End Date </label>
		                                          <input type="text" id="endDateId"  class="form-control form_val_popup_dp3" name="endDate" autocomplete="off" placeholder="YYYY-MM-DD" required/>
		                                     </div>
		                                 </div>
		                            </div>     
                                </div>
                            </div> <!-- /.col-lg-12 -->
                        </div> <!-- /.row -->
                    </div> <!-- /.inner -->
                </div> <!-- /.outer -->
            </div> <!-- /#content -->
        </div>
        
       <!--wrapper-->
        
</div>
<!-- /#wrap -->
<jsp:include page="/View/common/commonJs.jsp"></jsp:include>
  
    <script>eval(mod_pagespeed_g_o5ieHdNa);</script>
    <script>eval(mod_pagespeed_UzcyJ5ysoL);</script>
    <script>eval(mod_pagespeed_sB4kJD0xfI);</script>
    <script>eval(mod_pagespeed_aYQJk4iDci);</script>
    <script>eval(mod_pagespeed_wVkzf2s7YZ);</script>
    <script>eval(mod_pagespeed_Ij0pRaH8BP);</script>
    <script>eval(mod_pagespeed_wfmKXYO4Nj);</script>
    <script>eval(mod_pagespeed_EYzby3B1$L);</script>

</body>
<script type="text/javascript">
 <pre lang="Javascript"> $(function () {
	alert("hello");
    $('#selectOption').change(function () {
        var vFirst = $('#selectOption option:selected').text();
        vFirst.style.display.block;
    });
}); 
 /*
 function dateWiseBooks(val)
{
	alert("hello");
	if(val=="Issue")
	document.getElementById("dateWise").style.display.block;
	
}	*/
</script>
</html>
