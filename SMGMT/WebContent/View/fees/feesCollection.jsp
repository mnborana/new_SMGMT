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
			                                        
			                        		/* 			DateFormat df = new SimpleDateFormat("DD-MM-YYYY");
			                        					String currentDate = df.format(new Date()).toString();
                                                    	System.out.println(currentDate); */
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
                                                <select class="form-control chzn-select" title="Select Student" name="student_id" id="student_id" onchange="selectCast()" required="required">
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
                                                    <input type="text" id="paid_fees" name="paid_fees" class="form-control" onkeyup="if(/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')" required>
                                                </div>                                                
                                            </div>                                            
                                            <br>
                                            <div class="form-group row">
                                                <div class="col-lg-2  text-lg-right">
                                                    <label for="required2" class="col-form-label">Date *</label>
                                                </div>
                                                <div class="col-lg-3">
                                                    <div class="input-group input-append date" id="dp3" data-date-format="dd-mm-yyyy">
                                                    	<input class="form-control" type="text" name="currentDate" id="currentDate" placeholder="dd-mm-yyyy" required="required">
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
                                                        <input type="radio" name="payment_mode" id="payment_mode" value="Cash" class="custom-control-input" onclick="displayBank()" checked="checked">
                                                        <span class="custom-control-indicator custom_checkbox_primary"></span>
                                                        <span class="custom-control-description text-primary">Cash</span>
                                                    </label>                                                
                                                </div>
                                                <div class="col-lg-1 text-lg-right">
                                                    <label class="custom-control custom-radio">
                                                        <input type="radio" name="payment_mode" id="payment_mode" value="Cheque" class="custom-control-input" onclick="displayBank('bankDetails', 'chequeDetails')">
                                                        <span class="custom-control-indicator custom_checkbox_primary"></span>
                                                        <span class="custom-control-description text-primary">Cheque</span>
                                                    </label>                                                
                                                </div>
                                                <div class="col-lg-1 text-lg-right">
                                                    <label class="custom-control custom-radio">
                                                        <input type="radio" name="payment_mode" id="payment_mode" value="Transfer" class="custom-control-input" onclick="displayBank('bankDetails')">
                                                        <span class="custom-control-indicator custom_checkbox_primary"></span>
                                                        <span class="custom-control-description text-primary">Transfer</span>
                                                    </label>                                                
                                                </div>     
                                                
                                                <div class="col-lg-2 text-lg-right" id="bank_id">
                                                    <input type="text" placeholder="Bank Name" id="bank_name" name="bank_name" class="form-control" style="width: 150px; margin-left: 100px;">
                                                </div>                                                
                                                
                                                <div class="col-lg-2 text-lg-right" id="cheque_id">
                                                    <input type="text" placeholder="Cheque Number" id="check_no" name="check_no" class="form-control" onblur="this.value=$.trim(this.value)" pattern= "[0-9]" style="width: 150px; margin-left: 100px;">
                                                </div>
                                                                                                                                                                                                                                                       
                                            </div>
                                            
                                                
                                             
                                           
                                            <div class="form-actions form-group row">
                                                <div class="col-lg-4 push-lg-4">
                                                    <button type="submit" name="feesCollection_btn" id="feesCollection_btn" value="feesCollection_btn" class="btn btn-primary" disabled="disabled">Submit</button>
													<!-- <input type="button" value="Show Modal" data-toggle="modal" data-target="#search_modal" class="btn btn-primary"> --> 
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div> <!-- /.col-lg-12 -->
                        </div> <!-- /.row -->
                    </div> <!-- /.inner -->
                </div> <!-- /.outer -->
            
            <input type="text" id="year" value="<%=academicYear%>">
            
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
                <div class="modal fade" id="feeStruc" tabindex="-1" role="dialog" aria-hidden="true">
                    <form>
                        <div class="modal-dialog modal-lg" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    	<span class="float-right" aria-hidden="true">&times;</span>
                                	</button>
									<h4 class="modal-title" id="modalHead">Fee Structure</h4>
                                </div>
                                
                                <div class="modal-body">
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
                                
                                <div class="modal-footer">
                                	<button type="button" class="btn btn-primary" data-dismiss="modal" onclick="assignFee()">Assign Fee</button>
							        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
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


