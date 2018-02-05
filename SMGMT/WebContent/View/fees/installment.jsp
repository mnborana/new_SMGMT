<%@page import="com.servletStore.setup.model.SetupPOJO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.servletStore.setup.model.SetupImpl"%>
<%@page import="com.servletStore.setup.model.SetupDAO"%>
<%@page import="com.servletStore.fees.installment.model.InstallmentPOJO"%>
<%@page import="com.servletStore.fees.installment.model.InstallmentImpl"%>
<%@page import="com.servletStore.fees.installment.model.InstallmentDAO"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>Form Validations | Admire</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- <link rel="shortcut icon" href="/SMGMT/config/img/xlogo1.ico.pagespeed.ic.ONh6qx31g4.html"/>
    global styles
    <link type="text/css" rel="stylesheet" href="/SMGMT/config/css,_components.css+css,_custom.css+vendors,_jquery-validation-engine,_css,_validationEngine.jquery.css+vendors,_datepicker,_css,_bootstrap-datepicker.min.css+vendors,_datepicker,_css"/>
    <link type="text/css" rel="stylesheet" href="/SMGMT/config/css,_components.css+css,_custom.css+vendors,_select2,_css,_select2.min.css+css,_pages,_dataTables.bootstrap.css+css,_pages,_tables.css.pagespeed.cc._6lRWz19bZ.css"/>
 -->
 
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

