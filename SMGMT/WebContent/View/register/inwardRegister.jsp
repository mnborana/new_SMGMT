<%@page import="com.servletStore.setup.model.SetupPOJO"%>
<%@page import="com.servletStore.setup.model.SetupImpl"%>
<%@page import="com.servletStore.setup.model.SetupDAO"%>
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

<%
	String schoolId = "0";
	String academicYear = "0";
	int roll=0;
	
	if (session.getAttribute("userName") == null) {
		response.sendRedirect("/SMGMT");
	} 
	else {
		roll=(Integer)session.getAttribute("rollId");
		schoolId = session.getAttribute("schoolId").toString();
		academicYear = session.getAttribute("year").toString();
		
		SetupDAO dao = new SetupImpl();
		List list=dao.getAccessControlDetails(roll);
		Iterator<SetupPOJO> itr= list.iterator();
					
	}
%>

<body onload="setFocusToTextBox()">
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
                            <div class="col-xl-12">
                                <div class="card">
                                    <div class="card-header bg-white">
                                        <i class="fa fa-file-text-o"></i>
                                       Inward Register
                                    </div>
                                    <div class="card-block m-t-35" style="margin-top: 47px;">
                                        <form action="/SMGMT/InwardRegister" method="post" class="form-horizontal  login_validator" id="form_block_validator">
                                            <div class="form-group row">
                                                <div class="col-lg-3  text-lg-right">
                                                    <label for="required2" class="col-form-label"> Inward No<span style="color:red;">*</span></label>
                                                </div>
                                                <%
												int l=1;
												InwardRegisterDAO inwarddao=new InwardRegisterImpl();
												InwardRegisterPojo pojo=inwarddao.setInwordNo();
												int inwardid=pojo.getInwardNo();
											//	System.out.println("id:"+inwardid);
												int inward_No=inwardid+l;
												%>
                                                <div class="col-lg-2">
                                                    <input type="text" id="required2" name="inwardNo"  value="<%=inward_No %>" class="form-control" required readonly>
                                                </div>
                                                
                                                <div class="col-lg-1 text-lg-right">
                                                    <label class="col-form-label">Date<span style="color:red;">*</span></label>
                                                </div>
                                                <%
                                                SysDate requireddate=new SysDate(); 
                                                
                                                %>
                                                <div class="col-lg-2">
                                                    <input type="text" class="form-control form_val_popup_dp3"  name="requireddate" value="<%=requireddate.todayDate()%>"/>
                                                </div>                                  
                                            </div>
                                            
                                             <%
												  HashMap<String, String> userDetails =(HashMap)session.getAttribute("user");
												  String senderName = "";
												  String address = "";
												  String mobileNo = "";
												  if (userDetails != null) {
													  senderName = userDetails.get("senderName");
													  address = userDetails.get("address");
													  mobileNo = userDetails.get("mobileNo");
														
												  }
												 
											 %>
                                            
                                            <div class="form-group row">
	                                           <div class="col-lg-3 text-lg-right">
	                                               <label for="required2" class="col-form-label">Sender Name<span style="color:red;">*</span></label>
	                                           </div>
                                         	 
	                                           <div class="col-lg-5">
	                                           
	                                               <input class="form-control" list="senderId" name="senderName"  value="<%=senderName %>" id="selectSubjectId" autocomplete="off" onkeyup="this.value=this.value.toUpperCase();getSenderDetails(this.value)" onblur="setDetails()" required />
	                                                <datalist id="senderId">
	                                            
	                                                </datalist>
	                                         
	                                          </div>
                                     	  </div> 
                                     	  
                                     	  <input type="button" value="+" href="#addSender" data-toggle="modal" style="margin-left: 942px;margin-top: -50px;background-color: blue;color: white;"/>
                                     	 
                                     	  <div class="form-group row">
                                           	<div class="col-lg-3 text-lg-right">
                                               <label for="required2" class="col-form-label">Address<span style="color:red;">*</span></label>
                                         	  </div>
                                         	  
                                         	  	  <div class="col-lg-5">                                           				
                                             		  <input class="form-control" name="address"  pattern="[A-Za-z]" value="<%=address %>" id="setAddress" onkeyup="this.value=this.value.toUpperCase()" required />                                                
                                         		  </div>
                                         		  
                                        </div>
                                     	  
                                     	  <div class="form-group row">
                                           	<div class="col-lg-3 text-lg-right">
                                               <label for="required2" class="col-form-label">Mobile No<span style="color:red;">*</span></label>
                                         	  </div>
                                         	 
                                         		  <div class="col-lg-5">                                           				
                                             		  <input class="form-control" name="mobileNum"  pattern="[0-9]" value="<%=mobileNo %>" id="setMobileN" onkeyup="this.value=this.value.toUpperCase()" required />                                                
                                         		  </div>
                                         		
                                     	  </div> 
                                     	                        	  
                                     	  
                                     	  <div class="form-group row">
	                                           <div class="col-lg-3 text-lg-right">
	                                               <label for="required2" class="col-form-label">Subject<span style="color:red;">*</span></label>
	                                           </div>
	                                           <%
	                                              InwardRegisterDAO indao=new InwardRegisterImpl();
	                                              List<InwardRegisterPojo> inwardlist=indao.selsectSubject();
	                                               Iterator<InwardRegisterPojo> itr5=inwardlist.iterator();
	                                            		   
	                                           %>
                                          
	                                           <div class="col-lg-5">
	                                               <input class="form-control" list="subjectId" name="subject" id="selectSubjectId" onkeyup="this.value=this.value.toUpperCase()" autocomplete="off" required />
	                                                <datalist id="subjectId">
	                                                <%
	                                                while(itr5.hasNext())
	                                                {
	                                                	InwardRegisterPojo pojo5=(InwardRegisterPojo)itr5.next();	
	                                                	String subject=((InwardRegisterPojo)pojo5).getSubject() ;
	                                                %>
	                                                
	                                                <option><%=subject%></option>
	                                                <%} %>
	                                                </datalist>
	                                         
	                                          </div>
                                     	  </div>                                     	 
                                     	  
                                     	  <div class="form-group row">
	                                           <div class="col-lg-3 text-lg-right">
	                                               <label for="required2" class="col-form-label">Description<span style="color:red;">*</span></label>
	                                           </div>
	                                           <div class="col-lg-5">
	                                               <textarea class="form-control" name="description" id="required2" pattern="[A-Za-z]"  onkeyup="this.value=this.value.toUpperCase()" required ></textarea>
	                                                
	                                           </div>
                                     	  </div>  
                                     	  
                                     	  <div class="form-group row">
	                                            <div class="col-lg-3 text-lg-right">
	                                               <label for="required2" class="col-form-label">Select File<span style="color:red;">*</span></label>
	                                           </div>
	                                           <div class="col-lg-5">
	                                           <%
	                                           
	                                           InwardRegisterDAO docdao=new InwardRegisterImpl();
	                                           List<InwardRegisterPojo> l1=docdao.getDocument();
	                                           Iterator<InwardRegisterPojo> itr10=l1.iterator();
	                                           %>
	                                              <select class="form-control chzn-select" tabindex="2" name="selRegister" id="required2" required>
	                                             <option disabled selected>select File</option>
	                                              <%
	                                              while(itr10.hasNext())
	                                              {
	                                            	  InwardRegisterPojo pojo10=(InwardRegisterPojo)itr10.next();
	                                            	  int id=((InwardRegisterPojo)pojo10).getId();
	                                              	  String doc=((InwardRegisterPojo)pojo10).getDocmentName();
	                                              
	                                              %>
	                                                    <option value="<%=id%>"><%=doc %></option>
	                                                  <%} %> 
	                                                 </select>
	                                           </div>
                                          </div>
                                          
                                           <input type="button" value="+" href="#addRegister" data-toggle="modal" style="margin-left: 942px;margin-top: -50px;background-color: blue;color: white;"/>
                                     	
                                     	 
                                            <div class="modal-footer">
                                                <div class="col-lg-4 push-lg-4">
                                                     <button type="submit" name="InwardRegister" class="btn btn-primary" style="margin-left: -700px;">Submit</button>
                                                    <button type="button" class="btn btn-danger" style="margin-left: 10px;">Exit</button>
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
                                                <th class="sorting wid-15" tabindex="0" rowspan="1" colspan="1">Address</th>
                                                 <th class="sorting wid-20" tabindex="0" rowspan="1" colspan="1">Mobile No</th>
                                                <th class="sorting wid-20" tabindex="0" rowspan="1" colspan="1">Subject</th>                                               
                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Description</th>
                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">File Name</th>
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
                                             	<td><%=((InwardRegisterPojo)inwardPojo).getAddress() %></td>
                                             	<td><%=((InwardRegisterPojo)inwardPojo).getMobileNo() %></td>
                                             	<td><%=((InwardRegisterPojo)inwardPojo).getSubject() %></td>
                                             	<td><%=((InwardRegisterPojo)inwardPojo).getDescription() %></td>
                                             	<td><%=((InwardRegisterPojo)inwardPojo).getDocmentName()%></td>
                                             	<td>
                                        			<a class="edit"  title="update" data-toggle="modal" data-placement="top" title="Update" href="#modal-4" onclick="updateInward(<%=((InwardRegisterPojo)inwardPojo).getId()%>)"><i class="fa fa-pencil text-warning"></i></a>&nbsp; &nbsp;
                                        			<a class="delete hidden-xs hidden-sm" data-toggle="tooltip" data-placement="top" title="Delete" href="/SMGMT/InwardRegister?deleteId=<%=((InwardRegisterPojo)inwardPojo).getId()%>"><i class="fa fa-trash text-danger"></i></a>
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
								<label for="required2" class="col-form-label"> Sender Name<span style="color:red;">*</span></label>
							</div>
							<div class="col-lg-7">
								<input type="text" id="required2" name="addSenderName" class="form-control" onkeyup="this.value=this.value.toUpperCase()" required>
							</div>
						</div>

						<div class="form-group row">
							<div class="col-lg-4  text-lg-right">
								<label for="required2" class="col-form-label"> Address<span style="color:red;">*</span></label>
							</div>
							<div class="col-lg-7">
								<input type="text" id="required2" name="addAddress" onkeyup="this.value=this.value.toUpperCase()" class="form-control" required>
							</div>
						</div>
						
						<div class="form-group row">
							<div class="col-lg-4  text-lg-right">
								<label for="required2" class="col-form-label"> Mobile Number<span style="color:red;">*</span></label>
							</div>
							<div class="col-lg-7">
								<input type="text" id="required2" name="mobileNumber" maxlength="10" onkeyup="this.value=this.value.toUpperCase()" class="form-control" required>
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

	<div class="modal fade pullDown" id="addRegister" role="dialog" aria-labelledby="modalLabelnews">
		<div class="modal-dialog modal-mm" role="document">
			<div class="modal-content">
				<div class="modal-header bg-warning">
					<h4 class="modal-title text-white" id="modalLabelnews"
						style="margin-right: 332px;">Add New File</h4>
				</div>
				<div class="modal-body">
					<form action="/SMGMT/AddDocument" method="post" class="form-horizontal  login_validator" id="form_block_validator">
						<div class="form-group row">
							<div class="col-lg-4  text-lg-right">
								<label for="required2" class="col-form-label"> File Name<span style="color:red;">*</span></label>
							</div>
							<div class="col-lg-7">
								<input type="text" id="required2" name="getFileName" class="form-control" onkeyup="this.value=this.value.toUpperCase()" required>
							</div>
						</div>
									
						<div class="modal-footer">
							<button class="btn  btn-success" name="submitFileName" type="submit">Submit</button>
							<button class="btn  btn-warning" data-dismiss="modal">Close</button>
						</div>
					</form>

				</div>

			</div>
		</div>
	</div>
	<!-- end modal -->
	
						<div class="modal fade pullDown" id="modal-4" role="dialog" aria-labelledby="modalLabelnews">
							<div class="modal-dialog modal-lg" role="document">
								<div class="modal-content" style="width: 650px;">
									<div class="modal-header bg-warning">
										<h4 class="modal-title text-white" id="modalLabelnews"
											style="margin-right: 400px;">Update Inward Register</h4>
									</div>
									<div class="modal-body">	
		                      			<form action="/SMGMT/InwardRegister" method="post" class="form-horizontal  login_validator" id="form_block_validator">
                                            <div class="form-group row">
                                                                                                
                                                <div class="col-lg-3 text-lg-right">
                                                    <label class="col-form-label">Date*</label>
                                                </div>
                                                
                                                <div class="col-lg-6">
                                                	<input type="hidden" name="updateId" id="updateId">
                                                    <input type="text" class="form-control form_val_popup_dp3" name="update" id="updateDate"/>
                                                </div>
                                                
                                          
                                            </div>
                                            
                                      	                                    
                                          <div class="form-group row">
	                                           <div class="col-lg-3 text-lg-right">
	                                               <label for="required2" class="col-form-label">Sender Name*</label>
	                                           </div>
	                                           <%
	                                           InwardRegisterDAO inwardDao=new InwardRegisterImpl();
	                                            List<InwardRegisterPojo> lis3=inwardDao.updatesender();
	                                            Iterator<InwardRegisterPojo> itr8=lis3.iterator();
	                                           %>
                                           
                                           
	                                           <div class="col-lg-6">
	                                               <input class="form-control" list="browsers" name="upsenderName" id="updateSenderName" onkeyup="this.value=this.value.toUpperCase()" autocomplete="off" required />
	                                                <datalist id="browsers">	                                              
	                                               <%
	                                               while(itr8.hasNext())
	                                               {
	                                            	   InwardRegisterPojo pojo7=(InwardRegisterPojo)itr8.next();
	                                            	   String updateSender=((InwardRegisterPojo)pojo7).getSenderName();   
	                                               
	                                               %>
														<option ><%=updateSender %></option>
													<%
													
													}
													%>
														
													</datalist>
	                                          </div>                     	 
                                     	  </div>
                                     	  
                                     	  <div class="form-group row">
                                           	<div class="col-lg-3 text-lg-right">
                                               <label for="required2" class="col-form-label">Address*</label>
                                         	</div>
                                         	  
                                           		<div class="col-lg-6">                                           				
                                             		  <input class="form-control" name="upaddress" placeholder="-" id="updateAddress" onkeyup="this.value=this.value.toUpperCase()" required />                                                
                                         	  </div>
                                         		  
                                      	  </div>  
                                      	  
                                      	  <div class="form-group row">
                                           	<div class="col-lg-3 text-lg-right">
                                               <label for="required2" class="col-form-label">Mobile No*</label>
                                         	</div>
                                         	  
                                           		<div class="col-lg-6">                                           				
                                             		  <input class="form-control" name="updateMobileNum" placeholder="" id="updateMobileNumberId" maxlength="10" pattern="[0-9]+{10}" onkeyup="this.value=this.value.toUpperCase()" required />                                                
                                         	  </div>
                                         		  
                                      	  </div>                        	  
                                     	  
                                     	  <div class="form-group row">
                                           <div class="col-lg-3 text-lg-right">
                                               <label for="required2" class="col-form-label">Subject*</label>
                                           </div>
                                          
                                           <div class="col-lg-6">
                                          	   <%
                                                InwardRegisterDAO updatedao=new InwardRegisterImpl();
                                            	List<InwardRegisterPojo> lis2=updatedao.updateSubject();
                                            	Iterator<InwardRegisterPojo> itr7=lis2.iterator();
                                                %>
                                               <input class="form-control" list="selectSubject" name="upsubject" id="updateSubject" onkeyup="this.value=this.value.toUpperCase()" autocomplete="off" required />
                                                <datalist id="selectSubject">
                                                <%
                                                while(itr7.hasNext())
                                                {
                                                	InwardRegisterPojo pojo6=(InwardRegisterPojo)itr7.next();
                                                	String selectSubject=((InwardRegisterPojo)pojo6).getSubject();
                                                
                                                %>                                                
													<option><%=selectSubject %></option>
												<%} %>
												</datalist>
                                         		  </div>
                                     	  </div>                                     	 
                                     	  
                                     	  <div class="form-group row">
                                           <div class="col-lg-3 text-lg-right">
                                               <label for="required2" class="col-form-label">Description*</label>
                                           </div>
                                           <div class="col-lg-6">
                                               <input class="form-control" name="updateDescription" id="updateDescription" pattern="[A-Za-z]{}" onkeyup="this.value=this.value.toUpperCase()" required />
                                                
                                           </div>
                                     	  </div>
                                     	  
                                     	   <div class="form-group row">
                                            <div class="col-lg-3 text-lg-right">
                                               <label for="required2" class="col-form-label">Select Register*</label>
                                           </div>
                                           <div class="col-lg-6">
                                           <%
                                           
                                           InwardRegisterDAO docdao1=new InwardRegisterImpl();
                                           List<InwardRegisterPojo> l2=docdao1.updateDocument();
                                           Iterator<InwardRegisterPojo> itr11=l2.iterator();
                                           %>
                                           		
                                              <select  class="form-control" name="updateDocumentName" id="updateDocumentId" required>
                                              <%
                                              while(itr11.hasNext())
                                              {
                                            	  InwardRegisterPojo pojo11=(InwardRegisterPojo)itr11.next();
                                            	  int id1=((InwardRegisterPojo)pojo11).getId();                                            	 
                                              	  String doc1=((InwardRegisterPojo)pojo11).getDocmentName();
                                              	  
                                              	//System.out.println("id is :"+id1+"doc1:"+doc1);
                                              
                                              %>
                                                    <option value="<%=id1%>"><%=doc1 %></option>
                                                  <%} %> 
                                                 </select>
                                           </div>
                                          </div>  
                                     	 
                                          <div class="modal-footer">
                                        	  <button class="btn  btn-success" name="InwardDetailsBtn">Update</button>
			                                <button class="btn  btn-warning" data-dismiss="modal">Close</button>
			                            </div>                                           
	                                  </form>     
	                          			  
								</div>
				
							</div>
						</div>
					</div>
	
      
       
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
    
    <script type="text/javascript" src="/SMGMT/config/js/pages/datatable.js"></script>
      
    

