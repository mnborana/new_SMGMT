<%@page import="com.servletStore.library.model.IssueBookPOJO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.servletStore.library.model.BookCatPOJO"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.servletStore.library.model.BookCatImpl"%>
<%@page import="com.servletStore.library.model.BookDAO"%>
<%@page import="com.servletStore.library.model.AddBookImpl"%>
<%@page import="com.servletStore.library.model.AddBookDAO"%>
<%@page import="com.servletStore.library.model.AddBookPOJO"%>
<%@page import="java.util.List"%>
<%@page import=" utility.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>Form Validations | Admire</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <link rel="shortcut icon" -->
<!-- 	href="/SMGMT/config/img/xlogo1.ico.pagespeed.ic.ONh6qx31g4.html" /> -->
<!-- <link rel="shortcut icon" -->
<!-- 	href="/SMGMT/config/img/xlogo1.ico.pagespeed.ic.ONh6qx31g4.html" /> -->
<!-- <!--     global styles --> -->
<!-- <link type="text/css" rel="stylesheet" -->
<!-- 	href="/SMGMT/config/css,_components.css+css,_custom.css+vendors,_jquery-validation-engine,_css,_validationEngine.jquery.css+vendors,_datepicker,_css,_bootstrap-datepicker.min.css+vendors,_datepicker,_css" /> -->
<!-- <link type="text/css" rel="stylesheet" -->
<!-- 	href="/SMGMT/config/css,_components.css+css,_custom.css+vendors,_select2,_css,_select2.min.css+css,_pages,_dataTables.bootstrap.css+css,_pages,_tables.css.pagespeed.cc._6lRWz19bZ.css" /> -->
<!-- <link type="text/css" rel="stylesheet" -->
<!-- 	href="/SMGMT/config/css,_components.css+css,_custom.css+vendors,_inputlimiter,_css,_jquery.inputlimiter.css+vendors,_bootstrap-colorpicker,_css,_bootstrap-colorpicker.min.css+vendors,_jquery-tagsinput,_c" /> -->
<!-- <link type="text/css" rel="stylesheet" -->
<!-- 	href="/SMGMT/config/css,_components.css+css,_custom.css+vendors,_izitoast,_css,_iziToast.min.css.pagespeed.cc.hUh8XIbhbe.css" /> -->
<%--    <jsp:include page="/View/common/commonCss.jsp"></jsp:include> --%>
<!-- end of global styles-->
<jsp:include page="/View/common/commonCss.jsp"></jsp:include>
</head>
<body onload="myFunction()">
	
	<% SysDate date=new SysDate();%>
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
						<div class="col-sm-5 col-lg-6">
							<h4 class="nav_top_align">
								<i class="fa fa-pencil"></i> Issue Book Details
							</h4>
						</div>
						<div class="col-sm-7 col-lg-6">
							<ol class="breadcrumb float-right nav_breadcrumb_top_align">
								<li class="breadcrumb-item"><a href="index1.html"> <i
										class="fa fa-home" data-pack="default" data-tags=""></i>
										Dashboard
								</a></li>
								<li class="breadcrumb-item"><a href="#">Library</a></li>
								<li class="active breadcrumb-item">Issue Books</li>
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
										<i class="fa fa-file-text-o"></i> Book Issue
									</div>
									<div class="card-block" id="tab">
										<ul class="nav nav-tabs m-t-35">
											<li class="nav-item"><a class="nav-link active" href="#bookList" data-toggle="tab">Issue Book</a></li>
											<li class="nav-item" id="themify_icon"><a class="nav-link" href="#issuedList" data-toggle="tab">Issued List</a></li>
											<li class="nav-item" id="themify_icon"><a class="nav-link" href="#bookReturn" data-toggle="tab">Book Return</a></li>
										</ul>
										<div class="tab-content">
