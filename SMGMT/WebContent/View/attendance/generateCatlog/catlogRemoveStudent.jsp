<%@page import="utility.CommonStudent"%>
<%@page import="com.servletStore.attendance.removeCatlog.model.removeStudentPOJO"%>
<%@page import="com.servletStore.attendance.removeCatlog.model.removeStudentImpl"%>
<%@page import="com.servletStore.attendance.removeCatlog.model.removeStudetDAO"%>
<%@page import="java.util.*" %>
<%@page import="utility.CommonStudent"%>
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

    <!-- end of global styles-->
<meta charset="UTF-8">
    <title>Form Elements | Admire</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<!--     <link rel="shortcut icon" href="/SMGMT/config/img/xlogo1.ico.pagespeed.ic.ONh6qx31g4.html"/> -->
<!--     global styles -->
<!--     <link type="text/css" rel="stylesheet" href="/SMGMT/config/css/components.css"/> -->
<!--     <link type="text/css" rel="stylesheet" href="/SMGMT/config/css/custom.css"/> -->
<!--      <link type="text/css" rel="stylesheet" href="/SMGMT/config/css,_components.css+css,_custom.css+vendors,_jquery-validation-engine,_css,_validationEngine.jquery.css+vendors,_datepicker,_css,_bootstrap-datepicker.min.css+vendors,_datepicker,_css"/> -->
<!--     <link type="text/css" rel="stylesheet" href="/SMGMT/config/css,_components.css+css,_custom.css+vendors,_select2,_css,_select2.min.css+css,_pages,_dataTables.bootstrap.css+css,_pages,_tables.css.pagespeed.cc._6lRWz19bZ.css"/> -->
    