var feeForAssign = [];
var feeSum=0;

/*----- toast----- */
function myFunction(res){
	    iziToast.show({
            title: 'Status',
            message: res,
				color : '#00cc99',
				position : 'topCenter'
			});
	
}


/*------------ Setting student in dropdown and getting standard wise fee--------------- */
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
				
				if(fee.length==1)
				{
					alert('Fee not assinged for this class assign it first');	
					document.getElementById("feesCollection_btn").disabled = true;
				}
				else
				{
					document.getElementById("feesCollection_btn").disabled = false;
					
					var newArr=[];
					newArr.push(fee[fee.length-1]);
					 
					 for(var i=1;i<str.length;i++)
					 {
						 newArr.push(str[i]);
					 }
				
					fee.splice(-1,1);
					feeForAssign=[];
					feeForAssign.push(fee);
					
					 
					var data="<option disabled selected>Select Student </option>";
					
					for (var i = 0; i < newArr.length-1;) {
						
						data+='<option value='+newArr[ i++]+'>'+ newArr[ i++] +' </option>';
					}

					document.getElementById("student_id").innerHTML=data;
					$("#student_id").trigger('chosen:updated');	
					
					
				}
				
			
								
			}
		}
		xhttp.open("POST", "/SMGMT/AssignFee?standard_id="+standard_id, true);
		xhttp.send();
	}catch(e){
		alert("Unable to Connect Server!");
	}
}



