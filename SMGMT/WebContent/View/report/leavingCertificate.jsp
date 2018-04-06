<%@page import="com.servletStore.setup.model.SetupPOJO"%>
<%@page import="com.servletStore.setup.model.SetupImpl"%>
<%@page import="com.servletStore.setup.model.SetupDAO"%>
<%@page import="utility.CommonStudent"%>
<%@page import="com.servletStore.student.studentReports.model.studentReportPOJO"%>
<%@page import="com.servletStore.student.studentReports.model.studentReportImpl"%>
<%@page import="com.servletStore.student.studentReports.model.studentReportDAO"%>
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
<style>
  .red {
      color: red;
      font-size: 2em;
  }
</style>
<meta charset="UTF-8">
<title>Form Elements | Admire</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<jsp:include page="/View/common/commonCss.jsp"></jsp:include>
<style type="text/css">
#academicYearId {
	opacity: 0;
	margin-bottom: -35px;
	display: block !important;
}
#stddiv{
	opacity: 0;
	margin-bottom: -35px;
	display: block !important;
}
#sname {
	opacity: 0;
	margin-bottom: -35px;
	display: block !important;
}
#casteId {
	opacity: 0;
	margin-bottom: -35px;
	display: block !important;
}
</style>
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
<body onload="loadFunction()">
	
	<div class="preloader"
		style="position: fixed; width: 100%; height: 100%; top: 0; left: 0; z-index: 100000; backface-visibility: hidden; background: #ffffff;">
		<div class="preloader_img"
			style="width: 200px; height: 200px; position: absolute; left: 48%; top: 48%; background-position: center; z-index: 999999">
			<img src="" style="width: 40px;" alt="loading...">
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
								<i class="fa fa-pencil"></i> Form Validations
							</h4>
						</div>
						<div class="col-sm-7 col-lg-6">
							<ol class="breadcrumb float-right nav_breadcrumb_top_align">
								<li class="breadcrumb-item"><a href="index1.html"> <i
										class="fa fa-home" data-pack="default" data-tags=""></i>
										Dashboard
								</a></li>
								<li class="breadcrumb-item"><a href="#">Forms</a></li>
								<li class="active breadcrumb-item">Form Validations</li>
							</ol>
						</div>
					</div>
				</div>
				</header>

				<!-- start your code from here  -->
				<%
												studentReportDAO dao=new studentReportImpl();
												List<Object> ac_year=dao.getAcademic_year();
												
												List<Integer> l1=dao.getLastOutWordNo();
												Iterator<Integer> itr5=l1.iterator();
												int outword_no=0,outword_id=0;
												while(itr5.hasNext())
												{
													outword_no=itr5.next();
													outword_id=itr5.next();
												}
												//System.out.println("##### "+outword_no);
												  CommonStudent cs=new CommonStudent();
	                                                List<Object> list=cs.getStandardList("1");
												%>
				<!-- Official Details -->
				<form action="/SMGMT/LCReportGeneration" method="post" class="form-horizontal"
					id="form_block_validator">
					<div class="outer">
						<div class="inner bg-container forms">
							<div class="row">
								<div class="col-xl-12">
									<div class="card">
										<div class="card-header bg-white">
											<h2>Leaving Certificate Report</h2>
										</div>
										<div class="card-block">
											<div class="row">
												<div class="card-block seclect_form">
												
													<div class="row">
													
													
													<div class="form-group col-lg-3 input_field_sections">
                                                    <label class="custom-control custom-checkbox">
                                                        <input type="checkbox" class="custom-control-input" id="outwordCheck" onclick="showText()" value="1">
                                                        <span class="custom-control-indicator"></span>
                                                        <span class="custom-control-description">if Outword No is required </span>
                                                    </label>
                                                   
															
														 <input class="form-control" id="outword_no" type="text" name="outword_no" placeholder="Outword No" value="<%=outword_no+1%>" readonly="readonly">
												
														
                                                    
                                                </div>
                                         
														
														 
														 <div class="form-group col-lg-4 input_field_sections">
															<label for="admission_date" class="col-form-label">LC
																Date *</label>
															<div class="input-group input-append date" id="dp1"
																data-date-format="dd-mm-yyyy">
																<input type="text" class="form-control form_val_popup"
																	name="admissionDate" id="admissionDate"
																	placeholder="dd-mm-yyyy" required> <span
																	class="input-group-addon add-on"> <i
																	class="fa fa-calendar"></i>
																</span>
															</div>
															
														</div>
														 <div class="col-lg-4 input_field_sections">
														 
														 <input type="hidden" name="academic_year" id="academic_year" value="<%=academicYear%>">
                                            			 <input type="hidden" name="school_id" id="school_id" value=<%=schoolId %>>
                                            			 
                                            			<label class="col-form-label">General No</label> 
				                                            <form>
				                                                <div class="input-group">
				                                                    <input type="search" class="form-control">
				                                                    <span class="input-group-btn">
				                                                <button class="btn btn-primary" type="button">
				                                                    <span class="glyphicon glyphicon-search" aria-hidden="true">
				                                                </span> Search!</button>
				                                                </span>
				                                                </div>
				                                            </form>
				                                        </div>
														 
														 </div>
														
														
													
													
													</div>
															
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								
								<!--End of common  -->
								<!--Start 2nd Div -->
									<div class="outer">
						<div class="inner bg-container forms">
							<div class="row">
								<div class="col-xl-12">
									<div class="card">
										
										<div class="card-block">
											<div class="row">
												<div class="card-block seclect_form">
												
														<div class="row">
														<div class="form-group col-lg-4 input_field_sections">
															<label  class="col-form-label">Year *</label> 
															<select	class="form-control chzn-select"	name="academicYearId" id="academicYearId" required>
																<option disabled selected>Select Year</option>
																<%
																Iterator<Object> itr=ac_year.iterator();
																Object year="",id="";
																while(itr.hasNext())
																{
																	id=itr.next();
																	year=itr.next();
																%>
																<option value="<%=year %>"><%=year%></option>
																<%} %>
															</select>
														</div>
														
														<div class="form-group col-lg-4 input_field_sections">
															<label  class="col-form-label">Standard/Division *</label> 
															<select	class="form-control chzn-select"	name="stddiv" id="stddiv" onchange=" getstudentName()" required>
																<option disabled selected>Select std and div</option>
																<%
                                                	    Object id1="";
                                                		Object std="";
                                                	    Iterator<Object> itr1=list.iterator();
                                            			while(itr1.hasNext())
                                            			{
                                            				
                                            				id1=itr1.next();
                                            				//System.out.print("id of standard= "+id);
                                            				std=itr1.next()+"("+itr1.next()+" - "+itr1.next()+")";
                                            			%>
                                            			<option value="<%=id1 %>"><%=std %></option>
                                            			<%}%>
                                                	    	   
															</select>
														</div>
														<div class="form-group col-lg-4 input_field_sections">
															<label for="academicYearId" class="col-form-label">Student Name</label> 
															<select	class="form-control chzn-select"  name="sname" id="sname" onchange="getStudInfo();"  required>
																<option value="s_name" disabled selected>Select student Name</option>
															</select>
														</div>
													</div>
													
													<div class="row">
														<div class="form-group col-lg-4 input_field_sections">
															<label for="academicYearId" class="col-form-label">Gr.No</label> 
															<input class="form-control" id="gr_no" type="text" name="gr_no" readonly="readonly">
														</div>
														
														
														
														<div class="form-group col-lg-4 input_field_sections">
															<label for="academicYearId" class="col-form-label">Mother Name</label> 
															<input class="form-control" id="mname" type="text" name="mname" readonly="readonly">
														</div>
													
														<div class="form-group col-lg-4 input_field_sections">
															<label for="academicYearId" class="col-form-label">Caste</label> 
															<input class="form-control" id="caste" type="text" name="caste" readonly="readonly">
														</div>
													</div>
														
														
														<div class="row">
														
														
														<div class="form-group col-lg-4 input_field_sections">
															<label for="academicYearId" class="col-form-label">Admission Date</label> 
															<input class="form-control" id="adate" type="text" name="adate" readonly="readonly">
														</div>
													
														<div class="form-group col-lg-4 input_field_sections">
															<label for="academicYearId" class="col-form-label">Birth Date</label> 
															<input class="form-control" id="bdate" type="text" name="bdate" readonly="readonly">
														</div>
														<div class="form-group col-lg-4 input_field_sections">
															<label for="academicYearId" class="col-form-label">Birth Place</label> 
															<input class="form-control" id="bplace" type="text" name="bplace" readonly="readonly">
														</div>
													</div>		
													
													<div class="row">
														
														
														<div class="form-group col-lg-4 input_field_sections">
															<label for="academicYearId" class="col-form-label">Nationality</label> 
															<input class="form-control" id="nationality" type="text" name="nationality" readonly="readonly">
														</div>
													
														<div class="form-group col-lg-4 input_field_sections">
															<label for="academicYearId" class="col-form-label">Previous School Name</label> 
															<input class="form-control" id="school_name" type="text" name="school_name" readonly="readonly">
														</div>
														<div class="form-group col-lg-4 input_field_sections">
															<label for="academicYearId" class="col-form-label">Mother Tongue</label> 
															<input class="form-control" id="language" type="text" name="language" readonly="readonly">
														</div>
													</div>		
															<div class="row">
															<div class="form-group col-lg-4 input_field_sections">
															<label class="col-form-label">Leaving std</label> 
															<input class="form-control" id="leaving_std" type="text" name="leaving_std" readonly="readonly">
															</div>
															
															 
														 
														 <div class="form-group col-lg-4 input_field_sections">
															<label for="admission_date" class="col-form-label">Leaving
																Date *</label>
															<div class="input-group input-append date" id="dp2"
																data-date-format="dd-mm-yyyy">
																<input type="text" class="form-control form_val_popup"
																	name="lDate" id="lDate"
																	placeholder="dd-mm-yyyy" required> <span
																	class="input-group-addon add-on"> <i
																	class="fa fa-calendar"></i>
																</span>
															</div>
														</div>
															
														<div class="form-group col-lg-4 input_field_sections">
															<label  class="col-form-label">Study Status*</label> 
															 <input list="study_status" name="study_status" class="form-control form_val_popup">
														  <datalist id="study_status">
														  <option value="Ok">
														  <option value="Good">
														    <option value="Bad"></option>
														    <option value="Very Good">
														    <option value="Reliable">
														    <option value="UnSatisfied">
														    <option value="Better">
														    <option value="Fair">
														    <option value="Exelent">
														   
														  </datalist>
														</div>
															
															</div>
															<div class="row">
															
															<div class="form-group col-lg-2 input_field_sections">
															<label class="col-form-label">Start  From(month)</label> 
															<input class="form-control" id="sdate" type="text" name="sdate"  readonly="readonly">
			
															</div>
															<div class="form-group col-lg-2 input_field_sections">
															<label class="col-form-label">Start From(Year)</label> 
															<input class="form-control" id="syear" type="text" name="syear" readonly="readonly">
			
															</div>
												
												<div class="form-group col-lg-4 input_field_sections">
															<label  class="col-form-label">Behaviour</label> 
															<input list="Behaviour" name="Behaviour" class="form-control form_val_popup">
														  <datalist id="Behaviour">
														  <option value="Ok">
														  <option value="Good">
														    <option value="Bad">
														    <option value="Very Good">
														    <option value="Reliable">
														    <option value="UnSatisfied">
														    <option value="Better">
														    <option value="Fair">
														    <option value="Exelent">
														   
														  </datalist>
															</div>
														
															<div class="form-group col-lg-4 input_field_sections">
															<label  class="col-form-label">Leaving Reason</label> 
															<input list="l_reason" name="l_reason" class="form-control form_val_popup">
														  <datalist id="l_reason">
														  <option value="SSC Exam Pass">
														   <option value="Parent Transfer">
														 
														   
														   
														  </datalist>
														</div>
													</div>
																
                                           			   <div class="row">
														<div class="form-group col-lg-4 input_field_sections">
															<label  class="col-form-label">Remark</label> 
															<input list="remark" name="remark" class="form-control form_val_popup">
														  <datalist id="remark">
														  <option value="SSC Exam Pass">
														   <option value="Parent Transfer">
														  </datalist>
														</div>
														
														<div class="col-12 col-md-6 m-t-35">
                                                <h5 class="checkbox_header_bottom">Lc Format</h5>
                                                <div class="left_align custom-controls-stacked">
                                                    <label class="custom-control custom-radio">
                                                        <input name="lcFormat" type="radio" class="custom-control-input" value="lcWithname">
                                                        <span class="custom-control-indicator"></span>
                                                        <span class="custom-control-description">LC with School Name</span>
                                                    </label>
                                                    <label class="custom-control custom-radio">
                                                        <input name="lcFormat" type="radio" class="custom-control-input" value="lcWithoutname">
                                                        <span class="custom-control-indicator"></span>
                                                        <span class="custom-control-description">Lc without School Name</span>
                                                    </label>
                                                  
                                                </div>
                                            </div>
														
  																												
														</div>
															  <div class="form-actions form-group row">
                                                <div class="col-lg-4 push-lg-4"><br><br>
                                                    <input type="submit" class="btn btn-primary" value="OK" name="report_generation" id="report_generation" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                 <input type="reset" class="btn btn-primary" value="Cancle">
                                                 <input type="hidden" id="hidden1" name="hidden1" value="false">
                                                </div>
                                            </div>
														</div>
														
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!--End of common  -->
								</div>
							</form>
							</div>
						
						</div>
					</div>
				
	<script type="text/javascript">