<!--     end of page level styles -->
<!--     Plugin styles -->
<!--     <link type="text/css" rel="stylesheet" href="/SMGMT/config/vendors/inputlimiter/css/jquery.inputlimiter.css"/> -->
<!--     <link type="text/css" rel="stylesheet" href="/SMGMT/config/vendors/chosen/css/chosen.css"/> -->
<!--     <link type="text/css" rel="stylesheet" href="/SMGMT/config/vendors/bootstrap-colorpicker/css/bootstrap-colorpicker.min.css"/> -->
<!--     <link type="text/css" rel="stylesheet" href="/SMGMT/config/vendors/jquery-tagsinput/css/jquery.tagsinput.css"/> -->
<!--     <link type="text/css" rel="stylesheet" href="/SMGMT/config/vendors/daterangepicker/css/daterangepicker.css"/> -->
<!--     <link type="text/css" rel="stylesheet" href="/SMGMT/config/vendors/datepicker/css/bootstrap-datepicker.min.css"/> -->
<!--     <link type="text/css" rel="stylesheet" href="/SMGMT/config/vendors/bootstrap-timepicker/css/bootstrap-timepicker.min.css"/> -->
<!--     <link type="text/css" rel="stylesheet" href="/SMGMT/config/vendors/bootstrap-switch/css/bootstrap-switch.min.css"/> -->
<!--     <link type="text/css" rel="stylesheet" href="/SMGMT/config/vendors/jasny-bootstrap/css/jasny-bootstrap.min.css"/> -->
<!--     <link type="text/css" rel="stylesheet" href="/SMGMT/config/vendors/multiselect/css/multi-select.css"/> -->
<!--     End of plugin styles -->
<!--     Page level styles -->
<!--     <link type="text/css" rel="stylesheet" href="/SMGMT/config/css/pages/form_elements.css"/> -->
<!--     <link type="text/css" rel="stylesheet" href="#" id="skin_change"/> -->
    <!-- end of page level styles -->
    
    <jsp:include page="/View/common/commonCss.jsp"></jsp:include>
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
                                   
                                    </div>
                                    <div class="card-block m-t-35">
                                        <form action="/SMGMT/RemoveNameFromCatlog" class="form-horizontal  login_validator" id="form_block_validator">
                                            <div class="form-group row">
                                                <div class="col-lg-4  text-lg-right">
                                                    <label for="required2" class="col-form-label">Standard/Division *</label>
                                                </div>
                                               
                                                <%
                                                CommonStudent cs=new CommonStudent();
                                                List<Object> list=cs.getStandardList("1");
                                                
                                                
                                                %>	
                                               
                                                <div class="col-lg-4">
                                                   	<select class="form-control chzn-select" tabindex="2" id="stddiv" name="stddiv" onchange="getstudent()">
                                                	    <option disabled selected>Choose a standard and division</option>
                                                	     <%
                                                	    Object id="";
                                                		Object std="";
                                                	    Iterator<Object> itr=list.iterator();
                                            			while(itr.hasNext())
                                            			{
                                            				
                                            				id=itr.next();
                                            				//System.out.print("id of standard= "+id);
                                            				std=itr.next()+"("+itr.next()+" - "+itr.next()+")";
                                            			%>
                                            			<option value="<%=id %>"><%=std %></option>
                                            			<%}%>
                                                	    	
                                                	    
                                                	    
                                               </select>
                                                </div>
                                            </div>
                                            
                                            
                                            	<div class="form-group row">
                                            	<div class="col-lg-4  text-lg-right">
                                                    <label for="required2" class="col-form-label">Student Name*</label>
                                                </div>
                                                <div class="col-lg-4">
                                                   	<select class="form-control chzn-select" tabindex="2" id="stud_name" name="stud_name">
                                                	    <option disabled selected value="s_name">Choose a student name</option>
                                                	    
                                                	   <%--   <%
                                                	    	for(int i=0;i<stud_list.size();i++)
                                                	    	{
                                                	    		
                                                	    		studName=stud_list.get(i).getStud_name();
                                                	    		//System.out.println(studName);
                                                	    		/* std=stud_list.get(i).getStd_name();
                                                	    		div=stud_list.get(i).getDiv();
                                                	    		sid=stud_list.get(i).getStud_id();
                                                	    		stdid=stud_list.get(i).getStd_id();
                                                	  			 */
                                                	    		//String info=std+"   "+div;
                                                	    %>
	                                                	    <option value=<%=stud_list.get(i).getStud_id() %>><%=studName%></option>
	                                                	<%
                                                	    	} 
	                                                	%>   --%>
                                                	    
                                                	    
                                               </select>
                                               </select>
                                                </div>
                                            </div>
                                            
                                            <div class="form-group row">
                                                <div class="col-lg-4  text-lg-right">
                                                   <label class="col-form-label">Remove date *</label>
                                                </div>
                                                <div class="col-lg-4">
                                                    <input type="text" class="form-control form_val_popup_dp3" name="remove_date" value="" placeholder="YYYY-MM-DD" required/>
                                                </div>
                                            </div>
                                            
                                              <div class="form-group row">
                                                <div class="col-lg-4  text-lg-right">
                                                    <label for="required2" class="col-form-label">Reason*</label>
                                                </div>
                                                <div class="col-lg-4">
                                                    <input type="text" id="required2" name="reason"  value="" class="form-control" onkeyup="this.value=this.value.toUpperCase();" required >
                                                </div>
                                            </div>
                                            
                                             
                                            <div class="form-actions form-group row">
                                                <div class="col-lg-4 push-lg-4">
                                                    <input type="submit" value="Remove From Catlog" class="btn btn-primary" name="remove_button">
                                                    <input type="reset" value="Cancle" class="btn btn-primary">
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
                                            	 <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Sr No</th>
                                                <th class="sorting_asc wid-20" tabindex="0" rowspan="1" colspan="1">Student Name</th>
                                                <th class="sorting wid-25" tabindex="0" rowspan="1" colspan="1">Standard</th>
                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Division</th>
                                                <th class="sorting wid-20" tabindex="0" rowspan="1" colspan="1">Remove Date</th>
                                                <th class="sorting wid-15" tabindex="0" rowspan="1" colspan="1">reason</th>
                                                <th class="sorting wid-15" tabindex="0" rowspan="1" colspan="1">Action</th>
                                               <%
                                               
                                               removeStudetDAO dao1=new removeStudentImpl();
                                              List<removeStudentPOJO>list1=dao1.getRemoveStudentDetails();
                                               int i=0;
                                               
                                               
                                               %>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <%
                                            while(i<list1.size())
                                            {
                                            %>
                                            	<tr role="row" class="even">
                                            		<td class="sorting_1"><%=i+1%></td>
                                            		<td><%=list1.get(i).getStud_name()%></td>
                                            		<td><%=list1.get(i).getStd_name()%></td>
                                            		<td><%=list1.get(i).getDiv()%></td>
                                            		<td class="center"><%=list1.get(i).getRemove_date()%></td>
                                            		<td class="center"><%=list1.get(i).getReason() %></td>
                                            		<td>
                                            			
                                            		
                                            			<a class="delete hidden-xs hidden-sm" data-toggle="tooltip" data-placement="top" title="Delete" href="/SMGMT/RemoveNameFromCatlog?del_id=<%= list1.get(i).getStud_id()%>" onclick="return confirm('Are you sure you want to delete this Vehicle details?');">
                                            			<i class="fa fa-trash text-danger"></i>
                                            			</a>
                                            			</td>
                                            		</tr>
                                            		
                                            		</tr>
                                            		</tbody>
                                            		<%
                                            		i++;
                                            }
                                            		%>
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
       
        
        
