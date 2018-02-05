<%@page import="com.servletStore.setup.model.SetupPOJO"%>
<%@page import="com.servletStore.setup.model.SetupImpl"%>
<%@page import="com.servletStore.setup.model.SetupDAO"%>
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
<!--  <link rel="shortcut icon" href="/SMGMT/config/img/xlogo1.ico.pagespeed.ic.ONh6qx31g4.html"/>
    global styles
    <link type="text/css" rel="stylesheet" href="/SMGMT/config/css,_components.css+css,_custom.css+vendors,_jquery-validation-engine,_css,_validationEngine.jquery.css+vendors,_datepicker,_css,_bootstrap-datepicker.min.css+vendors,_datepicker,_css"/>
    <link type="text/css" rel="stylesheet" href="/SMGMT/config/css,_components.css+css,_custom.css+vendors,_select2,_css,_select2.min.css+css,_pages,_dataTables.bootstrap.css+css,_pages,_tables.css.pagespeed.cc._6lRWz19bZ.css"/>
<link type="text/css" rel="stylesheet" href="/SMGMT/config/css,_components.css+css,_custom.css+vendors,_inputlimiter,_css,_jquery.inputlimiter.css+vendors,_bootstrap-colorpicker,_css,_bootstrap-colorpicker.min.css+vendors,_jquery-tagsinput,_c"/>
 <link type="text/css" rel="stylesheet" href="/SMGMT/config/css,_components.css+css,_custom.css+vendors,_izitoast,_css,_iziToast.min.css.pagespeed.cc.hUh8XIbhbe.css"/>
   -->
<jsp:include page="/View/common/commonCss.jsp"></jsp:include>
<!-- end of global styles-->


</head>
<%
	String schoolId = "0";
	String academicYear = "0";
	int roll = 0;

	if (session.getAttribute("userName") == null) {
		response.sendRedirect("/SMGMT");
	} else {
		roll = (Integer) session.getAttribute("rollId");
		schoolId = session.getAttribute("schoolId").toString();
		academicYear = session.getAttribute("year").toString();

		//for read/write permission  Read = 1  Write = 2
		SetupDAO dao = new SetupImpl();
		List list = dao.getAccessControlDetails(roll);
		Iterator<SetupPOJO> itr = list.iterator();
		//for showing datatable according to read/write permission

		//choose appropriate method as per your leftNavbar form option name
		//e.g : if you are working on Attendance option in left navbar then code will be...

		/* SetupPOJO grant = new SetupPOJO();
		int access=grant.getAttendance(); */

		//if it returns read(1) then hide form and action column in dataTable
		//for write(2) show your orignal full form

	}
%>