<!--====================================================== First Tab================================================================================ -->
											<div class="tab-pane active" id="bookList">
												<div class="row">
													<div class="col-12">
														<div class="col-lg-8 m-t-20">
															<form action="/SMGMT/Library"
																class="form-horizontal  login_validator"
																id="form_block_validator">
																<div class="form-group row">
																	<div class="col-lg-8">
																		<!-- Search Book from here     ------- -->
																		<input type="text" list="browseBook"
																			autocomplete="off"
																			onkeyup="getbookdetails(this.value)"
																			class="form-control" id="searchtext"
																			name="searchBook"
																			placeholder="Search Books by BookId/BookName/AuthorName">
																		<datalist id="browseBook"> </datalist>
																	</div>
																</div>

																<div class="form-group row">
																	<div class="col-lg-8 ">
																		<label for="required2" class="col-form-label">User
																			Type *</label>
																		<div class="controls">
																			<input type="radio" value="Student"
																				style="margin-left: 1%;" name="userType"
																				id="userType" onclick="searchDetails(this.value)"
																				checked="checked"> Student <input
																				type="radio" value="Teacher"
																				style="margin-left: 1%;" name="userType"
																				id="userType" onclick="searchDetails(this.value)">
																			Teacher
																		</div>
																	</div>
																</div>
																<!-- Search stud from here     ----- -->
																<div class="form-group row" id="stud"
																	style="display: block">
																	<div class="col-lg-8">
																		<input type="hidden" name="studId" id="stud_Id">
																		<input type="text" list="browseStud"
																			autocomplete="off"
																			onkeyup="getstuddetails(this.value)"
																			oninput="getStudId(this.value)" class="form-control"
																			id="searchStud" name="searchStud"
																			placeholder="Search Student by Id/Name">
																		<datalist id="browseStud"> </datalist>
																	</div>
																</div>
																<div class="form-group row" id="teacher"
																	style="display: none;">
																	<div class="col-lg-8">
																		<input type="text" list="browseStud"
																			autocomplete="off"
																			onkeyup="getstuddetails(this.value)"
																			class="form-control" id="searchTeacher"
																			name="searchTeacher"
																			placeholder="Search Teacher by Id/Name">
																		<datalist id="browseStud"> </datalist>
																	</div>
																</div>
																<div class="form-group row">
																	<div class="col-lg-8">
																		<label class="col-form-label">Book Issue Date
																			*</label> <input type="text" id="date"
																			class="form-control form_val_popup_dp3"
																			name="issueDate" value="<%=date.todayDate() %>"
																			placeholder="YYYY-MM-DD" />
																	</div>
																</div>
																<div class="form-group row">
																	<div class="col-lg-8">
																		<label class="col-form-label">Book Due Date *</label>
																		<input type="text" id="date" class="form-control form_val_popup_dp3" name="dueDate" placeholder="YYYY-MM-DD" />
																	</div>
																</div>
																<div class="form-actions form-group row">
																	<div class="col-lg-8">
																		<input type="submit" id="btnSubmit" value="Save Book" name="issuebook" class="btn btn-primary">
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
												<!-- Book Table -->
												<div class="outer">
													<div class="inner bg-container">
														<div class="card">
															<div class="card-header bg-white">Issued Books List
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
																					<th class="sorting_asc wid-10" tabindex="0"
																						rowspan="1" colspan="1">Sr.No</th>
																					<th class="sorting wid-10" tabindex="0" rowspan="1"
																						colspan="1">User Type</th>
																					<th class="sorting wid-10" tabindex="0" rowspan="1"
																						colspan="1">User Name</th>
																					<!-- <th class="sorting wid-20" tabindex="0" rowspan="1" colspan="1">Book NO</th> -->
																					<th class="sorting wid-25" tabindex="0" rowspan="1"
																						colspan="1">Book Name</th>
																					<th class="sorting wid-10" tabindex="0" rowspan="1"
																						colspan="1">Issue Date</th>
																					<th class="sorting wid-20" tabindex="0" rowspan="1"
																						colspan="1">Due Date</th>
																				</tr>
																			</thead>
																			<tbody>
																				<%
                                       		 		AddBookDAO dao=new AddBookImpl();
                                       		 	//	System.out.print("***"+dao.getIssueBookDetails());
                                       		 		request.setAttribute("display_book", dao.getIssueBookDetails());
                                       		 		int bookCount=0;
                                       		 	%>
																				<c:forEach items="${display_book}" var="d">
																					<tr role="row" class="even">

																						<td><%=(++bookCount) %></td>
																						<c:if test="${d.studName!=null }">
																							<td><c:out value="Student"></c:out></td>
																							<td><c:out value="${d.studName}"></c:out></td>
																						</c:if>
																						<c:if test="${d.staffName!=null }">
																							<td><c:out value="Teacher"></c:out></td>
																							<td><c:out value="${d.staffName}"></c:out></td>
																						</c:if>
																						<td><c:out value="${d.bookName}"></c:out></td>
																						<td><c:out value="${d.issueDate}"></c:out></td>
																						<td><c:out value="${d.dueDate}"></c:out></td>

																						<%-- 	 <td>
                                            			<a class="edit" data-placement="top" title="Edit" href="#update" data-toggle="modal" onclick="loadDoc(${d.getBookNo()})"><i class="fa fa-pencil text-warning"></i></a>&nbsp; &nbsp;
                                            			<a class="delete hidden-xs hidden-sm" data-toggle="tooltip" data-placement="top" title="Delete" href="/SMGMT/Library?bookNo=${d.getBookNo()}"><i class="fa fa-trash text-danger"></i></a>
                                            			</td>  --%>
																					</tr>
																				</c:forEach>
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
												<!-- /outer -->
											</div>