/*-------- getting castWise fee and calculating with standardwise fee and setting it into modal table------------------- */
function selectCast()
{
	var student_id = document.getElementById('student_id').value;
	var standard_id = document.getElementById('standard_id').value;
	var academicYear = document.getElementById('year').value;
	var xhttp =new XMLHttpRequest();
	var sum=0;
	
	var cast = "";
	
	try{
		xhttp.onreadystatechange = function(){
			if(this.readyState == 4 && this.status == 200){
				var castFee=this.responseText;
				if(castFee.trim()==="FEE ASSIGNED")
				{
					selectedStudentInfo();
				}
				else
				{
					if(castFee.length==1)
					{
						alert("Cast category not assinged for this student assinged it first");
						document.getElementById("feesCollection_btn").disabled = true;
					}
					else
					{
						document.getElementById("remaining_fees").value ="";
						var allFee = castFee.split(",");	
						cast = allFee[allFee.length-1];
						allFee.splice(-1,1); //for removing last element
						if(feeForAssign.length>1)
						{
							while(feeForAssign.length > 1) { //for removing last assigned fee
								feeForAssign.pop();
							}	
						}
						feeForAssign.push(allFee); //added cast fee into standard fee
						
						//copying array for seeting it into table
						var feeStruct = feeForAssign.slice(0);
						
						
						var feeForAddition=[];
						
						var tempArray = [];
						var newArr = [];
						  for(var i=0;i<feeForAssign.length;i++)
							{
							  tempArray=feeForAssign[i].toString().split(",");
							  for(var j=0;j<tempArray.length;j++)
								{
								  newArr.push(tempArray[j].split(","))
								 }
							}
						  feeForAddition =newArr.slice(0);
						  
						  
						  for(var i=0;i<newArr.length;i++)
							{
							  	if(isNaN(newArr[i]))
								{
							  		newArr.splice(i,1);
								}  
							}
						  
						feeSum=0;
						for(var i=0;i<newArr.length;i++)
						{
							feeSum+=parseInt(newArr[i]);
						}//addition of all fees
						
						
						$('#feeStruc').modal('show'); 
						
						
						$('#feeStruc').on('shown.bs.modal', function (e) {
							  var tableData = "";
							  var count = 1;
							//  alert(feeForAddition);
							  
							  for(var i=0;i< feeForAddition.length;)
							  {
									//alert(feeForAddition[i+2]);
								  if( isNaN(feeForAddition[i+2])|| feeForAddition[i+2]=== undefined)
									{
									//	alert('hello');
										tableData +="<tr>"
											+"<td>"+count+"</td>"
											+"<td>"+feeForAddition[i++]+"</td>"
											+"<td colspan='2' align='center'>"+feeForAddition[i++]+"</td>"
											+"</tr>";
									}
									else
									{ 
										tableData +="<tr>"
											+"<td>"+count+"</td>"
											+"<td>"+feeForAddition[i++]+"</td>"
											+"<td>"+feeForAddition[i++]+"</td>"
											+"<td>"+feeForAddition[i++]+"</td>"
											+"</tr>";	
									}
									count++;
								  
								  	
							  }
							  document.getElementById("feeStructure").innerHTML=tableData;
							  
							  var table = document.getElementById("tableId");
							  
							  var rowCount = table.rows.length;
								
								var row = table.insertRow(rowCount);//tr
								
								var cell1 = row.insertCell(0);//td
								
								cell1.innerHTML="<b>Total Fee</b>";
								
								cell1.colSpan = 2
								
								$(cell1).attr("align","center");
								
								cell1.style.backgroundColor="#4fb7fe";
								
								var cell2 = row.insertCell(1);//td
								
								cell2.innerHTML="<b>"+feeSum+"<b>";
								
								cell2.colSpan = 2
								
								$(cell2).attr("align","center");
								
								cell2.style.backgroundColor="#4fb7fe";
								
								var selectedStudent = document.getElementById("student_id");
								var studName = selectedStudent.options[selectedStudent.selectedIndex].text;
								
								document.getElementById("modalHead").innerHTML=studName+" Fee Structure for "+cast+" Category"
							  
							});

						
						
					}
					
				}
				
			}
		}
		xhttp.open("POST", "/SMGMT/AssignFee?student_id="+student_id+"&standard="+standard_id+"&year="+academicYear, true);
		xhttp.send();
	}catch(e){
		alert("Unable to Connect Server!");
	}

	
}


/*------------ assigning total fee----------------- */
function assignFee()
{
	var aYear = document.getElementById('year').value;
	var student_id = document.getElementById('student_id').value;
	var standard_id = document.getElementById('standard_id').value;
	
	 var xhttp =new XMLHttpRequest();
	
	try{
		xhttp.onreadystatechange = function(){
			if(this.readyState == 4 && this.status == 200){
				var result=this.responseText;
				if(result=="Fee Assigned")
				{
					document.getElementById('remaining_fees').value = feeSum;					
				}
				myFunction(result);
			}
		}
		xhttp.open("POST", "/SMGMT/AssignFee?assign=1&standard_Id="+standard_id+"&student_Id="+student_id+"&totalFee="+feeSum+"&year="+aYear, true);
		xhttp.send();
	}catch(e){
		alert("Unable to Connect Server!");
	} 
}







function selectedStudentInfo() {
	
	var student_id = document.getElementById('student_id').value;
	//alert("student_id "+student_id);
	
	var xhttp =new XMLHttpRequest();
	
	try{
		xhttp.onreadystatechange = function(){
			if(this.readyState == 4 && this.status == 200){
				var str=this.responseText.split(",");
				
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
				//alert(data);
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

$("#bank_id").hide();
$("#cheque_id").hide();

function displayBank(bank_id, cheque_id){
	
	if( bank_id==null ){
		$("#bank_id").hide();
		$("#cheque_id").hide();
	}
	else if(bank_id!=null && cheque_id!=null){
		$("#bank_id").show();
		$("#cheque_id").show();
	}
	else{	
		$("#bank_id").show();
		$("#cheque_id").hide();
	}
}
    

</script>	
	

	
</body>
</html>