<body onload="myFunction()">
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


			<!-- /#left -->
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
											<li class="nav-item"><a class="nav-link active"
												href="#bookList" data-toggle="tab">Issue Book</a></li>
											<li class="nav-item" id="themify_icon"><a
												class="nav-link" href="#issuedList" data-toggle="tab">Issued
													List</a></li>
											<li class="nav-item" id="themify_icon"><a
												class="nav-link" href="#bookReturn" data-toggle="tab">Book
													Return</a></li>
										</ul>
										<div class="tab-content">
											<!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ First Tab@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-------------- -->
											<div class="tab-pane active" id="bookList">
												<div class="row">
													<%
														SysDate date = new SysDate();
													%>
													<div class="col-12">
														<form action="/SMGMT/Library"
															class="form-horizontal  login_validator"
															id="form_block_validator">

															<div class="form-group row">
																<div class="col-lg-5">
																	<label for="required2" class="col-form-label">Search
																		Book </label><span style="color: red;">*</span>
																	<!-- Search Book from here     ------- -->
																	<input type="text" list="browseBook" autocomplete="off"
																		onkeyup="getbookdetails(this.value)"
																		class="form-control" id="searchtext" name="searchBook"
																		placeholder="Search Books by BookId/BookName/AuthorName"
																		required>
																	<datalist id="browseBook"> </datalist>
																</div>
															</div>
															<div class="form-group row">
																<div class="col-lg-5 ">
																	<label for="required2" class="col-form-label">User
																		Type </label><span style="color: red;">*</span>
																	<div class="controls">
																		<input type="radio" value="Student"
																			style="margin-left: 1%;" name="userType"
																			id="userType" onclick="searchDetails(this.value)"
																			checked="checked"> Student <input
																			type="radio" value="Teacher" style="margin-left: 1%;"
																			name="userType" id="userType"
																			onclick="searchDetails(this.value)"> Teacher
																	</div>
																</div>
															</div>
															<!-- Search stud from here     ----- -->
															<div class="form-group row" id="stud"
																style="display: block">
																<div class="col-lg-5">
																	<input type="hidden" name="studId" id="stud_Id">
																	<input type="text" list="browseStud" autocomplete="off"
																		onkeyup="getstuddetails(this.value)"
																		oninput="getStudId(this.value)" class="form-control"
																		id="searchStud" name="searchStud"
																		placeholder="Search Student by Id/Name" required>
																	<datalist id="browseStud"> </datalist>
																</div>
															</div>
															<div class="form-group row" id="teacher"
																style="display: none;">
																<div class="col-lg-5">
																	<input type="text" list="browseStud" autocomplete="off"
																		onkeyup="getstuddetails(this.value)"
																		class="form-control" id="searchTeacher"
																		name="searchTeacher"
																		placeholder="Search Teacher by Id/Name" required>
																	<datalist id="browseStud"> </datalist>
																</div>
															</div>
															<div class="form-group row">
																<div class="col-lg-5">
																	<label class="col-form-label">Book Issue Date </label><span
																		style="color: red;">*</span> <input type="text"
																		id="issueDate_id" class="form-control"
																		name="issueDate" value="<%=date.todayDate()%>"
																		readonly="readonly" placeholder="YYYY-MM-DD" required />
																</div>
															</div>
															<div class="form-group row">
																<div class="col-lg-5 ">
																	<label class="col-form-label">Book Due Date </label> <span
																		style="color: red;">*</span>
																	<div class="input-group input-append date" id="dp1"
																		data-date-format="dd-mm-yyyy">
																		<input type="text" class="form-control form_val_popup"
																			name="dueDate" id="dueDate_id"
																			placeholder="dd-mm-yyyy" style="" required><span
																			class="input-group-addon add-on"> <i
																			class="fa fa-calendar"></i>
																		</span>
																	</div>
																</div>
															</div>

															<div class="form-group row form-actions ">
																<div class="col-lg-5 ">
																	<input type="submit" id="btnSubmit" value="Save Book"
																		name="issuebook" class="btn btn-primary">
																</div>
															</div>
														</form>
													</div>
												</div>
												<!-- ==================================================Book Table=========================================================================== -->
												<div class="outer">
													<div class="inner bg-light lter bg-container">
														<div class="row">
															<div class="col-12 data_tables">
																<div class="card m-t-35">
																	<div class="card-header bg-white">
																		<i class="fa fa-table"></i>Today Issued Books List
																	</div>
																	<div class="card-block m-t-35">
																		<table id="example2"
																			class="table table-striped table-bordered table-hover">
																			<thead>
																				<tr>
																					<th class="sorting_asc wid-10">Sr.No</th>
																					<th class="sorting wid-10">User Type</th>
																					<th class="sorting wid-10">User Name</th>
																					<th class="sorting wid-25">Book Name</th>
																					<th class="sorting wid-10">Issue Date</th>
																					<th class="sorting wid-20">Due Date</th>
																				</tr>
																			</thead>
																			<tbody>
																				<%
																					AddBookDAO dao = new AddBookImpl();
																					System.out.print("***" + dao.getIssueBookDetails());
																					request.setAttribute("display_book", dao.getIssueBookDetails());
																					int bookCount = 0;
																				%>
																				<c:forEach items="${display_book}" var="d">
																					<tr role="row" class="even">

																						<td><%=(++bookCount)%></td>
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
																					</tr>
																				</c:forEach>

																			</tbody>
																		</table>

																	</div>
																</div>


															</div>
														</div>
													</div>
												</div>

												<!-- ================================================== End Book Table=========================================================================== -->
											</div>

											<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ Second Tab @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
											<div class="tab-pane" id="issuedList">
												<div class="row">


													<!-- 			==========================================================================================	 -->
													<div class="outer col-12">
														<div class="inner bg-container">
															<div class="card">
																<div class="card-header bg-white">Issue Book List</div>
																<div class="card-block m-t-35" id="user_body">
																	<div class="table-toolbar">
																		<form>
																			<div class="input-group col-4"
																				style="float: left; margin-top: -2%;">
																				<span class="input-group-addon"> <i
																					class="fa fa-calendar"></i>
																				</span> 
																				<input type="text" class="form-control" onchange="getExpData(this.value)" id="reportrange" placeholder="dd/mm/yyyy-dd/mm/yyyy">
																			</div>
																		</form>
																		<div class="btn-group"></div>
																		<div class="btn-group float-right users_grid_tools">
																			<div class="tools"></div>
																		</div>
																	</div>
																	<div>
																		<div>
																			<table
																				class="table  table-striped table-bordered table-hover dataTable no-footer"
																				id="editable_table" role="grid">
																				<thead>
																					<tr role="row">
																						<th class="sorting_asc wid-10">Sr.No</th>
																						<th class="sorting wid-10">Book Name</th>
																						<th class="sorting wid-10">Author Name</th>
																						<th class="sorting wid-25">Edition</th>
																						<th class="sorting wid-10">User Type</th>
																						<th class="sorting wid-20">User Name</th>
																						<th class="sorting wid-20">Standard</th>
																						<th class="sorting wid-20">Division</th>
																						<th class="sorting wid-20">Issue Date</th>
																						<th class="sorting wid-20">Due Date</th>
																					</tr>
																				</thead>
																				<tbody id="displayDate">
																					
																				</tbody>
																			</table>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<!-- ====================================================================================== -->
												</div>
											</div>
										
										<!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ Third Tab @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
										<div class="tab-pane" id="bookReturn">
											<div class="row">
												<%
													//SysDate date1=new SysDate();
												%>
												<div class="col-12">
													<div class="col-lg-12 m-t-20">
														<form action="/SMGMT/Library"
															class="form-horizontal  login_validator"
															id="form_block_validator">
															<div class="form-group row">
																<div class="col-lg-8">
																	<label for="required2" class="col-form-label">Search
																		Book </label><span style="color: red;">*</span>
																	<!-- Search Book from here     ------- -->
																	<input type="text" list="returnBook" autocomplete="off"
																		onkeyup="getReturnBooks(this.value)"
																		onblur="getBookInfo('bookInfo',event)"
																		oninput="getStudentId(this.value)"
																		class="form-control" id="searchId"
																		name="searchBookDetails"
																		placeholder="Search Books by BookNo/BookName/AuthorName"
																		required>
																	<datalist id="returnBook"> </datalist>
																	<!-- getBookInfo('bookInfo',event) -->
																</div>
																<!-- <a href="#" onclick="getBookInfo('bookInfo')"
																		class="btn btn-primary" value="Search" id="btn">Search</a> -->
															</div>
															<div id="bookInfo">
																<div class="form-group row">

																	<div class="col-lg-4 ">
																		<input type="hidden" name="studentId" id="student_Id">

																		<input type="hidden" id="oldRemainFine"> <label
																			for="required2" class="col-form-label">Book
																			No</label> <input type="text" id="bNo" name="bookNum"
																			class="form-control" readonly="readonly">
																	</div>

																	<div class="col-lg-4 ">
																		<label for="required2" class="col-form-label">Book
																			Name</label> <input type="text" id="bName" name="bookName"
																			class="form-control" readonly="readonly">
																	</div>
																	<div class="col-lg-4">
																		<label for="required2" class="col-form-label">Author
																			Name</label> <input type="text" id="authrName"
																			name="authorName" class="form-control"
																			readonly="readonly">
																	</div>
																</div>

																<div class="form-group row">
																	<div class="col-lg-4 ">
																		<label for="required2" class="col-form-label">Issue
																			Date</label> <input type="text" id="issueDate1"
																			name="issueDateFrom3tab" class="form-control"
																			readonly="readonly">
																	</div>

																	<div class="col-lg-4">
																		<label for="required2" class="col-form-label"
																			id="oldDueDate">Due Date </label><span
																			style="color: red;">*</span> <input type="text"
																			id="dueDate1" name="dueDate" class="form-control"
																			readonly="readonly">
																	</div>
																	<div class="col-lg-4">
																		<label for="required2" class="col-form-label"
																			id="oldDueDate">Student Details</label><span
																			style="color: red;">*</span> <input type="text"
																			id="studdId" name="dueDate" class="form-control"
																			readonly="readonly">
																	</div>

																</div>
															</div>
															<div class="form-group row">
																<div class="col-lg-4 ">
																	<label for="required2" class="col-form-label">Renew/Return
																	</label><span style="color: red;">*</span>
																	<div class="controls">
																		<input type="radio" value="RETURN"
																			style="margin-left: 1%;" name="returnRadio"
																			id="selectRt" onclick="onBook(this.value)">
																		Return <input type="radio" value="RENEW"
																			style="margin-left: 1%;" name="returnRadio"
																			id="selectRn" onclick="onBook(this.value)">
																		Renewal &nbsp;<input type="radio" value="RECOVER"
																			style="margin-left: 1%;" name="returnRadio"
																			id="selectRe" onclick="onBook(this.value)">
																		Recovery Book
																	</div>
																</div>
															</div>

															<!-- Search stud from here     ----- -->
															<div id="returnBk">
																<div class="form-group row">
																	<%
																		SysDate d = new SysDate();
																	%>

																	<div class="col-lg-4">
																		<label class="col-form-label">Return Date </label><span
																			style="color: red;">*</span> <input type="text"
																			class="form-control" value="<%=date.todayDate()%>"
																			id="currentDate" name="currentDate"
																			placeholder="YYYY-MM-DD" readonly="readonly" />
																	</div>
																	<!-- <div class="col-lg-4">
																				<a href="#" onclick="getFineCount('countInfo')"
																				class="btn btn-primary" value="Search" id="btn" style="margin-top: 34px">Count Fine</a>
																			</div> -->

																	<div class="col-lg-4">
																		<label for="required2" class="col-form-label">Previous
																			Fine </label> <input type="text" id="previousFine"
																			name="previousFine" class="form-control"
																			readonly="readonly">
																	</div>
																	<div class="col-lg-4">
																		<label for="required2" class="col-form-label">Fine
																			Days </label> <input type="text" id="days" name="dueDays"
																			class="form-control" readonly="readonly">
																	</div>

																	<div class="col-lg-4">
																		<label for="required2" class="col-form-label">Total
																			Fine </label> <input type="text" id="fineAmount"
																			name="fineAmount" class="form-control"
																			readonly="readonly">
																	</div>
																	<div class="col-lg-4">
																		<label for="required2" class="col-form-label">Discount
																		</label> <input type="text" id="discount" name="discount"
																			readonly="readonly" value="0" class="form-control"
																			onchange="countPay()"> <small
																			class="help-block" data-bv-validator="notEmpty"
																			id="discountError" style=""></small>
																	</div>

																	<div class="col-lg-4">
																		<label for="required2" class="col-form-label">Total
																			Amount </label> <input type="text" id="totalAmount"
																			name="totalAmount" value="0" class="form-control"
																			readonly="readonly">
																	</div>

																	<div class="col-lg-4">
																		<label for="required2" class="col-form-label">Paid
																			Amount </label> <input type="text" id="paidAmountId"
																			name="finePaid" value="0"
																			onblur="calculatePaidAmt(this.value)" pattern="[0-9]+"
																			class="form-control"> <small
																			class="help-block" data-bv-validator="notEmpty"
																			id="error" style=""></small>
																	</div>
																	<div class="col-lg-4">
																		<label for="required2" class="col-form-label">Remaining
																			Fine </label> <input type="text" id="remainAmount"
																			name="remainAmt" class="form-control"
																			readonly="readonly">
																	</div>

																	<div class="col-lg-12">
																		<label for="" id="information" class="col-form-label"></label>
																	</div>
																	<div class="col-lg-12">
																		<label class="custom-control custom-checkbox">
																			<input type="checkbox" class="custom-control-input"
																			onclick="checkedPay(this)"> <span
																			class="custom-control-indicator"></span> <span
																			class="custom-control-description">Checked(Return
																				book with fine pending)</span>
																		</label>
																	</div>
																</div>
															</div>

															
											<!-- <<<<<<<<RENEW BOOK>>>>>>>>>> -->
															
															<div class="form-group row" id="renew"
																style="display: none">
																<div class="col-lg-4">
																	<label class="col-form-label">New Due Date </label><span
																		style="color: red;">*</span> <input type="text"
																		class="form-control form_val_popup_dp3" id="dueDateRn"
																		name="newdueDate" placeholder="YYYY-MM-DD"  />

																</div>
															</div>
					
												<!-- <<<<<<<<RECOVER BOOK>>>>>>>>>> -->			 
															 <div class="form-group row" id="recoverBk" style="display: none">
																<div class="col-lg-4">
																<label class="col-form-label">Remark  </label><span
																		style="color: red;">*</span>
																	<textarea id="text4" class="form-control" name="remark"  onkeyup="this.value = this.value.toUpperCase();" pattern="[A-Za-z]"cols="50" rows="5" ></textarea>
																</div>
															</div>
															
 															<div class="form-actions">
																<input type="submit" id="returnSubmit" value="Submit"
																	name="submitBook" class="btn btn-success"
																	disabled="disabled"> &nbsp;<input type="submit"
																	id="" value="Reset Form" name=""
																	class="btn btn-warning" onclick="resetForm()">
																&nbsp;<input type="button" id="cal"
																	value="Reset Calculation" name=""
																	class="btn btn-primary" onclick="resetCal()"
																	disabled="disabled">
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
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.inner -->
	</div>
	<!-- /.outer -->


	<!-- Modal -->
	<div class="modal fade show" id="giveDiscount" role="dialog"
		aria-labelledby="modalLabelnews">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header bg-primary">
					<h4 class="modal-title text-white" id="modalLabelnews">
						<strong>Do you want to give discount?</strong>
					</h4>
				</div>
				<div class="modal-body">

					<ul>
						<li id="tFine"><strong>Total Fine =</strong></li>
						<li id="pFine"><strong>Paid Amount =</strong></li>
						<li id="rBal"><strong>Remaining Balance =</strong></li>
					</ul>


				</div>

				<div class="modal-footer">
					<button class="btn btn-success" data-dismiss="modal"
						onclick="giveDiscount()">Yes</button>
					<button class="btn btn-warning" data-dismiss="modal">No</button>
				</div>

			</div>
		</div>
	</div>
	<!-- /Modal  -->

	</div>
	<!-- /#content -->
	</div>

	<!--wrapper-->

	<!-- /#wrap -->

	<jsp:include page="/View/common/commonJs.jsp"></jsp:include>

	<!-- end plugin scripts -->
	<!--Page level scripts-->

	<!-- 	<script>eval(mod_pagespeed_g_o5ieHdNa);</script> -->
	<!-- 	<script>eval(mod_pagespeed_UzcyJ5ysoL);</script> -->
	<!-- 	<script>eval(mod_pagespeed_sB4kJD0xfI);</script> -->
	<!-- 	<script>eval(mod_pagespeed_aYQJk4iDci);</script> -->
	<!-- 	<script>eval(mod_pagespeed_wVkzf2s7YZ);</script> -->
	<!-- 	<script>eval(mod_pagespeed_Ij0pRaH8BP);</script> -->
	<!-- 	<script>eval(mod_pagespeed_wfmKXYO4Nj);</script> -->
	<!-- 	<script>eval(mod_pagespeed_EYzby3B1$L);</script> -->

	<!-- 	<script type="text/javascript" src="/SMGMT/config/js/pages/users.js"></script> -->

