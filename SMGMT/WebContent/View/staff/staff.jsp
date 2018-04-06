<%@page import="com.servletStore.settings.caste.model.CasteImpl"%>
<%@page import="com.servletStore.settings.caste.model.CasteDAO"%>
<%@page import="com.servletStore.staff.model.StaffPojo"%>
<%@page import="com.servletStore.staff.model.StaffImpl"%>
<%@page import="com.servletStore.staff.model.StaffDAO"%>
<%@page import="com.servletStore.settings.standard.model.StandardPOJO"%>
<%@page import="java.util.List"%>
<%@page import="com.servletStore.settings.school.model.SchoolPOJO"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.servletStore.settings.standard.model.StandardImpl"%>
<%@page import="com.servletStore.settings.standard.model.StandardDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
	session.setAttribute("schoolId", "1");
	String schoolId=session.getAttribute("schoolId").toString();
	%>
	<div class="preloader"
		style="position: fixed; width: 100%; height: 100%; top: 0; left: 0; z-index: 100000; backface-visibility: hidden; background: #ffffff;">
		<div class="preloader_img"
			style="width: 200px; height: 200px; position: absolute; left: 48%; top: 48%; background-position: center; z-index: 999999">
			<img src="" style="width: 40px;" alt="loading...">
		</div>
	</div>
	<%
		if(session.getAttribute("flag")!=null){ %>
		<div id="snackbar">$(window).load(function () {
	        iziToast.show({
	            title: 'Success',
	            message: '<%=session.getAttribute("flag").toString()%>',
	            color:'#00cc99',
	            position: 'topCenter'
	        });
	        return false;
	    });</div>
	<%} session.removeAttribute("flag");%>
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
				<form action="/SMGMT/Staff" method="post" class="form-horizontal"
					id="form_block_validator">
					<!-- Personal Details -->

					<div class="outer">
						<div class="inner bg-container forms">
							<div class="row">
								
								<div class="col-lg-12">
									<div class="card">
										<div class="card-header bg-white">
											<h3>Teacher Personal Details</h3>
										</div>
										<div class="card-block">
											<div class="row">

												<div class="card-block seclect_form">
													<div class="row">
														<div class="form-group col-lg-4 input_field_sections">
															<label for="dob" class="col-form-label">Joining Date
																 *</label>
															<div class="input-group input-append date" id="dp3"
																data-date-format="dd-mm-yyyy">
																<input class="form-control" type="text" name="joinDate"
																	id="joinDateId" placeholder="dd-mm-yyyy" required />
																<span class="input-group-addon add-on"> <i
																	class="fa fa-calendar"></i>
																</span>
															</div>
														</div>
														
														<div class="form-group col-lg-4 input_field_sections">
															<label for="lastname" class="col-form-label">Joining Type
																</label> <select class="form-control chzn-select"
																name="joinType">
																<option disabled selected>Select</option>
																<option value="A+">Permanant</option>
																<option value="O+">Non Permanant</option>
															</select>
														</div>
														<div class="form-group col-lg-4 input_field_sections">
															<label for="name" class="col-form-label">Teacher
																Name *</label> <input type="text" id="nameId" name="name"
																class="form-control" placeholder="Teacher Full Name" required />
														</div>
													</div>

													<div class="row">
														<div class="form-group col-lg-4 input_field_sections">
															<label for="age" class="col-form-label">Address *</label> <input
																type="text" id="addId" name="add" class="form-control"
																placeholder="Address" required/>
														</div>
														
														<div class="col-lg-4 input_field_sections">
			                                                <label for="casteId" class="col-form-label">Religion</label>
			                                                <select class="form-control chzn-select" name="religion" id="religionId" onchange="casteList(this.value)" required="required">
				                                                <%
									 								CasteDAO castedao=new CasteImpl();
									 								request.setAttribute("list",castedao.getReligionDetails());
																%>
																<option disabled selected>Choose a Religion</option>
			                                                	<c:forEach items="${list}" var="u">  
			                                                		
																	<option value="${u.getReligion_id()}">${u.getReligionName()}</option>Z
																</c:forEach>  
			                                                </select>
			                                            </div>
                                             			<div class="form-group col-lg-4 input_field_sections">
															<label for="casteId" class="col-form-label">Caste</label>
															<select class="form-control chzn-select" name="caste" id="casteId" onchange="categoryList(this.value)" required>
																<option disabled selected>Choose a Caste</option>
															</select>
														</div>
													</div>
													<div class="row">
													<div class="form-group col-lg-4 input_field_sections">
															<label for="age" class="col-form-label">Previous School *</label> <input
																type="text" id="prevSchoolId" name="prevSchool" class="form-control"
																placeholder="Previous School" required/>
														</div>
													<div class="form-group col-lg-4 input_field_sections">
															<label for="age" class="col-form-label">Experiance  *</label> <input
																type="text" id="expYr" name="expYr" class="form-control" style="width: 50%;"
																placeholder="Year" required/>
																<input
																type="text" id="expMn" name="expMnth" class="form-control" style="width: 50%;
																  margin-left: 51%; margin-top: -35px;"
																placeholder="Month" />
														</div>
														 <div class="form-group col-lg-4 input_field_sections">
															<label for="dob" class="col-form-label">Date Of
																Birth *</label>
															<div class="input-group input-append date" id="dp2"
																data-date-format="dd-mm-yyyy">
																<input class="form-control" type="text" name="dob"
																	id="dob"  onchange="getAge()" placeholder="dd-mm-yyyy" required />
																<span class="input-group-addon add-on"> <i
																	class="fa fa-calendar"></i>
																</span>
															</div>
														</div> 
													</div>
													<div class="row">
														<div class="form-group col-lg-4 input_field_sections">
															<label for="age" class="col-form-label">Age *</label> <input
																type="text" id="age" name="age" class="form-control"
																placeholder="Age" required/>
														</div>
														<div class="form-group col-lg-4 input_field_sections">
															<label for="weight" class="col-form-label">Basic Pay </label>
															<input type="text" id="weight" name="basicPay"
																class="form-control" placeholder="Basic Pay" />
														</div>
														<div class="form-group col-lg-4 input_field_sections">
															<label for="adharno" class="col-form-label">Grade Pay
																</label> <input type="text" id="gradePayId" name="gradePay"
																class="form-control" placeholder="Grade Pay" required/>
														</div>
													</div>
													<div class="row">
														<div class="form-group col-lg-4 input_field_sections">
															<label for="adharno" class="col-form-label">Mobile No
																</label> <input type="text" id="mobId" name="moNo"
																class="form-control" placeholder="Mobile No" required/>
														</div>
														<div class="form-group col-lg-4 input_field_sections">
															<label for="lastname" class="col-form-label">Grant Type
																</label> <select class="form-control chzn-select"
																name="grantType">
																<option disabled selected>Select</option>
																<option value="A+">Granted</option>
																<option value="O+">Non Granted</option>
															</select>
														</div>
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
																		class="cr-icon fa fa-circle"></i></span>Female
																</label>
															</div>
														</div>
													</div>

													<div class="row">
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
															<label for="nationality" class="col-form-label">Education</label>
															<input type="text" id="educationId" name="education"
																class="form-control" placeholder="Education" />
														</div>
														<div class="form-group col-lg-4 input_field_sections" >
															<label for="casteId" class="col-form-label">Department</label>
															<%
															StaffDAO dao=new StaffImpl();
															List getDepartment=dao.getDepartmentList();
															Iterator itr=getDepartment.iterator();
															%>
															<input type="text" list="browseData" autocomplete="off"	class="form-control" id="deptId" name="dept"
																		placeholder="Department">
																	<datalist id="browseData"> 
																	<%
																	while(itr.hasNext())
																	{
																		String departmentlist=itr.next().toString();
																	
																	%>
																		<option value="<%=departmentlist%>"><%=departmentlist %></option>
																		<%} %>
																	</datalist>
 														</div>
													</div>
													<div class="row">
														<div class="form-group col-lg-4 input_field_sections">
															<label for="casteId" class="col-form-label">Designation</label>
															<% 
															List list=dao.getDesignationList();
															Iterator itr1=list.iterator();
															%>
															<input type="text" list="browseDesign" autocomplete="off" class="form-control" name="designation" id="designationId" placeholder="Designation">
															<datalist id="browseDesign">
															<% 
																while(itr1.hasNext())
																{
																	String designationList=itr1.next().toString();
																
															%>
															<option value="<%=designationList %>"><%=designationList %></option>
															<%} %>
															</datalist>
														</div>
														
														<div class="form-group col-lg-4 input_field_sections">
															<label for="casteId" class="col-form-label">Bank Name</label>
															<select class="form-control chzn-select" name="bankName" id="bankName" >
																<option disabled selected>Choose a Bank Name</option>
																<%-- <%
									 								StaffDAO dao=new StaffImpl();
									 								request.setAttribute("list1",dao.getBankName());
																%>
																<option disabled selected>Choose a Bank</option>
			                                                	<c:forEach items="${list1}" var="u">  
			                                                		
																	<option value="${u.getId()}">${u.getBankName()}</option>
																</c:forEach>  --%> 
															</select>
														</div>
														<div class="form-group col-lg-4 input_field_sections">
															<label for="nationality" class="col-form-label">Bank Acc.No.</label>
															<input type="text" id="accId" name="accNo"
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
					<!-- End of Personal Details -->
					<!-- Teacher Bank Details -->
					<div class="outer">
						<div class="inner bg-container forms">
							<div class="row">
								<div class="col-lg-12">
									<div class="card">
										<div class="card-header bg-white">
											<h3>Teacher Other Details</h3>
										</div>
										<div class="card-block">
											<div class="row">
												<div class="card-block seclect_form">
													<div class="row">
														<div class="form-group col-lg-4 input_field_sections">
															<label for="nationality" class="col-form-label">UID No </label>
															<input type="text" id="uid" name="uid"
																class="form-control" placeholder="UID No" />
														</div>
														<div class="form-group col-lg-4 input_field_sections">
															<label for="nationality" class="col-form-label">PF No </label>
															<input type="text" id="pfId" name="pf"
																class="form-control" placeholder="PF No" />
														</div>
														<div class="form-group col-lg-4 input_field_sections">
															<label for="nationality" class="col-form-label">PAN No.</label>
															<input type="text" id="panId" name="panNo"
																class="form-control" placeholder="PAN Card No" />
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
					<!-- End of Teacher Bank Details -->
					
					
                
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
																name="saveStaff" value="Save" />
																<input type="reset" class="btn btn-primary"
																name="submitBtn" value="Cancel" />
														</div>
														<!-- <div class="form-actions form-group row">
	                                           				 <input type="submit" value="Save" name="addbook" class="btn btn-primary" >
	                                             				&nbsp;&nbsp;&nbsp;<input type="reset" value="Cancel" class="btn btn-primary" style="margin-top: 3%;">
	                                  					</div> -->
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