</div>
<script type="text/javascript">
function getstudent()
{
	
	$('#stud_name').children('option:not(:first)').remove();
	$("#stud_name option[value='s_name']").remove();
	var std=document.getElementById("stddiv");
	var s = std.options[std.selectedIndex].value;
	//alert(s)
	var xhttp;
	var option;
	xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
				//alert(this.responseText);		
			var stud=this.responseText.split("~");
			//alert("DATA"+stud);
			var x = document.getElementById("stud_name");							
			option = document.createElement("option");
			option.text = "Choose a student";
			option.value = "s_name";
			option.disabled=true;
			option.selected=true;
			x.add(option);			
			for(var i=0;i<stud.length-1;i++)
			{
				var stud_id=stud[i].split(",");
					option = document.createElement("option");
					option.text =stud_id[1];
					option.value = stud_id[0];
					//alert(option.value)
					x.add(option);
			}
			
			$("#stud_name").trigger('chosen:updated');							
			}
		};
	xhttp.open("POST","/SMGMT/RemoveNameFromCatlog?std="+s, true);
	xhttp.send();	
	
}


</script>

<jsp:include page="/View/common/commonJs.jsp"></jsp:include>
<!-- /#wrap -->
<!-- 	<script type="text/javascript" src="/SMGMT/config/js/components.js"></script> -->
<!-- 	<script type="text/javascript" src="/SMGMT/config/js/custom.js"></script> -->

<!--     <script type="text/javascript" src="/SMGMT/config/vendors/jquery-validation-engine/js/jquery.validationEngine.js"></script> -->
<!--     <script type="text/javascript" src="/SMGMT/config/vendors/jquery-validation-engine/js/jquery.validationEngine-en.js"></script> -->
<!--     <script type="text/javascript" src="/SMGMT/config/vendors/jquery-validation/js/jquery.validate.js"></script> -->
<!--     <script type="text/javascript" src="/SMGMT/config/vendors/datepicker/js/bootstrap-datepicker.min.js"></script> -->
<!--     <script type="text/javascript" src="/SMGMT/config/vendors/datetimepicker/js/DateTimePicker.min.js"></script> -->
<!--     <script type="text/javascript" src="/SMGMT/config/vendors/bootstrapvalidator/js/bootstrapValidator.min.js"></script> -->
<!--     <script type="text/javascript" src="/SMGMT/config/vendors/moment/js/moment.min.js"></script> -->
<!-- 	<script type="text/javascript" src="/SMGMT/config/js/form.js"></script> -->
<!--     <script type="text/javascript" src="/SMGMT/config/js/pages/form_validation.js"></script> -->
<!-- 	<script type="text/javascript" src="js/components.js.pagespeed.jm.vxV3GQYFro.js"></script> -->
<!-- 	<script type="text/javascript" src="js/custom.js.pagespeed.jm.CN8Ow3CJOG.js"></script> -->

