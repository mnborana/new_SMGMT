<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Setup</title>
<link rel="shortcut icon"
	href="/SMGMT/config/img/xlogo1.ico.pagespeed.ic.ONh6qx31g4.html" />
<!-- global styles-->
<link type="text/css" rel="stylesheet"
	href="/SMGMT/config/css,_components.css+css,_custom.css+vendors,_bootstrapvalidator,_css,_bootstrapValidator.min.css+css,_pages,_wizards.css.pagespeed.cc.42ti_Q82Gz.css" />
<link type="text/css" rel="stylesheet"
	href="/SMGMT/config/css,_components.css+css,_custom.css+vendors,_bootstrap-switch,_css,_bootstrap-switch.min.css+vendors,_switchery,_css,_switchery.min.css+vendors,_radio_css,_css,_radiobox.min.css+vendo" />

<!-- end of global styles-->
<!--Plugin styles-->

<!--page level styles-->

<link type="text/css" rel="stylesheet" href="#" id="skin_change" />
<!--End of page styles-->
</head>
<body>
	<div class="preloader"
		style="position: fixed; width: 100%; height: 100%; top: 0; left: 0; z-index: 100000; backface-visibility: hidden; background: #ffffff;">
		<div class="preloader_img"
			style="width: 200px; height: 200px; position: absolute; left: 48%; top: 48%; background-position: center; z-index: 999999">
			<img src="/SMGMT/config/img/loader.gif.pagespeed.ce.pu_lpoGKrw.gif"
				style="width: 40px;" alt="loading...">
		</div>
	</div>
	<div id="wrap">
		<div id="top">
			<!-- .navbar -->
			<jsp:include page="/View/common/header.jsp"></jsp:include>
			<!-- /.navbar -->
			<!-- /.head -->
		</div>
		<!-- /#top -->
		<div class="wrapper">
			<!-- /left navbar -->
			<jsp:include page="/View/common/left-navbar.jsp"></jsp:include>
			<!-- /left navbar end -->
			<!-- /#left -->

			<div id="content" class="bg-container">
				<header class="head">
				<div class="main-bar">
					<div class="row no-gutters">
						<div class="col-lg-6 col-md-4 col-sm-4">
							<h4 class="nav_top_align">
								<i class="fa fa-pencil"></i> Wizards
							</h4>
						</div>
						<div class="col-lg-6 col-md-8 col-sm-8">
							<ol class="breadcrumb float-right nav_breadcrumb_top_align">
								<li class="breadcrumb-item"><a href="index1.html"> <i
										class="fa fa-home" data-pack="default" data-tags=""></i>
										Dashboard
								</a></li>
								<li class="breadcrumb-item"><a href="#">Forms</a></li>
								<li class="breadcrumb-item active">Wizards</li>
							</ol>
						</div>
					</div>
				</div>
				</header>
				<div class="outer">
					<div class="inner bg-container ">
						<div class="row">
							<div class="col-lg-12">
								<div class="card">
									<div class="card-header bg-white">
										<i class="fa fa-file-text-o"></i> General Wizard
									</div>
									<div class="card-block m-t-20">
									<form action="/SMGMT/Setup" method="post" id="commentForm" class="validate">
										<div id="rootwizard_no_val">
											<ul class="nav nav-pills">
												<li class="nav-item m-t-15">
													<a class="nav-link" href="#tab11" data-toggle="tab">
													<span class="userprofile_tab1">1</span>Trustee Environment</a>
												</li>
												<li class="nav-item m-t-15">
													<a class="nav-link" href="#tab21" data-toggle="tab">
													<span class="userprofile_tab2">2</span>Principal Environment</a>
												</li>
												<li class="nav-item m-t-15">
													<a class="nav-link" href="#tab31" data-toggle="tab">
													<span class="">3</span>Clerk Environment</a>
												</li>
												<li class="nav-item m-t-15">
													<a class="nav-link" href="#tab41" data-toggle="tab">
													<span class="">4</span>Teacher Environment</a>
												</li>
												<li class="nav-item finish_tab m-t-15">
													<a class="nav-link" href="#tab51" data-toggle="tab">
													<span>5</span>Librarian Environment</a>
												</li>
											</ul>
												<div class="tab-content m-t-20">
													<div class="tab-pane" id="tab11">
														
														<div class="form-group">
															<label for="eduName" class="col-form-label">Education
																Society Name*</label> <input id="eduName" name="eduName"
																type="text"
																placeholder="Enter your Education Society name"
																class="form-control required">
														</div>
														<div class="form-group">
															<label for="tUname" class="col-form-label">Trustee
																User Name*</label> <input id="tUname" name="tUname"
																placeholder="Trustee User Name" type="text"
																class="form-control required">
														</div>
														<div class="form-group">
															<label for="pass" class="col-form-label">Trustee
																Password</label> <input id="pass" type="password"
																placeholder="Enter your password" class="form-control required">
														</div>
														<div class="form-group">
															<label for="tPass" class="col-form-label">Confirm
																Password</label> <input id="tPass" name="tPass" type="password"
																placeholder="Confirm your password "
																class="form-control required">
														</div>
														<div class="form-group">
															<label for="nSchools" class="col-form-label">No
																of Schools*</label> <input id="nSchools" name="nSchools"
																placeholder="Trustee User Name" type="text"
																onblur="addFields(this.value)" class="form-control required">
														</div>
														<div class="form-group"></div>



														<div class="row">
															<div class="col-xl-12">
																<div class="card m-t-35">
																	<div class="card-header bg-white">Schools
																		Information</div>
																	<div class="card-block">
																		<div class="row">
																			<div class="col-lg-3 col-md-12 input_field_sections">
																				<label for="" class="">School Name</label>
																			</div>
																			<div class="col-lg-3 col-md-12 input_field_sections">
																				<label for="" class="">Allow Permission</label>
																			</div>
																			<div class="col-lg-3 col-md-12 input_field_sections">
																				<label for="" class="">Principal User Name</label>
																			</div>
																			<div class="col-lg-3 col-md-12 input_field_sections">
																				<label for="" class="">Principal Password</label>
																			</div>

																			<div class="col-lg-3 col-md-12 input_field_sections"
																				id="container">
																				<!-- SchoolName -->

																				<!-- <input id="" name="" placeholder="" type="text" class=""><br><br>
							                                                <input id="" name="" placeholder="" type="text" class=""> -->

																			</div>

																			<div class="col-lg-3 col-md-12 input_field_sections"
																				id="check">

																				<!-- checkbox -->

																			</div>

																			<div class="col-lg-3 col-md-12 input_field_sections"
																				id="userName">
																				<!-- uname -->

																			</div>

																			<div class="col-lg-3 col-md-12 input_field_sections"
																				id="principalPass">
																				<!-- pass -->

																			</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>

														<br>

														<ul class="pager wizard pager_a_cursor_pointer">
															<li class="previous"><a><i class="fa fa-long-arrow-left"></i> Previous</a></li>
															<li class="next"><a>Next <i class="fa fa-long-arrow-right"></i></a></li>
														</ul>
													</div>
													<div class="tab-pane" id="tab21">
														<div class="row">
															<div class="col-lg-12">
																				<!-- BEGIN SAMPLE TABLE PORTLET-->
																				<div class="card m-t-35">
																					<div class="card-header bg-white">
																						<i class="fa fa-table"></i> Principal
																					</div>
																					<div class="card-block">
																						<div class="table-responsive m-t-35">
																							<table
																								class="table table-striped table-bordered table-advance table-hover table_status_padding">
																								<thead>
																									<tr>
																										<th>Functionality</th>
																										<th>Give Access</th>
																										<th>Permissions</th>
																										<th>Actions</th>
																									</tr>
																								</thead>
																								<tbody>
																									<tr>
																										<td>Dashboard</td>
																										<td>
																											<div class="checkbox">
																												<label class="text-success"> <input
																													type="checkbox" value=""
																													onclick="permission(this,pr31,pw31)" checked="checked">
																													<span class="cr"><i
																														class="cr-icon fa fa-check"></i></span> Grant
																												</label>
																											</div>
																										</td>
																										<td>
																											<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="p_dash31" id="pr31" value="1"
																													> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ
																												</label>
																											</div>

																										</td>
																										<td>
																											<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="p_dash31" id="pw31" value="2"
																													 checked="checked"> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>
																													READ/WRITE
																												</label>
																											</div>
																										</td>
																									</tr>
																									<tr>
																										<td>Setting</td>
																										<td>
																											<div class="checkbox">
																												<label class="text-success"> <input
																													type="checkbox" value=""
																													onclick="permission(this,pr32,pw32)">
																													<span class="cr"><i
																														class="cr-icon fa fa-check"></i></span> Grant
																												</label>
																											</div>
																										</td>
																										<td>
																											<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="p_setting32" id="pr32" value="1"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ
																												</label>
																											</div>
																										</td>
																										<td>
																											<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="p_setting32" id="pw32" value="2"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ/WRITE
																												</label>
																											</div>
																										</td>
																									</tr>
																									<tr>
																										<td>Management</td>
																										<td>
																											<div class="checkbox">
																												<label class="text-success"> <input
																													type="checkbox" value=""
																													onclick="permission(this,pr33,pw33)">
																													<span class="cr"><i
																														class="cr-icon fa fa-check"></i></span> Grant
																												</label>
																											</div>
																										</td>
																										<td>
																											<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="p_mgmt33" id="pr33" value="1"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ
																												</label>
																											</div>
																										</td>
																										<td>
																											<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="p_mgmt33" id="pw33" value="2"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ/WRITE
																												</label>
																											</div>
																										</td>
																									</tr>
																									<tr>
																										<td>Admission</td>
																										<td>
																											<div class="checkbox">
																												<label class="text-success"> <input
																													type="checkbox" value=""
																													onclick="permission(this,pr34,pw34)">
																													<span class="cr"><i
																														class="cr-icon fa fa-check"></i></span> Grant
																												</label>
																											</div>
																										</td>
																										<td>
																											<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="p_admission34" id="pr34" value="1"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ
																												</label>
																											</div>
																										</td>
																										<td>
																											<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="p_admission34" id="pw34" value="2"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ/WRITE
																												</label>
																											</div>
																										</td>
																									</tr>
																									<tr>
																										<td>Fee</td>
																										<td>
																										<div class="checkbox">
																												<label class="text-success"> <input
																													type="checkbox" value=""
																													onclick="permission(this,pr35,pw35)" checked="checked">
																													<span class="cr"><i
																														class="cr-icon fa fa-check"></i></span> Grant
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="p_fee35" id="pr35" value="1"
																													checked="checked"> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="p_fee35" id="pw35" value="2"
																													> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ/WRITE
																												</label>
																											</div>
																										</td>
																									</tr>
																									<tr>
																										<td>Attendance</td>
																										<td>
																										<div class="checkbox">
																												<label class="text-success"> <input
																													type="checkbox" value=""
																													onclick="permission(this,pr36,pw36)">
																													<span class="cr"><i
																														class="cr-icon fa fa-check"></i></span> Grant
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="p_attendance36" id="pr36" value="1"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="p_attendance36" id="pw36" value="2"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ/WRITE
																												</label>
																											</div>
																										</td>
																									</tr>
																									<tr>
																										<td>Exam</td>
																										<td>
																										<div class="checkbox">
																												<label class="text-success"> <input
																													type="checkbox" value=""
																													onclick="permission(this,pr37,pw37)">
																													<span class="cr"><i
																														class="cr-icon fa fa-check"></i></span> Grant
																												</label>
																											</div>
																										</td>
																										<td>
																											<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="p_exam37" id="pr37" value="1"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="p_exam37" id="pw37" value="2"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ/WRITE
																												</label>
																											</div>
																										</td>
																									</tr>
																									<tr>
																										<td>Teacher</td>
																										<td>
																										<div class="checkbox">
																												<label class="text-success"> <input
																													type="checkbox" value=""
																													onclick="permission(this,pr38,pw38)" checked="checked">
																													<span class="cr"><i
																														class="cr-icon fa fa-check"></i></span> Grant
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="p_teacher38" id="pr38" value="1"
																													> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="p_teacher38" id="pw38" value="2"
																													checked="checked"> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ/WRITE
																												</label>
																											</div>
																										</td>
																									</tr>
																									<tr>
																										<td>Register</td>
																										<td>
																										<div class="checkbox">
																												<label class="text-success"> <input
																													type="checkbox" value=""
																													onclick="permission(this,pr39,pw39)">
																													<span class="cr"><i
																														class="cr-icon fa fa-check"></i></span> Grant
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="p_register39" id="pr39" value="1"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="p_register39" id="pw39" value="2"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ/WRITE
																												</label>
																											</div>
																										</td>
																									</tr>
																									<tr>
																										<td>Cash Book</td>
																										<td>
																										<div class="checkbox">
																												<label class="text-success"> <input
																													type="checkbox" value=""
																													onclick="permission(this,pr40,pw40)" checked="checked">
																													<span class="cr"><i
																														class="cr-icon fa fa-check"></i></span> Grant
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="p_cashbook40" id="pr40" value="1"
																													checked="checked"> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="p_cashbook40" id="pw40" value="2"
																													> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ/WRITE
																												</label>
																											</div>
																										</td>
																									</tr>
																									<tr>
																										<td>Transport</td>
																										<td>
																										<div class="checkbox">
																												<label class="text-success"> <input
																													type="checkbox" value=""
																													onclick="permission(this,pr41,pw41)">
																													<span class="cr"><i
																														class="cr-icon fa fa-check"></i></span> Grant
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="p_transport41" id="pr41" value="1"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="p_transport41" id="pw41" value="2"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ/WRITE
																												</label>
																											</div>
																										</td>
																									</tr>
																									<tr>
																										<td>Salary</td>
																										<td>
																										<div class="checkbox">
																												<label class="text-success"> <input
																													type="checkbox" value=""
																													onclick="permission(this,pr42,pw42)">
																													<span class="cr"><i
																														class="cr-icon fa fa-check"></i></span> Grant
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="p_salary42" id="pr42" value="1"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="p_salary42" id="pw42" value="2"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ/WRITE
																												</label>
																											</div>
																										</td>
																									</tr>
																									<tr>
																										<td>Library</td>
																										<td>
																										<div class="checkbox">
																												<label class="text-success"> <input
																													type="checkbox" value=""
																													onclick="permission(this,pr43,pw43)">
																													<span class="cr"><i
																														class="cr-icon fa fa-check"></i></span> Grant
																												</label>
																											</div>
																										
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="p_library43" id="pr43" value="1"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="p_library43" id="pw43" value="2"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ/WRITE
																												</label>
																											</div>
																										</td>
																									</tr>
																									<tr>
																										<td>Other</td>
																										<td>
																										<div class="checkbox">
																												<label class="text-success"> <input
																													type="checkbox" value=""
																													onclick="permission(this,pr44,pw44)" checked="checked">
																													<span class="cr"><i
																														class="cr-icon fa fa-check"></i></span> Grant
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="p_other44" id="pr44" value="1"
																													> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="p_other44" id="pw44" value="2"
																													checked="checked"> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ/WRITE
																												</label>
																											</div>
																										</td>
																									</tr>
																									<tr>
																										<td>E-Message</td>
																										<td>
																										<div class="checkbox">
																												<label class="text-success"> <input
																													type="checkbox" value=""
																													onclick="permission(this,pr45,pw45)">
																													<span class="cr"><i
																														class="cr-icon fa fa-check"></i></span> Grant
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="p_emsg45" id="pr45" value="1"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="p_emsg45" id="pw45" value="2"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ/WRITE
																												</label>
																											</div>
																										</td>
																									</tr>
																								</tbody>
																							</table>
																						</div>
																					</div>
																				</div>
																				<!-- END SAMPLE TABLE PORTLET-->
																			</div>
														
														</div>
														<br>
														<ul class="pager wizard pager_a_cursor_pointer">
															<li class="previous previous_btn2"><a><i class="fa fa-long-arrow-left"></i> Previous</a></li>
															<li class="next next_btn2"><a>Next <i class="fa fa-long-arrow-right"></i></a></li>
														</ul>
													</div>
													<div class="tab-pane" id="tab31">
														<div class="row">
														<div class="col-lg-12">
																				<!-- BEGIN SAMPLE TABLE PORTLET-->
																				<div class="card m-t-35">
																					<div class="card-header bg-white">
																						<i class="fa fa-table"></i> Clerk
																					</div>
																					<div class="card-block">
																						<div class="table-responsive m-t-35">
																							<table
																								class="table table-striped table-bordered table-advance table-hover table_status_padding">
																								<thead>
																									<tr>
																										<th>Functionality</th>
																										<th>Give Access</th>
																										<th>Permissions</th>
																										<th>Actions</th>
																									</tr>
																								</thead>
																								<tbody>
																									<tr>
																										<td>Dashboard</td>
																										<td>
																											<div class="checkbox">
																												<label class="text-success"> <input
																													type="checkbox" value=""
																													onclick="permission(this,cr31,cw31)"checked="checked">
																													<span class="cr"><i
																														class="cr-icon fa fa-check"></i></span> Grant
																												</label>
																											</div>
																										</td>
																										<td>
																											<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="c_dash31" id="cr31" value="1"
																													> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ
																												</label>
																											</div>

																										</td>
																										<td>
																											<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="c_dash31" id="cw31" value="2"
																													checked="checked"> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>
																													READ/WRITE
																												</label>
																											</div>
																										</td>
																									</tr>
																									<tr>
																										<td>Setting</td>
																										<td>
																											<div class="checkbox">
																												<label class="text-success"> <input
																													type="checkbox" value=""
																													onclick="permission(this,cr32,cw32)" checked="checked">
																													<span class="cr"><i
																														class="cr-icon fa fa-check"></i></span> Grant
																												</label>
																											</div>
																										</td>
																										<td>
																											<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="c_setting32" id="cr32" value="1"
																													> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ
																												</label>
																											</div>
																										</td>
																										<td>
																											<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="c_setting32" id="cw32" value="2"
																													checked="checked"> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ/WRITE
																												</label>
																											</div>
																										</td>
																									</tr>
																									<tr>
																										<td>Management</td>
																										<td>
																											<div class="checkbox">
																												<label class="text-success"> <input
																													type="checkbox" value=""
																													onclick="permission(this,cr33,cw33)" checked="checked">
																													<span class="cr"><i
																														class="cr-icon fa fa-check"></i></span> Grant
																												</label>
																											</div>
																										</td>
																										<td>
																											<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="c_mgmt33" id="cr33" value="1"
																													> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ
																												</label>
																											</div>
																										</td>
																										<td>
																											<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="c_mgmt33" id="cw33" value="2"
																													checked="checked"> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ/WRITE
																												</label>
																											</div>
																										</td>
																									</tr>
																									<tr>
																										<td>Admission</td>
																										<td>
																											<div class="checkbox">
																												<label class="text-success"> <input
																													type="checkbox" value=""
																													onclick="permission(this,cr34,cw34)" checked="checked">
																													<span class="cr"><i
																														class="cr-icon fa fa-check"></i></span> Grant
																												</label>
																											</div>
																										</td>
																										<td>
																											<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="c_admission34" id="cr34" value="1"
																													> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ
																												</label>
																											</div>
																										</td>
																										<td>
																											<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="c_admission34" id="cw34" value="2"
																													checked="checked"> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ/WRITE
																												</label>
																											</div>
																										</td>
																									</tr>
																									<tr>
																										<td>Fee</td>
																										<td>
																										<div class="checkbox">
																												<label class="text-success"> <input
																													type="checkbox" value=""
																													onclick="permission(this,cr35,cw35)" checked="checked">
																													<span class="cr"><i
																														class="cr-icon fa fa-check"></i></span> Grant
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="c_fee35" id="cr35" value="1"
																													> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="c_fee35" id="cw35" value="2"
																													checked="checked"> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ/WRITE
																												</label>
																											</div>
																										</td>
																									</tr>
																									<tr>
																										<td>Attendance</td>
																										<td>
																										<div class="checkbox">
																												<label class="text-success"> <input
																													type="checkbox" value=""
																													onclick="permission(this,cr36,cw36)">
																													<span class="cr"><i
																														class="cr-icon fa fa-check"></i></span> Grant
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="c_attendance36" id="cr36" value="1"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="c_attendance36" id="cw36" value="2"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ/WRITE
																												</label>
																											</div>
																										</td>
																									</tr>
																									<tr>
																										<td>Exam</td>
																										<td>
																										<div class="checkbox">
																												<label class="text-success"> <input
																													type="checkbox" value=""
																													onclick="permission(this,cr37,cw37)">
																													<span class="cr"><i
																														class="cr-icon fa fa-check"></i></span> Grant
																												</label>
																											</div>
																										</td>
																										<td>
																											<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="c_exam37" id="cr37" value="1"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="c_exam37" id="cw37" value="2"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ/WRITE
																												</label>
																											</div>
																										</td>
																									</tr>
																									<tr>
																										<td>Teacher</td>
																										<td>
																										<div class="checkbox">
																												<label class="text-success"> <input
																													type="checkbox" value=""
																													onclick="permission(this,cr38,cw38)">
																													<span class="cr"><i
																														class="cr-icon fa fa-check"></i></span> Grant
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="c_teacher38" id="cr38" value="1"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="c_teacher38" id="cw38" value="2"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ/WRITE
																												</label>
																											</div>
																										</td>
																									</tr>
																									<tr>
																										<td>Register</td>
																										<td>
																										<div class="checkbox">
																												<label class="text-success"> <input
																													type="checkbox" value=""
																													onclick="permission(this,cr39,cw39)" checked="checked">
																													<span class="cr"><i
																														class="cr-icon fa fa-check"></i></span> Grant
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="c_register39" id="cr39" value="1"
																													> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="c_register39" id="cw39" value="2"
																													checked="checked"> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ/WRITE
																												</label>
																											</div>
																										</td>
																									</tr>
																									<tr>
																										<td>Cash Book</td>
																										<td>
																										<div class="checkbox">
																												<label class="text-success"> <input
																													type="checkbox" value=""
																													onclick="permission(this,cr40,cw40)" checked="checked">
																													<span class="cr"><i
																														class="cr-icon fa fa-check"></i></span> Grant
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="c_cashbook40" id="cr40" value="1"
																													> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="c_cashbook40" id="cw40" value="2"
																													checked="checked"> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ/WRITE
																												</label>
																											</div>
																										</td>
																									</tr>
																									<tr>
																										<td>Transport</td>
																										<td>
																										<div class="checkbox">
																												<label class="text-success"> <input
																													type="checkbox" value=""
																													onclick="permission(this,cr41,cw41)" checked="checked">
																													<span class="cr"><i
																														class="cr-icon fa fa-check"></i></span> Grant
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="c_transport41" id="cr41" value="1"
																													> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="c_transport41" id="cw41" value="2"
																													checked="checked"> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ/WRITE
																												</label>
																											</div>
																										</td>
																									</tr>
																									<tr>
																										<td>Salary</td>
																										<td>
																										<div class="checkbox">
																												<label class="text-success"> <input
																													type="checkbox" value=""
																													onclick="permission(this,cr42,cw42)">
																													<span class="cr"><i
																														class="cr-icon fa fa-check"></i></span> Grant
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="c_salary42" id="cr42" value="1"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="c_salary42" id="cw42" value="2"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ/WRITE
																												</label>
																											</div>
																										</td>
																									</tr>
																									<tr>
																										<td>Library</td>
																										<td>
																										<div class="checkbox">
																												<label class="text-success"> <input
																													type="checkbox" value=""
																													onclick="permission(this,cr43,cw43)">
																													<span class="cr"><i
																														class="cr-icon fa fa-check"></i></span> Grant
																												</label>
																											</div>
																										
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="c_library43" id="cr43" value="1"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="c_library43" id="cw43" value="2"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ/WRITE
																												</label>
																											</div>
																										</td>
																									</tr>
																									<tr>
																										<td>Other</td>
																										<td>
																										<div class="checkbox">
																												<label class="text-success"> <input
																													type="checkbox" value=""
																													onclick="permission(this,cr44,cw44)" checked="checked">
																													<span class="cr"><i
																														class="cr-icon fa fa-check"></i></span> Grant
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="c_other44" id="cr44" value="1"
																													> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="c_other44" id="cw44" value="2"
																													checked="checked"> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ/WRITE
																												</label>
																											</div>
																										</td>
																									</tr>
																									<tr>
																										<td>E-Message</td>
																										<td>
																										<div class="checkbox">
																												<label class="text-success"> <input
																													type="checkbox" value=""
																													onclick="permission(this,cr45,cw45)" checked="checked">
																													<span class="cr"><i
																														class="cr-icon fa fa-check"></i></span> Grant
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="c_emsg45" id="cr45" value="1"
																													> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="c_emsg45" id="cw45" value="2"
																													checked="checked"> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ/WRITE
																												</label>
																											</div>
																										</td>
																									</tr>

																								</tbody>
																							</table>
																						</div>
																					</div>
																				</div>
																				<!-- END SAMPLE TABLE PORTLET-->
																			</div>
														</div>
														<br>
														<ul class="pager wizard pager_a_cursor_pointer">
															<li class="previous previous_btn3"><a><i class="fa fa-long-arrow-left"></i> Previous</a></li>
															<li class="next next_btn3"><a>Next <i class="fa fa-long-arrow-right"></i></a></li>
														</ul>
													</div>

													<div class="tab-pane" id="tab41">
														<div class="row">
																<div class="col-lg-12">
																				<!-- BEGIN SAMPLE TABLE PORTLET-->
																				<div class="card m-t-35">
																					<div class="card-header bg-white">
																						<i class="fa fa-table"></i> Teacher
																					</div>
																					<div class="card-block">
																						<div class="table-responsive m-t-35">
																							<table
																								class="table table-striped table-bordered table-advance table-hover table_status_padding">
																								<thead>
																									<tr>
																										<th>Functionality</th>
																										<th>Give Access</th>
																										<th>Permissions</th>
																										<th>Actions</th>
																									</tr>
																								</thead>
																								<tbody>
																									<tr>
																										<td>Dashboard</td>
																										<td>
																											<div class="checkbox">
																												<label class="text-success"> <input
																													type="checkbox" value=""
																													onclick="permission(this,tr31,tw31)" checked="checked">
																													<span class="cr"><i
																														class="cr-icon fa fa-check"></i></span> Grant
																												</label>
																											</div>
																										</td>
																										<td>
																											<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="t_dash31" id="tr31" value="1"
																													> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ
																												</label>
																											</div>

																										</td>
																										<td>
																											<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="t_dash31" id="tw31" value="2"
																													checked="checked"> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>
																													READ/WRITE
																												</label>
																											</div>
																										</td>
																									</tr>
																									<tr>
																										<td>Setting</td>
																										<td>
																											<div class="checkbox">
																												<label class="text-success"> <input
																													type="checkbox" value=""
																													onclick="permission(this,tr32,tw32)">
																													<span class="cr"><i
																														class="cr-icon fa fa-check"></i></span> Grant
																												</label>
																											</div>
																										</td>
																										<td>
																											<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="t_setting32" id="tr32" value="1"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ
																												</label>
																											</div>
																										</td>
																										<td>
																											<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="t_setting32" id="tw32" value="2"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ/WRITE
																												</label>
																											</div>
																										</td>
																									</tr>
																									<tr>
																										<td>Management</td>
																										<td>
																											<div class="checkbox">
																												<label class="text-success"> <input
																													type="checkbox" value=""
																													onclick="permission(this,tr33,tw33)">
																													<span class="cr"><i
																														class="cr-icon fa fa-check"></i></span> Grant
																												</label>
																											</div>
																										</td>
																										<td>
																											<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="t_mgmt33" id="tr33" value="1"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ
																												</label>
																											</div>
																										</td>
																										<td>
																											<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="t_mgmt33" id="tw33" value="2"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ/WRITE
																												</label>
																											</div>
																										</td>
																									</tr>
																									<tr>
																										<td>Admission</td>
																										<td>
																											<div class="checkbox">
																												<label class="text-success"> <input
																													type="checkbox" value=""
																													onclick="permission(this,tr34,tw34)">
																													<span class="cr"><i
																														class="cr-icon fa fa-check"></i></span> Grant
																												</label>
																											</div>
																										</td>
																										<td>
																											<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="t_admission34" id="tr34" value="1"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ
																												</label>
																											</div>
																										</td>
																										<td>
																											<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="t_admission34" id="tw34" value="2"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ/WRITE
																												</label>
																											</div>
																										</td>
																									</tr>
																									<tr>
																										<td>Fee</td>
																										<td>
																										<div class="checkbox">
																												<label class="text-success"> <input
																													type="checkbox" value=""
																													onclick="permission(this,tr35,tw35)">
																													<span class="cr"><i
																														class="cr-icon fa fa-check"></i></span> Grant
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="t_fee35" id="tr35" value="1"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="t_fee35" id="tw35" value="2"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ/WRITE
																												</label>
																											</div>
																										</td>
																									</tr>
																									<tr>
																										<td>Attendance</td>
																										<td>
																										<div class="checkbox">
																												<label class="text-success"> <input
																													type="checkbox" value=""
																													onclick="permission(this,tr36,tw36)" checked="checked">
																													<span class="cr"><i
																														class="cr-icon fa fa-check"></i></span> Grant
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="t_attendance36" id="tr36" value="1"
																													> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ
																												</label>
																											</div>
																										</td>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="t_attendance36" id="tw36" value="2"
																													checked="checked"> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ/WRITE
																												</label>
																											</div>
																										</td>
																									</tr>
																									<tr>
																										<td>Exam</td>
																										<td>
																										<div class="checkbox">
																												<label class="text-success"> <input
																													type="checkbox" value=""
																													onclick="permission(this,tr37,tw37)" checked="checked">
																													<span class="cr"><i
																														class="cr-icon fa fa-check"></i></span> Grant
																												</label>
																											</div>
																										</td>
																										<td>
																											<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="t_exam37" id="tr37" value="1"
																													> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="t_exam37" id="tw37" value="2"
																													checked="checked"> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ/WRITE
																												</label>
																											</div>
																										</td>
																									</tr>
																									<tr>
																										<td>Teacher</td>
																										<td>
																										<div class="checkbox">
																												<label class="text-success"> <input
																													type="checkbox" value=""
																													onclick="permission(this,tr38,tw38)" checked="checked">
																													<span class="cr"><i
																														class="cr-icon fa fa-check"></i></span> Grant
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="t_teacher38" id="tr38" value="1"
																													checked="checked"> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="t_teacher38" id="tw38" value="2"
																													> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ/WRITE
																												</label>
																											</div>
																										</td>
																									</tr>
																									<tr>
																										<td>Register</td>
																										<td>
																										<div class="checkbox">
																												<label class="text-success"> <input
																													type="checkbox" value=""
																													onclick="permission(this,tr39,tw39)">
																													<span class="cr"><i
																														class="cr-icon fa fa-check"></i></span> Grant
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="t_register39" id="tr39" value="1"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="t_register39" id="tw39" value="2"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ/WRITE
																												</label>
																											</div>
																										</td>
																									</tr>
																									<tr>
																										<td>Cash Book</td>
																										<td>
																										<div class="checkbox">
																												<label class="text-success"> <input
																													type="checkbox" value=""
																													onclick="permission(this,tr40,tw40)">
																													<span class="cr"><i
																														class="cr-icon fa fa-check"></i></span> Grant
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="t_cashbook40" id="tr40" value="1"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="t_cashbook40" id="tw40" value="2"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ/WRITE
																												</label>
																											</div>
																										</td>
																									</tr>
																									<tr>
																										<td>Transport</td>
																										<td>
																										<div class="checkbox">
																												<label class="text-success"> <input
																													type="checkbox" value=""
																													onclick="permission(this,tr41,tw41)">
																													<span class="cr"><i
																														class="cr-icon fa fa-check"></i></span> Grant
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="t_transport41" id="tr41" value="1"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="t_transport41" id="tw41" value="2"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ/WRITE
																												</label>
																											</div>
																										</td>
																									</tr>
																									<tr>
																										<td>Salary</td>
																										<td>
																										<div class="checkbox">
																												<label class="text-success"> <input
																													type="checkbox" value=""
																													onclick="permission(this,tr42,tw42)">
																													<span class="cr"><i
																														class="cr-icon fa fa-check"></i></span> Grant
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="t_salary42" id="tr42" value="1"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="t_salary42" id="tw42" value="2"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ/WRITE
																												</label>
																											</div>
																										</td>
																									</tr>
																									<tr>
																										<td>Library</td>
																										<td>
																										<div class="checkbox">
																												<label class="text-success"> <input
																													type="checkbox" value=""
																													onclick="permission(this,tr43,tw43)">
																													<span class="cr"><i
																														class="cr-icon fa fa-check"></i></span> Grant
																												</label>
																											</div>
																										
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="t_library43" id="tr43" value="1"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="t_library43" id="tw43" value="2"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ/WRITE
																												</label>
																											</div>
																										</td>
																									</tr>
																									<tr>
																										<td>Other</td>
																										<td>
																										<div class="checkbox">
																												<label class="text-success"> <input
																													type="checkbox" value=""
																													onclick="permission(this,tr44,tw44)">
																													<span class="cr"><i
																														class="cr-icon fa fa-check"></i></span> Grant
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="t_other44" id="tr44" value="1"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="t_other44" id="tw44" value="2"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ/WRITE
																												</label>
																											</div>
																										</td>
																									</tr>
																									<tr>
																										<td>E-Message</td>
																										<td>
																										<div class="checkbox">
																												<label class="text-success"> <input
																													type="checkbox" value=""
																													onclick="permission(this,tr45,tw45)">
																													<span class="cr"><i
																														class="cr-icon fa fa-check"></i></span> Grant
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="t_emsg45" id="tr45" value="1"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="t_emsg45" id="tw45" value="2"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ/WRITE
																												</label>
																											</div>
																										</td>
																									</tr>
																								</tbody>
																							</table>
																						</div>
																					</div>
																				</div>
																				<!-- END SAMPLE TABLE PORTLET-->
																			</div>
														</div>
														<br>
														<ul class="pager wizard pager_a_cursor_pointer">
															<li class="previous previous_btn4"><a><i class="fa fa-long-arrow-left"></i> Previous</a></li>
															<li class="next next_btn4"><a>Next <i class="fa fa-long-arrow-right"></i></a></li>
														</ul>
													</div>

													<div class="tab-pane" id="tab51">
														<div class="row">
														<div class="col-lg-12">
																				<!-- BEGIN SAMPLE TABLE PORTLET-->
																				<div class="card m-t-35">
																					<div class="card-header bg-white">
																						<i class="fa fa-table"></i> Librarian
																					</div>
																					<div class="card-block">
																						<div class="table-responsive m-t-35">
																							<table
																								class="table table-striped table-bordered table-advance table-hover table_status_padding">
																								<thead>
																									<tr>
																										<th>Functionality</th>
																										<th>Give Access</th>
																										<th>Permissions</th>
																										<th>Actions</th>
																									</tr>
																								</thead>
																								<tbody>
																									<tr>
																										<td>Dashboard</td>
																										<td>
																											<div class="checkbox">
																												<label class="text-success"> <input
																													type="checkbox" value=""
																													onclick="permission(this,lr31,lw31)" checked="checked">
																													<span class="cr"><i
																														class="cr-icon fa fa-check"></i></span> Grant
																												</label>
																											</div>
																										</td>
																										<td>
																											<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="l_dash31" id="lr31" value="1"
																													> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ
																												</label>
																											</div>

																										</td>
																										<td>
																											<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="l_dash31" id="lw31" value="2"
																													checked="checked"> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>
																													READ/WRITE
																												</label>
																											</div>
																										</td>
																									</tr>
																									<tr>
																										<td>Setting</td>
																										<td>
																											<div class="checkbox">
																												<label class="text-success"> <input
																													type="checkbox" value=""
																													onclick="permission(this,lr32,lw32)">
																													<span class="cr"><i
																														class="cr-icon fa fa-check"></i></span> Grant
																												</label>
																											</div>
																										</td>
																										<td>
																											<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="l_setting32" id="lr32" value="1"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ
																												</label>
																											</div>
																										</td>
																										<td>
																											<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="l_setting32" id="lw32" value="2"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ/WRITE
																												</label>
																											</div>
																										</td>
																									</tr>
																									<tr>
																										<td>Management</td>
																										<td>
																											<div class="checkbox">
																												<label class="text-success"> <input
																													type="checkbox" value=""
																													onclick="permission(this,lr33,lw33)">
																													<span class="cr"><i
																														class="cr-icon fa fa-check"></i></span> Grant
																												</label>
																											</div>
																										</td>
																										<td>
																											<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="l_mgmt33" id="lr33" value="1"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ
																												</label>
																											</div>
																										</td>
																										<td>
																											<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="l_mgmt33" id="lw33" value="2"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ/WRITE
																												</label>
																											</div>
																										</td>
																									</tr>
																									<tr>
																										<td>Admission</td>
																										<td>
																											<div class="checkbox">
																												<label class="text-success"> <input
																													type="checkbox" value=""
																													onclick="permission(this,lr34,lw34)">
																													<span class="cr"><i
																														class="cr-icon fa fa-check"></i></span> Grant
																												</label>
																											</div>
																										</td>
																										<td>
																											<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="l_admission34" id="lr34" value="1"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ
																												</label>
																											</div>
																										</td>
																										<td>
																											<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="l_admission34" id="lw34" value="2"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ/WRITE
																												</label>
																											</div>
																										</td>
																									</tr>
																									<tr>
																										<td>Fee</td>
																										<td>
																										<div class="checkbox">
																												<label class="text-success"> <input
																													type="checkbox" value=""
																													onclick="permission(this,lr35,lw35)">
																													<span class="cr"><i
																														class="cr-icon fa fa-check"></i></span> Grant
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="l_fee35" id="lr35" value="1"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="l_fee35" id="lw35" value="2"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ/WRITE
																												</label>
																											</div>
																										</td>
																									</tr>
																									<tr>
																										<td>Attendance</td>
																										<td>
																										<div class="checkbox">
																												<label class="text-success"> <input
																													type="checkbox" value=""
																													onclick="permission(this,lr36,lw36)">
																													<span class="cr"><i
																														class="cr-icon fa fa-check"></i></span> Grant
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="l_attendance36" id="lr36" value="1"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ
																												</label>
																											</div>
																										</td>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="l_attendance36" id="lw36" value="2"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ/WRITE
																												</label>
																											</div>
																										</td>
																									</tr>
																									<tr>
																										<td>Exam</td>
																										<td>
																										<div class="checkbox">
																												<label class="text-success"> <input
																													type="checkbox" value=""
																													onclick="permission(this,lr37,lw37)">
																													<span class="cr"><i
																														class="cr-icon fa fa-check"></i></span> Grant
																												</label>
																											</div>
																										</td>
																										<td>
																											<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="l_exam37" id="lr37" value="1"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="l_exam37" id="lw37" value="2"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ/WRITE
																												</label>
																											</div>
																										</td>
																									</tr>
																									<tr>
																										<td>Teacher</td>
																										<td>
																										<div class="checkbox">
																												<label class="text-success"> <input
																													type="checkbox" value=""
																													onclick="permission(this,lr38,lw38)">
																													<span class="cr"><i
																														class="cr-icon fa fa-check"></i></span> Grant
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="l_teacher38" id="lr38" value="1"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="l_teacher38" id="lw38" value="2"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ/WRITE
																												</label>
																											</div>
																										</td>
																									</tr>
																									<tr>
																										<td>Register</td>
																										<td>
																										<div class="checkbox">
																												<label class="text-success"> <input
																													type="checkbox" value=""
																													onclick="permission(this,lr39,lw39)">
																													<span class="cr"><i
																														class="cr-icon fa fa-check"></i></span> Grant
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="l_register39" id="lr39" value="1"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="l_register39" id="lw39" value="2"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ/WRITE
																												</label>
																											</div>
																										</td>
																									</tr>
																									<tr>
																										<td>Cash Book</td>
																										<td>
																										<div class="checkbox">
																												<label class="text-success"> <input
																													type="checkbox" value=""
																													onclick="permission(this,lr40,lw40)">
																													<span class="cr"><i
																														class="cr-icon fa fa-check"></i></span> Grant
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="l_cashbook40" id="lr40" value="1"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="l_cashbook40" id="lw40" value="2"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ/WRITE
																												</label>
																											</div>
																										</td>
																									</tr>
																									<tr>
																										<td>Transport</td>
																										<td>
																										<div class="checkbox">
																												<label class="text-success"> <input
																													type="checkbox" value=""
																													onclick="permission(this,lr41,lw41)">
																													<span class="cr"><i
																														class="cr-icon fa fa-check"></i></span> Grant
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="l_transport41" id="lr41" value="1"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="l_transport41" id="lw41" value="2"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ/WRITE
																												</label>
																											</div>
																										</td>
																									</tr>
																									<tr>
																										<td>Salary</td>
																										<td>
																										<div class="checkbox">
																												<label class="text-success"> <input
																													type="checkbox" value=""
																													onclick="permission(this,lr42,lw42)">
																													<span class="cr"><i
																														class="cr-icon fa fa-check"></i></span> Grant
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="l_salary42" id="lr42" value="1"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="l_salary42" id="lw42" value="2"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ/WRITE
																												</label>
																											</div>
																										</td>
																									</tr>
																									<tr>
																										<td>Library</td>
																										<td>
																										<div class="checkbox">
																												<label class="text-success"> <input
																													type="checkbox" value=""
																													onclick="permission(this,lr43,lw43)" checked="checked">
																													<span class="cr"><i
																														class="cr-icon fa fa-check"></i></span> Grant
																												</label>
																											</div>
																										
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="l_library43" id="lr43" value="1"
																													> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="l_library43" id="lw43" value="2"
																													checked="checked"> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ/WRITE
																												</label>
																											</div>
																										</td>
																									</tr>
																									<tr>
																										<td>Other</td>
																										<td>
																										<div class="checkbox">
																												<label class="text-success"> <input
																													type="checkbox" value=""
																													onclick="permission(this,lr44,lw44)">
																													<span class="cr"><i
																														class="cr-icon fa fa-check"></i></span> Grant
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="l_other44" id="lr44" value="1"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="l_other44" id="lw44" value="2"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ/WRITE
																												</label>
																											</div>
																										</td>
																									</tr>
																									<tr>
																										<td>E-Message</td>
																										<td>
																										<div class="checkbox">
																												<label class="text-success"> <input
																													type="checkbox" value=""
																													onclick="permission(this,lr45,lw45)">
																													<span class="cr"><i
																														class="cr-icon fa fa-check"></i></span> Grant
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="l_emsg45" id="lr45" value="1"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ
																												</label>
																											</div>
																										</td>
																										<td>
																										<div class="radio">
																												<label class="text-success"> <input
																													type="radio" name="l_emsg45" id="lw45" value="2"
																													disabled> <span class="cr"><i
																														class="cr-icon fa fa-circle"></i></span>READ/WRITE
																												</label>
																											</div>
																										</td>
																									</tr>
																								</tbody>
																							</table>
																						</div>
																					</div>
																				</div>
																				<!-- END SAMPLE TABLE PORTLET-->
																			</div>
														
														</div>
														<br>
														<ul class="pager wizard pager_a_cursor_pointer">
															<li class="previous previous_btn5"><a><i class="fa fa-long-arrow-left"></i> Previous</a></li>
															<li class="next pull-right"><button type="submit" class="btn btn-success  button-rounded">Finish</button></li>
														</ul>
													</div>
												</div>
											
										</div>
										</form>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
				<!-- /.inner -->
				<!-- Modal -->
				<div class="modal fade" id="search_modal" tabindex="-1"
					role="dialog" aria-hidden="true">
					<form>
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span class="float-right" aria-hidden="true">&times;</span>
								</button>
								<div class="input-group search_bar_small">
									<input type="text" class="form-control" placeholder="Search..."
										name="search"> <span class="input-group-btn">
										<button class="btn btn-secondary" type="submit">
											<i class="fa fa-search"></i>
										</button>
									</span>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
			<!-- /.outer -->
		</div>
		<!-- /#content -->
		<!--wrapper-->
		<div id="request_list">
			<div class="request_scrollable">
				<ul class="nav nav-tabs m-t-15">
					<li class="nav-item"><a class="nav-link active text-center"
						href="#settings" data-toggle="tab">Settings</a></li>
					<li class="nav-item"><a class="nav-link text-center"
						href="#favourites" data-toggle="tab">Favorites</a></li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="settings">
						<div id="settings_section">
							<div class="layout_styles mx-3">
								<div class="row">
									<div class="col-12 m-t-35">
										<h4>Layout settings</h4>
									</div>
								</div>
								<form autocomplete="off">
									<div class="row">
										<div class="col-12">
											<div class="float-left m-t-20">Fixed Header</div>
											<div class="float-right m-t-15">
												<div id="setting_fixed_nav">
													<input class="make-switch" data-on-text="ON"
														data-off-text="OFF" type="checkbox" data-size="small">
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-12">
											<div class="float-left m-t-20">Fixed Menu</div>
											<div class="float-right m-t-15">
												<div id="setting_fixed_menunav">
													<input class="make-switch" data-on-text="ON"
														data-off-text="OFF" name="radioBox" type="checkbox"
														data-size="small">
												</div>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-12">
											<div class="float-left m-t-20">No Breadcrumb</div>
											<div class="float-right m-t-15">
												<div id="setting_breadcrumb">
													<input class="make-switch" data-on-text="ON"
														data-off-text="OFF" type="checkbox" data-size="small">
												</div>
											</div>
										</div>
									</div>
								</form>
							</div>
							<div class="mx-3">
								<div class="row">
									<div class="col-12 m-t-35">
										<h4 class="setting_title">General Settings</h4>
									</div>
								</div>
								<div class="data m-t-5">
									<div class="row">
										<div class="col-2">
											<i class="fa fa-bell-o setting_ions text-info"></i>
										</div>
										<div class="col-7">
											<span class="chat_name">Notifications</span><br /> Get new
											notifications
										</div>
										<div class="col-2 checkbox float-right">
											<label class="text-info"> <input type="checkbox"
												value="" checked> <span class="cr"><i
													class="cr-icon fa fa-check"></i></span>
											</label>
										</div>
									</div>
								</div>
								<div class="data">
									<div class="row">
										<div class="col-2">
											<i class="fa fa-envelope-o setting_ions text-danger"></i>
										</div>
										<div class="col-7">
											<span class="chat_name">Messages</span><br /> Get new
											messages
										</div>
										<div class="col-2 checkbox float-right">
											<label class="text-danger"> <input type="checkbox"
												value="" checked> <span class="cr"><i
													class="cr-icon fa fa-check"></i></span>
											</label>
										</div>
									</div>
								</div>
								<div class="data">
									<div class="row">
										<div class="col-2">
											<i
												class="fa fa-exclamation-triangle setting_ions text-warning"></i>
										</div>
										<div class="col-7">
											<span class="chat_name">Warnings</span><br /> Get new
											warnings
										</div>
										<div class="col-2 checkbox float-right">
											<label class="text-warning"> <input type="checkbox"
												value="" checked> <span class="cr"><i
													class="cr-icon fa fa-check"></i></span>
											</label>
										</div>
									</div>
								</div>
								<div class="data">
									<div class="row">
										<div class="col-2">
											<i
												class="fa fa-calendar texlayout_stylest-primary setting_ions"></i>
										</div>
										<div class="col-7">
											<span class="chat_name">Events</span><br /> Show new events
										</div>
										<div class="col-2 checkbox float-right">
											<label class="text-primary"> <input type="checkbox"
												value=""> <span class="cr"><i
													class="cr-icon fa fa-check"></i></span>
											</label>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="tab-pane" id="favourites">
						<div id="requests" class="mx-3">
							<div class="m-t-35">
								<h4 class="setting_title">Favorites</h4>
							</div>
							<div class="data m-t-10">
								<div class="row">
									<div class="col-2">
										<img src="img/images1.jpg.pagespeed.ce.ZjizKiH_lW.jpg"
											class="message-img avatar rounded-circle" alt="avatar1">
									</div>
									<div class="col-8 message-data">
										<span class="chat_name">Philip J. Webb</span><br /> Available
									</div>
									<div class="col-1">
										<i class="fa fa-circle text-success"></i>
									</div>
								</div>
							</div>
							<div class="data">
								<div class="row">
									<div class="col-2">
										<img src="img/mailbox_imgs/x8.jpg.pagespeed.ic.bPiulp28ba.jpg"
											class="message-img avatar rounded-circle" alt="avatar1">
									</div>
									<div class="col-8 message-data">
										<span class="chat_name">Nancy T. Strozier</span><br /> Away
									</div>
									<div class="col-1">
										<i class="fa fa-circle text-warning"></i>
									</div>
								</div>
							</div>
							<div class="data">
								<div class="row">
									<div class="col-2">
										<img src="img/mailbox_imgs/3.jpg.pagespeed.ce.GkpJFgsHKa.jpg"
											class="message-img avatar rounded-circle" alt="avatar1">
									</div>
									<div class="col-8 message-data">
										<span class="chat_name">Robbinson</span><br /> Offline
									</div>
									<div class="col-1">
										<i class="fa fa-circle"></i>
									</div>
								</div>
							</div>
							<h4 class="setting_title">Contacts</h4>
							<div class="data m-t-10">
								<div class="row">
									<div class="col-2">
										<img src="img/mailbox_imgs/x7.jpg.pagespeed.ic.G41SvoerA2.jpg"
											class="message-img avatar rounded-circle" alt="avatar1">
									</div>
									<div class="col-8 message-data">
										<span class="chat_name">Chester Hardesty</span><br /> Busy
									</div>
									<div class="col-1">
										<i class="fa fa-circle text-warning"></i>
									</div>
								</div>
							</div>
							<div class="data">
								<div class="row">
									<div class="col-2">
										<img src="img/mailbox_imgs/2.jpg.pagespeed.ce.ldYVRVirTH.jpg"
											class="message-img avatar rounded-circle" alt="avatar1">
									</div>
									<div class="col-8 message-data">
										<span class="chat_name">Peter</span><br /> Online
									</div>
									<div class="col-1">
										<i class="fa fa-circle text-warning"></i>
									</div>
								</div>
							</div>
							<div class="data">
								<div class="row">
									<div class="col-2">
										<img src="img/mailbox_imgs/x6.jpg.pagespeed.ic.s8HpGucA66.jpg"
											class="message-img avatar rounded-circle" alt="avatar1">
									</div>
									<div class="col-8 message-data">
										<span class="chat_name">Devin Hartsell</span><br /> Available
									</div>
									<div class="col-1">
										<i class="fa fa-circle text-success"></i>
									</div>
								</div>
							</div>
							<div class="data">
								<div class="row">
									<div class="col-2">
										<img src="img/mailbox_imgs/x4.jpg.pagespeed.ic.Sf2RIV1O7k.jpg"
											class="message-img avatar rounded-circle" alt="avatar1">
									</div>
									<div class="col-8 message-data">
										<span class="chat_name">Kimy Zorda</span><br /> Available
									</div>
									<div class="col-1">
										<i class="fa fa-circle text-success"></i>
									</div>
								</div>
							</div>
							<div class="data">
								<div class="row">
									<div class="col-2">
										<img src="img/mailbox_imgs/5.jpg.pagespeed.ce.KlL6qXiRI3.jpg"
											class="message-img avatar rounded-circle" alt="avatar1">
									</div>
									<div class="col-8 message-data">
										<span class="chat_name">Jessica Bell</span><br /> Offline
									</div>
									<div class="col-1">
										<i class="fa fa-circle"></i>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /#content -->
		<div id="right">
			<div class="right_content">
				<div class="well-small dark m-t-15">
					<div class="row m-0">
						<div class="col-lg-12 p-d-0">
							<div class="skinmulti_btn"
								onclick="javascript:loadjscssfile('blue_black_skin.html','css')">
								<div class="skin_blue skin_size b_t_r"></div>
								<div class="skin_blue_border skin_shaddow skin_size b_b_r"></div>
							</div>
							<div class="skinmulti_btn"
								onclick="javascript:loadjscssfile('green_black_skin.html','css')">
								<div class="skin_green skin_size b_t_r"></div>
								<div class="skin_green_border skin_shaddow skin_size b_b_r"></div>
							</div>
							<div class="skinmulti_btn"
								onclick="javascript:loadjscssfile('purple_black_skin.html','css')">
								<div class="skin_purple skin_size b_t_r"></div>
								<div class="skin_purple_border skin_shaddow skin_size b_b_r"></div>
							</div>
							<div class="skinmulti_btn"
								onclick="javascript:loadjscssfile('orange_black_skin.html','css')">
								<div class="skin_orange skin_size b_t_r"></div>
								<div class="skin_orange_border skin_shaddow skin_size b_b_r"></div>
							</div>
							<div class="skinmulti_btn"
								onclick="javascript:loadjscssfile('red_black_skin.html','css')">
								<div class="skin_red skin_size b_t_r"></div>
								<div class="skin_red_border skin_shaddow skin_size b_b_r"></div>
							</div>
							<div class="skinmulti_btn"
								onclick="javascript:loadjscssfile('mint_black_skin.html','css')">
								<div class="skin_mint skin_size b_t_r"></div>
								<div class="skin_mint_border skin_shaddow skin_size b_b_r"></div>
							</div>
							<!--</div>-->
							<div
								class="skin_btn skinsingle_btn skin_blue b_r height_40 skin_shaddow"
								onclick="javascript:loadjscssfile('blue_skin.html','css')"></div>
							<div
								class="skin_btn skinsingle_btn skin_green b_r height_40 skin_shaddow"
								onclick="javascript:loadjscssfile('green_skin.html','css')"></div>
							<div
								class="skin_btn skinsingle_btn skin_purple b_r height_40 skin_shaddow"
								onclick="javascript:loadjscssfile('purple_skin.html','css')"></div>
							<div
								class="skin_btn  skinsingle_btn skin_orange b_r height_40 skin_shaddow"
								onclick="javascript:loadjscssfile('orange_skin.html','css')"></div>
							<div
								class="skin_btn skinsingle_btn skin_red b_r height_40 skin_shaddow"
								onclick="javascript:loadjscssfile('red_skin.html','css')"></div>
							<div
								class="skin_btn skinsingle_btn skin_mint b_r height_40 skin_shaddow"
								onclick="javascript:loadjscssfile('mint_skin.html','css')"></div>
						</div>
						<div class="col-lg-12 text-center m-t-15">
							<button class="btn btn-dark button-rounded"
								onclick="javascript:loadjscssfile('black_skin.html','css')">Dark
							</button>
							<button class="btn btn-secondary button-rounded default_skin"
								onclick="javascript:loadjscssfile('default_skin.html','css')">Default
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- # right side -->
	</div>
	<!-- /#wrap -->
	<!-- global scripts-->
	<script type="text/javascript">
		function addFields(val) {
			// Container <div> where dynamic content will be placed
			var container = document.getElementById("container");

			var check = document.getElementById("check");

			var user = document.getElementById("userName");

			var pass = document.getElementById("principalPass");

			// Clear previous contents of the container
			while (container.hasChildNodes()) {
				container.removeChild(container.lastChild);

			}
			var count = 1;
			var checkString = "";
			var margin = 10;
			for (var i = 0; i < val; i++) {

				//school name input texts
				var input = document.createElement("input");
				var br = document.createElement('br');
				var br1 = document.createElement('br');
				input.type = "text";
				input.name = "sName" + i;
				input.placeholder = "School Name " + count;
				input.required = true;
				container.appendChild(input);
				container.appendChild(br);
				container.appendChild(br1);

				// for generating checkbox  
				checkString = checkString
						+ "<div id='checkContain"+count+"'><div class='checkbox' style='margin-top: "+margin+"px;margin-left: 30px;'>"
						+ "<label class='text-success'>"
						+ "<input type='checkbox' value='' id='checkBox"
						+ count
						+ "' onclick='upass("
						+ count
						+ ",this)'>"
						+ "<span class='cr'><i class='cr-icon fa fa-check'></i></span>"
						+ "</label></div><div><br>";

				//for generating username password input text
				var userName = document.createElement("input");
				var br2 = document.createElement('br');
				var br3 = document.createElement('br');
				userName.type = "text";
				userName.name = "pUName" + count;
				userName.id = "pUName" + count;
				userName.disabled = true;
				userName.placeholder = "User Name " + count;
				userName.required = true;
				user.appendChild(userName);
				user.appendChild(br2);
				user.appendChild(br3);

				var password = document.createElement("input");
				var br4 = document.createElement('br');
				var br5 = document.createElement('br');
				password.type = "password";
				password.disabled = true;
				password.name = "pUPass" + count;
				password.id = "pUPass" + count;
				password.placeholder = "Password " + count;
				password.required = true;
				pass.appendChild(password);
				pass.appendChild(br4);
				pass.appendChild(br5);

				count++;
				if (count == 1) {
					margin = 8;
				} else if (count == 4) {
					margin = 10;
				} else if (count == 5) {
					margin = 8;
				}
			}
			check.innerHTML = checkString;
		}

		var margin = 0;
		function upass(val, id) {
			//disable or enable username and password input text as per checkbox checked value
			var pass = document.getElementById("pass");
			if ($(id).is(":checked")) {
				document.getElementById("pUName" + val).disabled = false;
				document.getElementById("pUPass" + val).disabled = false;
			} else {
				document.getElementById("pUName" + val).disabled = true;
				document.getElementById("pUPass" + val).disabled = true;
			}

		}

		function permission(id, radioReadId, radioWriteId) {
			//enabling permissions radio buttons
			if ($(id).is(":checked")) {
				radioReadId.disabled = false;
				radioWriteId.disabled = false;
			} else {
				radioReadId.disabled = true;
				radioWriteId.disabled = true;
			}
		}
	</script>

	<script type="text/javascript"
		src="/SMGMT/config/js/components.js.pagespeed.jm.vxV3GQYFro.js"></script>
	<script type="text/javascript"
		src="/SMGMT/config/js/custom.js.pagespeed.jm.CN8Ow3CJOG.js"></script>
	<!-- end of global scripts-->
	<!--Plugin scripts-->
	<script type="text/javascript"
		src="/SMGMT/config/vendors/bootstrapvalidator/js/bootstrapValidator.min.js.pagespeed.jm.YU3KUlvaHb.js"></script>
	<script type="text/javascript"
		src="/SMGMT/config/vendors/twitter-bootstrap-wizard/js/jquery.bootstrap.wizard.min.js.pagespeed.jm.tzmsKdGb4M.js"></script>
	<!--End of plugin scripts-->
	<!--Page level scripts-->
	<script type="text/javascript"
		src="/SMGMT/config/js/pages/wizard.js.pagespeed.jm.juRn4yCd2v.js"></script>
	<!-- end page level scripts -->
</body>
</html>