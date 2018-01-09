<%@page import="com.servletStore.ptamember.model.PTAMemberImpl"%>
<%@page import="com.servletStore.ptamember.model.PTAMemberDAO"%>
<%@page import="com.servletStore.ptamember.model.PTAMemberPojo"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.servletStore.register.model.InwardRegisterPojo"%>
<%@page import="com.servletStore.register.model.InwardRegisterImpl"%>
<%@page import="com.servletStore.register.model.InwardRegisterDAO"%>
<%@page import="utility.SysDate"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.servletStore.settings.school.model.SchoolImpl"%>
<%@page import="com.servletStore.settings.school.model.SchoolDAO"%>
<%@page import="com.servletStore.settings.school.model.SchoolPOJO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>Vertical Software</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="/SMGMT/config/img/xlogo1.ico.pagespeed.ic.ONh6qx31g4.html"/>
    <!-- global styles-->
    <link type="text/css" rel="stylesheet" href="/SMGMT/config/css,_components.css+css,_custom.css+vendors,_jquery-validation-engine,_css,_validationEngine.jquery.css+vendors,_datepicker,_css,_bootstrap-datepicker.min.css+vendors,_datepicker,_css"/>
    <link type="text/css" rel="stylesheet" href="/SMGMT/config/css,_components.css+css,_custom.css+vendors,_select2,_css,_select2.min.css+css,_pages,_dataTables.bootstrap.css+css,_pages,_tables.css.pagespeed.cc._6lRWz19bZ.css"/>
	
	
	
	<link type="text/css" rel="stylesheet" href="/SMGMT/config/vendors/inputlimiter/css/jquery.inputlimiter.css"/>
    <link type="text/css" rel="stylesheet" href="/SMGMT/config/vendors/chosen/css/chosen.css"/>
    <link type="text/css" rel="stylesheet" href="/SMGMT/config/vendors/bootstrap-colorpicker/css/bootstrap-colorpicker.min.css"/>
    <link type="text/css" rel="stylesheet" href="/SMGMT/config/vendors/jquery-tagsinput/css/jquery.tagsinput.css"/>
    <link type="text/css" rel="stylesheet" href="/SMGMT/config/vendors/daterangepicker/css/daterangepicker.css"/>
    <link type="text/css" rel="stylesheet" href="/SMGMT/config/vendors/datepicker/css/bootstrap-datepicker.min.css"/>
    <link type="text/css" rel="stylesheet" href="/SMGMT/config/vendors/bootstrap-timepicker/css/bootstrap-timepicker.min.css"/>
    <link type="text/css" rel="stylesheet" href="/SMGMT/config/vendors/bootstrap-switch/css/bootstrap-switch.min.css"/>
    <link type="text/css" rel="stylesheet" href="/SMGMT/config/vendors/jasny-bootstrap/css/jasny-bootstrap.min.css"/>
    <link type="text/css" rel="stylesheet" href="/SMGMT/config/vendors/multiselect/css/multi-select.css"/>
    <!-- end of global styles-->
    
    <link type="text/css" rel="stylesheet" href="/SMGMT/config/css/pages/form_elements.css"/>
    <link type="text/css" rel="stylesheet" href="#" id="skin_change"/>
    
    
    
    <style>
#snackbar {
    visibility: hidden;
    min-width: 250px;
    margin-left: -125px;
    background-color: #333;
    color: #fff;
    text-align: center;
    border-radius: 2px;
    padding: 16px;
    position: fixed;
    z-index: 1;
    left: 50%;
    bottom: 30px;
    font-size: 17px;
}

#snackbar.show {
    visibility: visible;
    -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
    animation: fadein 0.5s, fadeout 0.5s 2.5s;
}

@-webkit-keyframes fadein {
    from {bottom: 0; opacity: 0;} 
    to {bottom: 30px; opacity: 1;}
}

@keyframes fadein {
    from {bottom: 0; opacity: 0;}
    to {bottom: 30px; opacity: 1;}
}

