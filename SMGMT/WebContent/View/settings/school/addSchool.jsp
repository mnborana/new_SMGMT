<%@page import="utility.SysDate"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.servletStore.settings.school.model.SchoolImpl"%>
<%@page import="com.servletStore.settings.school.model.SchoolDAO"%>
<%@page import="com.servletStore.settings.school.model.SchoolPOJO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
                                    School Information
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
                                    <li class="active breadcrumb-item">Add New School</li>
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
                                       Add New School
                                    </div>
                                    <div class="card-block m-t-35">
                                        <form action="/SMGMT/School" method="post" class="form-horizontal  login_validator" id="form_block_validator">
                                            <div class="form-group row">
                                                <div class="col-lg-3  text-lg-right">
                                                    <label for="required2" class="col-form-label"> School Name *</label>
                                                </div>
                                                <div class="col-lg-3">
                                                    <input type="text" id="required2" name="school_name" onkeyup="this.value = this.value.toUpperCase()" class="form-control" required >
                                                </div>
                                                
                                                <div class="col-lg-2 text-lg-right">
                                                    <label for="required2" class="col-form-label"> Select Section *</label>
                                                </div>
                                                <div class="col-lg-3">
                                                   <select size="3" multiple class="form-control chzn-select" id="test_me_paddington" name="sectionList" tabindex="8">
                                       		 <%
											    SchoolDAO schooldao=new SchoolImpl();
											 	List<SchoolPOJO> list=schooldao.getSchoolInfo();
											 	Iterator itr=list.iterator();
											 	while(itr.hasNext())
											 	{									 		
										 			
										 			SchoolPOJO pobj = (SchoolPOJO)itr.next();	
										 			int id=((SchoolPOJO)pobj).getSection_id();
										 			String sectionList=((SchoolPOJO)pobj).getSectionName();
											 %> 
                                                   
                                                    <option value="<%=id%>"><%=sectionList %></option>
                                                    <%} %>
                                                </select>
                                          	  </div>
                                            </div>
                                            
                                            
                                             <div class="form-group row">
                                                <div class="col-lg-3  text-lg-right">
                                                    <label for="required2" class="col-form-label"> Address *</label>
                                                </div>
                                                <div class="col-lg-3">
                                                    <input type="text" id="required2" name="school_address" onkeyup="this.value = this.value.toUpperCase()" class="form-control" required >
                                                </div>
                                            
                                            
                                             <div class="col-lg-2  text-lg-right">
                                                    <label for="required2" class="col-form-label"> Slogan *</label>
                                                </div>
                                                <div class="col-lg-3">
                                                    <input type="text" id="required2" name="slogan" onkeyup="this.value = this.value.toUpperCase()" class="form-control" required >
                                                </div>
                                            </div>
                                            
                                            <div class="form-group row">
                                                <div class="col-lg-3  text-lg-right">
                                                    <label for="required2" class="col-form-label"> Index No *</label>
                                                </div>
                                                <div class="col-lg-3">
                                                    <input type="text" id="required2" name="index_no" class="form-control" required >
                                                </div>
                                            
                                            
                                                <div class="col-lg-2  text-lg-right">
                                                    <label for="required2" class="col-form-label"> Licence No *</label>
                                                </div>
                                                <div class="col-lg-3">
                                                    <input type="text" id="required2" name="licence_no" class="form-control" required >
                                                </div>
                                            </div>
                                            
                                            <div class="form-group row">
                                                <div class="col-lg-3  text-lg-right">
                                                    <label for="required2" class="col-form-label"> UDISE *</label>
                                                </div>
                                                <div class="col-lg-3">
                                                    <input type="text" id="required2" name="udise" class="form-control" required >
                                                </div>
                                            
                                                <div class="col-lg-2  text-lg-right">
                                                    <label for="required2" class="col-form-label"> School Code *</label>
                                                </div>
                                                <div class="col-lg-3">
                                                    <input type="text" id="required2" name="school_code" class="form-control" required >
                                                </div>
                                            </div>   
                                            
                                           <div class="form-group row">
                                                <div class="col-xl-3 text-xl-right">
                                                    <label for="email" class="col-form-label">E-mail *</label>
                                                </div>
                                                <div class="col-xl-3">
                                                    <input type="email" id="email" name="email_id" class="form-control">
                                                </div>
                                           
                                                <div class="col-lg-2  text-lg-right">
                                                    <label for="required2" class="col-form-label">Phone No *</label>
                                                </div>
                                                <div class="col-lg-3">
                                                    <input type="text" id="required2" name="phone_no" class="form-control" required >
                                                </div>
                                            </div>
                                            
                                            <div class="form-group row">
                                                <div class="col-lg-3  text-lg-right">
                                                    <label for="required2" class="col-form-label"> Board *</label>
                                                </div>
                                                <div class="col-lg-3">
                                                    <input type="text" id="required2" name="board" onkeyup="this.value = this.value.toUpperCase()" class="form-control" required >
                                                </div>
                                           
                                                <div class="col-lg-2  text-lg-right">
                                                    <label for="required2" class="col-form-label"> Punit Code*</label>
                                                </div>
                                                <div class="col-lg-3">
                                                    <input type="text" id="required2" name="punit_code" class="form-control" required >
                                                </div>
                                            </div>
                                            
                                            <div class="form-group row">
                                                <div class="col-lg-3  text-lg-right">
                                                    <label for="required2" class="col-form-label"> Center *</label>
                                                </div>
                                                <div class="col-lg-3">
                                                    <input type="text" id="required2" name="center" onkeyup="this.value = this.value.toUpperCase()" class="form-control" required >
                                                </div>
                                            
                                                <div class="col-lg-2 text-lg-right">
                                                    <label class="col-form-label">Date *</label>
                                                </div>
                                                <%
                                                SysDate requireddate=new SysDate(); 
                                                
                                                %>
                                                <div class="col-lg-3">
                                                    <input type="text" class="form-control form_val_popup_dp3" name="date_time" value="<%=requireddate.todayDate()%>"/>
                                                </div>
                                            </div>
                                            
                                            <div class="form-group row">
                                                <div class="col-lg-3  text-lg-right">
                                                    <label for="required2" class="col-form-label"> Jubilee Year*</label>
                                                </div>
                                                <div class="col-lg-3">
                                                    <input type="text" id="required2" name="jubilee_year" class="form-control" required >
                                                </div>
                                           
                                                <div class="col-lg-2  text-lg-right">
                                                    <label for="required2" class="col-form-label"> Establish Year*</label>
                                                </div>
                                                <div class="col-lg-3">
                                                    <input type="text" id="required2" name="establish_year" class="form-control" required >
                                                </div>
                                            </div>
                                            
                                             <div class="form-group row">
                                                <div class="col-lg-3  text-lg-right">
                                                    <label for="required2" class="col-form-label"> Medium*</label>
                                                </div>
                                                <div class="col-lg-3">
                                                    <input type="text" id="required2" name="medium" onkeyup="this.value = this.value.toUpperCase()" class="form-control" required >
                                                </div>
                                            </div>
                                           
                                            <div class="form-actions form-group row">
                                                <div class="col-lg-4 push-lg-4">
                                                     <button type="submit" name="SchoolSubmitBtn" class="btn btn-success">Submit</button>
                                                    <button type="button" class="btn btn-danger">Exit</button>
                                                </div>
                                            </div>
                                            
                                        </form>
                                    </div>
                                </div>
                            </div> <!-- /.col-lg-12 -->
                        </div> <!-- /.row -->
                    </div> <!-- /.inner -->
                </div> <!-- /.outer -->
            
            
            <div class="outer">
                    <div class="inner bg-container">
                        <div class="card">
                            <div class="card-header bg-white">
                                School Details
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
                                                <th class="sorting wid-25" tabindex="0" rowspan="1" colspan="1">School Name</th>
                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Select Section</th>
                                                <th class="sorting wid-20" tabindex="0" rowspan="1" colspan="1">Address</th>
                                                <th class="sorting wid-15" tabindex="0" rowspan="1" colspan="1">Slogan</th>
                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Index No</th>
                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Licence No</th>
                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">UDISE</th>
                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">School Code</th>
                                            	<th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Email Id</th>
                                            	<th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Phone No</th>
                                            	<th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Board</th>
                                           	    <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Puni Code</th> 	
                                           	    <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Center</th> 
                                           	    <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Date</th>
                                           	    <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Jubilee Year</th>  
                                           	    <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Establish Year</th>
                                           	    <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Medium</th>
                                           	    <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Action</th>
                                            </tr>
                                            </thead>
                                           <%
			                                   int id=0,count=1;                                  	 
											   	List<SchoolPOJO> li=schooldao.getSchoolDetails();	
									
											 	Iterator itr1=li.iterator();
								 	
                                		   %>
                                    <tbody>
                                        <%
                                        while(itr1.hasNext())
                                        {
                                        	
                                        	SchoolPOJO Pojo=(SchoolPOJO)itr1.next();
                                        	int id1=((SchoolPOJO)Pojo).getId();  
                                        	String sectionList=schooldao.selectSection(id1);
                                        
                                        %>
                                      <tr class="gradeX">
										<td id="<%=id1%>"><%=count%></td>
										<td><%=((SchoolPOJO)Pojo).getName()%></td>
										<td><%=sectionList%></td>
										<td><%=((SchoolPOJO)Pojo).getAddress()%></td>
										<td><%=((SchoolPOJO)Pojo).getSlogan()%></td>
										<td><%=((SchoolPOJO)Pojo).getIndexno()%></td>
										<td><%=((SchoolPOJO)Pojo).getLicenceno()%></td>
										<td><%=((SchoolPOJO)Pojo).getUdise()%></td>
										<td><%=((SchoolPOJO)Pojo).getShoolcode()%></td>
										<td><%=((SchoolPOJO)Pojo).getEmailid()%></td>
										<td><%=((SchoolPOJO)Pojo).getPhoneno()%></td>
										<td><%=((SchoolPOJO)Pojo).getBoard()%></td>
										<td><%=((SchoolPOJO)Pojo).getPunitcode()%></td>
										<td><%=((SchoolPOJO)Pojo).getCenter()%></td>
										<td><%=((SchoolPOJO)Pojo).getDate()%></td>
										<td><%=((SchoolPOJO)Pojo).getJubileeYear()%></td>
										<td><%=((SchoolPOJO)Pojo).getEstablishYear()%></td>
										<td><%=((SchoolPOJO)Pojo).getMedium()%></td>
                  								<td>
                                        			<a class="edit" data-toggle="modal" data-placement="top" title="Update" href="#update" onclick="searchSchool(<%=id1%>)"><i class="fa fa-pencil text-warning"></i></a>&nbsp; &nbsp;
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
       
       <!-- <modal start -->
                  <div class="modal fade pullDown" id="update" role="dialog" aria-labelledby="modalLabelnews">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header bg-warning">
                                <h4 class="modal-title text-white" id="modalLabelnews">Update School Details</h4>
                            </div>
                            <div class="modal-body">
                              <form action="/SMGMT/School" method="post" class="form-horizontal  login_validator" id="form_block_validator">
                                            <div class="form-group row">
                                                <div class="col-lg-3  text-lg-right">
                                                    <label for="required2" class="col-form-label"> School Name *</label>
                                                </div>
                                                <div class="col-lg-3">
                                                	<input type="hidden" id="Updateid" name="UpdateId">
                                                    <input type="text" id="schoolName" name="school_name" onkeyup="this.value = this.value.toUpperCase()" class="form-control" required >
                                                </div>
                                                
                                                <div class="col-lg-2  text-lg-right">
                                                    <label for="required2" class="col-form-label"> Address *</label>
                                                </div>
                                                <div class="col-lg-3">
                                                    <input type="text" id="schoolAddress" name="school_address" onkeyup="this.value = this.value.toUpperCase()" class="form-control" required >
                                                </div>                                                
                                         
                                            </div>
                                            
                                            
                                             <div class="form-group row">
                                                                                   
                                             <div class="col-lg-3  text-lg-right">
                                                    <label for="required2" class="col-form-label"> Slogan *</label>
                                                </div>
                                                <div class="col-lg-3">
                                                    <input type="text" id="sloganId" name="slogan" onkeyup="this.value = this.value.toUpperCase()" class="form-control" required >
                                                </div>
                                                
                                                 <div class="col-lg-2  text-lg-right">
                                                    <label for="required2" class="col-form-label"> Index No *</label>
                                                </div>
                                                <div class="col-lg-3">
                                                    <input type="text" id="indexNo" name="index_no" class="form-control" required >
                                                </div>
                                                
                                            </div>
                                            
                                            <div class="form-group row">                                     
                                            
                                                <div class="col-lg-3  text-lg-right">
                                                    <label for="required2" class="col-form-label"> Licence No *</label>
                                                </div>
                                                <div class="col-lg-3">
                                                    <input type="text" id="licenceNo" name="licence_no" class="form-control" required >
                                                </div>
                                                     <div class="col-lg-2  text-lg-right">
                                                    <label for="required2" class="col-form-label"> UDISE *</label>
                                                </div>
                                                <div class="col-lg-3">
                                                    <input type="text" id="udise" name="udise" class="form-control" required >
                                                </div>
                                                
                                            </div>
                                            
                                            <div class="form-group row">                                          
                                            
                                                <div class="col-lg-3  text-lg-right">
                                                    <label for="required2" class="col-form-label"> School Code *</label>
                                                </div>
                                                <div class="col-lg-3">
                                                    <input type="text" id="schoolCode" name="school_code" class="form-control" required >
                                                </div>
                                                 <div class="col-xl-2 text-xl-right">
                                                    <label for="required2" class="col-form-label">E-mail *</label>
                                                </div>
                                                <div class="col-xl-3">
                                                    <input type="email" id="emailId" name="email_id" class="form-control">
                                                </div>
                                                
                                            </div>   
                                            
                                           <div class="form-group row">
                                               
                                           
                                                <div class="col-lg-3  text-lg-right">
                                                    <label for="required2" class="col-form-label">Phone No *</label>
                                                </div>
                                                <div class="col-lg-3">
                                                    <input type="text" id="phoneNo" name="phone_no" class="form-control" required >
                                                </div>
                                                
                                                <div class="col-lg-2  text-lg-right">
                                                    <label for="required2" class="col-form-label"> Board *</label>
                                                </div>
                                                <div class="col-lg-3">
                                                    <input type="text" id="board" name="board" onkeyup="this.value = this.value.toUpperCase()" class="form-control" required >
                                                </div>
                                                
                                            </div>
                                            
                                            <div class="form-group row">
                                                                                           
                                                <div class="col-lg-3  text-lg-right">
                                                    <label for="required2" class="col-form-label"> Punit Code*</label>
                                                </div>
                                                <div class="col-lg-3">
                                                    <input type="text" id="PunitCode" name="punit_code" class="form-control" required >
                                                </div>
                                                
                                                <div class="col-lg-2  text-lg-right">
                                                    <label for="required2" class="col-form-label"> Center *</label>
                                                </div>
                                                <div class="col-lg-3">
                                                    <input type="text" id="center" name="center" onkeyup="this.value = this.value.toUpperCase()" class="form-control" required >
                                                </div>
                                                
                                            </div>
                                            
                                            <div class="form-group row">                                                
                                            
                                                <div class="col-lg-3 text-lg-right">
                                                    <label class="col-form-label" for="required2">Date *</label>
                                                </div>
                                               
                                                <div class="col-lg-3">
                                                    <input type="text" class="form-control form_val_popup_dp3" id="date" name="date_time" value="<%=requireddate.todayDate()%>"/>
                                                </div>
                                                
                                                <div class="col-lg-2  text-lg-right">
                                                    <label for="required2" class="col-form-label"> Jubilee Year*</label>
                                                </div>
                                                <div class="col-lg-3">
                                                    <input type="text" id="jubileeYear" name="jubileeYear" class="form-control" required >
                                                </div>
                                                
                                                
                                            </div>
                                            
                                            <div class="form-group row">                                                
                                           
                                                <div class="col-lg-3  text-lg-right">
                                                    <label for="required2" class="col-form-label"> Establish Year*</label>
                                                </div>
                                                <div class="col-lg-3">
                                                    <input type="text" id="establishYear" name="establishYear" class="form-control" required >
                                                </div>
                                                
                                                 <div class="col-lg-2  text-lg-right">
                                                    <label for="required2" class="col-form-label"> Medium*</label>
                                                </div>
                                                <div class="col-lg-3">
                                                    <input type="text" id="medium" name="medium" onkeyup="this.value = this.value.toUpperCase()" class="form-control" required >
                                                </div>
                                                
                                            </div>
                                
                          				  <div class="modal-footer">
                         					   <button class="btn  btn-success" type="submit" name="updateSchool">Submit</button>
                         				       <button class="btn  btn-warning" data-dismiss="modal">Close</button>
				                           </div>
				                           
				                             </form>      
                                      
                          			  		</div>
				                        </div>
				                    </div>
				                </div>
                
                <!-- modal end -->
                
                
                
       
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

	function searchSchool(id) {
		
		alert(id);
		var xhttp;
		xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				
				var demoStr = this.responseText.split(",");
					
				document.getElementById("Updateid").value = demoStr[0];				 
				document.getElementById("schoolName").value = demoStr[1];	
				document.getElementById("schoolAddress").value = demoStr[2];
				document.getElementById("sloganId").value = demoStr[3];
				document.getElementById("indexNo").value = demoStr[4];
				document.getElementById("licenceNo").value = demoStr[5];
				document.getElementById("udise").value = demoStr[6];
				document.getElementById("schoolCode").value = demoStr[7];
				document.getElementById("emailId").value = demoStr[8];
				document.getElementById("phoneNo").value = demoStr[9];
				document.getElementById("board").value = demoStr[10];
				document.getElementById("PunitCode").value = demoStr[11];
				document.getElementById("center").value = demoStr[12];
				document.getElementById("date").value = demoStr[13];
				document.getElementById("jubileeYear").value = demoStr[14];
				document.getElementById("establishYear").value = demoStr[15];
				document.getElementById("medium").value = demoStr[16];		
			     
				}
			};
		xhttp.open("POST","/SMGMT/School?schoolid="+id, true);
		xhttp.send();
	}

	
	
	function myFunction() {
	    var x = document.getElementById("snackbar")
	    x.className = "show";
	    setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
	}
	
	
	function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#blah')
                    .attr('src', e.target.result);
            };

            reader.readAsDataURL(input.files[0]);
        }
    }
	
	

	function setFocusToTextBox() {
		
		document.getElementById("required2").focus();
		document.getElementById("schoolName").focus();
		myFunction();
	}


	</script>
</body>

</html>