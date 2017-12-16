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
    <title>Form Validations | Admire</title>
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
    
</head>
<body onload="setFocusToTextBox()"">
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
                                    Inward Register
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
                                    <li class="active breadcrumb-item">Inward Register</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </header>
                
             <!-- start your code from here  -->  
              
                <div class="outer">
                    <div class="inner bg-container">
                        <div class="row">
                            <div class="col-xl-6">
                                <div class="card">
                                    <div class="card-header bg-white">
                                        <i class="fa fa-file-text-o"></i>
                                       Inward Register
                                    </div>
                                    <div class="card-block m-t-35">
                                        <form action="/SMGMT/InwardRegister" method="post" class="form-horizontal  login_validator" id="form_block_validator">
                                            <div class="form-group row">
                                                <div class="col-lg-3  text-lg-right">
                                                    <label for="required2" class="col-form-label"> Inward No*</label>
                                                </div>
                                                <%
												int l=1;
												InwardRegisterDAO inwarddao=new InwardRegisterImpl();
												InwardRegisterPojo pojo=inwarddao.setInwordNo();
												int inwardid=pojo.getInwardNo();
												System.out.println("id:"+inwardid);
												int inward_No=inwardid+l;
												%>
                                                <div class="col-lg-3">
                                                    <input type="text" id="required2" name="inwardNo"  value="<%=inward_No %>" class="form-control" required >
                                                </div>
                                                
                                                <div class="col-lg-1 text-lg-right">
                                                    <label class="col-form-label">Date*</label>
                                                </div>
                                                <%
                                                SysDate requireddate=new SysDate(); 
                                                
                                                %>
                                                <div class="col-lg-4">
                                                    <input type="text" class="form-control form_val_popup_dp3" name="requireddate" value="<%=requireddate.todayDate()%>"/>
                                                </div>
                                                
                                          
                                            </div>
                                            
                                      	                                    
                                          <div class="form-group row">
                                           <div class="col-lg-3 text-lg-right">
                                               <label for="required2" class="col-form-label">Sender Name*</label>
                                           </div>
                                           <%
                                           InwardRegisterDAO senderdao=new InwardRegisterImpl();
                                           List<InwardRegisterPojo> list=senderdao.selectSenderName();
                                           Iterator<InwardRegisterPojo> itr=list.iterator();
                                           %>
                                           
                                           <div class="col-lg-8">
                                               <input class="form-control" list="browsers" name="senderName" id="senderNameId" onkeyup="this.value=this.value.toUpperCase()" autocomplete="off" required />
                                                <datalist id="browsers">
                                               <%
                                               while(itr.hasNext())
                                               {
                                            	   InwardRegisterPojo pojo1=(InwardRegisterPojo)itr.next();
                                            	   
                                            	   String senderName=((InwardRegisterPojo)pojo1).getSenderName();
                                               		System.out.println("senderName:"+senderName);
                                               %>
                                               
													<option ><%=senderName %></option>
													
											
												<%} %>
													
												</datalist>
                                          </div>                     	 
                                     	  </div><input type="button" value="+" href="#addSender" data-toggle="modal" style="margin-left: 437px;margin-top: -56px;background-color: blue;color: white;"/>
                                     	 
                                     	  <div class="form-group row">
                                           	<div class="col-lg-3 text-lg-right">
                                               <label for="required2" class="col-form-label">Address*</label>
                                         	  </div>
                                         	  <%
                                         	 HttpSession sess=request.getSession(false);  
                                              String n=(String)sess.getAttribute("uname");  
                                             // System.out.print("Hello "+n);  
                                            		   
                                         	  %> 
                                           		<div class="col-lg-8">
                                           				
                                             		  <input class="form-control" name="address" value=<%=n %> id="setAddress" onkeyup="this.value=this.value.toUpperCase()" required />
                                                
                                         		  </div>
                                     	  </div>                        	  
                                     	  
                                     	  <div class="form-group row">
                                           <div class="col-lg-3 text-lg-right">
                                               <label for="required2" class="col-form-label">Subject*</label>
                                           </div>
                                           <%
                                                InwardRegisterDAO subjectdao=new InwardRegisterImpl();
                                            	List<InwardRegisterPojo> list2=subjectdao.selsectSubject();
                                            	Iterator<InwardRegisterPojo> itr2=list2.iterator();
                                             %>
                                           <div class="col-lg-8">
                                               <input class="form-control" list="selectSubject" name="subject" id="selectSubjectId" onkeyup="this.value=this.value.toUpperCase()" autocomplete="off" required />
                                                <datalist id="selectSubject">
                                                <%
                                                while(itr2.hasNext())
                                                {
                                                	InwardRegisterPojo pojo2=(InwardRegisterPojo)itr2.next();
                                                	
                                                
                                                %>
                                                
													<option><%=((InwardRegisterPojo)pojo2).getSubject()%></option>
											<%} %>
												</datalist>
                                         		  </div>
                                     	  </div>
                                     	 
                                     	  
                                     	  <div class="form-group row">
                                           <div class="col-lg-3 text-lg-right">
                                               <label for="required2" class="col-form-label">Description*</label>
                                           </div>
                                           <div class="col-lg-8">
                                               <textarea class="form-control" name="description" id="required2" onkeyup="this.value=this.value.toUpperCase()" required ></textarea>
                                                
                                           </div>
                                     	  </div>  
                                     	               	                                  
                                           
                                            <div class="form-actions form-group row">
                                                <div class="col-lg-4 push-lg-4">
                                                     <button type="submit" name="InwardRegister" class="btn btn-success">Submit</button>
                                                    <button type="button" class="btn btn-danger" style="margin-left: 92px;margin-top: -35px;">Exit</button>
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
                        <div class="card">
                            <div class="card-header bg-white">
                                Inward Register Details
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
                                                <th class="sorting wid-25" tabindex="0" rowspan="1" colspan="1">Inward No</th>
                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Date</th>
                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Sender Name</th>
                                                <th class="sorting wid-20" tabindex="0" rowspan="1" colspan="1">Subject</th>
                                                <th class="sorting wid-15" tabindex="0" rowspan="1" colspan="1">Address</th>
                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Description</th>
                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Action</th>

		                                       </tr>     	
                                           </thead>
                                           <%
                                           int count=1;
                                           InwardRegisterDAO dao=new InwardRegisterImpl();
                                           List<InwardRegisterPojo> list1=dao.selectInwardRegister();
                                           Iterator<InwardRegisterPojo> itr1=list1.iterator();                                           
                                           %>
                                             <tbody>
                                             <%
                                             while(itr1.hasNext())
                                             {
                                            	 InwardRegisterPojo inwardPojo=(InwardRegisterPojo)itr1.next();
                                            	// System.out.println("id is:"+((InwardRegisterPojo)inwardPojo).getId());
                                                                                                                                     
                                             %>
                                             <tr>
                                             	<td id="<%=((InwardRegisterPojo)inwardPojo).getId()%>"><%=count %></td>
                                             	<td><%=((InwardRegisterPojo)inwardPojo).getInwardNo()%></td>
                                             	<td><%=((InwardRegisterPojo)inwardPojo).getDate() %></td>
                                             	<td><%=((InwardRegisterPojo)inwardPojo).getSenderName()%></td>
                                             	<td><%=((InwardRegisterPojo)inwardPojo).getSubject() %></td>
                                             	<td><%=((InwardRegisterPojo)inwardPojo).getAddress() %></td>
                                             	<td><%=((InwardRegisterPojo)inwardPojo).getDescription() %></td>
                                             	<td>
                                        			<a class="edit" data-toggle="modal" data-placement="top" title="Update" href="#update" onclick="searchSchool(<%=((InwardRegisterPojo)inwardPojo).getId()%>)"><i class="fa fa-pencil text-warning"></i></a>&nbsp; &nbsp;
                                        			<a class="delete hidden-xs hidden-sm" data-toggle="tooltip" data-placement="top" title="Delete" href=""><i class="fa fa-trash text-danger"></i></a>
                                        		</td>
                                             	
                                             </tr>
                                             <%
                                             count++;
                                             }
                                             
                                             %>
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
        
       <!--wrapper-->

	<!-- start modal -->

	<div class="modal fade pullDown" id="addSender" role="dialog" aria-labelledby="modalLabelnews">
		<div class="modal-dialog modal-mm" role="document">
			<div class="modal-content">
				<div class="modal-header bg-warning">
					<h4 class="modal-title text-white" id="modalLabelnews"
						style="margin-right: 332px;">Add New Sender</h4>
				</div>
				<div class="modal-body">
					<form action="/SMGMT/InwardRegister" method="post" class="form-horizontal  login_validator" id="form_block_validator">
						<div class="form-group row">
							<div class="col-lg-4  text-lg-right">
								<label for="required2" class="col-form-label"> Sender
									Name*</label>
							</div>
							<div class="col-lg-7">
								<input type="text" id="required2" name="addSenderName" class="form-control" onkeyup="this.value=this.value.toUpperCase()" required>
							</div>
						</div>

						<div class="form-group row">
							<div class="col-lg-4  text-lg-right">
								<label for="required2" class="col-form-label"> Address*</label>
							</div>
							<div class="col-lg-7">
								<input type="text" id="required2" name="addAddress" onkeyup="this.value=this.value.toUpperCase()" class="form-control" required>
							</div>
						</div>

						<div class="modal-footer">
							<button class="btn  btn-success" name="SenderName" type="submit">Submit</button>
							<button class="btn  btn-warning" data-dismiss="modal">Close</button>
						</div>
					</form>

				</div>

			</div>
		</div>
	</div>
	<!-- end modal -->
       
       <!-- start modal -->

	<div class="modal fade pullDown" id="addSender" role="dialog" aria-labelledby="modalLabelnews">
		<div class="modal-dialog modal-mm" role="document">
			<div class="modal-content">
				<div class="modal-header bg-warning">
					<h4 class="modal-title text-white" id="modalLabelnews"
						style="margin-right: 332px;">Add New Sender</h4>
				</div>
				<div class="modal-body">
					<form action="/SMGMT/InwardRegister" method="post" class="form-horizontal  login_validator" id="form_block_validator">
						<div class="form-group row">
							<div class="col-lg-4  text-lg-right">
								<label for="required2" class="col-form-label"> Sender
									Name*</label>
							</div>
							<div class="col-lg-7">
								<input type="text" id="required2" name="addSenderName" class="form-control" onkeyup="this.value=this.value.toUpperCase()" required>
							</div>
						</div>

						<div class="form-group row">
							<div class="col-lg-4  text-lg-right">
								<label for="required2" class="col-form-label"> Address*</label>
							</div>
							<div class="col-lg-7">
								<input type="text" id="required2" name="addAddress" onkeyup="this.value=this.value.toUpperCase()" onblur="setAddress()" class="form-control" required>
							</div>
						</div>

						<div class="modal-footer">
							<button class="btn  btn-success" name="SenderName" type="submit">Submit</button>
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
    
    
    
    
<!-- plugin level scripts -->
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

<script type="text/javascript">

/* 
function searchName(id1) {
	
	var xhttp;
	xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			
			var demoStr = this.responseText.split(",");
			document.getElementById("Updateid").value = demoStr[0];
			document.getElementById("Updateconame").value = demoStr[1];
			document.getElementById("old_coname").value = demoStr[1];
			document.getElementById("Updatecname").value = demoStr[2];
			document.getElementById("Updatecontactno1").value = demoStr[3];
			document.getElementById("gstinid").value = demoStr[4];
			document.getElementById("Updateemail").value = demoStr[5];
			document.getElementById("Updateaddress").value = demoStr[6];
			document.getElementById("Updatebamount").value = demoStr[7];
			
			
			}
		};
	xhttp.open("POST","/SAMERP/AddClient?Updateid="+id1, true);
	xhttp.send();
	
	
} */

	function myFunction() {
	    var x = document.getElementById("snackbar")
	    x.className = "show";
	    setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
	}
	
	function setFocusToTextBox() {
		
	
		document.getElementById("senderNameId").focus();
		myFunction();
	}



	</script>
</body>

</html>