</body>
<script type="text/javascript">

//$( "#dueDate_id" ).datepicker({ minDate: 0});

// $(document).ready(function () {
//         $("#dueDate_id").datepicker({
//             minDate: 0
//         });
//     });

function giveDiscount()
{
	var fineAmount=parseInt(document.getElementById("fineAmount").value);
    var paidAmount=parseInt(document.getElementById("paidAmountId").value);
    //alert(paidAmount);
    var remainAmt = fineAmount - paidAmount;
    
    document.getElementById("discount").value=remainAmt;
    document.getElementById("remainAmount").value=0;
    
    document.getElementById("returnSubmit").disabled=false;
	
}


$('#giveDiscount').on('show.bs.modal', function(e) {

    //putting values in bootstrap modal
    var fineAmount=parseInt(document.getElementById("fineAmount").value);
    var paidAmount=parseInt(document.getElementById("paidAmountId").value);
    var remainAmt = fineAmount - paidAmount;
    
	document.getElementById("tFine").innerHTML='<strong>Total Fine = </strong>'+fineAmount;
	document.getElementById("pFine").innerHTML='<strong>Paid Fine = </strong>'+paidAmount;
	document.getElementById("rBal").innerHTML='<strong>Remaining Fee = <strong>'+remainAmt;
   
	
	 
});

