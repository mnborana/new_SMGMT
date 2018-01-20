<%@page import="com.servletStore.setup.model.SetupPOJO"%>
<%@page import="com.servletStore.setup.model.SetupImpl"%>
<%@page import="com.servletStore.setup.model.SetupDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.servletStore.signup.model.SignupImpl"%>
<%@page import="com.servletStore.signup.model.SignUpDAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="/View/common/commonCss.jsp"></jsp:include>
<title>Add New User</title>
<style type="text/css">
#selectRoll {
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
		
		//if it returns read(1) then hide form and action column in dataTable
		//for write(2) show your orignal full form
				
	}
%>

<body onload="myFunction()">
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
								<i class="fa fa-pencil"></i> Sign up New User
							</h4>
						</div>
						<div class="col-sm-7 col-lg-6">
							<ol class="breadcrumb float-right nav_breadcrumb_top_align">
								<li class="breadcrumb-item"><a href="/SMGMT/index.jsp">
										<i class="fa fa-home" data-pack="default" data-tags=""></i>
										Dashboard
								</a></li>
								<li class="breadcrumb-item"><a href="#">Sign Up User</a></li>
								<li class="active breadcrumb-item">Add New User</li>
							</ol>
						</div>
					</div>
				</div>
				</header>

				<div class="outer">
					<div class="inner bg-container">
						<div class="row">
							<div class="col-xl-12">
								<div class="card">
									<div class="card-header bg-white">
										<i class="fa fa-file-text-o"></i> Add New User
									</div>
									<div class="card-block m-t-35">
										<form action="/SMGMT/Signup"
											class="form-horizontal  login_validator"
											id="form_block_validator" method="post">

											<%
												if (schoolId.equals("0")) {
											%>

											<%
												SignUpDAO dao = new SignupImpl();
													List schoolName = dao.getSchoolForAdmin();
													Iterator itr = schoolName.iterator();
											%>
											<div class="form-group row">
												<div class="col-lg-4  text-lg-right">
													<label for="required2" class="col-form-label">Choose
														School</label>
												</div>
												<div class="col-lg-4">
													<select class="form-control chzn-select" id="selectSchool"
														name="schoolName" required>
														<option value="">Select School</option>
														<%
															while (itr.hasNext()) {
														%>
														<option value="<%=itr.next()%>"><%=itr.next()%></option>
														<%
															}
														%>
													</select>
												</div>

											</div>
											<%
												}
											%>

											<div class="form-group row">
												<div class="col-lg-4  text-lg-right">
													<label for="required2" class="col-form-label">Select
														User Roll</label>
												</div>
												<div class="col-lg-4">
													<select class="form-control chzn-select" id="selectRoll"
														name="userRoll" required>
														<option value="">Select Roll</option>
														<option value="4">Clerk</option>
														<option value="5">Teacher</option>
														<option value="6">Librarian</option>
													</select> <input type="hidden" name="schoolId" value="<%=schoolId%>">

												</div>

											</div>

											<div class="form-group row">
												<div class="col-lg-4  text-lg-right">
													<label for="required2" class="col-form-label">User
														Name *</label>
												</div>
												<div class="col-lg-4">
													<input type="text" id="required2" name="userName"
														class="form-control"
														onkeyup="checkUserName(this.value,document.getElementById('help'))"
														required> <small style="" class="help-block"
														id="help"></small>
												</div>
											</div>

											<div class="form-group row">
												<div class="col-lg-4 text-lg-right">
													<label for="confirm_password2" class="col-form-label">Password
														*</label>
												</div>
												<div class="col-lg-4">
													<input type="password" id="confirm_password2"
														name="password" class="form-control" required>
												</div>
											</div>

											<div class="form-actions form-group row">
												<div class="col-lg-4 push-lg-4">
													<input type="submit" id="add" value="Add" name="addNew"
														class="btn btn-primary">
												</div>
											</div>
										</form>
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




				<div class="outer">
					<div class="inner bg-container">
						<div class="card">
							<div class="card-header bg-white">User Grid</div>
							<div class="card-block m-t-35" id="user_body">
								<div class="table-toolbar">

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
													<th class="sorting_asc wid-10" tabindex="0" rowspan="1"
														colspan="1">Sr.No</th>
													<th class="sorting wid-10" tabindex="0" rowspan="1"
														colspan="1">User Type</th>
													<th class="sorting wid-10" tabindex="0" rowspan="1"
														colspan="1">User Name</th>
													<th class="sorting wid-25" tabindex="0" rowspan="1"
														colspan="1">Action</th>
												</tr>
											</thead>
											<tbody>
												<%
													SignUpDAO getDetails = new SignupImpl();
												%>
												<%
													if (schoolId.equals("0")) {
												%>

												<%
													request.setAttribute("list", getDetails.getUserInfoForAdmin());
												%>

												<%
													} else {
												%>
												<%
													request.setAttribute("list", getDetails.getUserInfo(schoolId));
												%>
												<%
													}
												%>
												<%
													int i = 0;
												%>
												<c:forEach items="${list}" var="o">
													<tr role="row">
														<td><%=++i%></td>
														<td><c:out value="${o.getUsertype()}"></c:out></td>
														<td><c:out value="${o.getUsername()}"></c:out></td>
														<td align="center"><a class="edit"
															data-toggle="tooltip" data-placement="top" title="Update"
															href="#" onclick=""><i
																class="fa fa-pencil text-warning"></i></a>&nbsp; &nbsp;
															||&nbsp; &nbsp;<a class="delete hidden-xs hidden-sm"
															data-toggle="tooltip" data-placement="top" title="Delete"
															href="#"><i class="fa fa-trash text-danger"></i></a></td>
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
				<!-- /.outer -->

			</div>

		</div>
		<!-- wrapper end -->
	</div>
	<!-- wrap end -->




	<jsp:include page="/View/common/commonJs.jsp"></jsp:include>
	<script type="text/javascript">
	function myFunction()
	{
		<%if (session.getAttribute("flag") != null) {%>
		$(window).load(function () {
	        iziToast.show({
	            title: 'Status',
	            message: '<%=session.getAttribute("flag").toString()%>
		',
					color : '#00cc99',
					position : 'topCenter'
				});
				return false;
			});
	<%}
			session.removeAttribute("flag");%>
		}

		function checkUserName(val, x) {
			// var x = document.getElementById('help');
			if (val.length < 5) {
				x.style.color = '#ff6666';
				x.innerHTML = "Username is too short";
				document.getElementById("add").disabled = true;
			} else {

				var xhttp = new XMLHttpRequest();
				xhttp.onreadystatechange = function() {
					if (this.readyState == 4 && this.status == 200) {
						var demoData = this.responseText;
						//var str=demoData.split(",");
						if (demoData == "1") {
							x.style.color = '#ff6666';
							x.innerHTML = "UserName is taken by someone";
							document.getElementById("add").disabled = true;
						} else {
							x.style.color = '#66cc66';
							x.innerHTML = "Username is available";
							document.getElementById("add").disabled = false;
						}
					}
				};
				xhttp.open("POST", "/SMGMT/Setup?checkName=" + val, true);
				xhttp.send();

			}

		}
	</script>
</body>
</html>