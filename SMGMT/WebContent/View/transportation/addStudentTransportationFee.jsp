<%@page import="com.servletStore.transportation.studentdetails.model.StudentNameDetailsPOJO"%>
<%@page import="com.servletStore.transportation.studentdetails.model.StudentNameDetailsImpl"%>
<%@page import="com.servletStore.transportation.studentdetails.model.StudentNameDetailsDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="com.servletStore.transportation.route.model.RouteImpl"%>
<%@page import="com.servletStore.transportation.route.model.RouteDAO"%>
<%@page import="com.servletStore.transportation.route.model.RoutePOJO"%>
<%@page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta charset="UTF-8">
    <title>Driver Information| Admire</title>
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
                                    Add Route
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
                                    <li class="active breadcrumb-item">Add Route</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </header>
                
             <!-- start your code from here  -->  
              
             
	                            
          
              
              
              
              <div class="outer">
                <div class="inner bg-container">
                    <div class="card">
                        <div class="card-header bg-white">
                            Student Transmission Details
                        </div>
                        	<div class="card-block" id="tabs">
	                            <ul class="nav nav-tabs m-t-35">
	                                <li class="nav-item">
	                                    <a class="nav-link active" href="#transmission" data-toggle="tab" onclick="hide()">Transmission Fee</a>
	                                </li>
	                                <li class="nav-item" id="themify_icon">
	                                    <a class="nav-link" href="#global_search" data-toggle="tab" onclick="show()">Global Search</a>
	                                </li>
	                            </ul>
	                             <div class="tab-content">
               
              	<!-- Transmission Fee Tab -->
              <div id="transmission">
                <div class="outer" id="outer1">
                    <div class="inner bg-container">
                        <div class="row">
                            <div class="col-xl-12">
                                <div class="card">
                                    <div class="card-header bg-white">
                                        <i class="fa fa-file-text-o"></i>
                                        Search Student
                                    </div>
                                    <div class="card-block m-t-35">
                                      <%
	                                      StudentNameDetailsDAO sd=new StudentNameDetailsImpl();
    	                                  List<StudentNameDetailsPOJO> stud_list=sd.getStudentNameDetails();
                                      
                                      %>
   									<form action="#" class="form-horizontal  login_validator" method="post" id="form_block_validator">
                                        
                                      
                                            
                                                                   
                                            <div class="form-group row">
                                                	<div class="col-lg-3  text-lg-right">
                                                	    <label for="required2" class="col-form-label">Search Student By Name *</label>
                                               		 </div>
                                                	 <div class="col-lg-4">
                                                	<select class="form-control chzn-select" tabindex="2">
                                                	    <option disabled selected>Choose a  Name</option>
                                                	    <%
                                                	    	for(int i=0;i<stud_list.size();i++)
                                                	    	{
                                                	    %>
	                                                	    <option value="<%=stud_list.get(i).getName()%>"><%=stud_list.get(i).getName()%></option>
                                                	    <%
                                                	    	}
                                                	    %>
                                                	</select>
                                          	 		</div>
                                                
                                                 	<div class="col-lg-4">
                                                		<a href="javascript:showMore()" id="moreless">Search More >>></a>
                                          	 		</div>
                                            </div>
                                            
                                            <div class="form-group row" id="std-div">
                                                <div class="col-lg-3  text-lg-right">
                                                    <label for="required2" class="col-form-label">Search By Std/Div *</label>
                                                </div>
                                                
                                                 <div class="col-lg-4">
                                                <select class="form-control chzn-select" tabindex="2">
                                                    <option disabled selected>Choose Std and Div</option>
                                                    <option value="5-A">5-A</option>
                                                    <option value="9-P">9-P</option>
                                                </select>
                                          	 </div>
                                                
                                                <div class="col-lg-4">
                                                <select class="form-control chzn-select" tabindex="2">
                                                    <option disabled selected>Choose a Name</option>
                                                    <option value="AP">AP</option>
                                                </select>
                                          	 </div>
                                                
                                            </div>
                                           
                                           
                                            <div class="form-actions form-group row">
                                                <div class="col-lg-5 push-lg-5">
                                                    <button class="btn btn-primary" name="add_route_btn" onclick="showInfo()">Search</button>
                                                </div>
                                            </div>
                                        </form>
                                     
                                    </div>
                                </div>
                            </div> <!-- /.col-lg-12 -->
                        </div> <!-- /.row -->
                    </div> <!-- /.inner -->
                </div> <!-- /.outer -->
                
                     
                <div class="outer" id="outer2">
                    <div class="inner bg-container">
                        <div class="row">
                            <div class="col-xl-12">
                                <div class="card">
                                    <div class="card-header bg-white">
                                        <i class="fa fa-file-text-o"></i>
                                       Student Info
                                    </div>
                                    <div class="card-block m-t-35">
                                      
                                       <%
                                       			RouteDAO rd=new RouteImpl();
                                                List<RoutePOJO> route_list=rd.getRouteDetails();                                                
                							 
						                %>
                                      
   									<form action="#" class="form-horizontal  login_validator" method="post" id="form_block_validator">
                                        
                                      
                                           <div class="form-group row">
                                                <div class="col-lg-2  text-lg-right">
                                                    <label class="col-form-label">GR No</label>
                                                </div>
                                                <div class="col-lg-2">
                                                    <input type="text" id="required1" name="gr_no" value="11659" class="form-control focused_input" readonly>                                                     
                                                </div>
                                                
                                                <div class="col-lg-1 text-lg-right">
                                                    <label for="required2" class="col-form-label">Std</label>
                                                </div>
                                                <div class="col-lg-2">
                                                    <input type="text" id="required2" name="std" value="5" class="form-control focused_input" readonly>                                                     
                                                </div>
                                                <div class="col-lg-1  text-lg-right">
                                                    <label for="required2" class="col-form-label">Div</label>
                                                </div>
                                                <div class="col-lg-2">
                                                    <input type="text" id="required3" name="divi" value="AP" class="form-control focused_input" readonly>                                                     
                                                </div>
                                            </div> 
                                            
                                            <div class="form-group row">
                                                	<div class="col-lg-2  text-lg-right">
                                                	    <label for="required2" class="col-form-label">Select Route *</label>
                                               		 </div>
                                                	 <div class="col-lg-4">
                                                	<select class="form-control chzn-select" id="route_name" tabindex="2" onchange="getDestinations()">
                                                	    <option disabled selected>Choose a  Route</option>
                                                	    <%
                                                	    	int j=0;
                                                	    	while(j<route_list.size())
                                                	    	{
                                                	    %>
                                                	    <option value="<%=route_list.get(j).getRoute_name() %>"><%=route_list.get(j).getRoute_name() %></option>
                                                	    <%
                                                	    		j++;
                                                	    	}
                                                	    %>
                                                	</select>
                                          	 		</div>
                                                
                                                	
                                            </div>
                                            
                                            <div class="form-group row">                                                
                                                	<div class="col-lg-2 text-lg-right ">
                                                	    <label for="required2" class="col-form-label">Select Destination *</label>
                                               		 </div>
                                                	 <div class="col-lg-4">
                                                	<select class="form-control chzn-select" tabindex="2" id="destination" onchange="getTableInfo()">
                                                	    <option disabled selected>Choose a  Destination </option>
                                                	</select>
                                          	 		</div>
                                                 	
                                            </div>
                                            <div class="form-actions form-group row">
                                                <div class="col-lg-5 push-lg-5">
                                                    <button class="btn btn-primary" name="assign_route_btn" onclick="getTableInfo()">Asssign</button>
                                                </div>
                                            </div>
                                        </form>
                                     
                                    </div>
                                </div>
                            </div> <!-- /.col-lg-12 -->
                        </div> <!-- /.row -->
                    </div> <!-- /.inner -->
                </div> <!-- /.outer -->
            
            <div class="outer" id="outer3">
                    <div class="inner bg-container">
                        <div class="card">
                            <div class="card-header bg-white">
                                User Grid
                            </div>
                            <div class="card-block m-t-35" id="user_body">
                                <div class="table-toolbar">
                                    
                                    <div class="btn-group float-right users_grid_tools">
                                        <div class="tools"></div>
                                    </div>
                                </div>
                                <div>
                                    <div>
                                    <%
                                    	String fees="0.00";
                                    	String from_year="2016",to_year="2017";
                                    	String months[]={"June-"+from_year,"July-"+from_year,"August-"+from_year,"September-"+from_year,"October-"+from_year,"November-"+from_year,"December-"+from_year,"January-"+to_year,"February-"+to_year,"March-"+to_year,"April-"+to_year,"May-"+to_year};                                    
                                    %>
                                    <form>
                                        <table class="table  table-striped table-bordered table-hover dataTable no-footer" id="editable_table" role="grid">
                                            <thead>
                                            <tr role="row">
                                                <th>
	                                            		<div >
	                                                    	<label class="custom-control custom-checkbox">
	                                                    	    <input type="checkbox" id="check_all" class="custom-control-input" onclick="checkAll()" checked>
	                                                    	    <span class="custom-control-indicator"></span>
	                                                    	    <span class="custom-control-description">Select All</span>
	                                                    	</label>
	                                                	</div>                                                		
                                            		</th>
                                            	<th tabindex="0" rowspan="1" colspan="1">Months</th>
                                                <th tabindex="0" rowspan="1" colspan="1">Fees</th>                                                                                               
                                            </tr>
                                            </thead>
                                          
                                            <tbody>
                                            <%
                                            	for(int i=0;i<months.length;i++)
                                            	{
                                            %>
                                            	<tr role="row" class="even">
		                                      		<td style="width:120px">
	                                            		<div >
	                                                    	<label class="custom-control custom-checkbox">
	                                                    	    <input type="checkbox" class="custom-control-input" id="check<%=i %>" checked onclick="select_month(<%=i %>)">
	                                                    	    <span class="custom-control-indicator"></span>
	                                                    	    <span class="custom-control-description"></span>
	                                                    	</label>
	                                                	</div>                                                		
                                            		</td>
                                            		<td style="width:100px"><%=months[i] %></td>
                                            		<td style="width:100px" id="fee<%=i%>"><%=fees%></td>
                                            	</tr>                                             		
                                            	<%
                                            		
                                            	}
                                            	%>
                                            	 <tr>
                                            	<td style="width:100px">
                                            		<input style="width:80px" type="text" id="required1" name="disc" value="" placeholder="Total Fee" class="form-control focused_input">                                                     
                                                </td>
                                                <td style="width:100px">
                                            		<input style="width:80px" type="text" id="required1" name="disc" value="" placeholder="Discount" class="form-control focused_input">                                                     
                                                </td>
                                            	<td style="width:100px">
                                            		<input style="width:80px" type="text" id="required1" name="disc" value="" placeholder="Final Fee" class="form-control focused_input">                                                     
                                                </td>
                                            	</tr>                                      	
                                            	
                                            	
                                            	     
                                            	</tbody>
                                        </table>
                                        </form>
                                    </div>
                                </div>
                                <!-- END EXAMPLE TABLE PORTLET-->
                            </div>
                        </div>
                    </div>                    
                </div>
                </div>
               	<!-- Transmission Fee Tab End-->
               	
               	
               	
               	
               		<!-- Global Search Tab Start-->
               		
               		  <div id="global_search">
                <div class="outer" id="outer1">
                    <div class="inner bg-container">
                        <div class="row">
                            <div class="col-xl-12">
                                <div class="card">
                                    <div class="card-header bg-white">
                                        <i class="fa fa-file-text-o"></i>
                                        Search Student
                                    </div>
                                    <div class="card-block m-t-35">
                                      
   									<form action="#" class="form-horizontal  login_validator" method="post" id="form_block_validator">
                                        
                                      
                                            
                                                                   
                                            <div class="form-group row">
                                                	<div class="col-lg-3  text-lg-right">
                                                	    <label for="required2" class="col-form-label">Search Student By Name *</label>
                                               		 </div>
                                                	 <div class="col-lg-4">
                                                	<select class="form-control chzn-select" tabindex="2">
                                                	    <option disabled selected>Choose a  Name</option>
                                                	    <option value="United States">Pravin</option>
                                                	</select>
                                          	 		</div>
                                                
                                                 	<div class="col-lg-4">
                                                		<a href="javascript:showMore()" id="moreless">Search More >>></a>
                                          	 		</div>
                                            </div>
                                            
                                            <div class="form-group row" id="std-div">
                                                <div class="col-lg-4  text-lg-right">
                                                    <label for="required2" class="col-form-label">Search By Std/Div *</label>
                                                </div>
                                                
                                                 <div class="col-lg-4">
                                                <select class="form-control chzn-select" tabindex="2">
                                                    <option disabled selected>Choose Std and Div</option>
                                                    <option value="5-A">5-A</option>
                                                    <option value="9-P">9-P</option>
                                                </select>
                                          	 </div>
                                                
                                                <div class="col-lg-4">
                                                <select class="form-control chzn-select" tabindex="2">
                                                    <option disabled selected>Choose a Name</option>
                                                    <option value="AP">AP</option>
                                                </select>
                                          	 </div>
                                                
                                            </div>
                                           
                                           
                                            <div class="form-actions form-group row">
                                                <div class="col-lg-4 push-lg-4">
                                                    <button class="btn btn-primary" name="add_route_btn" onclick="showInfo()">Search-Global</button>
                                                </div>
                                            </div>
                                        </form>
                                     
                                    </div>
                                </div>
                            </div> <!-- /.col-lg-12 -->
                        </div> <!-- /.row -->
                    </div> <!-- /.inner -->
                </div> <!-- /.outer -->
                
                     
                <div class="outer" id="outer2">
                    <div class="inner bg-container">
                        <div class="row">
                            <div class="col-xl-12">
                                <div class="card">
                                    <div class="card-header bg-white">
                                        <i class="fa fa-file-text-o"></i>
                                       Student Info
                                    </div>
                                    <div class="card-block m-t-35">
                                      
   									<form action="#" class="form-horizontal  login_validator" method="post" id="form_block_validator">
                                        
                                      
                                           <div class="form-group row">
                                                <div class="col-lg-2  text-lg-right">
                                                    <label class="col-form-label">GR No</label>
                                                </div>
                                                <div class="col-lg-2">
                                                    <input type="text" id="required1" name="gr_no" value="11659" class="form-control focused_input" readonly>                                                     
                                                </div>
                                                
                                                <div class="col-lg-1 text-lg-right">
                                                    <label for="required2" class="col-form-label">Std</label>
                                                </div>
                                                <div class="col-lg-2">
                                                    <input type="text" id="required2" name="std" value="5" class="form-control focused_input" readonly>                                                     
                                                </div>
                                                <div class="col-lg-1  text-lg-right">
                                                    <label for="required2" class="col-form-label">Div</label>
                                                </div>
                                                <div class="col-lg-2">
                                                    <input type="text" id="required3" name="divi" value="AP" class="form-control focused_input" readonly>                                                     
                                                </div>
                                            </div> 
                                            
                                        </form>
                                     
                                    </div>
                                </div>
                            </div> <!-- /.col-lg-12 -->
                        </div> <!-- /.row -->
                    </div> <!-- /.inner -->
                </div> <!-- /.outer -->
            
            <div class="outer" id="outer3">
                    <div class="inner bg-container">
                        <div class="card">
                            <div class="card-header bg-white">
                                User Grid
                            </div>
                            <div class="card-block m-t-35" id="user_body">
                                <div class="table-toolbar">
                                    
                                    <div class="btn-group float-right users_grid_tools">
                                        <div class="tools"></div>
                                    </div>
                                </div>
                                <div>
                                    <div>
                                    <%
                                    	String fees1="5934";
                                    	String from_year1="2016",to_year1="2017";
                                    	String months1[]={"June-"+from_year1,"July-"+from_year1,"August-"+from_year1,"September-"+from_year1,"October-"+from_year1,"November-"+from_year1,"December-"+from_year1,"January-"+to_year1,"February-"+to_year1,"March-"+to_year1,"April-"+to_year1,"May-"+to_year1};                                    
                                    %>
                                    <form>
                                        <table class="table  table-striped table-bordered table-hover dataTable no-footer" id="editable_table" role="grid">
                                            <thead>
                                            <tr role="row">
                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">ID</th>
                                                <th>
	                                            		<div >
	                                                    	<label class="custom-control custom-checkbox">
	                                                    	    <input type="checkbox" id="check_all" class="custom-control-input" onclick="checkAll()" checked>
	                                                    	    <span class="custom-control-indicator"></span>
	                                                    	    <span class="custom-control-description">Select All</span>
	                                                    	</label>
	                                                	</div>                                                		
                                            		</th>
                                            	<th tabindex="0" rowspan="1" colspan="1">Months</th>
                                                <th tabindex="0" rowspan="1" colspan="1">Fees</th>
                                                <th tabindex="0" rowspan="1" colspan="1">Discount</th>
                                                <th tabindex="0" rowspan="1" colspan="1">Total</th>
                                                <th tabindex="0" rowspan="1" colspan="1">Return</th>
                                                <th tabindex="0" rowspan="1" colspan="1">Actions</th>
                                            </tr>
                                            </thead>
                                          
                                            <tbody>
                                            <%
                                            	for(int i=0;i<months.length;i++)
                                            	{
                                            %>
                                            	<tr role="row" class="even">
		                                      		<td class="sorting_1"><%=i %></td>
		                                      		<td style="width:120px">
	                                            		<div >
	                                                    	<label class="custom-control custom-checkbox">
	                                                    	    <input type="checkbox" class="custom-control-input" id="check<%=i %>" checked>
	                                                    	    <span class="custom-control-indicator"></span>
	                                                    	    <span class="custom-control-description"></span>
	                                                    	</label>
	                                                	</div>                                                		
                                            		</td>
                                            		<td style="width:100px"><%=months[i] %></td>
                                            		<td style="width:100px"><%=fees%></td>
                                            		<td style="width:100px">
                                            			
                                                    		<input style="width:80px" type="text" id="required1" name="disc" value="" placeholder="Discount" class="form-control focused_input">                                                     
                                                		
                                            		</td>
                                            		<td style="width:100px">11600</td>
                                            		<td style="width:100px">
                                            			
                                                    		<input style="width:80px" type="text" id="required1" name="disc" value="" placeholder="Discount" class="form-control focused_input">                                                     
                                                		
                                            		</td>
                                            		<td>
	                                            		<a data-toggle="modal" data-placement="top" title="View Route" href="#view" >
	                                            			<i class="fa fa-eye text-success"></i>
	                                            			</a>&nbsp; &nbsp;                                            		
	                                            		<a class="edit" data-toggle="modal" data-target="#Update" data-placement="top" title="Edit" href="#Update" ><i class="fa fa-pencil text-warning"></i></a>
	                                            		&nbsp; &nbsp;
	                                            		<a class="delete hidden-xs hidden-sm" data-toggle="tooltip" data-placement="top" title="Delete"  href=" #"  onclick="return confirm('Are you sure you want to delete this item?');">
	                                            		<i class="fa fa-trash text-danger"></i></a>
                                            		</td>
                                            	<%
                                            	
                                            	}
                                            	%>
                                            	</tbody>
                                        </table>
                                        </form>
                                    </div>
                                </div>
                                <!-- END EXAMPLE TABLE PORTLET-->
                            </div>
                        </div>
                    </div>                    
                </div>
                </div>
               		
               		<!-- Global Search Tab End-->
                </div>
                </div>
                </div>
                </div>
                </div>
                
                
                
                <div class="modal fade" id="search_modal" tabindex="-1" role="dialog" aria-hidden="true">
                    
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
                </div>
           </div>
           </div>
           </div>
          
    
   <!--wrapper-->
       
               