<body >
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
                                   Installment And Mode
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
                                        <a href="#"></a>
                                    </li>
                                    <li class="active breadcrumb-item">Installment </li>
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
                                       Installment
                                    </div>
                                    <div class="card-block m-t-35">
                                   
                                        <form action="/SMGMT/Installment" class="form-horizontal  login_validator" id="form_block_validator" method="post">
                                            <div class="form-group row">
                                                <div class="col-lg-4  text-lg-right">
                                                    <label for="required2" class="col-form-label">Mode Name *</label>
                                                </div>
                                                <div class="col-lg-5">
  	                                              <input type="hidden" id="id_id"  name="id_name" />
                                                    <input type="text" id="mode_id"  name="mode_name"  onkeyup="this.value=this.value.toUpperCase()" onblur="this.value=$.trim(this.value)" pattern="[A-Za-z]" class="form-control" required/>
                                                </div>
                                               
                                            </div><br>
                                            <div class="row">
														<div class="col-lg-4  text-lg-right">
															<label for="lastname" class="col-form-label">Installment
																*</label>
																</div>
																<div class="col-md-5" >
																	<div class="radio">
															
																		<label> <input type="radio" id="installment_1" name="installment"
																			value="1" checked="checked"> <span
																			class="cr"><i class="cr-icon fa fa-circle" ></i></span>
																			1
																		</label>
																		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																		<label> <input type="radio" id="installment_2" name="installment"
																			value="2" > <span
																			class="cr"><i class="cr-icon fa fa-circle"></i></span>
																			2
																		</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																		<label> <input type="radio" id="installment_3" name="installment"
																			value="3" > <span
																			class="cr"><i class="cr-icon fa fa-circle"></i></span>
																			3
																		</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																		<label> <input type="radio" id="installment_4" name="installment"
																			value="4" > <span
																			class="cr"><i class="cr-icon fa fa-circle"></i></span>
																			4
																		</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																		<label> <input type="radio" id="installment_6"  name="installment"
																			value="6" > <span
																			class="cr"><i class="cr-icon fa fa-circle"></i></span>
																			6
																		</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																		<label> <input type="radio" id="installment_12" name="installment"
																			value="12" > <span
																			class="cr"><i class="cr-icon fa fa-circle"></i></span>
																			12
																		</label> 
																	</div>
																</div>
															</div><br>
															
																<div class="form-group row">
																		<div class="col-lg-4 text-lg-right">
			                                                    			<label class="col-form-label">Date *</label>
		                                                				</div>	
		                                                				 <div class="col-md-5">
																			<div class="input-group input-append date" id="dp3" data-date-format="dd-mm-yyyy">
							                                                    <input class="form-control" type="text" name="date" id="date_id" placeholder="dd-mm-yyyy">
							                                                    <span class="input-group-addon add-on">
							                                                    	<i class="fa fa-calendar"></i>
						                                                		</span>
		                                                					</div>
		                                                			   </div>	
                                                		       </div> <br>
														
											
                                           <div class="form-actions form-group row">
                                                <div class="col-lg-4 push-lg-4">
                                                    <input type="submit" value="Submit" id="btn_id" name="installmentName" class="btn btn-primary">
                                                </div>
                                            </div>
                                           
                                        </form>
                                    </div>
                                </div>
                            </div> <!-- /.col-lg-12 -->
                        </div> <!-- /.row -->
                    </div> <!-- /.inner -->
                </div> <!-- /.outer -->
            
            <!-- Table-->
           <div class="outer">
                    <div class="inner bg-container">
                        <div class="card">
                            <div class="card-header bg-white">
                              Installment Details
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
                                                <th class="sorting_asc wid-20" tabindex="0" rowspan="1" colspan="1">Sr NO</th>
                                                <th class="sorting wid-25" tabindex="0" rowspan="1" colspan="1">Mode Name</th>
                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Installment</th>
                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Date</th>
                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Action</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                       		 	<%
                                       		 		InstallmentDAO dao=new InstallmentImpl();
                                       		 		request.setAttribute("display_installment", dao.getIntallmentDetails());
                                       		 		int installmentCount=0;
                                       		 	%>
													<c:forEach items="${display_installment}" var="d">
													  <tr role="row" class="even"> 
														 <td><%=(++installmentCount) %></td>
														 <td><c:out value="${d.modeName}"></c:out></td>
														 <td><c:out value="${d.installment}"></c:out></td>
														 <td><c:out value="${d.date}"></c:out></td>
														
														<td>
                                            			<a class="edit" data-placement="top" title="Edit" href="#update" data-toggle="modal" onclick="loadDoc(${d.getId()})"><i class="fa fa-pencil text-warning"></i></a>&nbsp; &nbsp;
                                            			
                                            			</td>
                                            		</tr>
												  </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <!-- END EXAMPLE TABLE PORTLET-->
                            </div>
                       	 </div>
                       </div><!-- /.inner -->
                    </div><!-- /outer -->   
       <!-- Table End-->
       
       <!-- Model-->
       <div class="modal fade show" id="update" role="dialog" aria-labelledby="modalLabelnews">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header bg-primary">
                                <h4 class="modal-title text-white" id="modalLabelnews"><strong>Update</strong></h4>
                            </div>
                            <div class="modal-body">
                            <form action="/SMGMT/Installment" class="form-horizontal  login_validator" id="form_block_validator" method="post">
                                            <div class="form-group row">
                                               	 	<div class="col-lg-4  text-lg-right">
                                                    	<label for="required2" class="col-form-label" >Mode Name *</label>
                                                	</div>
                                                	<div class="col-lg-5">
	  	                                             	 	<input type="hidden" id="model_id"  name="mod_name" />
	                                                    	<input type="text" id="m_id"  name="m_name" onkeyup="this.value=this.value.toUpperCase()" onblur="this.value=$.trim(this.value)" pattern="[A-Za-z]" class="form-control" required />
                                                	</div>
                                               </div><br>
                                               
                                                  <div class="row">
														<div class="col-lg-4  text-lg-right">
															<label for="lastname" class="col-form-label">Installment
																*</label>
																</div>
																<div class="col-md-5" >
															<div class="radio">&nbsp;
																<label> <input type="radio" id="install_1" name="installmentMode"
																	value="1" checked="checked"> <span
																	class="cr"><i class="cr-icon fa fa-circle" ></i></span>
																	1
																</label>&nbsp;&nbsp;&nbsp;
																<label> <input type="radio" id="install_2" name="installmentMode"
																	value="2" > <span
																	class="cr"><i class="cr-icon fa fa-circle"></i></span>
																	2
																</label>&nbsp;&nbsp;&nbsp; 
																<label> <input type="radio" id="install_3" name="installmentMode"
																	value="3" > <span
																	class="cr"><i class="cr-icon fa fa-circle"></i></span>
																	3
																</label>&nbsp;&nbsp;&nbsp;
																<label> <input type="radio" id="install_4" name="installmentMode"
																	value="4" > <span
																	class="cr"><i class="cr-icon fa fa-circle"></i></span>
																	4
																</label>&nbsp;&nbsp;&nbsp;
																<label> <input type="radio" id="install_6"  name="installmentMode"
																	value="6" > <span
																	class="cr"><i class="cr-icon fa fa-circle"></i></span>
																	6
																</label>&nbsp;&nbsp;&nbsp;
																<label> <input type="radio" id="install_12" name="installmentMode"
																	value="12" > <span
																	class="cr"><i class="cr-icon fa fa-circle"></i></span>
																	12
																</label> 
															</div>
														</div>
													</div><br>
                                            <div class="form-group row">
                                                <div class="col-lg-4 text-lg-right">
                                                    <label class="col-form-label">Date *</label>
                                                </div><br>
                                                <div class="col-lg-5">
                                                    <input type="text" class="form-control form_val_popup_dp3" name="Modedate" id="modeDate_id" placeholder="YYYY-MM-DD"/>
                                                </div>
                                            </div> 
                                           
                                            <div class="modal-footer">
					                            <button class="btn btn btn-success" type="submit" name="updateInstallment1" id="updateInstallment1"  value="updateInstallment1">Update</button> 
					                           	<!-- <button data-dismiss="modal" type="button">Close</button> -->
					                           	<button class="btn btn-warning" data-dismiss="modal">Cancel</button>  
					              	         </div>
                                        </form>	
                                 </div>
                             </div>
                      </div>
                </div>  
      

            </div>
            
            
            </div> <!-- /#content -->
        </div>
        
       <!--wrapper-->
       
        
        

