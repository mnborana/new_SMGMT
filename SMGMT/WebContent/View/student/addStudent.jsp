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

<jsp:include page="/View/common/commonCss.jsp"></jsp:include>
<style type="text/css">
#academicYearId {
	opacity: 0;
	margin-bottom: -35px;
	display: block !important;
}
#stdId {
	opacity: 0;
	margin-bottom: -35px;
	display: block !important;
}
#religionId {
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

<body onload="loadFunction()">
	<%
	session.setAttribute("schoolId", "2");
	String schoolId=session.getAttribute("schoolId").toString();
	%>
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
				
				<!-- Official Details -->
				<form action="/SMGMT/Student" method="post" class="form-horizontal"
					id="form_block_validator">
					<div class="outer">
						<div class="inner bg-container forms">
							<div class="row">
								<div class="col-xl-12">
									<div class="card">
										<div class="card-header bg-white">
											<h3>Official Details</h3>
										</div>
										<div class="card-block">
											<div class="row">
												<div class="card-block seclect_form">
													<div class="row">
														<div class="form-group col-lg-4 input_field_sections">
															<label for="academicYearId" class="col-form-label">Select Academic Year *</label> 
															<select	class="validate[required] form-control chzn-select"	name="academicYearId" id="academicYearId" required>
																<option disabled selected>Select Academic Year</option>
															</select>
														</div>
														<div class="form-group col-lg-4 input_field_sections">
															<label for="stdId" class="col-form-label">Select Standard *</label> 
															<select class="form-control chzn-select" name="stdId" id="stdId" onchange="sectionList(this.value)" required>
																<option disabled selected>Select Standard</option>
															</select>
														</div>
														<div class="form-group col-lg-4 input_field_sections">
															<label for="sectionId" class="col-form-label">Select Section *</label> 
															<input type="text" id="sectionId" name="sectionId" class="form-control" placeholder="Section" readonly="readonly"/>
														</div>
													</div>
													<div class="row">
														<div class="form-group col-lg-4 input_field_sections">
															<label for="admission_date" class="col-form-label">Admission
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
														<div class="form-group col-lg-4 input_field_sections">
															<label for="booknumber" class="col-form-label">Book
																Number *</label> <input type="text"
																name="bookNo" class="form-control"
																placeholder="Book Number" required />

															<!--</div>-->
														</div>
														<div class="form-group col-lg-4 input_field_sections">
															<label for="gen_reg_number" class="col-form-label">General
																Register Number *</label> <input type="text"
																name="grNo" class="form-control"
																placeholder="General Register Number" required />
														</div>
													</div>
													<div class="row">
														<div class="form-group col-lg-4 input_field_sections">
															<label for="admission_date" class="col-form-label">Previous
																School Name *</label> <input type="text" id="previousSchool"
																name="previousSchool" class="form-control"
																placeholder="Previous School Name" />
														</div>

														<div class="form-group col-lg-4 input_field_sections">
															<label for="firstName" class="col-form-label">Select
																Medium*</label> <select class="form-control chzn-select"
																name="medium">
																<option selected>Marathi</option>
																<option value="Hindi">Hindi</option>
																<option value="English">English</option>
																<option value="Semi-English">Semi-English</option>
															</select>
														</div>

														<div class="form-group col-lg-4 input_field_sections">
															<label class="col-form-label" style="margin-bottom: 7%;"></label>
															<div class="checkbox">
																<label> <input type="checkbox" value="1"
																	name="classAlo" id="classAlo"
																	onclick="classAllocation()" checked="checked"> <span class="cr"><i
																		class="cr-icon fa fa-check"></i></span> Class Allocated
																</label>
															</div>
														</div>
													</div>
													<div class="row" id="aloRow" style="display: none;">
														<div class="form-group col-lg-4 input_field_sections">
															<label for="stdIdAlo" class="col-form-label">Select
																Standard *</label> <select class="form-control chzn-select"
																name="stdIdAlo" id="stdIdAlo"
																title="Select Standard">
																<option disabled selected>Select Standard</option>
															</select>
														</div>
														<div class="form-group col-lg-4 input_field_sections">
															
														</div>
														<div class="form-group col-lg-4 input_field_sections">
															
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- End of Official Details -->


					<!-- Personal Details -->

					<div class="outer">
						<div class="inner bg-container forms">
							<div class="row">
								<div class="col-lg-12">
									<div class="card">
										<div class="card-header bg-white">
											<h3>Personal Details</h3>
										</div>
										<div class="card-block">
											<div class="row">

												<div class="card-block seclect_form">
													<div class="row">
														<div class="form-group col-lg-4 input_field_sections">
															<label for="firstName" class="col-form-label">First
																Name *</label> <input type="text" id="firstName"
																name="firstName" class="form-control"
																placeholder="First Name" required>
														</div>
														<div class="form-group col-lg-4 input_field_sections">
															<label for="middlename" class="col-form-label">Middle
																Name *</label> <input type="text" id="middleName"
																name="middleName" class="form-control"
																placeholder="Middle Name" required />
														</div>
														<div class="form-group col-lg-4 input_field_sections">
															<label for="lastname" class="col-form-label">Last
																Name *</label> <input type="text" id="lastName" name="lastName"
																class="form-control" placeholder="Last Name" required />
														</div>
													</div>

													<div class="row">
														<div class="form-group col-lg-4 input_field_sections">
															<label for="dob" class="col-form-label">Date Of
																Birth *</label>
															<div class="input-group input-append date" id="dp3"
																data-date-format="dd-mm-yyyy">
																<input class="form-control" type="text" name="dob"
																	id="dob" onchange="getAge()" placeholder="dd-mm-yyyy" required />
																<span class="input-group-addon add-on"> <i
																	class="fa fa-calendar"></i>
																</span>
															</div>
														</div>
														<div class="form-group col-lg-4 input_field_sections">
															<label for="age" class="col-form-label">Age *</label> <input
																type="text" id="age" name="age" class="form-control"
																placeholder="Age" />
														</div>
														<div class="form-group col-lg-4 input_field_sections">
															<label for="birthplace" class="col-form-label">Birth
																Place *</label> <input type="text" id="birthPlace"
																name="birthPlace" class="form-control"
																placeholder="Birth Place" />
														</div>
													</div>
													<div class="row">
														<div class="form-group col-lg-4 input_field_sections">
															<label for="lastname" class="col-form-label">Gender
																*</label>
															<div class="radio">
																<label> <input type="radio" name="gender"
																	value="Male" checked="checked"> <span
																	class="cr"><i class="cr-icon fa fa-circle"></i></span>
																	Male
																</label> <label> <input type="radio" name="gender"
																	value="Female"> <span class="cr"><i
																		class="cr-icon fa fa-circle"></i></span> Female
																</label>
															</div>
														</div>
														<div class="form-group col-lg-4 input_field_sections">
															<label for="lastname" class="col-form-label">Blood
																Group</label> <select class="form-control chzn-select"
																name="bloodGroop">
																<option disabled selected>Choose a blood group</option>
																<option value="A+">A+</option>
																<option value="O+">O+</option>
																<option value="B+">B+</option>
																<option value="AB+">AB+</option>
																<option value="A-">A-</option>
																<option value="O-">O-</option>
																<option value="B-">B-</option>
																<option value="AB-">AB-</option>
															</select>
														</div>
														<div class="form-group col-lg-4 input_field_sections">
															<label for="height" class="col-form-label">Height</label>
															<input type="text" id="height" name="heigth"
																class="form-control" placeholder="Height" />
														</div>
													</div>
													<div class="row">
														<div class="form-group col-lg-4 input_field_sections">
															<label for="weight" class="col-form-label">Weight</label>
															<input type="text" id="weight" name="weight"
																class="form-control" placeholder="Weight" />
														</div>
														<div class="form-group col-lg-4 input_field_sections">
															<label for="adharno" class="col-form-label">Aadhar
																Card No</label> <input type="text" id="studAadharNumber" name="studAadharNumber"
																class="form-control" placeholder="Aadhar Card No" />
														</div>
														<div class="form-group col-lg-4 input_field_sections">
															<label for="lastname" class="col-form-label">Mother
																Tongue</label> <select class="form-control chzn-select"
																name="motherTongue">
																<option disabled selected>Choose a Language</option>
																<option value="Marathi">Marathi</option>
																<option value="Hindi">Hindi</option>
																<option value="English">English</option>
															</select>
														</div>
													</div>

													<div class="row">
														<div class="form-group col-lg-4 input_field_sections">
															<label for="religionId" class="col-form-label">Religion</label>
															<select class="form-control chzn-select" name="religionId" id="religionId" onchange="casteList(this.value)" required>
																<option disabled selected>Choose a Religion</option>
															</select>
														</div>
														<div class="form-group col-lg-4 input_field_sections">
															<label for="casteId" class="col-form-label">Caste</label>
															<select class="form-control chzn-select" name="casteId" id="casteId" onchange="categoryList(this.value)" required>
																<option disabled selected>Choose a Caste</option>
															</select>
														</div>
														<div class="form-group col-lg-4 input_field_sections">
															<label for="categoryId" class="col-form-label">Caste Category</label> 
															<input type="hidden" id="categoryId" name="categoryId" class="form-control" placeholder="Nationality" readonly="readonly"/>
															<input type="text" id="categoryText" name="categoryText" class="form-control" placeholder="Nationality" readonly="readonly"/>
														</div>
													</div>

													<div class="row">
														<div class="form-group col-lg-4 input_field_sections">
															<label for="nationality" class="col-form-label">Nationality</label>
															<input type="text" id="nationality" name="nationality"
																class="form-control" placeholder="Nationality" />
														</div>

														<div class="form-group col-lg-4 input_field_sections">
															<label class="col-form-label" style="margin-bottom: 7%;"></label>
															<div class="checkbox">
																<label> 
																	<input type="checkbox" name="minority" id="minority" value="1"> 
																	<span class="cr"><i class="cr-icon fa fa-check"></i></span> 
																	Minority
																</label>
															</div>
														</div>

														<div class="form-group col-lg-4 input_field_sections">
															<label class="col-form-label" style="margin-bottom: 7%;"></label>
															<div class="checkbox">
																<label> 
																	<input type="checkbox" name="handicap" id="handicap" value="1" onclick="handicapType()"> 
																	<span class="cr"><i class="cr-icon fa fa-check"></i></span> 
																	Physical Handicap
																</label>
															</div>
														</div>

													</div>
													<div class="row" id="handiRow" style="display: none;">
														<div class="form-group col-lg-4 input_field_sections">
															<label for="handitype" class="col-form-label">Physical Handicap Type</label> 
															<input type="text" id="handitype" name="handitype" class="form-control" placeholder="Physical Handicap Type" />
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- End of Personal Details -->
					<!-- Father's Details -->
					<div class="outer">
						<div class="inner bg-container forms">
							<div class="row">
								<div class="col-lg-12">
									<div class="card">
										<div class="card-header bg-white">
											<h3>Father's Details</h3>
										</div>
										<div class="card-block">
											<div class="row">
												<div class="card-block seclect_form">
													<div class="row">
														<div class="form-group col-lg-4 input_field_sections">
															<label for="father_name" class="col-form-label">Name</label>
															<input type="text" id="fatherName" name="fatherName"
																class="form-control" placeholder="" />
														</div>
														<div class="form-group col-lg-4 input_field_sections">
															<label for="father_mob_number" class="col-form-label">Mobile
																Number</label> <input type="text" id="fatherMobileNo"
																name="fatherMobileNo" class="form-control"
																placeholder="Mobile Number" />
														</div>
														<div class="form-group col-lg-4 input_field_sections">
															<label for="father_aadhar_number" class="col-form-label">Aadhar
																Number</label> <input type="text" id="fatherAaadharNo"
																name="fatherAaadharNo" class="form-control"
																placeholder="Aadhar Number" />
														</div>
													</div>
													<div class="row">
														<div class="form-group col-lg-4 input_field_sections">
															<label for="father_occu" class="col-form-label">Occupation</label>

															<input type="text" id="fatherDesignation" name="fatherDesignation"
																class="form-control" placeholder="Occupation" />

															<!--</div>-->
														</div>
														<div class="form-group col-lg-4 input_field_sections">
															<label for="father_income" class="col-form-label">Income</label>
															<input type="text" id="fatherIncome"
																name="fatherIncome" class="form-control"
																placeholder="Income" />
														</div>
														<div class="form-group col-lg-4 input_field_sections">
															<label for="father_email" class="col-form-label">Email
																Address</label> <input type="email" id="fatherEmail"
																name="fatherEmail" class="form-control"
																placeholder="Email Address" />
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- End of Father's Details -->
					<!-- Mother's Details -->
					<div class="outer">
						<div class="inner bg-container forms">
							<div class="row">
								<div class="col-lg-12">
									<div class="card">
										<div class="card-header bg-white">
											<h3>Mother's Details</h3>
										</div>
										<div class="card-block">
											<div class="row">
												<div class="card-block seclect_form">
													<div class="row">
														<div class="form-group col-lg-4 input_field_sections">
															<label for="mother_name" class="col-form-label">Name</label>
															<input type="text" id="motherName" name="motherName"
																class="form-control" placeholder="Name" />
														</div>
														<div class="form-group col-lg-4 input_field_sections">
															<label for="mother_mob_number" class="col-form-label">Mobile
																Number</label> <input type="number" id="motherMobileNo" minlength="10" maxlength="10"
																name="motherMobileNo" class="form-control"
																placeholder="Mobile Number" />
														</div>
														<div class="form-group col-lg-4 input_field_sections">
															<label for="mother_aadhar_number" class="col-form-label">Aadhar
																Number</label> <input type="text" id="motherAaadharNo"
																name="motherAaadharNo" class="form-control"
																placeholder="Aadhar Number" />
														</div>
													</div>
													<div class="row">
														<div class="form-group col-lg-4 input_field_sections">
															<label for="mother_occu" class="col-form-label">Occupation</label>

															<input type="text" id="motherDesignation" name="motherDesignation"
																class="form-control" placeholder="Occupation" />
														</div>
														<div class="form-group col-lg-4 input_field_sections">
															<label for="mother_income" class="col-form-label">Income</label>
															<input type="text" id="motherIncome"
																name="motherIncome" class="form-control"
																placeholder="Income" />
														</div>
														<div class="form-group col-lg-4 input_field_sections">
															<label for="mother_email" class="col-form-label">Email
																Address</label> <input type="email" id="motherEmail"
																name="motherEmail" class="form-control"
																placeholder="Email Address" />
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- End of Mother's Details -->
					<!-- Contact Details -->
					<div class="outer">
						<div class="inner bg-container forms">
							<div class="row">
								<div class="col-lg-12">
									<div class="card">
										<div class="card-header bg-white">
											<h3>Contact Details</h3>
										</div>
										<div class="card-block">
											<div class="row">
												<div class="card-block seclect_form">
													<div class="row">
														<div class="form-group col-lg-4 input_field_sections">
															<label for="pinCode" class="col-form-label">Pin
																Code *</label> <input type="text" id="pinCode" name="pinCode"
																class="form-control" placeholder="Pin Code" required
																onblur="loadDoc()" />
														</div>
														<div class="form-group col-lg-4 input_field_sections">
															<label for="taluk" class="col-form-label">Taluka
																*</label> <input type="text" id="taluk" name="taluk"
																class="form-control" placeholder="Taluka" tabindex="-98" />
														</div>
														<div class="form-group col-lg-4 input_field_sections">
															<label for="district" class="col-form-label">District
																*</label> <input type="text" id="district" name="district"
																class="form-control" placeholder="District"
																tabindex="-98" />
														</div>
													</div>
													<div class="row">
														<div class="form-group col-lg-4 input_field_sections">
															<label for="state" class="col-form-label">State *</label>
															<input type="text" id="state" name="state"
																class="form-control" placeholder="State" tabindex="-98" />
														</div>
														<div class="form-group col-lg-4 input_field_sections">
															<label for="autosize" class="col-form-label">Address
																*</label>
															<textarea id="autosize" class="form-control" cols="50"
																rows="5" name="addressOne"></textarea>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- End of Contact Details -->

					<!-- Bank Details -->

					<div class="outer">
						<div class="inner bg-container forms">
							<div class="row">
								<div class="col-lg-12">
									<div class="card">
										<div class="card-header bg-white">
											<h3>Bank Details</h3>
										</div>
										<div class="card-block">
											<div class="row">
												<div class="card-block seclect_form">
													<div class="row">
														<div class="form-group col-lg-4 input_field_sections">
															<label for="bankname" class="col-form-label">Bank
																Name</label> <input type="text" id="bankname" name="bankname"
																class="form-control" placeholder="Bank Name" />
														</div>
														<div class="form-group col-lg-4 input_field_sections">
															<label for="ifsc" class="col-form-label">IFSC
																Code</label> <input type="text" id="ifscCode" name="ifscCode"
																class="form-control" placeholder="IFSC Code" />
														</div>
														<div class="form-group col-lg-4 input_field_sections">
															<label for="accnt_no" class="col-form-label">Account
																No</label> <input type="text" id="accountNo" name="accountNo"
																class="form-control" placeholder="Account No" />
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- End of Bank Details -->
					<div class="outer">
						<div class="inner bg-container forms">
							<div class="row">
								<div class="col-lg-12">
									<div class="card">
										<div class="card-block">
											<div class="row">
												<div class="card-block seclect_form">
													<div class="row">
														<div
															class="col-xl-4 col-lg-6 col-md-4 col-sm-6 col-6 m-t-15">
															<input type="submit" class="btn btn-primary"
																name="submitBtn" value="Submit" />
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
		<!-- /#content -->
	</div>
	<!--wrapper-->


	<!-- /#content -->


	<jsp:include page="/View/common/commonJs.jsp"></jsp:include>


	<script type="text/javascript">