<!-- ============================================= Second Tab =================================================================================== -->
											<div class="tab-pane" id="issuedList">
												<div class="row">
													<div class="col-12">
													<div class="row">
																			<div class="col-lg-4 input_field_sections float-right">
																				<form>
																					<div class="input-group">
																						<span class="input-group-addon"> <i
																							class="fa fa-calendar"></i>
																						</span> <input type="text" class="form-control"
																							id="reportrange"
																							onchange="getExpData(this.value)"
																							placeholder="dd/mm/yyyy-dd/mm/yyyy">
																					</div>
																				</form>
																			</div>
																			</div>
																			<div class="row">
																			<div class="outer">
													<div class="inner bg-container">
														<div class="card">
															<div class="card-header bg-white">Issued Books List
															</div>
															<div class="card-block m-t-35" id="user_body">
																<div class="table-toolbar">
																	<div class="btn-group float-right users_grid_tools">
																		<div class="tools"></div>
																	</div>
																</div>
																<div>
																	<div>
																			<table
																				class="table  table-striped table-bordered table-hover dataTable no-footer" id="editable_table2" role="grid">
																				<thead>
																					<tr role="row">
																						<th class="sorting_asc wid-10" tabindex="0"
																							rowspan="1" colspan="1">Sr.No</th>
																						<th class="sorting wid-10" tabindex="0"
																							rowspan="1" colspan="1">User Type</th>
																						<th class="sorting wid-10" tabindex="0"
																							rowspan="1" colspan="1">User Name</th>
																						<!-- <th class="sorting wid-20" tabindex="0" rowspan="1" colspan="1">Book NO</th> -->
																						<th class="sorting wid-25" tabindex="0"
																							rowspan="1" colspan="1">Book Name</th>
																						<th class="sorting wid-10" tabindex="0"
																							rowspan="1" colspan="1">Issue Date</th>
																						<th class="sorting wid-20" tabindex="0"
																							rowspan="1" colspan="1">Due Date</th>
																					</tr>
																				</thead>
																				<tbody id="displayDate">
																					<%
                                       		 		AddBookDAO dao1=new AddBookImpl();
                                       		 	//	System.out.print("***"+dao.getIssueBookDetails());
                                       		 		request.setAttribute("display_book", dao1.getIssueBookDetails());
                                       		 		int bookCount1=0;
                                       		 	%>
																					<c:forEach items="${display_book}" var="d">
																						<tr role="row" class="even">

																							<td><%=(++bookCount1) %></td>
																							<c:if test="${d.studName!=null }">
																								<td><c:out value="Student"></c:out></td>
																								<td><c:out value="${d.studName}"></c:out></td>
																							</c:if>
																							<c:if test="${d.staffName!=null }">
																								<td><c:out value="Teacher"></c:out></td>
																								<td><c:out value="${d.staffName}"></c:out></td>
																							</c:if>
																							<td><c:out value="${d.bookName}"></c:out></td>
																							<td><c:out value="${d.issueDate}"></c:out></td>
																							<td><c:out value="${d.dueDate}"></c:out></td>

																							<%-- 	 <td>
                                            			<a class="edit" data-placement="top" title="Edit" href="#update" data-toggle="modal" onclick="loadDoc(${d.getBookNo()})"><i class="fa fa-pencil text-warning"></i></a>&nbsp; &nbsp;
                                            			<a class="delete hidden-xs hidden-sm" data-toggle="tooltip" data-placement="top" title="Delete" href="/SMGMT/Library?bookNo=${d.getBookNo()}"><i class="fa fa-trash text-danger"></i></a>
                                            			</td>  --%>
																						</tr>
																					</c:forEach>
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
																			<!-- END EXAMPLE TABLE PORTLET-->
													</div>
												</div>
											</div>
