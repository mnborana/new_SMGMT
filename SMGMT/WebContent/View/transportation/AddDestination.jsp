<%@page import="com.servletStore.transportation.destination.model.DestinationImpl"%>
<%@page import="com.servletStore.transportation.destination.model.DestinationPOJO"%>
<%@page import="com.servletStore.transportation.destination.model.DestinationDAO"%>
<%@page import="com.servletStore.transportation.route.model.RoutePOJO"%>
<%@page import="com.servletStore.transportation.route.model.RouteImpl"%>
<%@page import="com.servletStore.transportation.route.model.RouteDAO"%>
<%@page import="com.servletStore.settings.standard.model.StandardPOJO"%>
<%@page import="java.util.List"%>
<%@page import="com.servletStore.settings.school.model.SchoolPOJO"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.servletStore.settings.standard.model.StandardImpl"%>
<%@page import="com.servletStore.settings.standard.model.StandardDAO"%>
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

<body onload="setFocusToTextBox()">
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
        <img src="" style=" width: 40px;" alt="loading...">
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
                                    <li class="active breadcrumb-item">Destination Details</li>
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
                                        Destination Details
                                    </div>
                                    <div class="card-block m-t-35">
                                    
                                    <%
                                    			RouteDAO rd=new RouteImpl();
                                                List<RoutePOJO> route_list=rd.getRouteDetails();
                                                String id="",route_name="",dest="",fee="",btn_val="Add Destination",r_name="";
 			                                 	if(session.getAttribute("r_name")!=null)
                									{
                									 r_name=(String)session.getAttribute("r_name");
                									}
                								session.removeAttribute("r_name");
                							 
						                %>
                                    
                                        <form action="/SMGMT/Destination?id=<%=id %>" method="post" class="form-horizontal  login_validator" id="form_block_validator">
                                            <div class="form-group row">
                                                <div class="col-lg-4  text-lg-right">
                                                    <label for="required2" class="col-form-label">Select Route* </label>
                                                </div>
                                                
                                                <div class="col-lg-4">
                                                <%if(r_name!=""){%>
                                                    <select class="form-control chzn-select" tabindex="2" id="required2" name="route_name">
                                                	    <option disabled selected>Choose a Vehicle</option>
                                                	    <%
                                                	    	for(int i=0;i<route_list.size();i++)
                                                			{
                                                	    %>	                                                	    	
	                                                	    	<option value="<%=route_list.get(i).getId()%>"><%=route_list.get(i).getRoute_name()%></option>
                                                	    <%
                                                	    	}
                                                	    %>
                                                	</select>
                                                
                                           
                                       <% 
                                       }
                                       else if(r_name=="")
                                       {
                                       %>
                                       
                                                   <select class="form-control chzn-select" tabindex="2" id="required2" name="route_name" autofocus>
                                                	    <option disabled selected>Choose a Vehicle</option>
                                                	    <%
                                                	    	for(int i=0;i<route_list.size();i++)
                                                			{
                                                	    %>
	                                                	    	<option value="<%=route_list.get(i).getId()%>"><%=route_list.get(i).getRoute_name()%></option>
                                                	    <%
                                                	    	}
                                                	    %>
                                                	</select>                                              
                                      <%
                                      } 
                                      %>
                                      </div>
                                         </div> 
                                            <div class="form-group row">
                                                <div class="col-lg-4 text-lg-right">
                                                    <label class="col-form-label">Destination*</label>
                                                </div>
                                                <div class="col-lg-4">
                                                    <input id="dest" name="dest" type="text" value="<%=dest %>" class="form-control focused_input" onkeyup="this.value=this.value.toUpperCase();checkdest('required2',this.value,'warning','dest','btnsubmit');" placeholder="Destination"  autofocus required />
                                                </div>
                                                <div class="col-lg-4">
                                                     <strong id="warning"></strong>
                                                </div>
                                            </div>
                                            
                                            <div class="form-group row">
                                                <div class="col-lg-4 text-lg-right">
                                                    <label  class="col-form-label">Fee*</label>
                                                </div>
                                                <div class="col-lg-4">
                                                    <input id="fee" name="fee" type="text" value="<%=fee %>" class="form-control focused_input" id="fees" placeholder="Fee" required/>
                                                </div>
                                            </div>
                                            
                                          
                                       
                                           
                                            <div class="form-actions form-group row">
                                                <div class="col-lg-4 push-lg-4">
                                                    <input type="submit" id="btnsubmit" value="<%=btn_val %>" class="btn btn-primary" name="add_dest_btn">
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
                                                <th class="sorting_asc wid-2" tabindex="0" rowspan="1" colspan="1">Sr NO</th>
                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Route Name</th>
                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Destination</th>
                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Fee</th> 
                                                <th class="sorting wid-15" tabindex="0" rowspan="1" colspan="1">Status</th>
                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Actions</th>                                               
                                            </tr>
                                            </thead>
                                            <%
													DestinationDAO destDAO=new DestinationImpl();
													//request.setAttribute("display_vehicle_details", vehicleDAO.getVehicleDetails());
                                                    List<DestinationPOJO> ap=destDAO.getDestinationDetails();
										 			int i=0;
										 			
											%>
                                            <tbody>
                                            <%
                                            	while(i<ap.size())
                                            	{
                                            %>
                                            		<tr role="row" class="even">
                                            		<td class="sorting_1"><%=i+1%></td>
                                            		<td><%=ap.get(i).getRoute_name() %></td>
                                            		<td><%=ap.get(i).getDest() %></td>
                                            		<td><%=ap.get(i).getFee() %></td>
                                            		<td class="center">Approved</td>
                                            		<td>
                                            			<a href="#view" data-toggle="modal" data-target="#View" data-placement="top" title="View User" onclick="searchDesig(<%=ap.get(i).getId()%>,'Updateid1','route_name11','des111','fee11')">
                                            			<i class="fa fa-eye text-success"></i>
                                            			</a>&nbsp; &nbsp;
                                            			<a class="edit" data-toggle="modal" data-target="#Update" data-placement="top" title="Edit" href="#Update" onclick="searchDesig(<%=ap.get(i).getId()%>,'Updateid','three11','one11','two11')">
                                            			<i class="fa fa-pencil text-warning"></i>
                                            			</a>&nbsp; &nbsp;
                                            			<a class="delete hidden-xs hidden-sm" data-toggle="tooltip" data-placement="top" title="Delete" href="/SMGMT/Destination?del_id=<%= ap.get(i).getId()%>">
                                            			<i class="fa fa-trash text-danger"></i>
                                            			</a>
                                            			</td>
                                            		</tr>
                                            		
                                            	<%
                                            		i++;
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
            </div>
        </div>
        <!-- /#content -->
    </div>
    <!--wrapper-->
   <!-- /#content -->
  
  
  
  
  
  
  
  
<!-- /#wrap -->
<!-- global scripts-->

<!-- modal for update -->

  <div class="modal fade pullDown" id="Update" role="dialog" aria-labelledby="modalLabelnews">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header bg-warning">
                                <h4 class="modal-title text-white" id="modalLabelnews">Update Destination Details</h4>
                            </div>
                            <div class="modal-body">
                                <form action="/SMGMT/Destination" method="post" class="form-horizontal  login_validator" id="form_block_validator">
                              			<div class="form-group row">
                                                <div class="col-lg-4  text-lg-right">
                                                    <label for="required2" class="col-form-label">Select Route* </label>
                                                </div>
                                                
                                                <div class="col-lg-4">
                                            	<input type="hidden" id="Updateid" name="UpdateId">
                                                	<select class="form-control chzn-select" tabindex="2" id="three11" name="route_name1">
                                                	    <%
                                                	    	for(int j=0;j<route_list.size();j++)
                                                			{
                                                	    		System.out.println(route_list.get(j).getId()+"****"+route_list.get(j).getRoute_name());
                                                	    %>
	                                                	    	<option value="<%=route_list.get(j).getId()%>"><%=route_list.get(j).getRoute_name()%></option>
                                                	    <%
                                                	    	}
                                                	    %>
                                                	</select>
                                          	 		</div>
                                            </div>
                                          
                                            <div class="form-group row">
                                                <div class="col-lg-4 text-lg-right">
                                                    <label class="col-form-label">Destination *</label>
                                                </div>
                                                <div class="col-lg-4">
                                                    <input  id="one11" name="dest1" type="text"  class="form-control focused_input" onkeyup="this.value=this.value.toUpperCase();checkdest('three11',this.value,'warning1','one11','btnsubmit1');"/>
                                                </div>
                                                <div class="col-lg-4">
                                                     <strong id="warning1"></strong>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <div class="col-lg-4 text-lg-right">
                                                    <label  class="col-form-label">Fee*</label>
                                                </div>
                                                <div class="col-lg-4">
                                                    <input id="two11" name="fee1" type="text" class="form-control focused_input" placeholder="Fee"/>
                                                </div>
                                            </div>
                                            
                                          
                                       
                                           
                                           <div class="modal-footer">
                         					   <button class="btn  btn-success" type="submit" name="updateDesig" id="btnsubmit1">Update</button>
                         				       <button class="btn  btn-warning" data-dismiss="modal" onclick="setFlag()">Close</button>
				                           </div>
				                           </form>
                                            </div>                                        
                                    </div>
                                </div>
                            </div> <!-- /.col-lg-12 -->
                          				
                <!-- modal end -->
                    
            
            
            
            
            
            
            <!-- modal for view -->

  <div class="modal fade pullDown" id="View" role="dialog" aria-labelledby="modalLabelnews">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header bg-warning">
                                <h4 class="modal-title text-white" id="modalLabelnews">Destination Details</h4>
                            </div>
                            <div class="modal-body">
                                <form action="/SMGMT/Destination" method="post" class="form-horizontal  login_validator" id="form_block_validator">
                              <div class="form-group row">
                                                <div class="col-lg-4  text-lg-right">
                                                    <label for="required2" class="col-form-label">Select Route </label>
                                                
                                                </div>
                                                
                                                
                                                <div class="col-lg-4">
                                            		 <input type="hidden" id="Updateid1" name="UpdateId">
                                            		<select class="form-control" id="route_name11" name="route_name1" required readonly>                                                	    
                                            	    </select>
                                            	</div>                                                
                                            </div>
                                          
                                            <div class="form-group row">
                                                <div class="col-lg-4 text-lg-right">
                                                    <label class="col-form-label">Destination</label>
                                                </div>
                                                <div class="col-lg-4">
                                                    <input  id="des111" name="dest11" type="text"  class="form-control focused_input" readonly/>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <div class="col-lg-4 text-lg-right">
                                                    <label  class="col-form-label">Fee</label>
                                                </div>
                                                <div class="col-lg-4">
                                                    <input id="fee11" name="fee1" type="text" class="form-control focused_input" readonly/>
                                                </div>
                                            </div>
                                            
                                          
                                       
                                           
                                           <div class="modal-footer">
                         					    <button class="btn  btn-warning" data-dismiss="modal" onclick="setFlag()">OK</button>
                         				      
				                           </div>
				                           </form>
                                            </div>
                                        
                                    </div>
                                </div>
                            </div> <!-- /.col-lg-12 -->
                         				
                <!-- modal end -->
                    

<script type="text/javascript">



	var flag=true;
	var x,option;
	function checkdest(src,ap,wrng,dest,btn)
	{
		var xhttp;
		xhttp = new XMLHttpRequest();
		var e = document.getElementById(src);
		var source = e.options[e.selectedIndex].value;
		//alert(source+"  "+ap);
		xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			
			//alert(this.responseText);
			if(this.responseText&&document.getElementById(src).value.length>=1)
				{
					//alert("Exists");
					//document.getElementById("msg").value="Exists";	btnsubmit
					$("#"+wrng).text("Path already Exists...");	
					document.getElementById(btn).disabled=true;
					document.getElementById(dest).style.borderColor = "red";
				}
			else
				{
					$("#"+wrng).text("");
					document.getElementById(btn).disabled=false;
					document.getElementById(dest).style.borderColor = "skyblue";
				}
			
			 
			}
		};
	xhttp.open("POST","/SMGMT/Destination?dest="+ap+"&route_name="+source, true);	//name1=value1&name2=value2&??
	xhttp.send();
} 


	
	function searchDesig(id,iname,rn,de,f) {
		//document.write("AP");
		//alert(id);
		var xhttp;
		xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				
				var demoStr = this.responseText.split(",");				
				document.getElementById(iname).value = demoStr[0];
				//document.getElementById(rn).value = demoStr[1];
				document.getElementById(de).value = demoStr[2];
				document.getElementById(f).value = demoStr[3];
				//alert(demoStr[0]+" "+demoStr[1]+" "+demoStr[2]+" "+demoStr[3]);
				x = document.getElementById(rn);
				option = document.createElement("option");
				option.text =demoStr[1];
				option.value =demoStr[4];
				if(flag)
				{	
					//alert("IN"+option.text);
					x.add(option,0);
					x.selectedIndex="0";					
					flag=false;	
				}
			}
			};
		xhttp.open("POST","/SMGMT/Destination?id="+id, true);
		xhttp.send();
	}

	function setFlag()
	{
		x.remove(0);		
		flag=true;
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