<!-- /#wrap -->

<script type="text/javascript" src="/SMGMT/config/js/jquery.min.js"></script>
<script type="text/javascript">	



function loadDoc(id) {
	//alert(id);
	  var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	     var demoData = this.responseText;
	   // alert(demoData);
	     
	     var str=demoData.split(",");
	    	
	     document.getElementById("model_id").value=str[0];
	   	 document.getElementById("m_id").value=str[1];
	   	 
	   	 
	   	var  installradio1=str[2];
	   	var  installradio2=str[2];
	   	var  installradio3=str[2];
		var  installradio4=str[2];
		var  installradio6=str[2];
		var  installradio12=str[2];
	   	
	   	if(installradio1==1)
	   		{
	   		document.getElementById("install_1").checked=true;
	   		}
	   	else
	   		{
	   		document.getElementById("install_1").checked=false;
	   		}
		if(installradio2==2)
   		{
   		document.getElementById("install_2").checked=true;
   		}
   	else
   		{
   		document.getElementById("install_2").checked=false;
   		}
		if(installradio3==3)
   		{
   		document.getElementById("install_3").checked=true;
   		}
   	else
   		{
   		document.getElementById("install_3").checked=false;
   		}
		if(installradio4==4)
   		{
   		document.getElementById("install_4").checked=true;
   		}
   	else
   		{
   		document.getElementById("install_4").checked=false;
   		}
		if(installradio6==6)
   		{
   		document.getElementById("install_6").checked=true;
   		}
   	else
   		{
   		document.getElementById("install_6").checked=false;
   		}
		if(installradio12==12)
   		{
   		document.getElementById("install_12").checked=true;
   		}
   	else
   		{
   		document.getElementById("install_12").checked=false;
   		}
		
		document.getElementById("modeDate_id").value=str[3];
	     
	 }
	  };
	  xhttp.open("POST","/SMGMT/Installment?uId="+id, true);
	  xhttp.send();
	}
	
</script>
<jsp:include page="/View/common/commonJs.jsp"></jsp:include>



</body>

</html>