@-webkit-keyframes fadeout {
    from {bottom: 30px; opacity: 1;} 
    to {bottom: 0; opacity: 0;}
}

@keyframes fadeout {
    from {bottom: 30px; opacity: 1;}
    to {bottom: 0; opacity: 0;}
}
</style>
  
</head>

<body onload="myFunction()">

	
	<div class="preloader" style=" position: fixed;
	  width: 100%;
	  height: 100%;
	  top: 0;/*
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
	        
	      <div id="snackbar"><%=request.getAttribute("status") %></div>
	      
	      <%
			session.setAttribute("schoolId", "1");
			
			String schoolId=session.getAttribute("schoolId").toString();
			
			session.setAttribute("thisYear", "2016-17");
				
			%>
	        
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
                                  Add PTA Members 
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
                                    <li class="active breadcrumb-item">PTA Members</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </header>
                
                
                <form action="">                
                	<input type="hidden" id="studentName">
                </form>
                
             <!-- start your code from here  -->  
              
                <div class="outer">
                    <div class="inner bg-container">
                        <div class="row">
                            <div class="col-xl-12">
                                <div class="card">
                                    <div class="card-header bg-white">
                                        <i class="fa fa-file-text-o"></i>
                                      PTA Members
                                    </div>
                                    
                              		 <div class="card-block m-t-35" style="margin-top: 47px;">
                                   			<form action="/SMGMT/PTAMember" method="post" class="form-horizontal  login_validator" id="form_block_validator">
                                           
		                                     		  <div class="form-group row">
		                                          			 <div class="col-lg-3 text-lg-right">
																	<label for="stdIdAlo" class="col-form-label">Select	Standard & Division <span style="color:red;">*</span></label> 
															  </div>
															  	<div class="col-lg-4">
																	<select class="form-control chzn-select" name="stdId" id="stdId" onchange="studentNameList();test();"	title="Select Standard">
																		<option disabled selected>Select Standard</option>
																	</select>
																</div> 
		                                     			   </div>  
                                        
		                                        		 <div class="form-group row">
		                                          			 <div class="col-lg-3 text-lg-right">
																	<label for="stdIdAlo" class="col-form-label">Select	Student <span style="color:red;">*</span></label> 
															  </div>
															  	<div class="col-lg-4">
																	<select class="form-control chzn-select" name="studentId" id="studentId" onchange="selectParentDetails()" title="Select Student">
																	</select>
																</div> 
                                      			  			</div>                                      
                                                                                   
			                                            </form>
			                                         </div> 
			                                    </div>
			                                </div>
			                            </div>  
			                            
			                        </div>                                      
			       		     </div>   
       		     
       		   			  <div class="outer">
                 		   <div class="inner bg-container">
                 			       <div class="row">
       		    						  <div class="col-lg-12">
					                                <div class="card">
					                                    <div class="card-header bg-white">
					                                      Assign PTA Member
					                                    </div>
					                                    <div class="card-block">
					                                        <div class="table-responsive m-t-35">
					                                            <table class="table table-bordered">
					                                                <thead>
					                                              		  <tr role="row">
					                                              		      <th class="sorting wid-20" tabindex="0" rowspan="1" colspan="1">Assign Member</th>
								                                                  <th class="sorting wid-25" tabindex="0" rowspan="1" colspan="1"> Parent Name</th>
								                                                 <th class="sorting wid-20" tabindex="0" rowspan="1" colspan="1">Relation</th>
								                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Mobile No</th>
								                                                <th class="sorting wid-20" tabindex="0" rowspan="1" colspan="1">Aadhar Card</th>
								                                                 
						                                                    </tr>
					                                                </thead>
					                                                <tbody id="showtable">
					                                                
					                                                </tbody>
					                                            </table>
					                                        </div>
					                                    </div>
					                                </div>
					                            </div>
					                        </div>
					                  </div>
					              </div>    
					          
			       		      <div class="outer">
			                    <div class="inner bg-container">
			                        <div class="card">
			                            <div class="card-header bg-white">
			                                PTA Members Details
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
			                                                <th class="sorting_asc wid-20" tabindex="0" rowspan="1" colspan="1">Sr.No</th>			                                              
			                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Student Name</th>
			                                                <th class="sorting wid-25" tabindex="0" rowspan="1" colspan="1">ParentName</th>
			                                                <th class="sorting wid-15" tabindex="0" rowspan="1" colspan="1">Relation</th>
			                                                <th class="sorting wid-20" tabindex="0" rowspan="1" colspan="1">ClassRoom</th>
			                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Actions</th>
			                                           </tr>
			                                            </thead>
														
			                                         <%--   <%
			                                           int count=1;
			                                         PTAMemberDAO dao=new PTAMemberImpl();
			                                         List list=dao.fetchParentDetails();
			                                         Iterator itr=list.iterator();
			                                           
			                                           %>
			                                            <thead>
			                                            	<tbody>
			                                            	<%
			                                            	while(itr.hasNext())
			                                            	{
			                                            		String id=itr.next().toString();
			                                    				String student=itr.next().toString();
			                                    				String parent=itr.next().toString();
			                                    				String rele=itr.next().toString();
			                                    				String classroom=itr.next().toString();	
			                                            	
			                                            		
			                                            		
			                                            	%>
					                                            	<tr>					                                            	
					                                            			<td><%=count%></td>
					                                            			<td><%=student %></td>
					                                            			<td><%=parent %></td>
					                                            			<td><%=rele %></td>
					                                            			<td><%=classroom %></td>
					                                            			<td>
							                                        			<a class="edit" data-toggle="modal" data-placement="top" title="Update" href="#modal-4" onclick="updateInward(<%=id%>)"><i class="fa fa-pencil text-warning"></i></a>&nbsp; &nbsp;
							                                        			<a class="delete hidden-xs hidden-sm" data-toggle="tooltip" data-placement="top" title="Delete" href="/SMGMT/InwardRegister?deleteId=<%=id%>"><i class="fa fa-trash text-danger"></i></a>
							                                        		</td>
					                                            	</tr>
			                                            		
			                                            		</tbody>
			                                            		<%
			                                            		count++;
			                                            	}
			                                            	
			                                            		%>
			                                            </thead>
			                                             --%>
			                                             
			                                             <tbody id="displayMembers">
			                                             
			                                             </tbody>
			                                        </table>
			                                    </div>
			                                </div>
			                                <!-- END EXAMPLE TABLE PORTLET-->
			                            </div>
			                        </div>
			                    </div>
			                    <!-- /.inner -->
						      </div>         
					         	 
				        </div>
				     </div>
				  </div>
				  
				  
				  <!-- start modal -->

	<div class="modal fade pullDown" id="modal-4" role="dialog" aria-labelledby="modalLabelnews">
		<div class="modal-dialog modal-mm" role="document">
			<div class="modal-content">
				<div class="modal-header bg-warning">
					<h4 class="modal-title text-white" id="modalLabelnews"
						style="margin-right: 291px;">Update PTA Members</h4>
				</div>
				<div class="modal-body">
					<form action="/SMGMT/PTAMember" method="post" class="form-horizontal  login_validator" id="form_block_validator">
					
					
					<div class="form-group row">
							<div class="col-lg-4  text-lg-right">
								<label for="required2" class="col-form-label">ClassRoom<span style="color:red;">*</span></label>
							</div>
							<div class="col-lg-7">
								<input type="text" name="classroom" id="updateClassRoom" onkeyup="this.value=this.value.toUpperCase()" class="form-control" readonly required>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-lg-4  text-lg-right">
								<label for="required2" class="col-form-label"> Student Name<span style="color:red;">*</span></label>
							</div>
							<div class="col-lg-7">
								<input type="hidden" name="updateId" id="updateId">
								<input type="text" name="studentName" id="updateStudentName" class="form-control" onkeyup="this.value=this.value.toUpperCase()" readonly required>
							</div>
						</div>
						
						<div class="form-group row">
							<div class="col-lg-4  text-lg-right">
								<label for="required2" class="col-form-label">Relation<span style="color:red;">*</span></label>
							</div>
							<div class="col-lg-7">
								<input type="text"  name="updateRelation" id="updateRelation" class="form-control" required>
							</div>
						</div>
						

						<div class="form-group row">
							<div class="col-lg-4  text-lg-right">
								<label for="required2" class="col-form-label">ParentName<span style="color:red;">*</span></label>
							</div>
							<div class="col-lg-7">
								<input type="text" name="parentName" id="updateParentName" onkeyup="this.value=this.value.toUpperCase()" class="form-control" readonly required>
							</div>
						</div>
						
						
						
						
						<div class="modal-footer">
							<button class="btn  btn-success"type="submit">Submit</button>
							<button class="btn  btn-warning" data-dismiss="modal">Close</button>
						</div>
					</form>

				</div>

			</div>
		</div>
	</div>
	<!-- end modal -->
	

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
	
	<script type="text/javascript" src="/SMGMT/config/vendors/jquery.uniform/js/jquery.uniform.js"></script>
	<script type="text/javascript" src="/SMGMT/config/vendors/inputlimiter/js/jquery.inputlimiter.js"></script>
	<script type="text/javascript" src="/SMGMT/config/vendors/chosen/js/chosen.jquery.js"></script>
	<script type="text/javascript" src="/SMGMT/config/vendors/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js"></script>
	<script type="text/javascript" src="/SMGMT/config/vendors/jquery-tagsinput/js/jquery.tagsinput.js"></script>
	<script type="text/javascript" src="/SMGMT/config/js/pluginjs/jquery.validVal.min.js"></script>
	<script type="text/javascript" src="/SMGMT/config/vendors/moment/js/moment.min.js"></script>
	<script type="text/javascript" src="/SMGMT/config/vendors/daterangepicker/js/daterangepicker.js"></script>
	<script type="text/javascript" src="/SMGMT/config/vendors/datepicker/js/bootstrap-datepicker.min.js"></script>
	<script type="text/javascript" src="/SMGMT/config/vendors/bootstrap-timepicker/js/bootstrap-timepicker.min.js"></script>
	<script type="text/javascript" src="/SMGMT/config/vendors/bootstrap-switch/js/bootstrap-switch.min.js"></script>
	<script type="text/javascript" src="/SMGMT/config/vendors/autosize/js/jquery.autosize.min.js"></script>
	<script type="text/javascript" src="/SMGMT/config/vendors/inputmask/js/inputmask.js"></script>
	<script type="text/javascript" src="/SMGMT/config/vendors/inputmask/js/jquery.inputmask.js"></script>
	<script type="text/javascript" src="/SMGMT/config/vendors/inputmask/js/inputmask.date.extensions.js"></script>
	<script type="text/javascript" src="/SMGMT/config/vendors/inputmask/js/inputmask.extensions.js"></script>
	<script type="text/javascript" src="/SMGMT/config/vendors/multiselect/js/jquery.multi-select.js"></script>
	
	<script type="text/javascript" src="/SMGMT/config/js/form.js"></script>
	<script type="text/javascript" src="/SMGMT/config/js/pages/form_elements.js"></script>

    <script type="text/javascript" src="/SMGMT/config/vendors/select2/js/select2.js.pagespeed.jm.Eugd1Y0BmV.js"></script>
    <script type="text/javascript" src="/SMGMT/config/vendors/datatables/js/jquery.dataTables.min.js.pagespeed.jm.pVBv4jsFm2.js"></script>
    <script type="text/javascript" src="/SMGMT/config/js/pluginjs/dataTables.tableTools.js.pagespeed.jm.jv43zkM1QG.js"></script>
    <script type="text/javascript" src="/SMGMT/config/vendors/datatables/js/dataTables.colReorder.min.js"></script>
    <script src="/SMGMT/config/vendors/datatables/js/dataTables.bootstrap.min.js%2bdataTables.buttons.min.js.pagespeed.jc.NLPqlFNtdC.js"></script><script>eval(mod_pagespeed_UzcyJ5ysoL);</script>
    <script>eval(mod_pagespeed_aYQJk4iDci);</script>
    <script type="text/javascript" src="/SMGMT/config/js/pluginjs/jquery.dataTables.min.js"></script>
    <script src="/SMGMT/config/vendors/datatables/js/dataTables.responsive.min.js%2bdataTables.rowReorder.min.js%2bbuttons.colVis.min.js%2bbuttons.html5.min.js%2bbuttons.bootstrap.min.js%2bbuttons.print.min.js%2bdataTables.scr"></script><script>eval(mod_pagespeed_sB4kJD0xfI);</script>
    
     <script>eval(mod_pagespeed_FESMSNjrvX);</script>
    <script>eval(mod_pagespeed_wVkzf2s7YZ);</script>
    <script>eval(mod_pagespeed_Ij0pRaH8BP);</script>
    <script>eval(mod_pagespeed_wfmKXYO4Nj);</script>
    <script>eval(mod_pagespeed_EYzby3B1$L);</script>
    <script>eval(mod_pagespeed_ZN6rVE$v$y);</script>
    
   
   

<script>

function myFunction()
{
	
	standardList();
	fetchPtaMembers();
}

function fetchPtaMembers()
{
	
		
		var xhttp =new XMLHttpRequest();
		try{
			xhttp.onreadystatechange = function(){
				if(this.readyState == 4 && this.status == 200){
					var demoStr=this.responseText.split(",");
				
					document.getElementById("displayMembers").innerHTML=demoStr;
										
							
					}	
				};
			
			xhttp.open("POST", "/SMGMT/PTAMember?fetchPta=1", true);
			xhttp.send();
		}catch(e){
			alert("Unable to Connect Server!");
		} 	
	
}


function submitAssignDetails(relation)
{
	//alert("relation1 "+relation);
	if(relation==2)
		{
			relation="mother";
			 document.getElementById("studentMother").disabled = true;
			 document.getElementById("studentFather").disabled = true;
			
		}
	else
		{
			relation="father";
			 document.getElementById("studentFather").disabled = true;
			 document.getElementById("studentMother").disabled = true;
		}
	
	
	/* var td=document.getElementById("rowData"+rowId).children;
	var parentName=td[1].innerHTML;
	var mobileNo=td[3].innerHTML;
	var standard=document.getElementById("stdId").value;
	*/
	var standard=document.getElementById("stdId").value;
	var e = document.getElementById("studentId").value;		
	alert("student:	"+e);
	var xhttp =new XMLHttpRequest();
	xhttp.onreadystatechange = function(){
		if(this.readyState == 4 && this.status == 200){
		var getData=this.responseText.split(",");
		//getMembers(getData);
			
		fetchPtaMembers();
		
		}
	}
	 	xhttp.open("POST", "/SMGMT/PTAMember?studentId="+e+"&standard="+standard+"&relation="+relation, true);
		xhttp.send();  
}



