<%@page import="com.servletStore.settings.school.model.SchoolPOJO"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.servletStore.settings.standard.model.StandardPOJO"%>
<%@page import="java.util.List"%>
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
    <link type="text/css" rel="stylesheet" href="/SMGMT/config/css,_components.css+css,_custom.css+vendors,_bootstrap-switch,_css,_bootstrap-switch.min.css+vendors,_switchery,_css,_switchery.min.css+vendors,_radio_css,_css,_radiobox.min.css+vendo"/>
    <link type="text/css" rel="stylesheet" href="/SMGMT/config/css,_components.css+css,_custom.css+vendors,_themify,_css,_themify-icons.css+vendors,_ionicons,_css,_ionicons.min.css+css,_pages,_icon.css.pagespeed.cc.V3vSn3K0aE.css"/>
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
             
             
        <div id="content" class="bg-container">
            <header class="head">
                <div class="main-bar">
                   <div class="row no-gutters">
                       <div class="col-sm-5 col-lg-6 skin_txt">
                           <h4 class="nav_top_align">
                               <i class="fa fa-pencil"></i>
                               Standard And Section Assignment
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
                                   <a href="#">Settings</a>
                               </li>
                               <li class="active breadcrumb-item">Class</li>
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
                                        Create New Class
                                    </div>
                                    <div class="card-block m-t-35">
                                        <form action="/SMGMT/StdSectionAssignment" method="post" class="form-horizontal  login_validator" id="form_block_validator">
                                       <div class="form-group row">
                                           <div class="col-lg-4  text-lg-right">
                                               <label for="required2" class="col-form-label">Select School <span style="color: red;">*</span> </label>
                                           </div>
                                           <div class="col-lg-4">
                                               <select class="form-control chzn-select" name="schoolId" onchange="getSections()" id="schoolId" title="Select School"  required="required">
			                                        <option>Select School</option>
			                                        <%
				                                    	StandardDAO sdao3 = new StandardImpl();
				                                    	List<SchoolPOJO> l3 = sdao3.getSchoolDetails();
				                                   
														int count3=1;
				                                    	Iterator itr3 = l3.iterator();
				                                    	while(itr3.hasNext()){
				                                    		SchoolPOJO stdPojo3 = (SchoolPOJO)itr3.next();
				                                    		int id3 = stdPojo3.getId();
				                                    %>
				                                    	<option value="<%=id3 %>"><%=stdPojo3.getSchoolName() %></option>
														
				                                     <%
				                                     	count3++;
				                                    	}
				                                     %>  
			                                        
			                                    </select>
                                           </div>
                                       </div>
                                       <div class="form-group row">
                                           <div class="col-lg-4 text-lg-right">
                                               <label for="required2" class="col-form-label">Select Section <span style="color: red;">*</span></label>
                                           </div>
                                           <div class="col-lg-4">
                                               <input class="form-control" placeholder="Select Section" list="browsers" onkeyup="this.value=this.value.toUpperCase()" name="sectionName" id="sectionName"autocomplete="off" required />
                                                <datalist id="browsers">
												</datalist>
                                           </div>
                                       </div>
                                       
                                       
                                       <div class=" form-group row" id="stdCheckboxes">
                                      
                                      </div>
                                      
                                      <br>
                                       <div class="form-actions form-group row">
                                           <div class="col-lg-4 push-lg-4">
                                               <input type="submit" value="Generate Class" class="btn btn-primary">
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
                                            <th class="sorting_asc wid-20" tabindex="0" rowspan="1" colspan="1">Sr.No.</th>
                                            <th class="sorting wid-25" tabindex="0" rowspan="1" colspan="1">School Name</th>
                                            <th class="sorting wid-25" tabindex="0" rowspan="1" colspan="1">Section Name</th>
                                            <th class="sorting wid-25" tabindex="0" rowspan="1" colspan="1">Standard Name</th>
                                            <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Actions</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        
                                        <%
                                         StandardDAO sdao = new StandardImpl();
                                     	List<StandardPOJO> l = sdao.getClassDetails();
                                    
 										int count=1;
                                     	Iterator itr = l.iterator();
                                     	while(itr.hasNext()){
                                     		StandardPOJO stdPojo = (StandardPOJO)itr.next();
                                     		int id = stdPojo.getFkClassId();
                                  %>
                                        	<tr role="row" class="even">
                                        		<td><%=count %></td>
                                        		<td><%=stdPojo.getSchoolName() %></td>
                                        		<td><%=stdPojo.getSectionName() %></td>
                                        		<td><%=stdPojo.getStdName() %></td>
                                        		<td>
                                        			<a class="edit" data-toggle="tooltip" data-placement="top" title="Update" href="#" onclick="updateStandard(<%=id%>)"><i class="fa fa-pencil text-warning"></i></a>&nbsp; &nbsp;
                                        			<a class="delete hidden-xs hidden-sm" data-toggle="tooltip" data-placement="top" title="Delete" href="#"><i class="fa fa-trash text-danger"></i></a>
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
            </div>
        </div>
        <!-- /#content -->
    </div>
    <!--wrapper-->
    
    <!-- /#content -->
  

</div>
<!-- /#wrap -->
<!-- global scripts-->

<script type="text/javascript">

function getSections() {
	
	var sid = document.getElementById("schoolId").value;
	var xhttp;
	xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			
			var demoStr = this.responseText.split(",");
			
			var select = document.getElementById('sectionName');

			$("#sectionName").empty();
			
			var text="";
			for (var i=0; i<demoStr.length; i++) {
				
				text += "<option id=" +demoStr[i]+" value=\""+demoStr[++i]+"\"> </option>";
			}
			document.getElementById("browsers").innerHTML = text;			
		}
	};
	
	xhttp.open("POST", "/SMGMT/AddStandard?schoolId="+sid, true);
	xhttp.send();
	
	getStandards();
}

