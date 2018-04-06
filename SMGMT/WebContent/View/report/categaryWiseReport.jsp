<%@page import="com.servletStore.setup.model.SetupImpl"%>
<%@page import="com.servletStore.setup.model.SetupPOJO"%>
<%@page import="com.servletStore.setup.model.SetupDAO"%>
<%@page import="com.servletStore.student.studentReports.model.studentReportPOJO"%>
<%@page import="java.util.List"%>

<%@page import="com.servletStore.student.studentReports.model.studentReportImpl"%>
<%@page import="com.servletStore.student.studentReports.model.studentReportDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="utility.CommonStudent"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="com.servletStore.transportation.route.model.RouteImpl"%>
<%@page import="com.servletStore.transportation.route.model.RouteDAO"%>
<%@page import="com.servletStore.transportation.route.model.RoutePOJO"%>

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
<%
	String schoolId = "0";
	String academicYear = "0";
	int roll=0;
	
	if (session.getAttribute("userName") == null) {
		response.sendRedirect("/SMGMT");
	} else {
		roll=(Integer)session.getAttribute("rollId");
		schoolId = session.getAttribute("schoolId").toString();
		academicYear = session.getAttribute("year").toString();
		
		//for read/write permission  Read = 1  Write = 2
		SetupDAO dao = new SetupImpl();
		List list=dao.getAccessControlDetails(roll);
		Iterator<SetupPOJO> itr= list.iterator();
		//for showing datatable according to read/write permission
		
		//choose appropriate method as per your leftNavbar form option name
		//e.g : if you are working on Attendance option in left navbar then code will be...
		
		/* SetupPOJO grant = new SetupPOJO();
		int access=grant.getAttendance(); */
		
		//if it returns read(1) then hide FORM and ACTION COLUMN(UPDATE/DELETE) in dataTable
		//for write(2) show your orignal full form
				
	}
%>


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
                        <div class="row">
                            <div class="col-xl-12">
                                <div class="card">
                                    <div class="card-header bg-white">
                                        <i class="fa fa-file-text-o"></i>
                                        Categary wise Report Generation
                                    </div>
                                    <%
                                    				studentReportDAO dao=new studentReportImpl();
                                    					List<studentReportPOJO> cast_category=dao.getCategory();
                                                CommonStudent cs=new CommonStudent();
                                                List<Object> list=cs.getStandardList("1");
                                               
                                             //  System.out.println(schoolId);
                                                %>	
          <form action="/SMGMT/categaryWiseReportGeneration" class="form-horizontal  login_validator" method="post" id="formId">
                                        <div class="card-block m-t-35">
              					  <label class="custom-control custom-radio">
              					 	<input type="hidden" name="ac_year" value=<%=academicYear %>>
              					 	 	<input type="hidden" name="school_id" value=<%=schoolId %>>
                                                        <input name="radio3" type="radio" id="a1" value=1 class="custom-control-input" onchange="showOnlyCategory()" >
                                                        
                                                        <span class="custom-control-indicator"></span>
                                                        <span class="custom-control-description">All</span>
                                                    </label>
                                                    <label class="custom-control custom-radio">
                                                        <input name="radio3" type="radio" id="a2" value=2 class="custom-control-input" onchange="show1()">
                                                        <span class="custom-control-indicator"></span>
                                                        <span class="custom-control-description">Standard division Wise</span>
                                                    </label>
                                                   <label class="custom-control custom-radio">
                                                        <input name="radio3" type="radio" id="a3" value=3 class="custom-control-input" onchange="show2()">
                                                        <span class="custom-control-indicator"></span>
                                                        <span class="custom-control-description">All category Wise</span>
                                                    </label>  
                                                 </div>
                                                     
                                            <div class="card-block m-t-35">                                      
                                            <div class="form-group row" id="s2">
                                            <div class="col-lg-4  text-lg-right">
                                                    <label for="required2" class="col-form-label">Category*</label>
                                                    </div>
                                             
                                                <div class="col-lg-4">
                                                <select class="form-control chzn-select" tabindex="2" name="category" id="category" >                                                	    <option value="vehi"></option>
                                                	<%   for(int i=0;i<cast_category.size();i++)
                                                {
                                              %>
                                                		<option value="<%=cast_category.get(i).getId() %>"><%=cast_category.get(i).getCategory_name() %></option>	
                                                		
                                              <%  }  
                                                	
                                                    
                                                                                             
                                                %>
                                                </select>
                                             </div>
                                             <div><span id="msg" style="color: red;display: none;">This field is required</span></div>
                                             </div>  
                                             
                                                                                                                                            
                                            <div class="card-block m-t-35" id="s1">                                      
                                            <div class="form-group row">
                                            <div class="col-lg-4  text-lg-right">
                                                    <label for="required2" class="col-form-label">Standard/Division*</label>
                                                    </div>
                                             
                                                <div class="col-lg-4">
                                                <select class="form-control chzn-select" tabindex="2" name="stddiv" id="stddiv">                                                	    <option value="vehi"></option>
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
                                              
                                 <div><span id="emsg" style="color: red;display: none;">This field is required</span></div>
                                                
                                             </div>
                                             </div>
                                                       
                                            
                                            </div>
                                                                                   
                                           
                                            <div class="form-actions form-group row">
                                                <div class="col-lg-4 push-lg-4">
                                                    <input type="submit" class="btn btn-primary" value="Generate Report" name="report_generation" id="report_generation" onclick="return ValidateForm()" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                 <input type="reset" class="btn btn-primary" value="Cancle">
                                                </div>
                                            </div>
                                        </form>
                                        <div>     </div><br><br>       
                                         <div>     </div>  
                                           
                                </div>
                            </div> <!-- /.col-lg-12 -->
                        </div> <!-- /.row -->
                    </div> <!-- /.inner -->
                </div> <!-- /.outer -->
        </div>
        
        
        
        
        
        
        
        
        
        
        
        
   <script type="text/javascript">
   
   function showOnlyCategory()
   {
	   $("#s1").hide();
	   $("#s2").show();
	   
   }
   function show1()
   {
	   $("#s1").show();
	   $("#s2").show();
   }
   function show2()
   {
	   $("#s2").hide();
	   $("#s1").show();
   }
   function validate()
	{
		//vehicle_msg
	//alert("APAPAOUT")
		if(document.getElementById("category").selectedIndex==0)
		{
			//alert("APAPA")
			document.getElementById("msg").style.display="block";
			//return false;
		}	
	if(document.getElementById("stddiv").selectedIndex==0)
	{
		alert("APAPA")
		document.getElementById("msg").style.display="block";
		//return false;
	}	
	
	}
   
   
   function ValidateForm(){
	  // alert(" "+form.radio3[0].);
	   ErrorText= "";
	   if ( ( document.getElementById("a1").checked == false ) && ( document.getElementById("a2").checked == false )&&(document.getElementById("a3").checked==false) ) 
	   {
		   alert ( "Please choose your radio option" ); 
		   return false;
	   }
	   else
		   {
		   return true;
		   }
	   }
	   </script>
   </script>
       
        
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