<!-- Modal for category -->
            <div class="modal fade show" id="department" role="dialog" aria-labelledby="modalLabelnews">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header bg-primary">
                                <h4 class="modal-title text-white" id="modalLabelnews">Category</h4>
                            </div>
                            <div class="modal-body">
                            	<form action="/SMGMT/Staff" class="form-horizontal" id="form_block_validator" method="POST">
                            		 		<div class="form-group row">
                            		 			<div class="col-lg-8 ">
                                                    <label for="catName" class="col-form-label">Department Name </label><span style="color: red;">*</span>
                                               	    <input type="text" id="catName" name="catName" class="form-control" onkeyup="this.value = this.value.toUpperCase();" pattern="[A-Za-z]" required>
                                                </div>
                                            </div>
                                             <div class="modal-footer">
                               					 <button class="btn btn-success" type="submit" name="savecat" id="updateId">Save</button> 
					                           	<button class="btn btn-warning" data-dismiss="modal">Cancel</button>
                            				</div>
                           	    </form>   
                            </div>
                           
                        </div>
                    </div>
                </div>  <!-- /Modal  -->
	<!-- /#content -->


	<jsp:include page="/View/common/commonJs.jsp"></jsp:include>


	<script type="text/javascript">
//====================================== loadFunction  =====================================
function loadFunction(){
	
	getBankName();
	getAcademicYear();
	standardList();
	admissionDate();
	classAllocation();
	religionList();
	
	
}
//======================================End loadFunctionr  =====================================
//====================================== ACADEMIC YEAR =====================================
	function getDept(str,id){

			document.getElementById('browseData').innerHTML='';
			if(!document.getElementById(id).value==""){
				var xhttp;
				document.getElementById(id).value=str.toUpperCase();
				xhttp = new XMLHttpRequest();
				xhttp.onreadystatechange = function() {
					if (this.readyState == 4 && this.status == 200) {
						var demoStr = this.responseText.split(",");
							//alert(demoStr);
							 if(demoStr[0]==0)
							{
								if (confirm("Are You Want To Add "+demoStr[1]) == true) {
							       insertData(str);
							    }
								else{
									document.getElementById(id).value="";
									document.getElementById("browseData").innerHTML="";
									document.getElementById(id).focus();
								}
								} 
								
						}
					};

	  xhttp.open("POST", "/SMGMT/Staff?department="+str, true);
	  xhttp.send();
			}

}