<!-- ===================================================== Third Tab =================================================================== -->
											<div class="tab-pane" id="bookReturn">
												<div class="row">
													<div class="col-12">
<!-- 														<div class="col-lg-8 m-t-20"> -->
															<form action="/SMGMT/Library" class="form-horizontal  login_validator" id="form_block_validator">
																<div class="row">
																	<div class="form-group col-lg-4 input_field_sections">
																		<input type="text" list="returnBook"
																			autocomplete="off"
																			onkeyup="getReturnBooks(this.value)"
																			onblur="getBookInfo('bookInfo',event)"
																			oninput="getStudentId(this.value)"
																			class="form-control" id="searchId"
																			name="searchBookDetails"
																			placeholder="Search Books by BookNo/BookName/AuthorName">
																		<datalist id="returnBook"> </datalist>
																	</div>
																</div>
																<div id="bookInfo" Style="display: none">
																	<div class="row">
																		<div class="form-group col-lg-4 input_field_sections">
																			<input type="hidden" name="studentId" id="student_Id">
																			<label for="required2" class="col-form-label">Book
																				No</label> <input type="text" id="bNo" name="bookNum"
																				class="form-control" required>
																		</div>
																		<div class="form-group col-lg-4 input_field_sections">
																			<label for="required2" class="col-form-label">Book
																				Name</label> <input type="text" id="bName" name="bookName"
																				class="form-control" required>
																		</div>
																		<div class="form-group col-lg-4 input_field_sections">
																			<label for="required2" class="col-form-label">Author
																				Name</label> <input type="text" id="authrName"
																				name="authorName" class="form-control" required>
																		</div>
																	</div>
																	<div class="row">
																		<div class="form-group col-lg-4 input_field_sections">
																			<label for="required2" class="col-form-label">Issue
																				Date</label> <input type="text" id="issueDate1"
																				name="issueDate" class="form-control" required>
																		</div>
																		<div class="form-group col-lg-4 input_field_sections">
																			<label for="required2" class="col-form-label"
																				id="oldDueDate">Due Date *</label> <input
																				type="text" id="dueDate1" name="dueDate"
																				class="form-control" required>
																		</div>
																	</div>
																</div>
																<div class="row">
																	<div class="form-group col-lg-4 input_field_sections">
																		<label for="required2" class="col-form-label">Renew/Return
																			*</label>
																		<div class="controls">
																			<input type="radio" value="RETURN"
																				style="margin-left: 1%;" name="returnRadio"
																				id="selectRt" onclick="onBook(this.value)">
																			Return <input type="radio" value="RENEW"
																				style="margin-left: 1%;" name="returnRadio"
																				id="selectRn" onclick="onBook(this.value)">
																			Renewal
																		</div>
																	</div>
																</div>
																<!-- Search stud from here     ----- -->
																<div id="returnBk" style="display: none">
																	<div class="row">
																		<div class="form-group col-lg-4 input_field_sections">
																			<label class="col-form-label">Return Date *</label> <input
																				type="text" class="form-control form_val_popup_dp3"
																				value="<%=date.todayDate()%>" id="currentDate"
																				name="currentDate" placeholder="YYYY-MM-DD" />
																		</div>
																		<!-- <div class="col-lg-4">
																				<a href="#" onclick="getFineCount('countInfo')"
																				class="btn btn-primary" value="Search" id="btn" style="margin-top: 34px">Count Fine</a>
																			</div> -->

																		<div class="form-group col-lg-4 input_field_sections">
																			<label for="required2" class="col-form-label">Total
																				Days </label> <input type="text" id="days" name="dueDays"
																				class="form-control">
																		</div>

																		<div class="form-group col-lg-4 input_field_sections">
																			<label for="required2" class="col-form-label">Total
																				Fine </label> <input type="text" id="fineAmount"
																				name="fineAmount" class="form-control">
																		</div>
																	</div>
																	<div class="row input_field_sections">
																		<label class="custom-control custom-checkbox">
																			<input type="checkbox" class="custom-control-input"
																			onclick="checkedPay(this)"> <span
																			class="custom-control-indicator"></span> <span
																			class="custom-control-description">Checked</span>
																		</label>
																	</div>
																	<div id="checkId" style="display: none">
																	<div class="row">
																		<div class="form-group col-lg-4 input_field_sections">
																			<label for="required2" class="col-form-label">Discount
																			</label> <input type="text" id="discount" name="discount"
																				value="0" class="form-control" onkeyup="countPay()">
																		</div>
																		<div class="form-group col-lg-4 input_field_sections">
																			<label for="required2" class="col-form-label">Paid
																				Amount </label> <input type="text" id="paidAmountId"
																				name="finePaid" value="0" class="form-control">
																		</div>
																		<div class="form-group col-lg-4 input_field_sections">
																			<label for="required2" class="col-form-label">Remaining
																				Amount </label> <input type="text" id="remainAmount"
																				name="remainAmt" class="form-control">
																		</div>
																	</div>
																	</div>
																</div>
																<div class="row" id="renew"	style="display: none">
																	<div class="form-group col-lg-4 input_field_sections">
																		<label class="col-form-label">New Due Date *</label> <input
																			type="text" class="form-control form_val_popup_dp3"
																			id="dueDate" name="newdueDate"
																			placeholder="YYYY-MM-DD" />
																	</div>
																</div>

																<div class="form-actions form-group row input_field_sections">
																	<input type="submit" id="btnSubmit" value="Submit"
																		name="submitBook" class="btn btn-primary">
																</div>
															</form>
