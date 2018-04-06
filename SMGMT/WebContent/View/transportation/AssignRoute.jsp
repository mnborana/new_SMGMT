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
                                       Route Details
                                    </div>
                                    <div class="card-block m-t-35">
                                    
                                     <%                                    
                                    //String id="",vehicle_no="",name="",temp_add="",perm_add="",dob="",pno="",lno="",btn_val="Add Driver";
                                    //DriverPOJO dp=null;
                                    VehicleDAO vd=new VehicleImpl();
                                   // DriverDAO d=new DriverImpl();
	                                RouteDAO rao=new RouteImpl();
                                   	AssignRouteDAO ad=new AssignRouteImpl();
                                    List<VehiclePOJO> veh_list=vd.getVehicleDetails();
                                    List<RoutePOJO> rao_list=rao.getRouteDetails();
                                    List<AssignRoutePOJO> assi_list=ad.getAssignRouteDetails();
                                    int ap1=0;
                                    System.out.println("-----------");
                                    //ArrayList<String> al1=new ArrayList();
                                  	//ArrayList<String> al2=new ArrayList();
//                                     for(int i=0;i<rao_list.size();i++)
//                                     {
//                                     	al1.add(rao_list.get(i).getRoute_name());
//                                     }
//                                     for(int i=0;i<rao_list.size();i++)
//                                     {
//                                     	al2.add(assi_list.get(i).getRoute_name());
//                                     }
//                                     System.out.println("=====Route Details");
//                                     for(int i=0;i<al1.size();i++)
//                                     {
//                                     	System.out.println(al1.get(i));
//                                     }
//                                     System.out.println("=====Assign Route Details");
//                                     for(int i=0;i<al2.size();i++)
//                                     {
//                                     	System.out.println(al2.get(i));
//                                     }
                                    //ArrayList<String> al1=new ArrayList();
                                    //ArrayList<String> al2=new ArrayList();
                                    ArrayList<Integer> al1_id=new ArrayList();
                                    ArrayList<Integer> al2_id=new ArrayList();
                                    HashMap<Integer,String> hm=new HashMap();  
                                    while(ap1<veh_list.size())
                                    {
                                    	VehiclePOJO vp=veh_list.get(ap1);
                                    	al1_id.add(vp.getId());
                                    	hm.put(vp.getId(), vp.getVeh_no());
                                    	ap1++;
                                    }                                    
                                    ap1=0;
                                    while(ap1<assi_list.size())
                                    {
                                    	AssignRoutePOJO p=assi_list.get(ap1);
                                    	al2_id.add(p.getVeh_id());
                                    	ap1++;
                                    }
                                    boolean flag=true;
                                    ArrayList<String> al3=new ArrayList();
                                    ArrayList<Integer> al3_id=new ArrayList();
                                    for(int i=0;i<al1_id.size();i++)
                                    {     
                                    	flag=true;
                                    	for(int j=0;j<al2_id.size();j++)
                                    	{
                                    		if(al1_id.get(i).equals(al2_id.get(j)))
                                    		{                                    			
                                    			flag=false;
                                    			break;
                                    		}                                    			
                                    	}
                                    	if(flag)
                                    	{
                                    	
	                                    	al3_id.add(al1_id.get(i));
                                    	}
                                    }    
                                    for(int j=0;j<al3_id.size();j++)
                                	{
                                		al3.add(hm.get(al3_id.get(j)));
                                		System.out.println("Id : "+al3_id.get(j)+" Name : "+al3.get(j));
                                	}
                                    %>
                                        <form action="/SMGMT/AssignRoute" class="form-horizontal  login_validator" id="form_block_validator">
                                            
                                            
                                           <div class="form-group row">
                                                <div class="col-lg-4  text-lg-right">
                                                  <label for="required2" class="col-form-label">Vehicle No. *</label>
                                                </div>
                                                
                                                <div class="col-lg-4">
                                                	<select class="form-control chzn-select" tabindex="2" id="required2" name="vehicle_no" required onchange="getRoutes(this.id,'required3')">
                                                	    <option disabled selected>Choose a Vehicle</option>
                                                	  <%
                                                	  		for(int i=0;i<veh_list.size();i++)
                                                			{
                                                	    %>
	                                                	    	<option value="<%=veh_list.get(i).getId()%>"><%=veh_list.get(i).getVeh_no()%></option>
                                                	    <%
                                                	    	}
                                                	    %>
                                                	</select>
                                          	 	</div>
                             <div><span id="vehicle_msg" style="color: red;display: none;">This field is required</span></div>
                                          	 	
                                            </div>
                                           
                                         <div class="form-group row">
                                                <div class="col-lg-4  text-lg-right">
                                                  <label for="required2" class="col-form-label">Route Name *</label>
                                                </div>
                                                
                                                 <div class="col-lg-4">
                                                	
                                                	     <select class="form-control chzn-select-deselect" id="required3" name="route_name" multiple required>
                                                    <optgroup label="choose a Route" id="optgrp">
                                                        
                                                	    </optgroup>
                                                	</select>
                                          	 	</div>
                                          	 	  <div><span id="vehicle_msg1" style="color: red;display: none;">This field is required</span></div>
                                            </div>  
                                           
                                          
                                           
                                           
                                            <div class="form-actions form-group row">
                                                <div class="col-lg-4 push-lg-4">
                                                    <input type="submit" name="assign_route_btn" value="Assign Route" class="btn btn-primary" onclick="validateVehicle();validateRoute()">
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div> <!-- /.col-lg-12 -->
                        </div> <!-- /.row -->
                    </div> <!-- /.inner -->
                </div> <!-- /.outer -->
            
            
            
             <!-- View Modal -->
                
                 <div class="modal fade pullDown" id="view" role="dialog" aria-labelledby="modalLabelnews">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header bg-warning">
                                <h4 class="modal-title text-white" id="modalLabelnews">View Assign Details</h4>
                            </div>
                            <div class="modal-body">
                              <form action="/SMGMT/Driver" method="post" class="form-horizontal  login_validator" id="form_block_validator">
                                             
                                             
                                            <div class="form-group row">
                                                <div class="col-lg-4  text-lg-right">
                                                  <label for="required2" class="col-form-label">Vehicle No. *</label>
                                                </div>
                                                <div class="col-lg-4">
                                                <input type="hidden" id="view_Updateid" name="UpdateId" readonly>
                                                    <input list="vehicle_nos" id="view_required2" name="vehicle_no" value="" class="form-control" required readonly>                                                   
                                                </div>
                                            </div>
                                           
                                         <div class="form-group row">
                                                <div class="col-lg-4  text-lg-right">
                                                  <label for="required2" class="col-form-label">Route Name *</label>
                                                </div>
                                                <div class="col-lg-4">
                                                    <input list="route_names" id="view_required3" name="route_name" value="" class="form-control" required readonly>                                                   
                                                </div>
                                            </div>  
                                          
                                           
                          				  <div class="modal-footer">
                         					   <button class="btn  btn-warning" data-dismiss="modal" onclick="setFlag()">OK</button>                         				       
				                           </div>
				                           
				                             </form>      
                                      
                          			  		</div>
				                        </div>
				                    </div>
				                </div>
                
                <!-- modal end -->
                
            <!-- Update Modal -->
                
                 <div class="modal fade pullDown" id="update" role="dialog" aria-labelledby="modalLabelnews">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header bg-warning">
                                <h4 class="modal-title text-white" id="modalLabelnews">Update Assign Details</h4>
                            </div>
                            <div class="modal-body">
                              <form action="/SMGMT/AssignRoute" method="post" class="form-horizontal  login_validator" id="form_block_validator">
                                             
                                             
                                            <div class="form-group row">
                                                <div class="col-lg-4  text-lg-right">
                                                  <label for="required2" class="col-form-label">Vehicle No. *</label>
                                                </div>
                                                
                                                 <div class="col-lg-4">
	                                                 <input type="hidden" id="update_Updateid" name="UpdateId">
                                                	<select class="form-control chzn-select-deselect" id="update_required2" name="vehicle_no" onchange="getRoutes(this.id,'update_required3')">
                                                	                                                    	  <%
                                                	  		for(int i=0;i<veh_list.size();i++)
                                                			{
                                                	    %>
	                                                	    	<option value="<%=veh_list.get(i).getId()%>"><%=veh_list.get(i).getVeh_no()%></option>
                                                	    <%
                                                	    	}
                                                	    %>
                                                	</select>
                                          	 	</div>
                                                
                                            </div>
                                           
                                         <div class="form-group row">
                                                <div class="col-lg-4  text-lg-right">
                                                  <label for="required2" class="col-form-label">Route Name *</label>
                                                </div>
                                                
                                                <div class="col-lg-4">
                                                	<select class="form-control chzn-select-deselect" tabindex="2" id="update_required3" name="route_name" multiple required>                                                	    
                                                	<optgroup label="choose a Route">
                                                        
                                               		</optgroup>
                                                	</select>
                                          	 	</div>
                                            </div>  
                                          
                                           
                          				  <div class="modal-footer">
                         					   <button class="btn  btn-success" type="submit" name="updateAssign">Submit</button>
                         				       <button class="btn  btn-warning" data-dismiss="modal" onclick="setFlag()">Close</button>
				                           </div>
				                           
				                             </form>      
                                      
                          			  		</div>
				                        </div>
				                    </div>
				                </div>
                
                <!--Update modal end -->
                
            
            
            
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
                                        <table class="table  table-striped table-bordered table-hover dataTable no-footer" id="editable_table" role="grid">
                                            <thead>
                                            <tr role="row">
                                                <th class="sorting_asc wid-20" tabindex="0" rowspan="1" colspan="1">Sr No</th>
                                                <th class="sorting wid-25" tabindex="0" rowspan="1" colspan="1">Vehicle No</th>
                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Route Name</th>
                                                <th class="sorting wid-15" tabindex="0" rowspan="1" colspan="1">Status</th>
                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Actions</th>
                                            </tr>
                                            </thead>
                                             <%
													AssignRouteDAO assignDAO=new AssignRouteImpl();
													//request.setAttribute("display_vehicle_details", vehicleDAO.getVehicleDetails());
                                                    List<AssignRoutePOJO> ap=assignDAO.getAssignRouteDetails();
										 			int i=0;
										 			System.out.print("AAAAAAAAAP : "+ap.size());
										 			
											%>
                                            <tbody>
                                             <%
                                            	while(i<ap.size())
                                            	{
                                            %>
                                            	<tr role="row" class="even">
                                            		<td class="sorting_1"><%=i+1%></td>
                                            		<td><%=ap.get(i).getVeh_no() %></td>
                                            		<td><%=ap.get(i).getRoute_name() %></td>
                                            		<td class="center">Approved</td>
                                            		<td>
                                            			<a data-placement="top" data-toggle="modal" title="View" href="#view" onclick="assignRoute(<%=ap.get(i).getId()%>,'view_Updateid','view_required2','view_required3','view')">
                                            				<i class="fa fa-eye text-success"></i>
                                            			</a>&nbsp; &nbsp;
                                            			<a class="edit" data-placement="top" data-toggle="modal" title="Edit" href="#update" onclick="assignRoute(<%=ap.get(i).getId()%>,'update_Updateid','update_required2','update_required3','update')">
                                            				<i class="fa fa-pencil text-warning"></i>
                                            			</a>&nbsp; &nbsp;
                                            			<a class="delete hidden-xs hidden-sm" data-toggle="tooltip" data-placement="top" title="Delete" href="/SMGMT/AssignRoute?del_id=<%=ap.get(i).getId() %>" onclick="return confirm('Are you sure you want to delete this item?');">
                                            				<i class="fa fa-trash text-danger"></i>
                                            			</a>
                                            		</td>
                                            		<%
                                            			i++;
	                                            	}
                                           		%>
                                            	</tr>
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
       
        
        