function insertData(str)
{
	if(str=="")
	{
	   alert("something wrong happening");
	   document.getElementById("deptId").value="";
	   document.getElementById("deptId").focus();
	   document.getElementById("browseData").innerHTML="";
	}
else
	{
	var xhttp;
	xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			var newdata = this.responseText.split(",");
			alert(newdata);
			if(newdata[0]==1)
				{
				var newDiv=document.createElement("DIV");
				newDiv.id="snackbar";
				document.body.appendChild(newDiv);
				var x = document.getElementById("snackbar");
				x.innerHTML=newdata[1];
			    x.className = "show";
			    setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
				}
				
			}
		};
	xhttp.open("POST","/SMGMT/Staff?addNewDept="+str, true);
	xhttp.send();
		
	}
	
}

	function getBankName()
	{
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
					document.getElementById("bankName").innerHTML+=row;
					$("#bankName").trigger('chosen:updated'); 
				}
			}
			xhttp.open("POST", "/SMGMT/Staff?bankList=bankList", true);
			xhttp.send();
		}catch(e){
			alert("Unable to Connect Server!");
		}
	}
	
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
		alert('id '+id);
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
			xhttp.open("POST", "/SMGMT/Staff?casteList="+id, true);
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
//====================================== AGE Calculator  =====================================
	function getAge() {
	
		var inputDate = document.getElementById("dob").value;
		var newDate=inputDate.split("-");
		
	    var byr = newDate[2];
	    var bmo = newDate[1];
	    bmo=bmo-1;
	    alert(bmo);
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
	    	alert(age);
	    }
	    document.getElementById("age").value=(tyr-age);
	    alert(tyr-age);
}
//======================================End  AGE Calculator  =====================================

</script>


</body>
</html>