<!-- 														</div> -->
													</div>
												</div>

											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- /.col-lg-12 -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.inner -->
			</div>
			<!-- /.outer -->


			<!-- Modal -->
			<div class="modal fade" id="search_modal" tabindex="-1" role="dialog"
				aria-hidden="true">
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
		<!-- /#content -->
	</div>

	
<!-- 	<!--      global scripts --> -->
<!-- 	<script type="text/javascript" src="/SMGMT/config/js/components.js"></script> -->


<!-- 	<script type="text/javascript" src="/SMGMT/config/js/custom.js"></script> -->

<!-- 	<!-- end of global scripts --> -->
<!-- 	<!-- plugin scripts --> -->
<!-- 	<script type="text/javascript" -->
<!-- 		src="/SMGMT/config/vendors/jquery.uniform/js/jquery.uniform.js"></script> -->
<!-- 	<script type="text/javascript" -->
<!-- 		src="/SMGMT/config/vendors/inputlimiter/js/jquery.inputlimiter.js"></script> -->
<!-- 	<script type="text/javascript" -->
<!-- 		src="/SMGMT/config/vendors/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js"></script> -->
<!-- 	<script type="text/javascript" -->
<!-- 		src="/SMGMT/config/vendors/jquery-tagsinput/js/jquery.tagsinput.js"></script> -->
<!-- 	<script type="text/javascript" -->
<!-- 		src="/SMGMT/config/js/pluginjs/jquery.validVal.min.js"></script> -->
<!-- 	<script type="text/javascript" -->
<!-- 		src="/SMGMT/config/vendors/inputmask/js/jquery.inputmask.bundle.js"></script> -->
<!-- 	<script type="text/javascript" -->
<!-- 		src="/SMGMT/config/vendors/moment/js/moment.min.js"></script> -->
<!-- 	<script type="text/javascript" -->
<!-- 		src="/SMGMT/config/vendors/daterangepicker/js/daterangepicker.js"></script> -->
<!-- 	<script type="text/javascript" -->
<!-- 		src="/SMGMT/config/vendors/datepicker/js/bootstrap-datepicker.min.js"></script> -->
<!-- 	<script type="text/javascript" -->
<!-- 		src="/SMGMT/config/vendors/bootstrap-timepicker/js/bootstrap-timepicker.min.js"></script> -->
<!-- 	<script type="text/javascript" -->
<!-- 		src="/SMGMT/config/vendors/bootstrap-switch/js/bootstrap-switch.min.js"></script> -->
<!-- 	<script type="text/javascript" -->
<!-- 		src="/SMGMT/config/vendors/autosize/js/jquery.autosize.min.js"></script> -->
<!-- 	<script type="text/javascript" -->
<!-- 		src="/SMGMT/config/vendors/jasny-bootstrap/js/jasny-bootstrap.min.js"></script> -->
<!-- 	<script type="text/javascript" -->
<!-- 		src="/SMGMT/config/vendors/jasny-bootstrap/js/inputmask.js"></script> -->
<!-- 	<script type="text/javascript" -->
<!-- 		src="/SMGMT/config/vendors/datetimepicker/js/DateTimePicker.min.js"></script> -->
<!-- 	<script type="text/javascript" -->
<!-- 		src="/SMGMT/config/vendors/j_timepicker/js/jquery.timepicker.min.js"></script> -->
<!-- 	<script type="text/javascript" -->
<!-- 		src="/SMGMT/config/vendors/clockpicker/js/jquery-clockpicker.min.js"></script> -->
<!-- 	<!-- end of plugin scripts --> -->
<!-- 	<script type="text/javascript" src="/SMGMT/config/js/form.js"></script> -->
<!-- 	<script type="text/javascript" -->
<!-- 		src="/SMGMT/config/js/pages/datetime_piker.js"></script> -->
<!-- 	<script -->
<!-- 		src="/SMGMT/config/vendors/datatables/js/jquery.dataTables.min.js+dataTables.bootstrap.min.js.pagespeed.jc.HRNT0WoBU9.js"></script> -->
<!-- 	<script -->
<!-- 		src="/SMGMT/config/vendors/datatables/js/dataTables.responsive.min.js+dataTables.buttons.min.js+buttons.colVis.min.js+buttons.html5.min.js+buttons.bootstrap.min.js+buttons.print.min.js.pagespeed.jc.TdR_"></script> -->
<!-- 	<script type="text/javascript" -->
<!-- 		src="/SMGMT/config/vendors/izitoast/js/iziToast.min.js"></script> -->
<!-- 	<script type="text/javascript" -->
<!-- 		src="/SMGMT/config/js/pages/izi_toastr.js"></script> -->
<!-- 	--> -->

