<%@page import="com.servletStore.transportation.destination.model.DestinationPOJO"%>
<%@page import="com.servletStore.transportation.destination.model.DestinationImpl"%>
<%@page import="com.servletStore.transportation.destination.model.DestinationDAO"%>
<%@page import="com.servletStore.transportation.studentdetails.model.*"%>
<%@page import="com.servletStore.transportation.studentdetails.model.StudentDetailsImpl"%>
<%@page import="com.servletStore.transportation.studentdetails.model.StudentDetailsDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.servletStore.transportation.route.model.RoutePOJO"%>
<%@page import="com.servletStore.transportation.route.model.RouteImpl"%>
<%@page import="com.servletStore.transportation.route.model.RouteDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.servletStore.transportation.vehicle.model.VehicleDAO"%>
<%@page import="com.servletStore.transportation.assignroute.model.AssignRouteDAO"%>
<%@page import="com.servletStore.transportation.assignroute.model.AssignRoutePOJO"%>
<%@page import="com.servletStore.transportation.vehicle.model.VehiclePOJO"%>
<%@page import="com.servletStore.transportation.assignroute.model.AssignRouteImpl"%>
<%@page import="com.servletStore.transportation.vehicle.model.VehicleImpl"%>
<%@page import="java.util.List"%>
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
    <title>Form Elements | Admire</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="/SMGMT/config/img/xlogo1.ico.pagespeed.ic.ONh6qx31g4.html"/>
    <!-- global styles-->
    <link type="text/css" rel="stylesheet" href="/SMGMT/config/css/components.css"/>
    <link type="text/css" rel="stylesheet" href="/SMGMT/config/css/custom.css"/>
    <!-- end of page level styles -->
    <!--Plugin styles-->
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
    <!--End of plugin styles-->
    <!--Page level styles-->
    <link type="text/css" rel="stylesheet" href="/SMGMT/config/css/pages/form_elements.css"/>
    <link type="text/css" rel="stylesheet" href="#" id="skin_change"/>
    <!-- end of page level styles -->
   
