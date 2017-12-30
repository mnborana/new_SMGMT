
<%@page import="com.servletStore.register.model.OutwardRegisterImpl"%>
<%@page import="com.servletStore.register.model.OutwardRegisterPojo"%>
<%@page import="com.servletStore.register.model.OutwardRegisterDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.servletStore.register.model.InwardRegisterImpl"%>
<%@page import="java.sql.ResultSet"%>

<%@page import="utility.SysDate"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>

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
<body >
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
                                    Outward Register
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
                                    <li class="active breadcrumb-item">Outward Register</li>
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
                                       Outward Register
                                    </div>
                                    <div class="card-block m-t-35" style="margin-top: 47px;">
                                        <form action="/SMGMT/OutwardRegister" method="post" class="form-horizontal  login_validator" id="form_block_validator">
                                            <div class="form-group row">
                                                <div class="col-lg-3  text-lg-right">
                                                    <label for="required2" class="col-form-label"> Outward No<span style="color:red;">*</span></label>
                                                </div>
                                                <%
												int l=1;
												OutwardRegisterDAO outwardDao=new OutwardRegisterImpl();
												OutwardRegisterPojo pojo=outwardDao.outwardNo();
												int outwardId=pojo.getOutwardNo();
												
												int outwardNo=outwardId+l;
												%>
                                                <div class="col-lg-2">
                                                    <input type="text" id="required2" name="outwardNo"  value="<%=outwardNo %>" class="form-control" required readonly>
                                                </div>
                                                
                                                <div class="col-lg-1 text-lg-right">
                                                    <label class="col-form-label">Date<span style="color:red;">*</span></label>
                                                </div>
                                                <%
                                                SysDate requireddate=new SysDate(); 
                                                
                                                %>
                                                <div class="col-lg-2">
                                                    <input type="text" class="form-control form_val_popup_dp3" name="reqdate"  value="<%=requireddate.todayDate()%>"/>
                                                </div>
                                                
                                          
                                            </div>
                                            
                                            <%
												  HashMap<String, String> userDetails =(HashMap)session.getAttribute("user");
												  String receiverName = "";
												  String receiverAddress = "";
												  String mobileNo = "";
												  if (userDetails != null) {
													  receiverName = userDetails.get("receiverName");
													  receiverAddress = userDetails.get("receiverAddress");
													  mobileNo = userDetails.get("mobileNo");
														
												  }
												 
											 %>
                                            
                                            <div class="form-group row">
	                                           <div class="col-lg-3 text-lg-right">
	                                               <label for="required2" class="col-form-label">Receiver Name<span style="color:red;">*</span></label>
	                                           </div>
                                           
	                                           <div class="col-lg-5">
	                                               <input class="form-control" list="receiverId" name="receiverName" id="selectSubjectId" value="<%=receiverName %>" onkeyup="this.value=this.value.toUpperCase();getReceiverDetails(this.value)" onblur="setDetails()()" autocomplete="off" required />
	                                                <datalist id="receiverId">
	                                              
														
													</datalist>
	                                          </div>                     	 
                                     	  </div>
                                     	  
                                     	  <input type="button" value="+" href="#addReceiver" data-toggle="modal" style="margin-left: 800px;margin-top: -53px;background-color: blue;color: white;"/>
                                     	 
                                            
                                      	 
                                     	  <div class="form-group row">
                                           	<div class="col-lg-3 text-lg-right">
                                               <label for="required2" class="col-form-label">Address<span style="color:red;">*</span></label>
                                         	  </div>
                                         	 
                                         	   <div class="col-lg-5">                                           				
                                             		  <input class="form-control" name="outwardAddress"  id="setAddress" value="<%=receiverAddress %>" pattern="[A-Za-z 0-9]" onkeyup="this.value=this.value.toUpperCase()" required />                                                
                                         	  </div>
                                         		
                                     	  </div>   
                                     	  
                                     	  <div class="form-group row">
                                           	<div class="col-lg-3 text-lg-right">
                                               <label for="required2" class="col-form-label">Mobile No<span style="color:red;">*</span></label>
                                         	  </div>
                                         	   <div class="col-lg-5">                                           				
                                             		  <input class="form-control" name="mobileNumber" value="<%=mobileNo %>" id="setMobileNum" pattern="[0-9]" maxlength="10" required />                                                
                                         	  </div>	  
                                         		 
                                     	  </div>                               	                       	  
                                     	  <%session.invalidate(); %>
                                     	  
                                     	  <div class="form-group row">
                                           <div class="col-lg-3 text-lg-right">
                                               <label for="required2" class="col-form-label" >Subject<span style="color:red;">*</span></label>
                                           </div>
                                           <%
                                           OutwardRegisterDAO outwardRegDao=new OutwardRegisterImpl();
                                           List<OutwardRegisterPojo> sublist=outwardRegDao.selectSubjctName();
                                            Iterator<OutwardRegisterPojo> itr3=sublist.iterator();
                                           %>
                                           
                                           <div class="col-lg-5">
                                               <input class="form-control" list="subject1" name="subjectName" onkeyup="this.value=this.value.toUpperCase()"  autocomplete="off" required />
                                                <datalist id="subject1">
                                              	<%
                                              	while(itr3.hasNext())
                                              	{
                                              		
                                              		OutwardRegisterPojo pojo3=(OutwardRegisterPojo)itr3.next();
                                              		String subjectName=((OutwardRegisterPojo)pojo3).getSubject();
                                              	%>
                                               
													<option ><%=subjectName %></option>
													
												<%} %>
													
												</datalist>
                                          </div>                     	 
                                     	  </div>
                                     	  
                                     	 
                                     	 
                                     	  
                                     	  <div class="form-group row">
                                           <div class="col-lg-3 text-lg-right">
                                               <label for="required2" class="col-form-label">Description<span style="color:red;">*</span></label>
                                           </div>
                                           <div class="col-lg-5">
                                               <textarea class="form-control" name="Description" pattern="[A-Za-z]" id="required2" onkeyup="this.value=this.value.toUpperCase()" required ></textarea>
                                                
                                           </div>
                                     	  </div> 
                                     	  
                                     	  <div class="form-group row">
                                            <div class="col-lg-3 text-lg-right">
                                               <label for="required2" class="col-form-label">Select File<span style="color:red;">*</span></label>
                                           </div>
                                           <div class="col-lg-5">
                                           <%
                                           
                                           OutwardRegisterDAO docdao=new OutwardRegisterImpl();
                                           List<OutwardRegisterPojo> l1=docdao.selectDocument();
                                           Iterator<OutwardRegisterPojo> itr10=l1.iterator();
                                           %>
                                              <select class="form-control chzn-select" tabindex="2" name="selRegister" id="required2" required>
                                              <%
                                              while(itr10.hasNext())
                                              {
                                            	  OutwardRegisterPojo pojo10=(OutwardRegisterPojo)itr10.next();
                                            	  int id=((OutwardRegisterPojo)pojo10).getId();
                                              	  String doc=((OutwardRegisterPojo)pojo10).getOutwardDoc();
                                              
                                              %>
                                                    <option value="<%=id%>"><%=doc %></option>
                                                  <%} %> 
                                                 </select>
                                           </div>
                                          </div>  
                                     	  <input type="button" value="+" href="#addReg" data-toggle="modal" style="margin-left: 800px;margin-top: -53px;background-color: blue;color: white;"/>
                                     	
                                     	             	                                  
                                           
                                            <div class="modal-footer">
                                                <div class="col-lg-4 push-lg-4">
                                                     <button type="submit" name="OutwardRegister" class="btn btn-primary" style="margin-left: -700px;">Submit</button>
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
                                Outward Register Details
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
                                                <th class="sorting wid-25" tabindex="0" rowspan="1" colspan="1">Outward No</th>
                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Date</th>
                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Receiver Name</th>
                                                <th class="sorting wid-20" tabindex="0" rowspan="1" colspan="1">Subject</th>
                                                <th class="sorting wid-15" tabindex="0" rowspan="1" colspan="1">Address</th>
                                                  <th class="sorting wid-15" tabindex="0" rowspan="1" colspan="1">Mobile No</th>
                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Description</th>
                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">File Name</th>
                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Action</th>

		                                       </tr>     	
                                           </thead>
                                           <%
                                           int count=1;
                                           OutwardRegisterDAO dao1=new OutwardRegisterImpl();
                                           List<OutwardRegisterPojo> list1=dao1.selectOutwardRegister();
                                           Iterator<OutwardRegisterPojo> itr1=list1.iterator();                                           
                                           %>
                                             <tbody>
                                             <%
                                             while(itr1.hasNext())
                                             {
                                            	 OutwardRegisterPojo outwardPojo=(OutwardRegisterPojo)itr1.next();
                                            	// System.out.println("id is:"+((InwardRegisterPojo)inwardPojo).getId());
                                                                                                                                     
                                             %>
                                             <tr>
                                             	<td id="<%=((OutwardRegisterPojo)outwardPojo).getId()%>"><%=count %></td>
                                             	<td><%=((OutwardRegisterPojo)outwardPojo).getOutwardNo()%></td>
                                             	<td><%=((OutwardRegisterPojo)outwardPojo).getRequireddate() %></td>
                                             	<td><%=((OutwardRegisterPojo)outwardPojo).getReceiverName()%></td>
                                             	<td><%=((OutwardRegisterPojo)outwardPojo).getSubject() %></td>
                                             	<td><%=((OutwardRegisterPojo)outwardPojo).getAddress() %></td>
                                             	<td><%=((OutwardRegisterPojo)outwardPojo).getMobileNo()%></td>
                                             	<td><%=((OutwardRegisterPojo)outwardPojo).getDescription() %></td>
                                             	<td><%=((OutwardRegisterPojo)outwardPojo).getOutwardDoc() %></td>
                                             	
                                             	<td>
                                        			<a class="edit" data-toggle="modal" data-placement="top" title="Update" href="#modal-4" onclick="searchName(<%=((OutwardRegisterPojo)outwardPojo).getId()%>)"><i class="fa fa-pencil text-warning"></i></a>&nbsp; &nbsp;
                                        			<a class="delete hidden-xs hidden-sm" data-toggle="tooltip" data-placement="top" title="Delete" href="/SMGMT/OutwardRegister?deleteId=<%=((OutwardRegisterPojo)outwardPojo).getId()%>"><i class="fa fa-trash text-danger"></i></a>
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

	<div class="modal fade pullDown" id="addReceiver" role="dialog" aria-labelledby="modalLabelnews">
		<div class="modal-dialog modal-mm" role="document">
			<div class="modal-content">
				<div class="modal-header bg-warning">
					<h4 class="modal-title text-white" id="modalLabelnews"
						style="margin-right: 308px;">Add New Receiver</h4>
				</div>
				<div class="modal-body">
					<form action="/SMGMT/OutwardRegister" method="post" class="form-horizontal  login_validator" id="form_block_validator">
						<div class="form-group row">
							<div class="col-lg-4  text-lg-right">
								<label for="required2" class="col-form-label"> Receiver	Name<span style="color:red;">*</span></label>
							</div>
							<div class="col-lg-7">
								<input type="text" id="required2" name="addReceiverName" class="form-control" onkeyup="this.value=this.value.toUpperCase()" required>
							</div>
						</div>

						<div class="form-group row">
							<div class="col-lg-4  text-lg-right">
								<label for="required2" class="col-form-label"> Address<span style="color:red;">*</span></label>
							</div>
							<div class="col-lg-7">
								<input type="text" id="required2" name="outwardAddress" onkeyup="this.value=this.value.toUpperCase()"  class="form-control" required>
							</div>
						</div>
						
						<div class="form-group row">
							<div class="col-lg-4  text-lg-right">
								<label for="required2" class="col-form-label"> Mobile No<span style="color:red;">*</span></label>
							</div>
							<div class="col-lg-7">
								<input type="text" id="required2" name="mobileNumber" onkeyup="this.value=this.value.toUpperCase()"  maxlength="10" class="form-control" required>
							</div>
						</div>
						
						
						<div class="modal-footer">
							<button class="btn  btn-success" name="OutwardReceiverBtn" type="submit">Submit</button>
							<button class="btn  btn-warning" data-dismiss="modal">Close</button>
						</div>
					</form>

				</div>

			</div>
		</div>
	</div>
	
	<!-- end modal -->
	
<!-- 	start model -->
		<div class="modal fade pullDown" id="modal-4" role="dialog" aria-labelledby="modalLabelnews">
							<div class="modal-dialog modal-lg" role="document">
								<div class="modal-content" style="width: 650px;">
									<div class="modal-header bg-warning">
										<h4 class="modal-title text-white" id="modalLabelnews"
											style="margin-right: 400px;">Update Outward Register</h4>
									</div>
									<div class="modal-body">	
		                      			<form action="/SMGMT/OutwardRegister" method="post" class="form-horizontal  login_validator" id="form_block_validator">
                                            <div class="form-group row">
                                                                                                
                                                <div class="col-lg-3 text-lg-right">
                                                    <label class="col-form-label">Date*</label>
                                                </div>
                                                
                                                <div class="col-lg-6">
                                                	<input type="hidden" name="updatedId" id="updateId">
                                                    <input type="text" class="form-control form_val_popup_dp3" name="updatedDate" id="updatedate"/>
                                                </div>
                                                
                                          
                                            </div>
                                            
                                      	                                    
                                          <div class="form-group row">
	                                           <div class="col-lg-3 text-lg-right">
	                                               <label for="required2" class="col-form-label">Receiver Name*</label>
	                                           </div>
	                                          <%
	                                          OutwardRegisterDAO updateDao=new OutwardRegisterImpl();
	                                          List<OutwardRegisterPojo> list4=updateDao.upReceiver();
	                                          Iterator<OutwardRegisterPojo> itr5=list4.iterator();
	                                          
	                                          %>
                                           
                                           
	                                           <div class="col-lg-6">
	                                               <input class="form-control" list="receiverName" name="updatedReceiverName"  id="updateReceiverName" onkeyup="this.value=this.value.toUpperCase()" required />
	                                                <datalist id="receiverName">	                                              
	                                               <%
	                                               while(itr5.hasNext())
	                                               {
	                                            	   OutwardRegisterPojo pojo5=(OutwardRegisterPojo)itr5.next();
	                                            	   String updateReceiver=((OutwardRegisterPojo)pojo5).getReceiverName();
	                                               
	                                               %>
														<option ><%= updateReceiver%></option>
													<%} %>
														
													</datalist>
	                                          </div>                     	 
                                     	  </div>
                                     	  
                                     	  <div class="form-group row">
                                           	<div class="col-lg-3 text-lg-right">
                                               <label for="required2" class="col-form-label">Address*</label>
                                         	</div>
                                         	  
                                           		<div class="col-lg-6">                                           				
                                             		  <input class="form-control" name="updatedAddress" placeholder="-"  id="updateAddress" onkeyup="this.value=this.value.toUpperCase()" required />                                                
                                         	  </div>
                                         		  
                                      	  </div>       
                                      	  
                                      	    <div class="form-group row">
                                           	<div class="col-lg-3 text-lg-right">
                                               <label for="required2" class="col-form-label">Mobile No*</label>
                                         	</div>
                                         	  
                                           		<div class="col-lg-6">                                           				
                                             		  <input class="form-control" name="updateMobileNumber" placeholder="-"  id="updateMobileNumber"  maxlength="10" required />                                                
                                         	  </div>
                                         		  
                                      	  </div>                  	  
                                     	  
                                     	  <div class="form-group row">
                                           <div class="col-lg-3 text-lg-right">
                                               <label for="required2" class="col-form-label">Subject*</label>
                                           </div>
                                          
                                           <div class="col-lg-6">
                                          	   <%
                                                OutwardRegisterDAO updatedao=new OutwardRegisterImpl();
                                            	List<OutwardRegisterPojo> lis2=updatedao.upSubject();
                                            	Iterator<OutwardRegisterPojo> itr7=lis2.iterator();
                                                %>
                                               <input class="form-control" list="selectsubject" name="updatedSubject"  id="updateSubject" onkeyup="this.value=this.value.toUpperCase()" autocomplete="off" required />
                                                <datalist id="selectsubject">
                                                <%
                                                while(itr7.hasNext())
                                                {
                                                	OutwardRegisterPojo pojo6=(OutwardRegisterPojo)itr7.next();
                                                	String selectSubject=((OutwardRegisterPojo)pojo6).getSubject();
                                                
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
                                               <input class="form-control" name="updatedDescription" id="updateDescription" onkeyup="this.value=this.value.toUpperCase()" required />
                                                
                                           </div>
                                     	  </div> 
                                     	  
                                     	   <div class="form-group row">
                                            <div class="col-lg-3 text-lg-right">
                                           
                                               <label for="required2" class="col-form-label">Select Register*</label>
                                           </div>
                                           <%
                                           OutwardRegisterDAO document=new OutwardRegisterImpl();
                                           List<OutwardRegisterPojo> reglist=document.updateDocument();
                                           Iterator<OutwardRegisterPojo> itr11=reglist.iterator();
                                           %>
                                           <div class="col-lg-6">
                                            <select class="form-control chzn-select" tabindex="2" name="updateRegister" id="updateDocumentId" required>
                                              <%
                                              while(itr11.hasNext())
                                              {
                                            	  OutwardRegisterPojo pojo11=(OutwardRegisterPojo)itr11.next();
                                            	  int id1=((OutwardRegisterPojo)pojo11).getId();
                                              	  String document1=((OutwardRegisterPojo)pojo11).getOutwardDoc();
                                              
                                              %>
                                                    <option value="<%=id1%>"><%=document1 %></option>
                                                  <%} %> 
                                                 </select>         	                                       	 
                                     	 	</div>
                                     	 </div>
                                          <div class="modal-footer">
                                        	  <button class="btn  btn-success" name="outwardDetailsBtn">Update</button>
			                                <button class="btn  btn-warning" data-dismiss="modal">Close</button>
			                            </div>                                           
	                                  </form>     
	                          			  
								</div>
				
							</div>
						</div>
					</div>
<!-- end model -->	

<!-- start modal -->

	<div class="modal fade pullDown" id="addReg" role="dialog" aria-labelledby="modalLabelnews">
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


<!--plugin scripts-->
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
    <!-- end of plugin scripts -->
    <!--Page level scripts-->
    <script type="text/javascript" src="/SMGMT/config/js/pages/datatable.js"></script>
    <!-- end of global scripts-->

<script type="text/javascript">

function getReceiverDetails(id){

	var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	     var demoData = this.responseText;
	     var str=demoData.split(",");
	     //alert(str);
	     document.getElementById("receiverId").innerHTML = "";
	     var text="";
	     for(var i=0; i<str.length; i++)
	    	 {
	    	 text+="<option id='"+str[i]+"' ";
	    	 i++;
	    	 text+="value='"+str[i]+"'>";
	    	 i++;
	    	 text +=str[i]+"</option>";
	    	 }
			document.getElementById("receiverId").innerHTML = text;		 
	     
	    }
	  };
	  xhttp.open("POST", "/SMGMT/OutwardRegister?receiverId="+id, true);
	  xhttp.send();
	
}