function selectParentDetails(){
	
	var studId=document.getElementById("studentId").value;
	//alert(studId);
	//document.getElementById("studentId").innerHTML="";
	var xhttp =new XMLHttpRequest();
		try{
			xhttp.onreadystatechange = function(){
				if(this.readyState == 4 && this.status == 200){
					var demoStr=this.responseText.split(",");
				
					var i=0;
					var row="";
					
					for(;demoStr[i];)
						{
					
							var id=demoStr[i];
							i++;
							row+="<tr id='rowData"+id+"'><td> <label class='custom-control custom-radio'><input name='radio3' id='studentFather' type='radio' onclick='submitAssignDetails(1)' class='custom-control-input'><span class='custom-control-indicator'></span><span class='custom-control-description'></span></label></td>";
							
							row+="<td>"+demoStr[i]+"</td>";
							i++;							
							row+="<td>Father</td>";								
							row+="<td>"+demoStr[i]+"</td>";
							i++;							
							row+="<td>"+demoStr[i]+"</td></tr>";
							i++;
							
							row+="<tr id='rowData"+id+"'><td> <label class='custom-control custom-radio'><input name='radio3' id='studentMother' type='radio' onclick='submitAssignDetails(2)' class='custom-control-input'><span class='custom-control-indicator'></span><span class='custom-control-description'></span></label></td>";
							
							row+="<td>"+demoStr[i]+"</td>";
							i++;							
							row+="<td>Mother</td>";								
							row+="<td>"+demoStr[i]+"</td>";
							i++;							
							row+="<td>"+demoStr[i]+"</td></tr>";
							i++;
						}		
					
						document.getElementById("showtable").innerHTML=row;		
						
					}	
				};
			//alert("student:"+studId);
			xhttp.open("POST", "/SMGMT/PTAMember?parentName="+studId, true);
			xhttp.send();
		}catch(e){
			alert("Unable to Connect Server!");
		} 	
}