function resetCal()
{
	//reset calculation for discount
	var oldRemainFine=parseInt(document.getElementById("oldRemainFine").value);
	document.getElementById("remainAmount").value=oldRemainFine;
	document.getElementById("paidAmountId").value=0;
	document.getElementById("totalAmount").value=0;
	document.getElementById("discount").value=0;
}

function resetForm()
{
	document.getElementById("searchId").value="";
	document.getElementById("student_Id").value="";
	document.getElementById("oldRemainFine").value="";
	document.getElementById("bNo").value="";
	document.getElementById("bName").value="";
	document.getElementById("authrName").value="";
	document.getElementById("issueDate1").value="";
	document.getElementById("dueDate1").value="";
	document.getElementById("studdId").value="";
	document.getElementById("previousFine").value="";
	document.getElementById("days").value="";
	document.getElementById("fineAmount").value="";
	document.getElementById("discount").value=0;
	document.getElementById("totalAmount").value=0;
	document.getElementById("paidAmountId").value=0;
	document.getElementById("remainAmount").value=0;
	document.getElementById("returnSubmit").disabled=true;
	$('input[name=returnRadio]').attr('checked',false);
}

function calculatePaidAmt(val)
{
	//alert(val);
	var oldRemainAmt=parseInt(document.getElementById("oldRemainFine").value);
	var remainAmt=parseInt(document.getElementById("fineAmount").value);
	//var remainFine=document.getElementById("remainAmount").value;
	//alert(remainAmt);
	var paidAmount=parseInt(document.getElementById("paidAmountId").value);
	var discount=parseInt(document.getElementById("discount").value);
	//alert(paidAmount);
	
	if(discount==0)
	{
		
		if(oldRemainAmt<paidAmount)
		{
			//alert('not count');	
			document.getElementById('remainAmount').value=oldRemainAmt;
			document.getElementById("error").innerHTML="Number should less than Fine";
			
			
		}
		
		else
		{
			var totalFine=remainAmt-paidAmount;
			
			//alert(totalFine);
			// var totalAmt=remainAmt-paidAmt;
			document.getElementById('remainAmount').value=totalFine;
			document.getElementById("discount").value = 0;
			document.getElementById("discount").readOnly = true;
			//document.getElementById("information").innerHTML="*Note : If you want to give discount then press Reset Calculation.";	
			document.getElementById("information").style.color='#27ae60';
			document.getElementById("error").innerHTML="";
			//document.getElementById("cal").disabled=false;
			document.getElementById("cal").disabled=false;
			if(totalFine==0)
			{
				document.getElementById("returnSubmit").disabled=false;	
			}
			if(paidAmount<=1)
			{
				//alert('incorrect number');
				 $('#giveDiscount').modal('hide');
				document.getElementById("error").innerHTML="incorrect number";
				
					document.getElementById('remainAmount').value=0;
				    document.getElementById("paidAmountId").value=0;
				    document.getElementById("discount").value = 0;
				    
				   
				
				} 
			
			$('#giveDiscount').modal('show');
			
		}
	
		
		
		
	} 
	else
	{
		
		var totalAmt=parseInt(document.getElementById('totalAmount').value);
		if(totalAmt<paidAmount)
		{
			//alert('not count');
			document.getElementById('remainAmount').value=0;
		}
		else
		{
			var totalFine=totalAmt-paidAmount;
			//alert(totalFine);
			// var totalAmt=remainAmt-paidAmt;
			document.getElementById('remainAmount').value=totalFine; 
			document.getElementById("error").innerHTML="";	
			if(totalFine==0)
			{
				document.getElementById("returnSubmit").disabled=false;	
			}
		}
		
	} 
	
}