<%-- 	<jsp:include page="/View/common/commonJs.jsp"></jsp:include> --%>

<!-- 	<!-- end plugin scripts --> -->
<!-- 	<!-- Page level scripts --> -->

<!-- 	<script>eval(mod_pagespeed_g_o5ieHdNa);</script> -->
<!-- 	<script>eval(mod_pagespeed_UzcyJ5ysoL);</script> -->
<!-- 	<script>eval(mod_pagespeed_sB4kJD0xfI);</script> -->
<!-- 	<script>eval(mod_pagespeed_aYQJk4iDci);</script> -->
<!-- 	<script>eval(mod_pagespeed_wVkzf2s7YZ);</script> -->
<!-- 	<script>eval(mod_pagespeed_Ij0pRaH8BP);</script> -->
<!-- 	<script>eval(mod_pagespeed_wfmKXYO4Nj);</script> -->
<!-- 	<script>eval(mod_pagespeed_EYzby3B1$L);</script> -->

<!-- 	<script type="text/javascript" src="/SMGMT/config/js/pages/users.js"></script> -->

<jsp:include page="/View/common/commonJs.jsp"></jsp:include>
</body>
<script type="text/javascript">


function getStudentId(val)
{
	var opts = document.getElementById('returnBook').childNodes;
	for (var i = 0; i < opts.length; i++) {
		 if (opts[i].value === val) 
		 {
			 //alert(val);
			var xhttp = new XMLHttpRequest();
			  xhttp.onreadystatechange = function() {
			    if (this.readyState == 4 && this.status == 200) {
			    	
			      var demo = this.responseText;
			     var stud=demo.split(",");
			     alert(stud);
			     document.getElementById("student_Id").value=stud;
			      }
			  };
			  xhttp.open("POST", "/SMGMT/Library?getstudentId="+val, true);
			  xhttp.send(); 
	    	  break;
		}
	}
}
function getStudId(val)
{
	var opts = document.getElementById('browseStud').childNodes;
	for (var i = 0; i < opts.length; i++) {
		 if (opts[i].value === val) 
		 {
			 var xhttp = new XMLHttpRequest();
			  xhttp.onreadystatechange = function() {
			    if (this.readyState == 4 && this.status == 200) {
			     var demo = this.responseText;
			     var stud=demo.split(",");
			     var studId=demo.split("#");
			     document.getElementById("stud_Id").value=studId;
			    //alert(studId);
			     }
			  };
			  xhttp.open("POST", "/SMGMT/Library?getstudId="+val, true);
			  xhttp.send(); 
	    	  break;
		 }
	}
}