<!-- /#wrap -->

	<script type="text/javascript">

	function assignRoute(id,Updateid,required2,required3,status) {
		//document.write("AP");
		//alert(status)
		var flag=true;
		var x,option,x1,option1;
		var xhttp;
		xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) 
			{				
				var demoStr = this.responseText.split(",");	
				document.getElementById(Updateid).value = demoStr[0];	
				if(status=="view")
				{
					document.getElementById(required2).value = demoStr[3];
					document.getElementById(required3).value = demoStr[4];						
				}
				else
				{ 
					x = document.getElementById(required2);
					option = document.createElement("option");
					option.text =demoStr[3];
					option.value =demoStr[1];
					
					x1 = document.getElementById(required3);
					option1 = document.createElement("option");
					option1.text =demoStr[4];
					option1.value =demoStr[2];
					//alert(demoStr[2]+"  "+demoStr[4]);
					if(flag)
					{	
						x.add(option,0);
						x.selectedIndex="0";
						x1.add(option1,0);
						x1.selectedIndex="0";
						flag=false;	
					}
				}
				//alert(demoStr[3]);
				$("#required2").trigger('chosen:updated');
				$("#update_required2").trigger('chosen:updated');
				$("#required3").trigger('chosen:updated');	
			}	
		}
		xhttp.open("POST","/SMGMT/AssignRoute?id="+id, true);
		xhttp.send();
	}	
	function setFlag()
	{
		x.remove(0);		
		flag=true;
	}
	
	function getRoutes(id,id1)
	{
		var veh_id=document.getElementById(id).options[document.getElementById(id).selectedIndex].value;
		//alert(document.getElementById(id).options[document.getElementById(id).selectedIndex].text)
		//alert(document.getElementById(id).options[document.getElementById(id).selectedIndex].value)
		var xhttp;
		var x,option,x1,option1;
		x=document.getElementById(id1);
		xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() 
		{
			if (this.readyState == 4 && this.status == 200) 
			{
				var data=this.responseText.split("~");
				////alert(data);
				x1="<optgroup>";
				for(var i=0;i<data.length-1;i++)
				{
					var route_id_name=data[i].split("=");					
					x1+="<option value="+route_id_name[0]+">"+route_id_name[1]+"</option>";
				}	
				x1+="</optgroup>";
				x.innerHTML=(x1);
				//alert("added")
				$("#"+id1).trigger('chosen:updated');	
			}	
		};
		xhttp.open("POST","/SMGMT/AssignRoute?veh_id="+veh_id, true);
		xhttp.send();
	}
	
	function validateVehicle()
	{
		//vehicle_msg
		//alert("APAPAOUT")
		if(document.getElementById("required2").selectedIndex==0)
		{
			//alert("APAPA")
			document.getElementById("vehicle_msg").style.display="block";
			//document.getElementById("vehicle_msg1").style.display="block";
			//return false;
		}
		
	}
	
	function validateRoute()
	{
		//vehicle_msg
		//alert(document.getElementById("required2").selectedIndex)
		if(document.getElementById("required3").selectedIndex==-1)
		{
			//alert("APAPA")
			document.getElementById("vehicle_msg1").style.display="block";
			//document.getElementById("vehicle_msg1").style.display="block";
			//return false;
		}
	}
</script>


<script type="text/javascript" src="/SMGMT/config/js/components.js"></script>
<script type="text/javascript" src="/SMGMT/config/js/custom.js"></script>


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
<!-- <script type="text/javascript" src="../../cdnjs.cloudflare.com/ajax/libs/jquery.quicksearch/2.3.1/jquery.quicksearch.min.js"></script> -->
<!--end of plugin scripts-->
<script type="text/javascript" src="/SMGMT/config/js/form.js"></script>
<script type="text/javascript" src="/SMGMT/config/js/pages/form_elements.js"></script>

</body>

</html>