<!-- /#wrap -->
<script type="text/javascript" src="/SMGMT/config/js/jquery.min.js"></script>
<script type="text/javascript">
	var ap,check,fee;
	$(document).ready(function()
	{     
			check=true;
			ap=0;
			document.getElementById("global_search").style.display="none";
	        $("#outer2").hide();
	        $("#std-div").hide();
	}); 
	function showInfo()
	{
	    $("#outer2").toggle();
	}
	function showMore()
	{	
		ap=ap+1;
		$("#std-div").toggle();
		if(ap%2!=0)
			$("#moreless").text("Less <<<");
		else
			$("#moreless").text("Search More >>>");
	}
	function show()
	{
		//alert("called...")
		document.getElementById("global_search").style.display="block";
		document.getElementById("transmission").style.display="none";
	}
	function hide()
	{
		//alert("called...")
		document.getElementById("global_search").style.display="none";
		document.getElementById("transmission").style.display="block";
	}
	function checkAll()
	{
			//alert("FALSE");
			var len=<%=months.length%>;	
			var i=0;
			//alert(len);
			while(i<len)
			{				
				if(check)
				{
					$("#check"+i).prop("checked", false);
				}
				else
				{
					$("#check"+i).prop("checked", true);
				}
				i++;
			}			
			if(check)
				check=false
			else
				check=true		
	}
	function getDestinations()
	{
		$('#destination').children('option:not(:first)').remove()
		var route_name=document.getElementById("route_name");
		var route = route_name.options[route_name.selectedIndex].value;
		var xhttp;
		xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
								
				var dest=this.responseText.split(",");
				var x = document.getElementById("destination");
				//alert(dest.length);				
				for(var i=0;i<dest.length-1;i++)
				{
					var option = document.createElement("option");
					option.text = dest[i];
					x.add(option);
				}
				

				//alert(demoStr[0]);
				 
				}
			};
		xhttp.open("POST","/SMGMT/StudentTransmissionFee?route_name="+route, true);
		xhttp.send();		
	}
	function getTableInfo()
	{
		//alert("59")
		var route_name=document.getElementById("route_name");
		var route = route_name.options[route_name.selectedIndex].value;
		var dest_name=document.getElementById("destination");
		var dest = dest_name.options[dest_name.selectedIndex].value;
		var xhttp;
		xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
								
				//alert(this.responseText);
				fee=this.responseText;
				for(var i=0;i<12;i++)
					{
						
						document.getElementById("fee"+i).innerHTML=fee;
					}
				 
				}
			};
		xhttp.open("POST","/SMGMT/StudentTransmissionFee?dest_name="+dest+"&route_name1="+route, true);
		xhttp.send();
	}
	function select_month(ap)
	{
		//alert(document.getElementById("check"+ap).checked)
		if(document.getElementById("check"+ap).checked)
		{
			document.getElementById("fee"+ap).innerHTML=fee;
		}
		else
		{
			document.getElementById("fee"+ap).innerHTML="0.00";
		}
	}
</script>

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

</html>