function countPay()
{
	
	
	var discount=parseInt(document.getElementById("discount").value);
	var oldFineAmount=parseInt(document.getElementById("oldRemainFine").value);
	var fineAmount=parseInt(document.getElementById("fineAmount").value);
	//alert(discount.length);
	//alert(oldFineAmount.length);
	//Intdiscount
	//parseInt(discount); 
	//alert("of "+oldFineAmount+" dis "+discount);
	if(discount > oldFineAmount)
	{
		//alert('not count');	
		document.getElementById("totalAmount").value=0;
		document.getElementById("discountError").innerHTML="Number should less than Fine";
	}
	else
	{
		//alert('count');
		var totalAmt=oldFineAmount-discount;
		document.getElementById("totalAmount").value=totalAmt;
		document.getElementById("oldRemainFine").value=fineAmount;
		document.getElementById("remainAmount").value=totalAmt;
		document.getElementById("discountError").innerHTML="";
	}
	

	

}

function getDueDateCount()
{
	
	var issueDate=document.getElementById('issueDate_id').value;
	
		var date = new Date(issueDate);
	    var newdate = new Date(date);
	    var count=0;

	    newdate.setDate(newdate.getDate() + 3);
	    
	    var dd = newdate.getDate();
	    var mm = newdate.getMonth() + 1;
	    var y = newdate.getFullYear();


	 while(count<7) {
	    if(newDate.gateDay()!=0 && newDate.gateDay()!=6 )
	    	{
	    	var newDate = dd + '-' + mm + '-' + y;
		    document.getElementById('dueDate_id').value = newDate;
	    	count++;
	    	}
	   }
	
}

