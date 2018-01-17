
<%@page import="com.servletStore.casteWiseEduFees.model.casteWiseEduFeesPojo"%>
<%@page import="com.servletStore.casteWiseEduFees.model.casteWiseEduFeesIMPL"%>
<%@page import="com.servletStore.casteWiseEduFees.model.casteWiseEduFeesDAO"%>
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
    <link type="text/css" rel="stylesheet" href="/SMGMT/config/css,_components.css+css,_custom.css+vendors,_izitoast,_css,_iziToast.min.css.pagespeed.cc.hUh8XIbhbe.css"/>
    <link type="text/css" rel="stylesheet" href="#" id="skin_change"/>
    
 </head>

<body onload="loadFunction()">
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
	        
	        <%
	        HttpSession session1=request.getSession();
	        session1.setAttribute("schoolId", "1");
	        String  schoolId=session.getAttribute("schoolId").toString();
	        %>
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
                                    Caste-Wise Education Fees
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
                                    <li class="active breadcrumb-item">Caste-Wise Education Fees</li>
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
                                       Caste-Wise Education Fees
                                    </div>
                                    <div class="card-block m-t-35" style="margin-top: 47px;">
                                        <form action="/SMGMT/casteWiseEduFees" method="post" class="form-horizontal  login_validator" id="form_block_validator">
                                            
                                            <div class="form-group row">
	                                            <div class="col-lg-3 text-lg-right">
	                                               <label for="required2" class="col-form-label">Select Type<span style="color:red;">*</span></label>
	                                           </div>
	                                           
	                                           <%
	                                           casteWiseEduFeesDAO dao=new casteWiseEduFeesIMPL();
	                                           List<casteWiseEduFeesPojo> list=dao.getFeesType();
	                                           Iterator<casteWiseEduFeesPojo> itr=list.iterator();
	                                           
	                                           %>
	                                           <div class="col-lg-3">                                          
	                                              <select  class="form-control chzn-select" tabindex="2" name="selectType" required>
	                                              <option disabled selected>Select Type</option>
	                                              <%
	                                              while(itr.hasNext())
	                                              {
	                                            	  
	                                            	casteWiseEduFeesPojo pojo=(casteWiseEduFeesPojo)itr.next();	                                            	
	                                            	int id=((casteWiseEduFeesPojo)pojo).getId();
	                                            	String feesType=((casteWiseEduFeesPojo)pojo).getFeesType();
	                                              %>
	                                                 <option value="<%=id%>"><%=feesType %></option>     
	                                                 <%} %>                                          
	                                              </select>
	                                           </div>
                                          </div> 
                                          
                                          <div class="form-group row">
                                            <div class="col-lg-3 text-lg-right">
                                               <label for="required2" class="col-form-label">Select Standard <span style="color:red;">*</span></label>
                                           </div>
                                           <%
                                           List<casteWiseEduFeesPojo> stdList=dao.getStandard(schoolId);
                                           Iterator<casteWiseEduFeesPojo> itr1=stdList.iterator();
                                           %>
                                           
                                           <div class="col-lg-3">                                          
                                              <select  class="form-control chzn-select" tabindex="2" name="selectStandard" required>
                                              <option disabled selected>Select standard</option>
                                              <%
                                              while(itr1.hasNext())
                                              {
                                            	casteWiseEduFeesPojo stdPojo=(casteWiseEduFeesPojo)itr1.next();
                                              	int id1=((casteWiseEduFeesPojo)stdPojo).getId();
                                              	String getStandard=((casteWiseEduFeesPojo)stdPojo).getStandard();
                                              %>
                                                 <option value="<%=id1%>"><%=getStandard %></option>
                                             <%} %>                                              
                                                 </select>
                                           </div>
                                          </div>  
                                        
                                           
                                            <div class="form-group row">                                     
                                            	<div class="col-lg-3  text-lg-right">
                                                    <label for="" class="col-form-label"> Select Category<span style="color:red;">*</span></label>
                                                </div>    
                                                <%
                                                List<casteWiseEduFeesPojo> categoryList=dao.getCasteCategory();
                                                Iterator<casteWiseEduFeesPojo> itr2=categoryList.iterator();
                                                %>                                    
                                                <div class="col-lg-3">
                                                	<select size="3" multiple class="form-control chzn-select" name="selectCategory">
                                                	<%
                                                	while(itr2.hasNext())
                                                	{
                                                		casteWiseEduFeesPojo pojo=(casteWiseEduFeesPojo)itr2.next();
                                                		int id2=((casteWiseEduFeesPojo)pojo).getId();
                                                		String getCategory=((casteWiseEduFeesPojo)pojo).getCategory();
                                                	%>
                                                	<option value="<%=id2%>"><%=getCategory%></option>
                                                	<% } %>
                                                    </select>
                                           	    </div>                                  	
                                           	</div>
                                           	
	                                          <div class="form-group row">
	                                           	<div class="col-lg-3 text-lg-right">
	                                               <label for="required2" class="col-form-label">Fees<span style="color:red;">*</span></label>
	                                         	  </div>                                         	 
	                                         		  <div class="col-lg-3">                                           				
	                                             		  <input type="text" class="form-control" name="educationFees" onblur="this.value=$.trim(this.value)" pattern="[0-9]" id="required2" required />                                                
	                                         		  </div>                                         		
	                                     	  </div>                                        	
                                       
	                                            <div class="modal-footer">
	                                                <div class="col-lg-4 push-lg-4">
	                                                     <button type="submit" name="submitBTN" class="btn btn-primary" style="margin-left: -980px;">Submit</button>
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
                                Caste-Wise Education Fees Details
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
                                                <th class="sorting wid-25" tabindex="0" rowspan="1" colspan="1">Fees Type</th>
                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Standard</th>
                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Category</th>
                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Fees</th>
                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Action</th>
		                                       </tr>     	
                                           </thead>
                                           <%
                                           int count=1;
                                           List<casteWiseEduFeesPojo> fetchList=dao.fetchDetails();
                                           Iterator<casteWiseEduFeesPojo> itr3=fetchList.iterator();
                                           %>
                                           
                                             <tbody>
                                             <%
                                             while(itr3.hasNext())
                                             {
                                            	 String selCategory="";
                                             	casteWiseEduFeesPojo pojo=(casteWiseEduFeesPojo)itr3.next();
                                             	int id3=((casteWiseEduFeesPojo)pojo).getId();
                                             	String selectcategory=dao.getCategory(id3);
                                             	if (selectcategory != null && selectcategory.length() > 0 && selectcategory.charAt(selectcategory.length() - 1) == ',') {
                                            		selCategory=selectcategory.substring(0, selectcategory.length()-1);
                                                }
                                             	
                                             %>
                                            
                                             <tr>
                                             	<td id="<%=id3%>"><%=count %></td>
                                             	<td><%=((casteWiseEduFeesPojo)pojo).getFeesType() %></td>
                                             	<td><%=((casteWiseEduFeesPojo)pojo).getStandard() %></td>
                                             	<td><%=selCategory%></td>                                             	
                                             	<td><%=((casteWiseEduFeesPojo)pojo).getFees() %></td>                                             	
                                             	<td>
                                        			<a class="edit"  title="update" data-toggle="tooltip" data-placement="top" title="Update" href="#modal-4" onclick="updateInward(<%=id3%>)"><i class="fa fa-pencil text-warning"></i></a>&nbsp; &nbsp;
                                        			<a class="delete hidden-xs hidden-sm" data-toggle="tooltip" data-placement="top" title="Delete" href="/SMGMT/InwardRegister?deleteId="+<%=id3 %>><i class="fa fa-trash text-danger"></i></a>
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

function loadFunction(){
	
	<%
		if(session.getAttribute("flag")!=null){ %>
		$(window).load(function () {
	        iziToast.show({
	            title: 'Success',
	            message: '<%=session.getAttribute("flag").toString()%>',
	            color:'#00cc99',
	            position: 'topCenter'
	        });
	        return false;
	    });
	<%} session.removeAttribute("flag");%>
}
	
	</script>
</body>

</html>