</head>
<body onload="getVehicle()">
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
              <%
              		String std="",name="",div="";
              int sid;
              		StudentDetailsDAO stud_dao=new StudentDetailsImpl();
              		List<StudentDetailsPOJO> stud_pojo=stud_dao.getStudentDetails();
              		//System.out.println("GR1:"+stud_pojo.get(0).getGrNo());
              		//System.out.println("GR2:"+stud_pojo.get(1).getGrNo());
              %>
          <form name="MyForm" action="/SMGMT/StudentTransmissionFee" class="form-horizontal  login_validator" method="post" id="form_block_validator">
             
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
	                                    <a class="nav-link" href="#global_search" data-toggle="tab" onclick="show()">Vehicle Details</a>
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
	                                      
                                      %>
   									
                                           <div class="form-group row">
                                                	<div class="col-lg-3  text-lg-right">
                                                	    <label for="required2" class="col-form-label">Search Student By Name *</label>
                                               		 </div>
                                                	 <div class="col-lg-4">                                                	 
                                                	<select class="form-control chzn-select" tabindex="2" onchange="showInfo()" name="studinfoname" id="studinfoid">
                                                	    <option disabled selected>Choose a Student</option>
                                                	    <%
                                                	    	for(int i=0;i<stud_pojo.size();i++)
                                                	    	{
                                                	  			sid=stud_pojo.get(i).getId();
                                                	    		name=stud_pojo.get(i).getName();
                                                	      		//System.out.print(name);
                                                	    		std=stud_pojo.get(i).getStd();
                                                	    		div=stud_pojo.get(i).getDiv();
                                                	    		String info=name+" "+std+" "+div;
                                                	    %>
	                                                	    <option value="<%=info+" "+stud_pojo.get(i).getGrNo()+" "+stud_pojo.get(i).getId() %>"><%=info %></option>
	                                                	<%
                                                	    	} 
	                                                	%>   
                                                	</select>
                                          	 		</div>
                                                
                                                 	<div class="col-lg-4">
                                                		<a href="javascript:showMore()" id="moreless"></a>
                                          	 		</div>
                                            </div>
                                     
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
                                                DestinationDAO dd=new DestinationImpl();
                                                List<DestinationPOJO> dest_list=dd.getDestinationDetails();
                                             
                							 
						                %>
                                      
   									   	<form action="/SMGMT/StudentTransmissionFee" class="form-horizontal  login_validator" method="post" id="form_block_validator">

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
                                                	<select class="form-control chzn-select" id="route_name" name="routename_name" tabindex="2" onchange="getDestinations()">
                                                	    <option disabled selected>Choose a  Route</option>
                                                	    <%
                                                	    	int j=0;
                                                	    	while(j<route_list.size())
                                                	    	{
                                                	    %>
                                                	    <option value="<%=route_list.get(j).getId()%>"><%=route_list.get(j).getRoute_name() %></option>
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
                                                	 <input type="hidden" name="months_name" id="months_id" value=""/>
                                                	 <input type="hidden" name="fee_name" id="fee_id" value=""/>  
                                                	 <input type="hidden" name="studid_name" id="studid_id" value=""/>
                                                	 <input type="hidden" name="disco_name" id="disco_id" value=""/>
                                                	<select class="form-control chzn-select" tabindex="2" name="destination_name" id="destination" onchange="getTableInfo()">
                                                	    <option disabled selected value="msg">Choose a  Destination</option>
                                                	    <%--  <option disabled selected>Choose a  Destination</option>
                                                	    <%
                                                	    	int j1=0;
                                                	    	while(j1<dest_list.size())
                                                	    	{
                                                	    %>
                                                	    <option value="<%=dest_list.get(j1).getId()%>"><%=dest_list.get(j1).getDest()%></option>
                                                	    <%
                                                	    		j1++;
                                                	    	}
                                                	    %>  --%>
                                                	</select>
                                          	 		</div>
                                                 	
                                            </div>
                                         
                                     
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
                                    
                                        <table class="table  table-striped table-bordered table-hover dataTable no-footer" >
                                            <thead>
                                            <tr role="row" class="even">
                                                <th>
	                                            		<div >
	                                                    	<label class="custom-control custom-checkbox">
	                                                    	    <input type="checkbox" id="check_all" class="custom-control-input" onclick="checkAll()" checked>
	                                                    	    <span class="custom-control-indicator"></span>
	                                                    	    <span class="sorting_asc wid-20">Select All</span>
	                                                    	</label>
	                                                	</div>                                                		
                                            		</th>
                                            	<th class="sorting_asc wid-20" tabindex="0">Months</th>
                                                <th class="sorting_asc wid-20" tabindex="0" >Fees</th>                                                                                               
                                            </tr>
                                            </thead>
                                          
                                            <tbody>
                                            <%
                                            	for(int i=0;i<months.length;i++)
                                            	{
                                            %>
                                            	<tr>
		                                      		<td>
	                                            		<div >
	                                                    	<label class="custom-control custom-checkbox">
	                                                    	    <input type="checkbox" class="custom-control-input" id="check<%=i %>" checked onclick="select_month(<%=i %>)">
	                                                    	    <span class="custom-control-indicator"></span>
	                                                    	    <span class="custom-control-description"></span>
	                                                    	</label>
	                                                	</div>                                                		
                                            		</td>
                                            		<td><%=months[i] %></td>
                                            		<td id="fee<%=i%>"><%=fees%></td>
                                            	</tr>                                             		
                                            	<%
                                            		
                                            	}
                                            	%>
                                            	<tr>
                                            	<td style="width:100px">
                                            		Total Fee<input style="width:100px" type="text" id="required_total" name="total" value="" placeholder="Total Fee" class="form-control focused_input" required>                                                     
                                                </td>
                                                <td style="width:100px">
                                            		Discount<input style="width:80px" type="text" id="required_disc" name="disc" value="" onkeypress="return IsNumeric(event,'errmsg');" ondrop="return false;" onpaste="return false;" placeholder="Discount" class="form-control focused_input" onkeyup="calculateTotal(this.value)" required>
                                            		 <span id="errmsg" style="color: red;display: none">Only digits allowed</span>
                                            	                                     	
                                            	                                                     
                                                </td>
                                            	<td style="width:100px">
                                            		Final Fee<input style="width:100px" type="text" id="required_final" name="final" value="" placeholder="Final Fee" class="form-control focused_input" required>                                                     
                                                </td>
                                            	</tr> 
                                        
                                            	
                                            	     
                                            	</tbody>
                                        </table>                                        
                                     <div class="form-actions form-group row">
                                                <div class="col-lg-5 push-lg-5">
                                                    <button class="btn btn-primary" name="assign_route_btn" onclick="setValues();MyFun()">Assign</button>
                                                </div>
                                            </div>
                                        </form>
               	<!-- Transmission Fee Tab End-->
               	
               	
               	
                                    </div>
                                </div>
                                  
                                <!-- END EXAMPLE TABLE PORTLET-->
                            </div>
                        </div>
                    </div>                    
                </div>
                
                 						
                </div>
                
                	
               	
               		<!-- Global Search Tab Start-->
               		
               		<div id="global_search">
            			<div class="outer">
                    <div class="inner bg-container">
                        <div class="row">
                            <div class="col-xl-12">
                                <div class="card">
                                    <div class="card-header bg-white">
                                        <i class="fa fa-file-text-o"></i>
                                        Basic Validation
                                    </div>
                                    <div class="card-block m-t-35">
                                       
                                            <div class="form-group row">
                                            <div class="col-lg-4  text-lg-right">
                                                    <label for="required2" class="col-form-label">Search Field*</label>
                                                     <input type="hidden" id="Updateid" name="UpdateId">
                                                </div>
                                                <%
                                                VehicleDAO dao=new VehicleImpl();
                                                List<VehiclePOJO> list=dao.getVehicleDetails();
                                                 DestinationDAO destdao=new DestinationImpl();
                                                 List<DestinationPOJO> dlist=destdao.getDestinationDetails();
                                                
                                                %>
                                                <div class="col-lg-4">
                                                <select class="form-control chzn-select" tabindex="2" name="search1" id="vehicleList" onchange="dataList()">
                                                	    <option value="vehi"></option>
                                                	    
                                                	</select>
                                                    
                                                </div>
                                                <div class="col-lg-4 text-lg-right">
                                                
                                                <div class="left_align custom-controls-stacked">
                                                 <div class="col-lg-4 text-lg-right">
                                                   
                                                </div>
                                               
                                               
                                                    <label class="custom-control custom-radio">
                                                        <input name="radio3" type="radio" id="vehicleradio" value=1 class="custom-control-input" onclick="getVehicle()"  checked>
                                                        
                                                        <span class="custom-control-indicator"></span>
                                                        <span class="custom-control-description">By Vehicle Number</span>
                                                    </label>
                                                    <label class="custom-control custom-radio">
                                                        <input name="radio3" type="radio" id="destradio" value=2 class="custom-control-input" onclick="getDestination()">
                                                        <span class="custom-control-indicator"></span>
                                                        <span class="custom-control-description">By Destination</span>
                                                    </label>
                                                    
                                                   
                                                </div>
                                            </div>
                                        </div>
                                           
                                            <div class="form-actions form-group row">
                                                <div class="col-lg-4 push-lg-4">
                                                  <!--   <hidden input type="submit" value="Validate" class="btn btn-primary">
 -->                                                </div>
                                            </div>
                                      
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
                                        <table class="table table-bordered" border=2 id="editable_table" role="grid">
                                            <thead>
                                            <tr role="row">
                                                
                                            </tr>
                                            </thead>
                                            
                                           
                                           		 <tbody id="showtable">
                                            		
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
	var ap,check,fee,total_months;
	var month=["1","1","1","1","1","1","1","1","1","1","1","1"]
	$(document).ready(function()
	{     
			document.getElementById("months_id").value=month.toString();		
			fee="0.00"
			total_months=12
			check=true;
			ap=0;
			document.getElementById("global_search").style.display="none";
	        $("#outer2").hide();
	        $("#std-div").hide();
	}); 
	function showInfo()
	{
	    $("#outer2").show();
	    var info=document.getElementById("studinfoid").value;
		var split=info.split(" ");
		//alert(split[0]+"-"+split[1]+"-"+split[2]+" "+split[3]);
		document.getElementById("required1").value=split[3];
		document.getElementById("required2").value=split[1];
		document.getElementById("required3").value=split[2];
		//alert("SID"+split[4])
		document.getElementById("studid_id").value=split[4];
	
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
			document.getElementById("fee"+i).value=fee;
			if(document.getElementById("check_all").checked)
				{
					while(i<len)
					{				
						total_months=total_months+1;
						$("#check"+i).prop("checked", true);
						//document.getElementById("fee"+i).innerHTML=fee;
						i++;
					}	
				}
				else 
				{
						i=0;
						while(i<len)
						{				
							total_months=total_months+1;
							$("#check"+i).prop("checked", false);
							//document.getElementById("fee"+i).innerHTML=fee;
							i++;
						}	
				}	
			
				
	}
	function MyFun()
	{
		alert("data inserted successfully");
		
	}
	
/****************************************/	
	function getVehicle() 
	{
		document.getElementById("vehicleList").innerHTML="";
		var x="";
		if(document.getElementById("vehicleradio").checked)
			{
			x="1";
			}
		else
			{
			x="2";
			}
		//var vehicle=this.responseText.split("~");
		//option = document.createElement("option");
		//option.text = "Choose a Destination";
		//option.value = "val";
		//alert(x);
		var option;
		var xhttp;   		
		var xhttp = new XMLHttpRequest();
		  xhttp.onreadystatechange = function() {
		    if (this.readyState == 4 && this.status == 200)
		    {
		    	var vehicle=this.responseText.split("~");
		    	//alert(vehicle);
		    	var x1 = document.getElementById('vehicleList');							
				//option = document.createElement("option");
		    	option = document.createElement("option");
				option.text = "Choose a vehicle";
				option.value ="vehi";
				option.disabled=true;
				option.selected=true;
				x1.add(option);
				//alert(x1.add(option));
				//alert(option.text);
				for(var i=0;i<vehicle.length-1;i++)
				{
					option = document.createElement("option");
					option.text = vehicle[i];
					option.value = vehicle[i];
					x1.add(option);
					
					//alert($('#vehicleList').val(vehicle[i]));

					//alert("option  "+option.value);
				
				}
				$("#vehicleList").trigger('chosen:updated');
		     // document.getElementById("vehicleList").innerHTML+=option;
		    }
		  };
			//System.out.print("xxxxxxxxx "+x);
		  xhttp.open("POST","/SMGMT/StudentTransmissionFee?ch2="+x, true);
			xhttp.send();	
	}
	/********************************/
	function getDestination()
	{
		var x="";
		if(document.getElementById("vehicleradio").checked)
			{
			x="1";
			}
		else
			{
			x="2";
			}
		//alert(x);
		document.getElementById("vehicleList").innerHTML="";
		var option;
		var xhttp;   		
		var xhttp = new XMLHttpRequest();
		  xhttp.onreadystatechange = function() {
		    if (this.readyState == 4 && this.status == 200)
		    {
		    	var dest=this.responseText.split("~");
		    	//alert(dest);
		    	var x1 = document.getElementById('vehicleList');							
				//option = document.createElement("option");
		    	option = document.createElement("option");
				option.text = "Choose a Destination";
				option.value ="vehi";
				option.disabled=true;
				option.selected=true;
				x1.add(option);
				//alert(x1.add(option));
				//alert(option.text);
				for(var i=0;i<dest.length-1;i++)
				{
					//alert("hiii");
					option = document.createElement("option");
					option.text = dest[i];
					option.value = dest[i];
					x1.add(option);
					
					
				}
				$("#vehicleList").trigger('chosen:updated');
		     
		    }
		  };
			
		  xhttp.open("POST","/SMGMT/StudentTransmissionFee?ch2="+x, true);
			xhttp.send();		
		
	}
	/*****************************************/
	function getDestinations()
	{				
		$('#destination').children('option:not(:first)').remove();
		$("#destination option[value='msg']").remove();
		var route_name=document.getElementById("route_name");
		var route = route_name.options[route_name.selectedIndex].value;
		//alert(route)
		var xhttp;
		var option;
		xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
								
				var dest=this.responseText.split(",");
				var x = document.getElementById("destination");							
				option = document.createElement("option");
				option.text = "Choose a Destination";
				option.value = "msg";
				option.disabled=true;
				option.selected=true;
				//alert(x.add(option));
				for(var i=0;i<dest.length-1;i++)
				{
					var dest_id=dest[i].split("=");
					//alert(dest_id);
					option = document.createElement("option");
					option.text = dest_id[0];
					option.value = dest_id[1];
					//alert(option.value)
					x.add(option);
				}
				
				$("#destination").trigger('chosen:updated');							
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
		var dest = dest_name.options[dest_name.selectedIndex].text;
		var dest_id = dest_name.options[dest_name.selectedIndex].value;
		//alert(route+" "+dest+" "+dest_id)
		
		var xhttp;
		xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
								
				
				fee=this.responseText;
				document.getElementById("required_total").value=total_months*parseFloat(fee);
				document.getElementById("required_final").value=parseFloat(document.getElementById("required_total").value);
				//alert(fee+" ******** "+total_months)
				for(var i=0;i<12;i++)
				{
					if(fee!="")
						document.getElementById("fee"+i).innerHTML=fee;
					else
						document.getElementById("fee"+i).innerHTML="0.00";
				}				
				}
			$("#destination").trigger('chosen:updated');	
			};
		xhttp.open("POST","/SMGMT/StudentTransmissionFee?dest_name="+dest+"&route_name1="+route, true);
		xhttp.send();
	}
	function calculateTotal(ap)
	{
		if(ap=="")
		{
			document.getElementById("required_final").value=parseFloat(document.getElementById("required_total").value);			
		}
		else
		{		
			document.getElementById("required_final").value=parseFloat(document.getElementById("required_total").value)-parseFloat(ap);
		}	
	}
	function select_month(ap)
	{
		
		if(document.getElementById("check"+ap).checked)
		{
			month[ap]="1";
			total_months=total_months+1;
			document.getElementById("fee"+ap).innerHTML=fee;
		}
		else
		{
			month[ap]="0";
			total_months=total_months-1;
			document.getElementById("fee"+ap).innerHTML="0.00";						
		}
		document.getElementById("months_id").value=month.toString();
		document.getElementById("required_total").value=total_months*fee;
		document.getElementById("required_final").value=parseFloat(document.getElementById("required_total").value);
		//alert(document.getElementById("months_id").value)
	}
	function setValues()
	{
		document.getElementById("fee_id").value=document.getElementById("required_final").value;
		document.getElementById("months_id").value=month.toString();
		document.getElementById("disco_id").value=document.getElementById("required_disc").value;	
		var dest_name=document.getElementById("destination");
		var dest = dest_name.options[dest_name.selectedIndex].text;
		var dest_id = dest_name.options[dest_name.selectedIndex].value;
		var info=document.getElementById("studinfoid").value;
		var split=info.split(" ");
		document.getElementById("studid_id").value=split[4];
	
		document.getElementById("disco_id").value=dis;
	
	}
	
	function dataList() {
		var x="";
		if(document.getElementById("vehicleradio").checked)
			{
			x="1";
			}
		else
			{
			x="2";
			}
		//alert(x);
		/* /* var ch1=$('input[name=radio3]:checked', '#myForm').val(); 
		alert(ch1); */
		if(x==1){
			searchByVehicle();
		}else{
			searchByDest();
		}	 
	}
	
	
	
    function searchByVehicle() {
		
		 // var ch1=$('input[name=radio3]:checked', '#myForm').val(); 
		  //alert(ch1);
		  
		  var x="";
			if(document.getElementById("vehicleradio").checked)
				{
				x="1";
				}
			else
				{
				x="2";
				}
			//alert(x);
		var  vehicleNo=document.getElementById("vehicleList").value;
	
		var xhttp;   		
		xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
			
				var demoStr1 = this.responseText;
				var demoStr = demoStr1.split("~");
				//alert(demoStr1);
				var i=0;
				
				var row="<table border=2>";
				row+="<tr><th>Sr.No.</th><th>Route name</th><th>Destination</th><th>fee</th></tr>";
				var tr="";
				var count=0;
				for(;demoStr[i];)
				{	
					count++;
					var cnt = demoStr[i];
					i++;
					row+="<tr><td rowspan='"+cnt+"'>"+count+"</td>";
					row+="</td><td rowspan='"+cnt+"'>"+demoStr[i]+"</td>";
					i++;
				//	alert(cnt);
					while(cnt>0){
						row+="</td><td>"+demoStr[i]+"</td>";
						i++;
						row+="</td><td>"+demoStr[i]+"</td></tr>";
						i++;
						cnt--;
					}
					
				}
				
				row+="</table>"
				document.getElementById("showtable").innerHTML=row;
				
				}
			};
		xhttp.open("POST","/SMGMT/Search?vehicleNo="+vehicleNo+"&ch1="+x, true);
		xhttp.send();
	}


	
    
    function searchByDest() {
   		
   		var  dest=document.getElementById("vehicleList").value;
   		// var ch1=$('input[name=radio3]:checked', '#myForm').val(); 
   		var x="";
			if(document.getElementById("vehicleradio").checked)
				{
				x="1";
				}
			else
				{
				x="2";
				}
   		 var xhttp;   		
   		xhttp = new XMLHttpRequest();
   		xhttp.onreadystatechange = function() {
   			if (this.readyState == 4 && this.status == 200) {
   			
   				var demoStr = this.responseText.split(",");	
   				//var cnt=1;
   				var i=0;
   				var row="<table border=1>";
   				row+="<tr><th>Vehicle No</th><th>Route Name</th></tr>";
   				
   				for(;demoStr[i];)
   					{	
   						row+="<tr><td>"+demoStr[i];
   						i++;
   						row+="</td><td>"+demoStr[i]+"</td></tr>";
   						i++;
						//cnt++;

   					}
   				row+="</table>"
   				document.getElementById("showtable").innerHTML=row;
   				
   				 
   				}
   			};
   		xhttp.open("POST","/SMGMT/Search?dest="+dest+"&ch1="+x, true);
   		xhttp.send();
   	}

    
    
    var specialKeys = new Array();
	specialKeys.push(8); //Backspace
	function IsNumeric(e,msg) {
	    var keyCode = e.which ? e.which : e.keyCode
	    var ret = ((keyCode >= 48 && keyCode <= 57) || specialKeys.indexOf(keyCode) != -1);
	    document.getElementById(msg).style.display = ret ? "none" : "inline";
	    return ret;
	}


	function IsCharacter(e,msg)
	{ 
		 var keyCode = e.which ? e.which : e.keyCode
				    var ret = ((keyCode > 64 && keyCode < 91) ||(keyCode > 96 && keyCode < 123)||(keyCode==8)|| specialKeys.indexOf(keyCode) != -1);
				    document.getElementById(msg).style.display = ret ? "none" : "inline";
				   // alert(ret)
				    return ret;
	}

    
    
	
</script>
<script type="text/javascript" src="/SMGMT/config/js/components.js"></script>
<script type="text/javascript" src="/SMGMT/config/js/custom.js"></script>

<!-- end of global scripts-->
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




</body>

</html>