/* <<<<<<<<<<<<<<<<<<< For get student Id- (issue id,student id) >>>>>>>>>>>>>>>>>>>>>>>>>*/
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
			     var stud=demo.split(" ");
			  
			     
			     document.getElementById("student_Id").value=stud[0];
			     document.getElementById("studdId").value=stud[1];
			      }
			  };
			  xhttp.open("POST", "/SMGMT/Library?getstudentId="+val, true);
			  xhttp.send(); 
	    	  break;
		}
	}
}

/* <<<<<<<<<<<<<<<<<<<Search Student info from here- (grn, name, std, div, shift) >>>>>>>>>>>>>>>>>>>>>>>>>*/
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
	
	
	 /*<<<<<<<<<<< For count days between issue date and due date >>>>>>>>>>>>>>> */
	var issueDate=document.getElementById('issueDate_id').value;
	
	var date = issueDate.split('-');
	date=date[2]+'-'+date[1]+'-'+date[0];
	
    var newdate = new Date(date);

    newdate.setDate(newdate.getDate() + 7);
    
    var dd = newdate.getDate();
    var mm = newdate.getMonth() + 1;
    var y = newdate.getFullYear();
	
    var someFormattedDate = dd + '-' + mm + '-' + y;
    //alert(date);
   // document.getElementById('dueDate_id').value = someFormattedDate;
    
    
    $("#dueDate_id").datepicker({
        format: 'dd-mm-yyyy',
        autoclose: true
    }).datepicker("update", someFormattedDate); 
	/*  var issueDate=document.getElementById('issueDate_id').value;
	
	var date = new Date(issueDate);
    var newdate = new Date(date);

    newdate.setDate(newdate.getDate() + 7);
    
    var dd = newdate.getDate();
    var mm = newdate.getMonth() + 1;
    var y = newdate.getFullYear();
	
    var someFormattedDate = y + '-' + mm + '-' + dd;
    document.getElementById('dueDate_id').value = someFormattedDate; */
    /*<<<<<<<<<<<<<<<<< For snackbar >>>>>>>>>>>>>>>>>>>>>>> */