function setSelected() {
	var selectedSection = document.getElementById("sectionName").value;
	//alert(selectedSection);
}


function getStandards() {

	var schoolId = document.getElementById("schoolId").value;
	var xhttp;
	xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			var demoStr = this.responseText.split(",");
			var count=1;
			var s="";
			
		
			for(var j=0; j<demoStr.length-1; j++){
				
				s=s+"<div class='col-lg-2 input_field_sections'> "+
           		"<div class='checkbox'>"+
                "<label class='text-mint'>"+
                    "<input type='checkbox' value='"+demoStr[j]+"' name='stds' id='basic_checkbox_"+(count)+"' >"+
                    "<span class='cr'><i class='cr-icon fa fa-check'></i></span> "+demoStr[++j]+
                "</label>"+
    		"</div>"+
    	"</div>";
				count++;
			}
			
			document.getElementById("stdCheckboxes").innerHTML=s;
			
			
		}
	};
	
	xhttp.open("POST", "/SMGMT/StdSectionAssignment?schoolId="+schoolId, true);
	xhttp.send();
	
}

</script>


<script type="text/javascript" src="/SMGMT/config/js/components.js"></script>
<script type="text/javascript" src="/SMGMT/config/js/custom.js"></script>

<!-- end of global scripts-->
<!-- plugin level scripts -->
	<script type="text/javascript" src="/SMGMT/config/vendors/jquery-validation-engine/js/jquery.validationEngine.js"></script>
    <script type="text/javascript" src="/SMGMT/config/vendors/jquery-validation-engine/js/jquery.validationEngine-en.js"></script>
    <script type="text/javascript" src="/SMGMT/config/vendors/jquery-validation/js/jquery.validate.js"></script>
    <script type="text/javascript" src="/SMGMT/config/vendors/datepicker/js/bootstrap-datepicker.min.js"></script>
    <script type="text/javascript" src="/SMGMT/config/vendors/datetimepicker/js/DateTimePicker.min.js"></script>
    <script type="text/javascript" src="/SMGMT/config/vendors/bootstrapvalidator/js/bootstrapValidator.min.js"></script>
    <script type="text/javascript" src="/SMGMT/config/vendors/moment/js/moment.min.js"></script>
	<script type="text/javascript" src="/SMGMT/config/js/form.js"></script>
    <script type="text/javascript" src="/SMGMT/config/js/pages/form_validation.js"></script>
	<!-- <script type="text/javascript" src="js/components.js.pagespeed.jm.vxV3GQYFro.js"></script>
	<script type="text/javascript" src="js/custom.js.pagespeed.jm.CN8Ow3CJOG.js"></script> -->
	
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
	<script type="text/javascript" src="/SMGMT/config/cdnjs.cloudflare.com/ajax/libs/jquery.quicksearch/2.3.1/jquery.quicksearch.min.js"></script>
	<!--end of plugin scripts-->
	<script type="text/javascript" src="/SMGMT/config/js/form.js"></script>
	<script type="text/javascript" src="/SMGMT/config/js/pages/form_elements.js"></script>
	<script src="/SMGMT/config/vendors/bootstrap-switch,_js,_bootstrap-switch.min.js+switchery,_js,_switchery.min.js.pagespeed.jc.Z7BLPQIxUe.js""></script>
	<script>eval(mod_pagespeed_6q1EIQWfni);</script>
	<script>eval(mod_pagespeed_d3eUViXN4C);</script>

	<script type="text/javascript" src="/SMGMT/config/js/pages/radio_checkbox.js.pagespeed.jm.nna8wpyJlw.js"></script>



</body>

</html>