<script type="text/javascript">


function getSenderDetails(id){
//alert(id);
	var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	     var demoData = this.responseText;
	     var str=demoData.split(",");
	     //alert(str);
	     document.getElementById("senderId").innerHTML = "";
	     var text="";
	     for(var i=0; i<str.length; i++)
	    	 {
	    	 text+="<option id='"+str[i]+"' ";
	    	 i++;
	    	 text+="value='"+str[i]+"'>";
	    	 i++;
	    	 text +=str[i]+"</option>";
	    	 }
			document.getElementById("senderId").innerHTML = text;		 
	     
	    }
	  };
	  xhttp.open("POST", "/SMGMT/InwardRegister?senderId="+id, true);
	  xhttp.send();
	
}


function updateInward(id) {
	//alert(id);
	var xhttp;
	xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			
			var demoStr = this.responseText.split(",");
			alert(demoStr);
			document.getElementById("updateId").value = demoStr[0];
			document.getElementById("updateDate").value = demoStr[1];
			document.getElementById("updateSenderName").value = demoStr[2];
			document.getElementById("updateAddress").value = demoStr[3];
			document.getElementById("updateMobileNumberId").value = demoStr[4];
			document.getElementById("updateSubject").value = demoStr[5];
			document.getElementById("updateDescription").value = demoStr[6];
			document.getElementById("updateDocumentId").value = demoStr[7];	
			//document.getElementById("updateDocumentId").selectedIndex = demoStr[7];
			/*  var dd = document.getElementById('updateDocumentId');
			
			for (var i = 0; i < dd.options.length; i++) {
			    if (dd.options[i].text === demoStr[7]) {
			        dd.selectedIndex = i;
			        alert(demoStr[7]);
			        getSetSelect('s2id_updateDocumentId', demoStr[7]);
			        break;
			    }
			}  */
			
		}
		};
	xhttp.open("POST","/SMGMT/InwardRegister?inwardId="+id, true);
	xhttp.send();
	
} 


function setDetails() {
	
	var val = document.getElementById('selectSubjectId').value;
    var str = $('#senderId').find('option[value="' + val + '"]').attr('id');
	
	var xhttp;
	xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			
			var demoStr = this.responseText.split(",");
			//alert(demoStr);
			document.getElementById("setAddress").value = demoStr[0];
			document.getElementById("setMobileN").value = demoStr[1];
			
						
		}
		};
	xhttp.open("POST","/SMGMT/InwardRegister?searchName="+str, true);
	xhttp.send();
	
} 
	
	 function getSetSelect(id,value)
	{
		var x=document.getElementById(id).children;
		var xx=x[0].children;
		xx[0].innerHTML=value;
	}

	
	function myFunction() {
	    var x = document.getElementById("snackbar").value;
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