<%-- 	<%
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
	<%} session.removeAttribute("flag");%> --%>
}

/* <<<<<<<<<<<<<<<<<<< Ajax for Serach book Info which is issued >>>>>>>>>>>>>>>>>>>>>>>>>*/
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

/*<<<<<<<<<<<<<<< Ajax for Serach books as datewise from table >>>>>>>>>>>>>>>>>> */
function getExpData(val)
{
	var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	    	var demoStr = this.responseText.split(",");
	    	
	    	if(demoStr==""){
				document.getElementById("displayDate").innerHTML="<tr><td colspan='10'>No Records Found!</td></tr>"
			}else
				{
				var now = new Date();
				var today= now.getDate();

				var todayMonth=(now.getMonth())+1;
			    var todayYear=(now.getFullYear());
			    
			    if(todayMonth<10) {
			    	todayMonth = '0'+todayMonth;
			    } 
			    
			    if(today<10) {
			    	today = '0'+today;
			    } 

			    
			    var x=todayYear+"-"+todayMonth+"-"+today; //DATE

				var count=1;
				var wholeData="";
				var i=0;

				//alert(x);
				
					for(;demoStr[i]; ){
						if (x>demoStr[i+9]) {
							
							//alert(demoStr[i+9]);
							//alert(x>demoStr[i+9]);
							wholeData+="<tr style='background-color: #f3a1a1;'>";
														
 						}else {
							wholeData+="<tr>";
						}
						
						wholeData+="<td style='text-align: center'>"+count+"</td>"+
									"<td style='text-align: center'>"+demoStr[i]+"</td>"+
									"<td style='text-align: center'>"+demoStr[i+1]+"</td>"+
									"<td style='text-align: center'>"+demoStr[i+2]+"</td>";
						if (demoStr[i+3] !='null') {
							wholeData+="<td style='text-align: center'>Student</td>";
						}
						if (demoStr[i+4]!='null') {
							wholeData+="<td style='text-align: center'>"+demoStr[i+4]+"</td>";
						}
						wholeData+="<td style='text-align: center'>"+demoStr[i+5]+"</td>"+ 
									"<td style='text-align: center'>"+demoStr[i+6]+"</td>"+
									"<td style='text-align: center'>"+demoStr[i+7]+"</td>"+
									"<td style='text-align: center'>"+demoStr[i+8]+"</td>"+
									"<td style='text-align: center'>"+demoStr[i+9]+"</td>"+
									
									"<tr>";

						
						count++;
						i=i+10;
					}
// 					//alert(wholeData);
					document.getElementById("displayDate").innerHTML=wholeData;
				}
	    }
	  };
	  xhttp.open("POST", "/SMGMT/Library?getTableData="+val, true);
	  xhttp.send();
}

/*<<<<<<<<<<<<< When selected book from serach bar get the info of book in return book form  >>>>>>>>>>>>> */
function getBookInfo(bookInfo,e)
{
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
			
			var iDate = stud[3].split('-');
			alert(stud[3]);
			iDate=iDate[2]+'-'+iDate[1]+'-'+iDate[0];
			document.getElementById("issueDate1").value = iDate;
			
			var dDate = stud[4].split('-');
			dDate=dDate[2]+'-'+dDate[1]+'-'+dDate[0];
			document.getElementById("dueDate1").value = dDate;

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
	var todayDate = tDate.split('-');
	todayDate=todayDate[2]+'-'+todayDate[1]+'-'+todayDate[0];
	var dDate = document.getElementById("dueDate1").value;
	var dueDate = dDate.split('-');
	dueDate=dueDate[2]+'-'+dueDate[1]+'-'+dueDate[0];
	var studId= document.getElementById("student_Id").value;
	//alert(studId);
	
	
	document.getElementById("oldDueDate").innerHTML=" Due Date";
	//document.getElementById("dueDate1").disabled=true;
	getFineCount(todayDate, dueDate, radioValue,studId);
			
	}

