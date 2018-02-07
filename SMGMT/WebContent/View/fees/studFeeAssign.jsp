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
                                    Assign Student Fee
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
                                    <li class="active breadcrumb-item">Assign Student Fee</li>
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
                                        Student Fee
                                    </div>
                                    <div class="card-block seclect_form">
                                        <form action="/SMGMT/AssignFee" method="post" class="form-horizontal" id="form_block_validator">
                                            
                                            <div class="row">
	                                            <div class="col-lg-2 input_field_sections">
	                                            </div>
	                                            
	                                            	<%
			                                        	FeesCollectionDAO feesCollectionDAO = new FeesCollectionImpl();
			                                        	request.setAttribute("list", feesCollectionDAO.getStadardDivisionDetails(schoolId));
			                                        %>
	                                            <div class="col-lg-4 input_field_sections">
	                                                <h5>Select Standard</h5>
	                                                	<select class="form-control chzn-select" id="standard_id" name="standard_Id" onchange="selectStudent()" required>
															<option value="" selected="selected">Select Standard</option>
															<c:forEach items="${list}" var="u">  
																<option value="${u.getClassRoomMasterId()}">${u.getStdName()} ${u.getDivName()} - ${u.getShift()}</option>
															</c:forEach>
														</select>
	                                            </div>
	                                            <div class="col-lg-4 input_field_sections">
	                                                <h5>Student Name</h5>
	                                                	<select class="form-control chzn-select" id="student_id" name="student_Id" onchange="selectCast()" required>
															<option value="">Select Student</option>
															<option value="">demo</option>
														</select>
	                                            </div>
                                        	</div>
                                        	
                                        	<input type="text" id="totalFee" name="totalFee"/>
                                        	<input type="text" id="year" name="year" value="<%=academicYear%>"/>
                                            
                                            <div class="outer">
                                            	<div class="inner bg-container">
							                		<div class="card">
							                    		<div class="card-header bg-white" id="heading">Student Fees Structure</div>
							                    		<div class="card-block m-t-35" id="user_body">
							                        		<div class="table-toolbar">
								                                <div class="btn-group float-right users_grid_tools">
								                                    <div class="tools"></div>
								                                </div>
							                            	</div>
							                            	
							                            	<table class="table  table-striped table-bordered table-hover  no-footer" id="tableId"  role="grid">
							                                        <thead>
								                                        <tr role="row">
																			<th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">No</th>
								                                            <th class="sorting wid-25" tabindex="0" rowspan="1" colspan="1">Fees Type</th>
								                                            <th class="sorting wid-25" tabindex="0" rowspan="1" colspan="1">Term One Fees</th>
								                                            <th class="sorting wid-25" tabindex="0" rowspan="1" colspan="1">Term Two Fees</th>
								                                        </tr>
							                                        </thead>
							                                        <tbody id="feeStructure">
							                                        	<tr id="trid">
							                                        		<td></td>
							                                        		<td></td>
							                                        		<td></td>
							                                        		<td></td>
							                                        	</tr>
							                                        </tbody>
							                                 </table> 
							                        	</div>
							                    	</div>
							                	</div>
	                                        </div>
                                            
                                            
                                           
                                            <div class="form-actions form-group row">
                                                <div class="col-lg-4 push-lg-4">
                                                    <input type="submit" value="Assign Fee" name="assign"  id="assign" class="btn btn-primary" disabled="disabled">
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
                                            	<th class="sorting_asc wid-10" tabindex="0" rowspan="1" colspan="1">Sr.No</th>
                                            	<th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">User Type</th>
                                            	<th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">User Name</th>
                                                <!-- <th class="sorting wid-20" tabindex="0" rowspan="1" colspan="1">Book NO</th> -->
                                                <th class="sorting wid-25" tabindex="0" rowspan="1" colspan="1">Book Name</th>
                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Issue Date</th>
                                                <th class="sorting wid-20" tabindex="0" rowspan="1" colspan="1">Due Date</th>
                                            </tr>
                                            </thead>
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
	function myFunction(){
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

	}
	
	function selectCast()
	{
		var student_id = document.getElementById('student_id').value;
		
		var standard_id = document.getElementById('standard_id').value;
		
		var xhttp =new XMLHttpRequest();
		
		var sum=0;
		
		try{
			xhttp.onreadystatechange = function(){
				if(this.readyState == 4 && this.status == 200){
					var castFee=this.responseText.split(",");
				
					if(castFee.length==1)
					{
						alert("Cast category not assinged for this student assinged it first");
						document.getElementById("assign").disabled = true; 
					}
					else
					{
						document.getElementById("assign").disabled = false;
					}
					var table = document.getElementById("tableId");
					
					var lastRowId = $('#tableId tr:last').attr('id');
					
					while(lastRowId === undefined) //for deleting last available rows
					{
						var lastRowId = $('#tableId tr:last').attr('id');
						if(lastRowId)
						{
							break;
						}
						var rowCount = table.rows.length;
					    table.deleteRow(rowCount -1);
					}
					
					for(var i=0;i<castFee.length-1;i=i+2)
					{
						
						var lastSrNo = $('#tableId tr:last td:first').text();
						var count=parseInt(lastSrNo)+1;
						
						var rowCount = table.rows.length;
						
						var row = table.insertRow(rowCount);//tr
						
						var cell1 = row.insertCell(0);//td
						
						cell1.innerHTML=count; //srNo
						
						var cell2 = row.insertCell(1);
						
						cell2.innerHTML=castFee[i]; //feeType
						
						var cell3 = row.insertCell(2);
						
						cell3.innerHTML=castFee[i+1]; //fee
						
						cell3.colSpan = 2;
						
						$(cell3).attr("align","center");
		
					}
					
					var totalRows = document.getElementById("tableId").rows.length;
					
					for(var i=1;i<totalRows;i++)
					{
						var totalColumn = table.rows[i].cells.length;
						
						if(totalColumn==4)
						{
							sum+=parseInt(table.rows[i].cells[2].innerText);
							
							sum+=parseInt(table.rows[i].cells[3].innerText);
								
						}
						else
						{
							sum+=parseInt(table.rows[i].cells[2].innerText);
								
						}
												
					}
					
					var rowCount = table.rows.length;
					
					var row = table.insertRow(rowCount);//tr
					
					var cell1 = row.insertCell(0);//td
					
					cell1.innerHTML="<b>Total Fee</b>";
					
					cell1.colSpan = 2
					
					$(cell1).attr("align","center");
					
					cell1.style.backgroundColor="#4fb7fe";
					
					var cell2 = row.insertCell(1);//td
					
					cell2.innerHTML="<b>"+sum+"<b>";
					
					cell2.colSpan = 2
					
					$(cell2).attr("align","center");
					
					cell2.style.backgroundColor="#4fb7fe";
 
					document.getElementById('totalFee').value=sum;
					
					
					document.getElementById('heading').innerHTML="Student Fees Structure for "+castFee[castFee.length-1]+" Category";
					
				}
			}
			xhttp.open("POST", "/SMGMT/AssignFee?student_id="+student_id+"&standard="+standard_id, true);
			xhttp.send();
		}catch(e){
			alert("Unable to Connect Server!");
		}
	
		
	}
	function selectStudent() {
		
		var standard_id = document.getElementById('standard_id').value;
		
		var xhttp =new XMLHttpRequest();
		
		try{
			xhttp.onreadystatechange = function(){
				if(this.readyState == 4 && this.status == 200){
					var str=this.responseText.split(",");
					var fee=str[0].split("#");
					
					var tableData="";
					var count=1;
					//var i=0;
					
					if(fee.length==1)
					{
						alert('Fee not assinged for this class assign it first');	
						document.getElementById("assign").disabled = true;
					}
					
					for(var i=0;i < fee.length-1;i=i+3)
					{
					 	tableData+="<tr id='row"+count+"'>"
						+"<td>"+count+"</td>"
						+"<td>"+fee[i]+"</td>"
						+"<td>"+fee[i+1]+"</td>"
						+"<td>"+fee[i+2]+"</td>"
						+"</tr>";
						
						count++;
//						alert(tableData);
						
					}
					 document.getElementById("feeStructure").innerHTML=tableData;
					 
					
					// 
					
					
					
					
					
					
					var data="<option disabled selected>Select Student </option>";
					
					for (var i = 0; i < str.length-1;) {
						
						data+='<option value='+str[ i++]+'>'+ str[ i++] +' </option>';
					}
					
					//alert(data);
					
					document.getElementById("student_id").innerHTML=data;
					$("#student_id").trigger('chosen:updated');					
				}
			}
			xhttp.open("POST", "/SMGMT/AssignFee?standard_id="+standard_id, true);
			xhttp.send();
		}catch(e){
			alert("Unable to Connect Server!");
		}
	}

	
	</script>
</body>
</html>