<!--     <script type="text/javascript" src="/SMGMT/config/vendors/select2/js/select2.js.pagespeed.jm.Eugd1Y0BmV.js"></script> -->
<!--     <script src="/SMGMT/config/vendors/datatables/js/jquery.dataTables.min.js+dataTables.bootstrap.min.js.pagespeed.jc.HRNT0WoBU9.js"></script> -->
<!--     <script src="/SMGMT/config/vendors/datatables/js/dataTables.responsive.min.js+dataTables.buttons.min.js+buttons.colVis.min.js+buttons.html5.min.js+buttons.bootstrap.min.js+buttons.print.min.js.pagespeed.jc.TdR_"></script> -->
    
<!--     <script>eval(mod_pagespeed_g_o5ieHdNa);</script> -->
<!--     <script>eval(mod_pagespeed_UzcyJ5ysoL);</script> -->
<!--     <script>eval(mod_pagespeed_sB4kJD0xfI);</script> -->
<!--     <script>eval(mod_pagespeed_aYQJk4iDci);</script> -->
<!--     <script>eval(mod_pagespeed_wVkzf2s7YZ);</script> -->
<!--     <script>eval(mod_pagespeed_Ij0pRaH8BP);</script> -->
<!--     <script>eval(mod_pagespeed_wfmKXYO4Nj);</script> -->
<!--     <script>eval(mod_pagespeed_EYzby3B1$L);</script> -->

<!--     <script type="text/javascript" src="/SMGMT/config/js/pages/users.js"></script> -->


<!-- <script type="text/javascript" src="/SMGMT/config/js/form.js"></script> -->
<!-- <script type="text/javascript" src="/SMGMT/config/js/pages/form_elements.js"></script> -->

<!--  <script type="text/javascript" src="/SMGMT/config/vendors/jquery-validation-engine/js/jquery.validationEngine.js"></script> -->
<!--     <script type="text/javascript" src="/SMGMT/config/vendors/jquery-validation-engine/js/jquery.validationEngine-en.js"></script> -->
<!--     <script type="text/javascript" src="/SMGMT/config/vendors/jquery-validation/js/jquery.validate.js"></script> -->
<!--     <script type="text/javascript" src="/SMGMT/config/vendors/datepicker/js/bootstrap-datepicker.min.js"></script> -->
<!--     <script type="text/javascript" src="/SMGMT/config/vendors/datetimepicker/js/DateTimePicker.min.js"></script> -->
<!--     <script type="text/javascript" src="/SMGMT/config/vendors/bootstrapvalidator/js/bootstrapValidator.min.js"></script> -->
<!--     <script type="text/javascript" src="/SMGMT/config/vendors/moment/js/moment.min.js"></script> -->
<!-- 	<script type="text/javascript" src="/SMGMT/config/js/form.js"></script> -->
<!--     <script type="text/javascript" src="/SMGMT/config/js/pages/form_validation.js"></script> -->
<!-- 	<script type="text/javascript" src="js/components.js.pagespeed.jm.vxV3GQYFro.js"></script> -->
<!-- 	<script type="text/javascript" src="js/custom.js.pagespeed.jm.CN8Ow3CJOG.js"></script> -->

</body>

</html>