//====================================== loadFunction  =====================================
function loadFunction(){
	getAcademicYear();
	standardList();
	admissionDate();
	classAllocation();
	religionList();
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
//======================================End loadFunctionr  =====================================
//====================================== ACADEMIC YEAR =====================================
	function getAcademicYear() {
		var pinNew="";
		$.getJSON("/SMGMT/config/json/academicYear.json", function(json) {
			year=json;
			currentYear(year);
		});
	}
	
	function currentYear(x) {
		var now = new Date();
		
	    var tmo=(now.getMonth());
	    var tyr=(now.getFullYear());
	    
		if(tmo >= 5){
			tyr=tyr+"-"+(tyr+1);
		}else{
			tyr=(tyr-1)+"-"+tyr;
		}
		document.getElementById("academicYearId").innerHTML="";
		var row="";
		var i;
		for (i = 0; i <x.length; i++) {
			var tyrGet=x[i].year;
			
		   if(tyr == tyrGet){
			   row += "<option value="+tyrGet+" selected>"+ tyrGet + "</option>";
			   break;
		   }else{
			   row += "<option value="+tyrGet+">"+ tyrGet + "</option>";
		   }
		}
		document.getElementById("academicYearId").innerHTML+=row;
		$("#academicYearId").trigger('chosen:updated');
	}
//====================================== END ACADEMIC YEAR =====================================
//====================================== Section List  =====================================
	function sectionList(schoolId){
		if(schoolId==""){
			return;
		}
		document.getElementById("stdIdAlo").value = schoolId;
		$("#stdIdAlo").trigger('chosen:updated');
		var xhttp =new XMLHttpRequest();
		try{
			xhttp.onreadystatechange = function(){
				if(this.readyState == 4 && this.status == 200){
					var getData=this.responseText.split("~");
					var i=0;
					for(;getData[i];){
						
						document.getElementById("sectionId").value=getData[i];
						i++;
					}					
					
				}
			}
			xhttp.open("GET", "/SMGMT/Student?sectionList="+schoolId, true);
			xhttp.send();
		}catch(e){
			alert("Unable to Connect Server!");
		}
	}
//======================================End Section List  =====================================
//====================================== Standard List  =====================================
	function standardList(){
		var std=<%=schoolId %>
		if(std==""){
			return;
		}
		document.getElementById("stdId").innerHTML="";
			document.getElementById("stdIdAlo").innerHTML="";
		var xhttp =new XMLHttpRequest();
		try{
			xhttp.onreadystatechange = function(){
				if(this.readyState == 4 && this.status == 200){
					var getData=this.responseText.split("~");
					var row="<option disabled selected>Select Standard </option>";
					var i=0;
					for(;getData[i];){
						row += "<option value="+getData[i]+">";
						i++;
						row += getData[i] ;
						i++;
						row += " ("+ getData[i] +" - ";
						i++;
						row += getData[i]+ ")</option>";
						i++;
	
					}					
					document.getElementById("stdId").innerHTML+=row;
					$("#stdId").trigger('chosen:updated');
					document.getElementById("stdIdAlo").innerHTML+=row;
					$("#stdIdAlo").trigger('chosen:updated');
				}
			}
			xhttp.open("GET", "/SMGMT/Student?standardList="+std, true);
			xhttp.send();
		}catch(e){
			alert("Unable to Connect Server!");
		}
}
//======================================End Standard List  =====================================
//======================================Admission Date  =====================================
function admissionDate(x) {
		var now = new Date();
		var today= now.getDate();
		var todayMonth=(now.getMonth());
	    var todayYear=(now.getFullYear());
	    
	    document.getElementById("admissionDate").value=today+"-"+(todayMonth+1)+"-"+todayYear;
	}
//====================================== END Admission Date =====================================
//====================================== Class Allocation =====================================
function classAllocation(){
	var check=document.getElementById("classAlo").checked;
	if(check==true){
		document.getElementById("aloRow").style.display="";
	}else {
		document.getElementById("aloRow").style.display="none";
	}
}
//====================================== END Class Allocation =====================================
//====================================== Religion List  =====================================
	function religionList(){
		var xhttp =new XMLHttpRequest();
		try{
			xhttp.onreadystatechange = function(){
				if(this.readyState == 4 && this.status == 200){
					var getData=this.responseText.split("~");
					var row="";
					var i=0;
					for(;getData[i];){
						
						row += "<option value="+getData[i]+">";
						i++;
						row += getData[i] + "</option>";
						i++;
	
					}					
					document.getElementById("religionId").innerHTML+=row;
					$("#religionId").trigger('chosen:updated');
				}
			}
			xhttp.open("GET", "/SMGMT/Student?religionList=religionList", true);
			xhttp.send();
		}catch(e){
			alert("Unable to Connect Server!");
		}
	}
//======================================End Religion List  =====================================
//====================================== Caste List  =====================================
	function casteList(id){
		
		if(id==""){
			return;
		}
		document.getElementById("casteId").innerHTML=""
		var xhttp =new XMLHttpRequest();
		try{
			xhttp.onreadystatechange = function(){
				if(this.readyState == 4 && this.status == 200){
					var getData=this.responseText.split("~");
					var row="<option disabled selected>Choose a Caste </option>";
					var i=0;
					for(;getData[i];){
						row += "<option value="+getData[i]+">";
						i++;
						row += getData[i] + "</option>";
						i++;
	
					}					
					document.getElementById("casteId").innerHTML+=row;
					$("#casteId").trigger('chosen:updated');
				}
			}
			xhttp.open("GET", "/SMGMT/Student?casteList="+id, true);
			xhttp.send();
		}catch(e){
			alert("Unable to Connect Server!");
		}
	}
//====================================== Caste List  =====================================
//====================================== Caste List  =====================================
	function categoryList(id){
		
		if(id==""){
			return;
		}
		document.getElementById("categoryId").value=""
		var xhttp =new XMLHttpRequest();
		try{
			xhttp.onreadystatechange = function(){
				if(this.readyState == 4 && this.status == 200){
					var getData=this.responseText.split("~");
					var i=0;
					for(;getData[i];){
						document.getElementById("categoryId").value=getData[i];
						i++;
						document.getElementById("categoryText").value=getData[i];
						i++;
					}					
				}
			}
			xhttp.open("GET", "/SMGMT/Student?categoryList="+id, true);
			xhttp.send();
		}catch(e){
			alert("Unable to Connect Server!");
		}
	}
//====================================== Caste List  =====================================
//====================================== Handicap =====================================
function handicapType(){
	var check=document.getElementById("handicap").checked;
	if(check==true){
		document.getElementById("handiRow").style.display="";
	}else {
		document.getElementById("handiRow").style.display="none";
	}
}
//====================================== END Handicap =====================================

//====================================== AGE Calculator  =====================================
	function getAge() {
		var inputDate = document.getElementById("dob").value;
		var newDate=inputDate.split("-");
		
	    var byr = newDate[2];
	    var bmo = newDate[1];
	    bmo=bmo-1;
	    var bday = newDate[0];
	    
	    var byr;
	    var age;
	    var now = new Date();
	    tday=now.getDate();
	    tmo=(now.getMonth());
	    tyr=(now.getFullYear());
	    
	    if((tmo > bmo)||(tmo==bmo & tday>=bday)){
	    	age=byr;
	    }
	    else{
	    	age=parseInt(byr)+parseInt(1);
	    }
	    document.getElementById("age").value=(tyr-age);
	    
}
//======================================End  AGE Calculator  =====================================


//====================================== PINCODE SEARCH =====================================
	function loadDoc() {
		var pinNew="";
		$.getJSON("/SMGMT/config/json/PincodeJson.json", function(json) {
			pinNew=json;
			myFunction(pinNew);
		});
	}
	
	function myFunction(x) {
		var pinNo=document.getElementById("pinCode").value;
		document.getElementById("taluk").value="";
	    document.getElementById("district").value="";
	    document.getElementById("state").value="";
	  var i;
	  for (i = 0; i <x.length; i++) {
		var pin=x[i].pincode;
	    if(pin == pinNo){
	      //document.getElementById("pinNo").value=x[i].pincode;
	      document.getElementById("taluk").value=x[i].taluk;
	      document.getElementById("district").value=x[i].districtname;
	      document.getElementById("state").value=x[i].statename;
		  break;
	     }
	  }
	}
//====================================== END PINCODE SEARCH =====================================
</script>


</body>
</html>