function getFineCount(todayDate, dueDate, radioValue,studId) {
	
	
	 var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			var str = this.responseText.split(",");
			var issueDate=document.getElementById("issueDate1").value; 
		 if(radioValue=="RETURN")
 			{
	 			document.getElementById("returnBk").style.display="block";
	 			document.getElementById("renew").style.display="none";
	 			 document.getElementById("recoverBk").style.display="none";
	 			
	 			if(todayDate<dueDate)
	 			{
	 				//alert(tDate+" "+dDate+" if");
	 				 document.getElementById("days").value=0;
	 				document.getElementById("remainAmount").value=str[1]; 
	 				document.getElementById("oldRemainFine").value=str[1]; 
	 				document.getElementById("previousFine").value=str[1]; 
					document.getElementById("fineAmount").value = str[1];
				}
	 			else
	 			{
	 				//alert("else");
		 			 var oneDay = 24*60*60*1000; // hours*minutes*seconds*milliseconds
					var firstDate = new Date(todayDate);
					var secondDate = new Date(dueDate);
	
					var diffDays = Math.round(Math.abs((firstDate.getTime() - secondDate.getTime())/(oneDay)));
					
					document.getElementById("days").value=diffDays;
					document.getElementById("previousFine").value=str[1];
					if(parseInt(str[1])>0)
					{
						//alert('addition');
						
						var regularFine = diffDays * parseInt(str[0]);
						var totalFine = regularFine+parseInt(str[1]);
						document.getElementById("fineAmount").value = totalFine;
			 			document.getElementById("remainAmount").value=totalFine;
			 			document.getElementById("oldRemainFine").value=totalFine;
			 			
					}
					else
					{
						//alert('not add');
						var totalFine = diffDays * str[0];
						
						document.getElementById("fineAmount").value = totalFine;
						
			 			document.getElementById("remainAmount").value=totalFine;
			 			
			 			alert(totalFine);
			 			document.getElementById("oldRemainFine").value=totalFine;
			 				
					}
				}
	 			var studId= document.getElementById("student_Id").value;
	 			document.getElementById("returnSubmit").disabled=true;
	 			var newFineAmt=document.getElementById("fineAmount").value;
	 			
	 			if(newFineAmt==0)
	 			{
	 				document.getElementById("returnSubmit").disabled=false;
	 			}
	 			   
 			}
	 		else if(radioValue=="RENEW")
	 		{
	 			document.getElementById("renew").style.display="block";
	 			document.getElementById("returnBk").style.display="none";
	 			 document.getElementById("recoverBk").style.display="none";
	 			//document.getElementById("dueDateRn").value="";
	 			var dueDateRenew=document.getElementById("dueDateRn").value;
	 			/* var dueDateNew = dueDateRenew.split('-');
	 			dueDateNew=dueDateNew[2]+'-'+dueDateNew[1]+'-'+dueDateNew[0];
 */
	 			//alert(dueDateRenew);
	 			document.getElementById("returnSubmit").disabled=false;
	 	        document.getElementById("dueDateRn").required=true;
	 			document.getElementById("text4").required=false;

	 			/* if(dueDateRenew=="")
 				{
 				alert('disable');
 				document.getElementById("returnSubmit").disabled=true; 
 				}
	 			else 
	 				{
	 				alert('enable');
	 				document.getElementById("returnSubmit").disabled=false;
	 				} */
 				
	 		}
	 		  else if(radioValue=="RECOVER")
	 			{
	 			  
	 			     document.getElementById("returnSubmit").disabled=false;
		 			 document.getElementById("recoverBk").style.display="block";
		 			 document.getElementById("returnBk").style.display="none";
		 			 document.getElementById("renew").style.display="none";
		 			document.getElementById("text4").required=true;
		 			 document.getElementById("dueDateRn").required=false;
	 			 
	 			  
	 			}   

		}
	};
	//get student id in javascript variable and pass it in servlet
	xhttp.open("POST", "/SMGMT/Library?countDetail=1"
			+ "&currentDate=" + todayDate + "&dueDate=" + dueDate+ "&studId=" +studId, true);
	xhttp.send(); 

	
}


 
 
/*<<<<<<<<<<<<<<<<<<< Code For check box if it is selected or not >>>>>>>>>>>>>>>>>>> */
/* function checkedPay(checkId)
{
	var famount=parseInt(document.getElementById("fineAmount").value);
	if($(checkId).is(":checked"))
		{
		
		document.getElementById("returnSubmit").disabled=false;
		document.getElementById("remainAmount").value=famount;
		}
	else{
		document.getElementById("returnSubmit").disabled=true;
		}
	
} */

function checkedPay(checkId)
{   var totalFineAmt=parseInt(document.getElementById('fineAmount').value);
	var paidFineAmount=parseInt(document.getElementById('paidAmountId').value);
	var checkFine=totalFineAmt-paidFineAmount;
	if($(checkId).is(":checked"))
		{
		document.getElementById("returnSubmit").disabled=false;
		document.getElementById("remainAmount").value=checkFine;
		}
	else{
		document.getElementById("returnSubmit").disabled=true;
	}
	 //var famount=document.getElementById("fineAmount").value;
	//alert(famount);
	//var x = document.getElementById("checkId");
	
}


	


</script>
</html>