function searchName(id1) {
	
	var xhttp;
	xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			
			var demoStr = this.responseText.split(",");
			alert(demoStr);
			document.getElementById("updateId").value = demoStr[0];
			document.getElementById("updatedate").value = demoStr[1];
			document.getElementById("updateReceiverName").value = demoStr[2];
			document.getElementById("updateAddress").value = demoStr[3];
			document.getElementById("updateMobileNumber").value = demoStr[4];
			document.getElementById("updateSubject").value = demoStr[5];
			document.getElementById("updateDescription").value = demoStr[6];
			document.getElementById("updateDocumentId").value = demoStr[7];
			
			 var dd=document.getElementById("updateDocumentId");
			 
				
				for (var i = 0; i < dd.options.length; i++) {
				    if (dd.options[i].text ==demoStr[7].trim()) {
				        dd.selectedIndex = i;
				        getSetSelect('s2id_updateDocumentId',demoStr[7]);
				        break;
				    }
				}
				
			}
		};
	xhttp.open("POST","/SMGMT/OutwardRegister?outwardId="+id1, true);
	xhttp.send();	
	
} 

function setDetails() {
	
	var val = document.getElementById('selectSubjectId').value;
    var str = $('#receiverId').find('option[value="' + val + '"]').attr('id');

	
	var xhttp;
	xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			
			var demoStr = this.responseText.split(",");
			//alert(demoStr);
			document.getElementById("setAddress").value = demoStr[0];
			document.getElementById("setMobileNum").value = demoStr[1];
						
		}
		};
	xhttp.open("POST","/SMGMT/OutwardRegister?searchName="+str, true);
	xhttp.send();
	
} 




function getSetSelect(id,value)
{
	var x=document.getElementById(id).children;
	var xx=x[0].children;
	xx[0].innerHTML=value;
}

	function myFunction() {
	    var x = document.getElementById("snackbar")
	    x.className = "show";
	    setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
	}
	



	</script>
</body>

</html>