function studentNameList()
{
	
	var studentId=document.getElementById("stdId").value;
			
	//document.getElementById("studentId").innerHTML="";
		var xhttp =new XMLHttpRequest();
		
		try{
			xhttp.onreadystatechange = function(){
				if(this.readyState == 4 && this.status == 200){
					var getData=this.responseText.split(",");
					
			//		alert(studentId);
					var row="<option disabled selected>Select Student </option>";
					var i=0;
					for(;getData[i];){
						row += "<option value="+getData[i]+">";
						i++;
						row += getData[i] ;
						i++;
						row += "-"+ getData[i] +" - ";
						i++;
						row += getData[i]+ " </option>";
						i++;

					}					
					document.getElementById("studentId").innerHTML=row;
					$("#studentId").trigger('chosen:updated');					
					 document.getElementById("studentFather").disabled = false;
					 document.getElementById("studentMother").disabled = false;
				}
			}
			//alert(studentId);
			xhttp.open("POST", "/SMGMT/PTAMember?studentNameList="+studentId, true);
			xhttp.send();
		}catch(e){
			alert("Unable to Connect Server!");
		} 
}


function standardList()
{	
	var std=<%=schoolId%>;
	
		if(std==""){
			return;
		}		
		
		document.getElementById("stdId").innerHTML="";
		var xhttp =new XMLHttpRequest();
		
		try{
			xhttp.onreadystatechange = function(){
				if(this.readyState == 4 && this.status == 200){
					var getData=this.responseText.split("~");
					
					//alert(getData);
					var row="<option disabled selected>Select Standard </option>";
					var i=0;
					for(;getData[i];){
						row += "<option value="+getData[i]+">";
						i++;
						row += getData[i] ;
						i++;
						row += " ("+ getData[i] +") - ";
						i++;
						row += getData[i]+ " </option>";
						i++;

					}					
					document.getElementById("stdId").innerHTML+=row;
					$("#stdId").trigger('chosen:updated');	
					
					
				}
			}
			
			xhttp.open("POST", "/SMGMT/PTAMember?standardList="+std, true);
			xhttp.send();
		}catch(e){
			alert("Unable to Connect Server!");
		}
}



function updatePTAMembers(id) {
	
	var xhttp;
	xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			
			var demoStr = this.responseText.split(",");
			alert(demoStr);
			document.getElementById("updateId").value = demoStr[0];
			document.getElementById("updateStudentName").value = demoStr[1];
			document.getElementById("updateParentName").value = demoStr[2];
			document.getElementById("updateRelation").value = demoStr[3];
			document.getElementById("updateClassRoom").value = demoStr[4];
		
		}
		};
	xhttp.open("POST","/SMGMT/PTAMember?updateStudentId="+id,true);
	xhttp.send();
	
} 

</script>

</body>


</html>