<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.servletStore.fees.feescollection.model.FeesCollectionImpl"%>
<%@page import="com.servletStore.fees.feescollection.model.FeesCollectionDAO"%>
<%@page import="com.servletStore.setup.model.SetupPOJO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.servletStore.setup.model.SetupImpl"%>
<%@page import="com.servletStore.setup.model.SetupDAO"%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
                                    Fees Collection
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
                                    <li class="active breadcrumb-item">Fees Collection</li>
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
                                        Student Fee Collection
                                    </div>
                                    <div class="card-block m-t-35">
                                        <form action="/SMGMT/FeesCollection" method="POST" class="form-horizontal  login_validator" id="form_block_validator">
                                            <div class="form-group row">
                                                <div class="col-lg-2  text-lg-right">
                                                    <label for="required2" class="col-form-label">Select Standard*</label>
                                                </div>
                                                <div class="col-lg-3">
                                               <select class="form-control chzn-select" title="Select Standard" name="standard_id" id="standard_id" required="required" onchange="selectStudent()">
			                                        <option value="Select Standard" disabled="disabled"> Select Standard </option>
			                                        <%
			                                        
			                        					DateFormat df = new SimpleDateFormat("DD-MM-YYYY");
			                        					String currentDate = df.format(new Date()).toString();
                                                    	//System.out.println(currentDate);
			                                        	FeesCollectionDAO feesCollectionDAO = new FeesCollectionImpl();
			                                        	request.setAttribute("list", feesCollectionDAO.getStadardDivisionDetails(schoolId));
			                                        %>
			                                        <option></option>
			                                       	<c:forEach items="${list}" var="u">  
														<option value="${u.getClassRoomMasterId()}">${u.getStdName()} ${u.getDivName()} - ${u.getShift()}</option>
													</c:forEach>
			                                        
			                                    </select>                                                    
                                                </div>
                                                <div class="col-lg-2 text-lg-right">
                                                    <label for="email2" class="col-form-label">Select Student*</label>
                                                </div>
                                                <div class="col-lg-3">
                                                <select class="form-control chzn-select" title="Select Student" name="student_id" id="student_id" onchange="selectedStudentInfo()" required="required">
			                                    	<option value="Select Student" disabled="disabled"> Select Student </option>
			                                    	
			                                    </select>                                                    
                                                </div>                                               
                                            </div>
                                            <br>
                                            <div class="form-group row">
                                                <div class="col-lg-2  text-lg-right">
                                                    <label for="required2" class="col-form-label">Remaining fees</label>
                                                </div>
                                                <div class="col-lg-3">
                                                    <input type="text" id="remaining_fees" name="remaining_fees" class="form-control" readonly >
                                                </div>
                                                <div class="col-lg-2 text-lg-right">
                                                    <label for="email2" class="col-form-label">Pay Fees *</label>
                                                </div>
                                                <div class="col-lg-3">
                                                    <input type="text" id="paid_fees" name="paid_fees" class="form-control" pattern= "[0-9]" required>
                                                </div>                                                
                                            </div>                                            
                                            <br>
                                            <div class="form-group row">
                                                <div class="col-lg-2  text-lg-right">
                                                    <label for="required2" class="col-form-label">Date *</label>
                                                </div>
                                                <div class="col-lg-3">
                                                    <div class="input-group input-append date" id="dp3" data-date-format="dd-mm-yyyy">
                                                    	<input class="form-control" type="text" name="currentDate" id="currentDate" placeholder="dd-mm-yyyy" required="required" value="<%= currentDate %>">
                                                	    <span class="input-group-addon add-on">
                                                    	<i class="fa fa-calendar"></i>
                                                	</span>
                                                </div>
                                                </div>
                                                <div class="col-lg-3 text-lg-right">
	                                                <label class="custom-control custom-checkbox">
	                                                    <input type="checkbox" class="custom-control-input" name="checkbox_cashbook" id="checkbox_cashbook" >
	                                                    <span class="custom-control-indicator custom_checkbox_primary"></span>
	                                                    <span class="custom-control-description text-primary">Cash Book</span>
	                                                </label>
                                                </div>                                                
                                            </div>
                                            <br>
                                            <div class="form-group row">
                                                <div class="col-lg-2  text-lg-right">
                                                    <label for="required2" class="col-form-label">Payment Mode *</label>
                                                </div>
                                                <div class="col-lg-1 text-lg-right">
                                                    <label class="custom-control custom-radio">
                                                        <input type="radio" name="payment_mode" id="payment_mode" value="Cash" class="custom-control-input" checked="checked">
                                                        <span class="custom-control-indicator custom_checkbox_primary"></span>
                                                        <span class="custom-control-description text-primary">Cash</span>
                                                    </label>                                                
                                                </div>
                                                <div class="col-lg-1 text-lg-right">
                                                    <label class="custom-control custom-radio">
                                                        <input type="radio" name="payment_mode" id="payment_mode" value="Cheque" class="custom-control-input">
                                                        <span class="custom-control-indicator custom_checkbox_primary"></span>
                                                        <span class="custom-control-description text-primary">Cheque</span>
                                                    </label>                                                
                                                </div>
                                                <div class="col-lg-1 text-lg-right">
                                                    <label class="custom-control custom-radio">
                                                        <input type="radio" name="payment_mode" id="payment_mode" value="Transfer" class="custom-control-input">
                                                        <span class="custom-control-indicator custom_checkbox_primary"></span>
                                                        <span class="custom-control-description text-primary">Transfer</span>
                                                    </label>                                                
                                                </div>                                                                                                            
                                            </div>
                                           
                                            <div class="form-actions form-group row">
                                                <div class="col-lg-4 push-lg-4">
                                                    <button type="submit" name="feesCollection_btn" id="feesCollection_btn" value="feesCollection_btn" class="btn btn-primary">Submit</button>
                                                    <!-- <input type="submit" value="Submit" name="feesCollection_btn" id="feesCollection_btn" class="btn btn-primary"> -->
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div> <!-- /.col-lg-12 -->
                        </div> <!-- /.row -->
                    </div> <!-- /.inner -->
                </div> <!-- /.outer -->
            
            
            <div class="outer">
                    <div class="inner bg-container">
                        <div class="card">
                            <div class="card-header bg-white">
                                User Grid
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
                                            	<th >No</th>
                                            	<th >Date</th>
                                            	<th >Paid Amount</th>
                                            	<th >Remaining Amount</th>
                                                <th >Payment Mode</th>
                                                <th >Description</th>
                                            </tr>
                                            </thead>
                                            
                                            <tbody id="feesTable">
                                            	
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
                <!-- Modal -->
                <div class="modal fade" id="search_modal" tabindex="-1" role="dialog" aria-hidden="true">
                    <form>
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span class="float-right" aria-hidden="true">&times;</span>
                                </button>
                                <div class="input-group search_bar_small">
                                    <input type="text" class="form-control" placeholder="Search..." name="search">
                                    <span class="input-group-btn">
							        <button class="btn btn-secondary" type="submit"><i class="fa fa-search"></i></button>
							      </span>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            
            
            </div> <!-- /#content -->
        </div>
        
       <!--wrapper-->
       
        