function myFunction()
{
	<%
	if(session.getAttribute("flag")!=null){ %>
	$(window).load(function () {
        iziToast.show({
            title: 'Success',
            message: '<%=session.getAttribute("flag").toString()%>',
            color:'#cc7fe5',       //'#00cc99'
            position: 'topCenter'
        });
        return false;
    });
	<%} session.removeAttribute("flag");%>
}

function getReturnBooks(val)
{
	var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	     var demoData = this.responseText;
	     var str=demoData.split(",");
	    // alert(str);
	     for(var i=0; i<str.length; i++)
	    	 {
	    	 var text=text+"<option value=\""+str[i]+"\"> </option>";
	    	 
	    	 }
			document.getElementById("returnBook").innerHTML = text;		 
	     
	    }
	  };
	  xhttp.open("POST", "/SMGMT/Library?returnBooks="+val, true);
	  xhttp.send();
}

/*<<<<<<<<<<<<<<<<<< Ajax for Serach book Info which is not issued >>>>>>>>>>>>>>>>>>>>>>>>>*/
function getbookdetails(id){
	//alert(id);
	var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	     var demoData = this.responseText;
	     var str=demoData.split(",");
	    // alert(str);
	     for(var i=0; i<str.length; i++)
	    	 {
	    	 var text=text+"<option value=\""+str[i]+"\"> </option>";
	    	 
	    	 }
			document.getElementById("browseBook").innerHTML = text;		 
	    }
	  };
	  xhttp.open("POST", "/SMGMT/Library?detailId="+id, true);
	  xhttp.send();
}

/*<<<<<<<<<<<Display Student/ Teacher Block >>>>>>>>>>>>>>>>  */
function searchDetails(radioValue)
	{
			if(radioValue=="Student")
 			{
	 			document.getElementById("stud").style.display="block";
	 			document.getElementById("teacher").style.display="none";
 			
	        }
	 		else if(radioValue=="Teacher"){
	 			document.getElementById("teacher").style.display="block";
	 			document.getElementById("stud").style.display="none";
	 		}
	}

/*<<<<<<<<<<<<<<<<<< Ajax for Serach Student Info >>>>>>>>>>>>>>>>>>>>>>>>>*/
function getstuddetails(id){
//	alert(id);
	var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	     var demo = this.responseText;
	     var stud=demo.split(",");
	     
	     //var studId=demo.split("#");
	    // document.getElementById("stud_Id").value=studId[0];
	    // alert(x[0]);
	     for(var i=0; i<stud.length; i++)
	    	 {	
	    	 	var text=text+"<option value=\""+stud[i]+"\"> </option>";
	    	 }
	     
			document.getElementById("browseStud").innerHTML = text;	
			
	    }
	  };
	  xhttp.open("POST", "/SMGMT/Library?studDetails="+id, true);
	  xhttp.send();
}

function getteacherDetails(id){
//	alert(id);
	var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	     var demo = this.responseText;
	     var stud=demo.split(",");
	     for(var i=0; i<stud.length; i++)
	    	 {
	    	 var text=text+"<option value=\""+stud[i]+"\"> </option>";
	    	 }
	     //alert(text);
			document.getElementById("browseStud").innerHTML = text;		 
	      
	     
	    }
	  };
	  xhttp.open("POST", "/SMGMT/Library?studDetails="+id, true);
	  xhttp.send();
	
}