</script>


	<jsp:include page="/View/common/commonJs.jsp"></jsp:include>


	<script type="text/javascript">
	//createEditableSelect(document.forms.myText);
	
//====================================== loadFunction  =====================================
function loadFunction(){
	$("#outword_no").hide();
	
	admissionDate();

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

//======================================Admission Date  =====================================
function admissionDate(x) {
		var now = new Date();
		//alert(now);
		var today= now.getDate();
		//alert(today);
		var todayMonth=(now.getMonth());
		//alert(todayMonth);
	    var todayYear=(now.getFullYear());
	    
	    
	    document.getElementById("admissionDate").value=today+"-"+(todayMonth+1)+"-"+todayYear;
	    document.getElementById("lDate").value=today+"-"+(todayMonth+1)+"-"+todayYear;
	}

function getstudentName()
{
	
	
	$('#sname').children('option:not(:first)').remove();
	$("#sname option[value='s_name']").remove();
	var std=document.getElementById("stddiv");
	var academic_year=document.getElementById("academicYearId").value;
	//alert(academic_year);
	var s = std.options[std.selectedIndex].value;
	//var standard_name=std.options[std.selectedIndex].text;
	
	var xhttp;
	var option;
	xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
				//alert(this.responseText);		
			var stud=this.responseText.split("~");
			//alert("DATA"+stud);
			var x = document.getElementById("sname");							
			option = document.createElement("option");
			option.text = "Choose a student";
			option.value = "s_name";
			option.disabled=true;
			option.selected=true;
			x.add(option);							
			var color1="";	
			for(var i=0;i<stud.length-1;i++)
			{
				var stud_id=stud[i].split(",");
					option = document.createElement("option");
					
					var lc_status=stud_id[2];
					if(lc_status==0)
						{
						color1="black";
						//alert("in 0");
						//var val=stud_id[1];
						//stud_id[1].style.color="blue";;
						
						}else
							if(lc_status==1)
							{
								//alert("in 1");
								color1="green";
							//stud_id[1].fontcolor("gray");
							
							}else
								
								if(lc_status==2)
								{
									color1="red";
									//	alert("in 2");

								//stud_id[1].fontcolor("red");
								
								}
					//alert(option.value)
					option.text =stud_id[1];
					option.value = stud_id[0];
					 option.style.color = color1;
					x.add(option);
			}
			
			$("#sname").trigger('chosen:updated');							
			}
		var std1=document.getElementById("stddiv");
		//var academic_year=document.getElementById("academicYearId").value;
		//alert(academic_year);
		var std_name = std1.options[std1.selectedIndex].text;
		//alert(s)
		document.getElementById("leaving_std").value=std_name;
		};
	xhttp.open("POST","/SMGMT/LCReportGeneration?std="+s+"&academic_year="+academic_year, true);
	xhttp.send();	
	
}
function getStudInfo()
{

	
var stud_id=document.getElementById("sname").value;
var xhttp;
var option;
xhttp = new XMLHttpRequest();
xhttp.onreadystatechange = function() {
	if (this.readyState == 4 && this.status == 200)
	{
		//var data1=data[i].split(",");
		var gr_no,mother_name,caste_name,ad_date,birth_place,dob,nationality,previous_school_name,mothertongue;
		var data=this.responseText.split("~");
		var stud_name;
		for(var i=0;i<data.length-1;i++)
			{
			data1=data[i].split(",");
			 gr_no=data1[0];
			
			 mother_name=data1[1];
			 caste_name=data1[2];
			 ad_date=data1[3];
			 birth_place=data1[4];
			 dob=data1[5];
			 nationality=data1[6];
			 previous_school_name=data1[7];
			mothertongue=data1[8];
			stud_name=data1[9];
			
			}
		//alert(gr_no);
		document.getElementById("mname").value=mother_name;
		document.getElementById("caste").value=caste_name;
		document.getElementById("adate").value=ad_date;
		document.getElementById("bdate").value=dob;
		document.getElementById("bplace").value=birth_place;
		document.getElementById("nationality").value=nationality;
		document.getElementById("school_name").value=previous_school_name;
		document.getElementById("language").value=mothertongue;


		document.getElementById("gr_no").value=gr_no;
	var date1=ad_date.split("-");
	var Month_name="";
	var yy=date1[0];
	var mm=date1[1];
	var dd=date1[2];
	document.getElementById("adate").value=dd+"-"+mm+"-"+yy;	
	if(mm==1)
	{
		Month_name="January";
	}else if(mm==2)
	{
		Month_name="February";
	}
	else if(mm==3)
	{
		Month_name="March";
	}else if(mm==4)
	{
		Month_name="April";
	}else if(mm==5)
	{
		Month_name="May";
	}else if(mm==6)
	{
		Month_name="June";
	}else if(mm==7)
	{
		Month_name="Jully";
	}else if(mm==8)
	{
		Month_name="August";
	}else if(mm==9)
	{
		Month_name="September";
	}else if(mm==10)
	{
		Month_name="October";
	}else if(mm==11)
	{
		Month_name="November";
	}else if(mm==12)
	{
		Month_name="December";
	}
	document.getElementById("sdate").value=Month_name;
	document.getElementById("syear").value=yy;
		}
	
	};
xhttp.open("POST","/SMGMT/LCReportGeneration?student_id="+stud_id, true);
xhttp.send();	

}
function showText()
{
	var stud_id=document.getElementById("sname").value;
	var outword_no="0";
	//var lc_date=document.getElementById("admissionDate").value;
	//var studentname=
		if(outwordCheck.checked==true)
		{
			document.getElementById("hidden1").value="true";
		outword_no=document.getElementById("outword_no").value;
		//var outword_id1=outword_id;
		//alert(outword_no)
		$("#outword_no").show();
		var xhttp;
		var option;
		xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) 
			{
				
			}
		};
				
		xhttp.open("POST","/SMGMT/LCReportGeneration", true);
		xhttp.send();	
		}
	else
		{
			document.getElementById("hidden1").value="false";
			$("#outword_no").hide();
		}
	
}

</script>


</body>
</html>