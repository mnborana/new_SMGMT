<%@page import="com.servletStore.report.icardReport.model.IcardGenerateImpl"%>
<%@page import="com.servletStore.report.icardReport.model.IcardGenerateDAO"%>
<%@page import="com.servletStore.fees.feescollection.model.FeesCollectionImpl"%>
<%@page import="com.servletStore.fees.feescollection.model.FeesCollectionDAO"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.servletStore.fees.assignStdWiseFees.model.AssignStdWiseFeesImpl"%>
<%@page import="com.servletStore.fees.assignStdWiseFees.model.AssignStdWiseFeesDao"%>
<%@page import="com.servletStore.setup.model.SetupPOJO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.servletStore.setup.model.SetupImpl"%>
<%@page import="com.servletStore.setup.model.SetupDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>Form Validations | Admire</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	 <jsp:include page="/View/common/commonCss.jsp"></jsp:include>

    <!-- end of global styles-->
   
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

<body onload="myFunction()">
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
                                   Identity Card
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
                                        <a href="#">Fee</a>
                                    </li>
                                    <li class="active breadcrumb-item"> Identity Card</li>
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
                                       Identity Card
                                    </div>
                                    <div class="card-block m-t-35">
                                        <form action="/SMGMT/Icard" method="post" class="form-horizontal" id="form_block_validator">
                                          <div class="form-group row">
                                         			 <%
			                        					DateFormat df = new SimpleDateFormat("DD-MM-YYYY");
			                        					String currentDate = df.format(new Date()).toString();
                                                    	//System.out.println(currentDate);
			                                        	IcardGenerateDAO  icardDAD=new IcardGenerateImpl();
                                                    	//FeesCollectionDAO feesCollectionDAO = new FeesCollectionImpl();
			                                        	request.setAttribute("list", icardDAD.getStadardDivisionDetails(schoolId));
			                                        %>
		                                            
		                                                <div class="col-lg-4  text-lg-right">
		                                                	       <label for="required2" class="col-form-label">Select Standard <span style="color: red;">*</span></label>
		                                                </div> 
														 <div class="col-lg-4 ">
														  <input type="hidden" name="schoolId" value="<%=schoolId %>">
														 <input type="hidden" name="academicYr" value="<%=academicYear %>">
														 	 <select class="form-control chzn-select" id="standard_id" name="standard_Id" onchange="selectStandard()" required>
															<option value="" selected="selected">Select Standard</option>
															<c:forEach items="${list}" var="u">  
																<option value="${u.getClassRoomMasterId()}">${u.getStdName()} ${u.getDivName()} - ${u.getShift()}</option>
															</c:forEach>
														</select>

														</div>
													</div>
													<div class="form-group row">
													
													<div class="col-lg-4  text-lg-right">
		                                                	       <label for="required2" class="col-form-label">Select Name <span style="color: red;">*</span></label>
		                                                </div> 
														 <div class="col-lg-4 ">
														 	 <select class="form-control chzn-select" id="student_id" name="student_Id" onchange="selectStudent()"required>
															<option value="">Select Student</option>
															<!-- <option value="">demo</option> -->
														</select>

														</div>
													</div>
												<!-- 	<div class="form-group row" id="allStudentCheck">
													<div class="col-lg-4  text-lg-right">
		                                                	       <label for="required2" class="col-form-label"></label>
		                                                </div>
													<div class="col-lg-6">
													
																		<label class="custom-control custom-checkbox">
																			<input type="checkbox" class="custom-control-input" name="allStudentCheck"> 
																			<span class="custom-control-indicator"></span>
																			<span class="custom-control-description">All Student</span>
																		</label>
													</div>
													</div> -->
													<div class="form-group row">
													<div class="col-lg-4  text-lg-right">
		                                                	       <label for="required2" class="col-form-label"></label>
		                                                </div>
																<div class="col-lg-4 ">
																	<div class="controls">
																		<input type="radio" value="Type1"
																			style="margin-left: 1%;" name="userType"
																			id="userType" onclick="searchDetails(this.value)"
																			checked="checked"> Type1 <input
																			type="radio" value="Type2" style="margin-left: 1%;"
																			name="userType" id="userType"
																			onclick="searchDetails(this.value)"> Type2
																	</div>
																</div>
															</div>	
										
                                        	
                                        	 <div class="form-actions form-group row">
                                                <div class="col-lg-4 push-lg-4">
                                                    <input type="submit" value="Print" name="icard" class="btn btn-primary">
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div> <!-- /.col-lg-12 -->
                        </div> <!-- /.row -->
                    </div> <!-- /.inner -->
                </div> <!-- /.outer -->
			</div>
           </div> <!-- /#content -->
        </div>
        
       <!--wrapper-->
       
        
</div>
<!-- /#wrap -->

	<jsp:include page="/View/common/commonJs.jsp"></jsp:include>
	<script type="text/javascript">
<%-- 	function myFunction(){
		<%if (session.getAttribute("flag") != null) {%>
		$(window).load(function () {
	        iziToast.show({
	            title: 'Status',
	            message: '<%=session.getAttribute("flag").toString()%> ',
					color : '#00cc99',
					position : 'topCenter'
				});
				return false;
			});
	<%}
			session.removeAttribute("flag");%>

	} --%>
	

	
	
	function selectStandard() {
		
		var standard_id = document.getElementById('standard_id').value;
		//alert("Std "+standard_id);
		
		//alert("Standard Id "+standard_id);
		$("#allStudentCheck").show();
		
		var xhttp =new XMLHttpRequest();
		
		try{
			xhttp.onreadystatechange = function(){
				if(this.readyState == 4 && this.status == 200){
					var str=this.responseText.split(",");
					//var fee=str[0].split("#");
					//alert(str);
					var data="<option disabled selected>Select Student </option>";
					
					for (var i = 0; i < str.length-1;) {
						
						data+='<option value='+str[ i++]+'>'+ str[ i++] +' </option>';
					}
					
					//alert(data);
					
					document.getElementById("student_id").innerHTML=data;
					$("#student_id").trigger('chosen:updated');					
				}
			}
			xhttp.open("POST", "/SMGMT/Icard?standard_id="+standard_id, true);
			xhttp.send();
		}catch(e){
			alert("Unable to Connect Server!");
		}
}

	
	function selectStudent()
	{
		var stud_id=document.getElementById('student_id').value;
		//alert("Student"+stud_id);
		//var allStudentCheck=document.getElementById('allStudentCheck');
		
			$("#allStudentCheck").hide();
			
			
		
		
		
	}
	
	</script>
</body>
</html>