function getExpData(val)
{
	//alert(val); 
	
	var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	    	var demoStr = this.responseText.split(",");
	    	
	    	if(demoStr==""){
				document.getElementById("displayDate").innerHTML="<tr><td colspan=''>No Records Found!</td></tr>"}
			else
				{
				var count=1;
				var wholeData="";
					for(var i=0;i<demoStr.length-2;i=i+4){
						wholeData+="<tr>"+
						"<td style='text-align: center'>"+count+"</td>"+
						"<td style='text-align: center'>Student</td>"+
						"<td style='text-align: center'>"+demoStr[i]+"</td>"+
						"<td style='text-align: center'>"+demoStr[i+1]+"</td>"+
						"<td style='text-align: center'>"+demoStr[i+2]+"</td>"+
						"<td style='text-align: center'>"+demoStr[i+3]+"</td>"+
						/* "<td style='text-align: center'>"+demoStr[i+4]+"</td>"+ */
						/* "<td style='text-align: center'>"+demoStr[i+5]+"</td>"+ */
						"<tr>"
						
						count++;
					}
					//alert(wholeData);
					document.getElementById("displayDate").innerHTML=wholeData;
				}
	    }
	  };
	  xhttp.open("POST", "/SMGMT/Library?getTableData="+val, true);
	  xhttp.send();
}
function getBookInfo(bookInfo,e) {
	//alert(e+"  "+bookInfo);
	//if (e.keyCode == 13 || e.keyCode == 9) {
	var bInfo = document.getElementById("bookInfo").style.display = "block";
	//alert(bookInfo);
	var searchIdVal = document.getElementById("searchId").value;
	//alert(id);
	var bookD = searchIdVal.split("-");
	///alert(bookD);
	var tDate = document.getElementById("currentDate").value;

	//alert(tDate);
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			var demo = this.responseText;
			// alert(demo);
			var stud = demo.split(",");
			document.getElementById("bNo").value = stud[0];
			document.getElementById("bName").value = stud[1];
			document.getElementById("authrName").value = stud[2];
			document.getElementById("issueDate1").value = stud[3];
			document.getElementById("dueDate1").value = stud[4];

		}
	};
	//	  alert(bookD[0]);
	xhttp.open("POST", "/SMGMT/Library?bookdetail=" + bookD[0].trim()+ "&currentDate=" + tDate +"&bookName="+bookD[1].trim()+"&authorName="+bookD[2].trim(), true);
	xhttp.send();
	//}

}

function onBook(radioValue)
	{
	//alert(radioValue);

	var tDate = document.getElementById("currentDate").value;
	var dDate = document.getElementById("dueDate1").value;
	document.getElementById("oldDueDate").innerHTML="Old Due Date";
	document.getElementById("dueDate1").disabled=true;
	getFineCount(tDate, dDate, radioValue);
			
	}

function getFineCount(tDate, dDate, radioValue) {

	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			var str = this.responseText.split(",");
			var demo=str[0];
			var totalFine = demo * str[1];
			document.getElementById("days").value = demo;
			document.getElementById("fineAmount").value = totalFine;
			var tDate = document.getElementById("currentDate").value;
			var dDate = document.getElementById("dueDate1").value;
			//alert(demo);
			if(radioValue=="RETURN")
 			{
	 			document.getElementById("returnBk").style.display="block";
	 			document.getElementById("renew").style.display="none";
	 			document.getElementById("remainAmount").value=totalFine;
	 			if(dDate>tdate)
 				{
	 				alert("sdafafd");
 				/* document.getElementById("days").value = 0;
 				document.getElementById("fineAmount").value = 0; */
 				}
	        }
	 		else if(radioValue=="RENEW"){
	 			document.getElementById("renew").style.display="block";
	 			document.getElementById("returnBk").style.display="none";
	 			document.getElementById("dueDate").value="";
	 			//document.getElementById("dueDate").focus();
	 		}

		}
	};
	xhttp.open("POST", "/SMGMT/Library?countDetail=1"
			+ "&currentDate=" + tDate + "&dueDate=" + dDate, true);
	xhttp.send();

	
}
	
function checkedPay(checkId)
{
	var famount=document.getElementById("fineAmount").value;
	//alert(famount);
	var x = document.getElementById("checkId");
	if($(checkId).is(":checked"))
		{
			checkId.disabled=false;
			x.style.display = "block";
			document.getElementById("remainAmount").value=famount;
		}
	else 
		{
			x.style.display = "none";
		}
}
	
function countPay()
{
	var famount=document.getElementById("fineAmount").value;
	
	
   var discount=document.getElementById("discount").value;
  // alert(discount);
	var paid=famount-discount;
	document.getElementById("paidAmountId").value=paid;
	document.getElementById("remainAmount").value=0;
}
	

</script>



</html>