</div>
<!-- /#wrap -->

	<jsp:include page="/View/common/commonJs.jsp"></jsp:include>
	
	
<script type="text/javascript">

function selectStudent() {
	
	var standard_id = document.getElementById('standard_id').value;
	
	//alert("Standard Id "+standard_id);
	
	var xhttp =new XMLHttpRequest();
	
	try{
		xhttp.onreadystatechange = function(){
			if(this.readyState == 4 && this.status == 200){
				var str=this.responseText.split(",");
				
				var data="<option disabled selected>Select Student </option>";
				
				for (var i = 0; i < str.length-1;) {
					
					data+='<option value='+str[ i++]+'>'+ str[ i++] +' </option>';
				}
				
				//alert(data);
				
				document.getElementById("student_id").innerHTML=data;
				$("#student_id").trigger('chosen:updated');					
			}
		}
		xhttp.open("POST", "/SMGMT/FeesCollection?standard_id="+standard_id, true);
		xhttp.send();
	}catch(e){
		alert("Unable to Connect Server!");
	}
	//SELECT student_details.id, student_details.first_name, student_details.middle_name, student_details.last_name FROM 
	//student_details, class_allocation WHERE class_allocation.student_id = student_details.id AND class_allocation.classroom_master=8
	
	//SELECT student_details.id, concat(student_details.first_name,' ',student_details.middle_name,' ',student_details.last_name) AS full_name FROM 
	//student_details, class_allocation WHERE class_allocation.student_id = student_details.id AND class_allocation.classroom_master=8 AND 
	//concat(student_details.first_name,' ',student_details.middle_name,' ',student_details.last_name) LIKE 'suraj m%'
}

function selectedStudentInfo() {
	
	var student_id = document.getElementById('student_id').value;
	alert("student_id "+student_id);
	
	var xhttp =new XMLHttpRequest();
	
	try{
		xhttp.onreadystatechange = function(){
			if(this.readyState == 4 && this.status == 200){
				var str=this.responseText.split(",");
				
				alert(str);
				var count=0;
				var data="";
				document.getElementById("remaining_fees").value = str[0];
				
				for (var i = 1; i < str.length-1;) {
					//alert(str[i++]);
					 data+="<tr><td>"+(++count)+"</td>"+
						"<td>"+str[i++]+"</td>"+
						"<td>"+str[i++]+"</td>"+
						"<td>"+str[i++]+"</td>"+
						"<td>"+str[i++]+"</td>"+
						"<td>"+str[i++]+"</td></tr>";
				}
				alert(data);
				document.getElementById("feesTable").innerHTML = data;
			}
		}
		xhttp.open("POST", "/SMGMT/FeesCollection?student_id="+student_id, true);
		xhttp.send();
	}catch(e){
		alert("Unable to Connect Server!");
	}
	//SELECT date, paid_fees, remaining_fees, pay_mode, particulers FROM fees_collection WHERE stud_id=1
	
	
	//SELECT remaining_fees FROM fees_collection WHERE id=(SELECT MAX(id) FROM fees_collection WHERE stud_id=1)
}


</script>	
	

	
</body>
</html>
