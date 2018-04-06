<%@page import="com.servletStore.setup.model.SetupImpl"%>
<%@page import="com.servletStore.setup.model.SetupPOJO"%>
<%@page import="java.util.List"%>
<%@page import="com.servletStore.setup.model.SetupDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.servletStore.fees.assignStdWiseFees.model.AssignStdWiseFeesImpl"%>
<%@page import="com.servletStore.fees.assignStdWiseFees.model.AssignStdWiseFeesDao"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>Vertical Software</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
     <!-- common css -->
		<jsp:include page="/View/common/commonCss.jsp"></jsp:include>
     <!-- common css -->
    
    <!-- end of page level styles -->
    
    <style type="text/css">
    
    #standardId {
		display: block !important;
	    opacity: 0;
	    margin-top: -25%;
	}
	
	
    </style>
</head>


<%
	String schoolId = "0";
	String academicYear = "0";
	int roll=0;
	int access = 0;
	
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
		
		SetupPOJO grant = new SetupPOJO();
		
		 while(itr.hasNext())
		 {
			grant = itr.next();
		 }
		 
		 access = grant.getFee();
		 System.out.println("roll "+roll + " schoolId "+schoolId +" access "+access);
		 
		//if it returns read(1) then hide form and action column in dataTable
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
             
             
        <div id="content" class="bg-container">
            <header class="head">
                <div class="main-bar">
                   <div class="row no-gutters">
                       <div class="col-sm-5 col-lg-6 skin_txt">
                           <h4 class="nav_top_align">
                               <i class="fa fa-pencil"></i>
                               Standard Wise Fees Assignment
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
                                   <a href="#">Fees</a>
                               </li>
                               <li class="active breadcrumb-item">Fees Assignment</li>
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
                                        Fees Assignment
                                    </div>
                                    <div class="card-block m-t-35">
                                        <form action="/SMGMT/AssignStdWiseFees" method="post" class="form-horizontal  login_validator" id="form_block_validator">
                                       <div class="form-group row">
                                           <div class="col-lg-4  text-lg-right">
                                               <label for="required2" class="col-form-label">Select Standards <span style="color: red;">*</span> </label>
                                           </div>
                                           <div class="col-lg-4">
                                               <select multiple onchange="setStds()" class="form-control chzn-select" name="standardIds" id="standardId" title="Select Standard"  required>
			                                        
			                                        <%
				                                    	AssignStdWiseFeesDao dao = new AssignStdWiseFeesImpl(); 
				                                    	HashMap<Integer, String> stdList = dao.getStandards(schoolId);
				                                   		
				                                    	Set keys = stdList.keySet(); 
														Iterator itr = keys.iterator();
														
														while(itr.hasNext()){
				                                    		int key = Integer.parseInt(itr.next().toString());
				                                    %>
				                                    	<option value="<%=key %>"><%=stdList.get(key)%></option>
														
				                                     <%
				                                    	}
				                                     %>  
			                                        
			                                    </select>
                                           </div>
                                       </div>
                                       
                                      
                                      <br>
                                      
                                      
                                      <div class="outer">
							                <div class="inner bg-container">
							                    <div class="card">
							                        <div class="card-header bg-white">
							                            Standard Wise Fees Structure
							                        </div>
							                        <div class="card-block m-t-35" id="user_body">
							                            <div class="table-toolbar">
							                                
							                                <div class="btn-group float-right users_grid_tools">
							                                    <div class="tools"></div>
							                                </div>
							                            </div>
							                            
							                            <div>
							                                <div>
							                                    <table id="sort" class="table  table-striped table-bordered table-hover dataTable no-footer">
							                                        <thead>
							                                        <tr>
							                                            <th>
							                                            	<div class='checkbox'>
															                	<label class='text-mint'>	
															                    	<input type='checkbox' onclick="selectAllChecks()" id='selectAllCheck' >
															                    	<span class='cr'><i class='cr-icon fa fa-check'></i></span>
															                	</label>
																    		</div>
							                                            </th>
							                                            <th>Fees Type</th>
							                                            <th>Term One Fees</th>
							                                            <th>Term Two Fees</th>
							                                            <!-- <th>Priority</th> -->
							                                            <th>Action</th>
							                                        </tr>
							                                        </thead>
							                                        
							                                        <%
							                                        	request.setAttribute("FeesTypeList", dao.getFeestypeList());
							                                        	int i=0;
							                                        %>
							                                        
							                                        <tbody>	
							                                        
							                                        <c:forEach items="${FeesTypeList}" var="l">
							                                        	<%++i; %>
							                                        	<tr role="row" class="even" id="editFeeTR<%=i%>">
							                                        		<td id="${l.id}"> 
																           		<div class='checkbox'>
																                	<label class='text-mint'>	
																                    	<input type='checkbox' value='<%=i %>' onclick="getFinalTotal(<%=i%>)" name='feeTypeCheck' id='feeTypeCheck<%=i%>' >
																                    	<span class='cr'><i class='cr-icon fa fa-check'></i></span>
																                	</label>
																	    		</div>
							                                        		</td>
							                                        		<td><c:out value="${l.feesType}"> </c:out></td> 
							                                        		<td><c:out value="${l.termOneFees}"></c:out></td>
							                                        		<td><c:out value="${l.termTwoFees}"></c:out></td>
							                                        		
							                                        		<%-- <td>
							                                        			<div class='checkbox'>
																                	<label class='text-mint'>
																                    	<input type='checkbox' value='1' name='feeTypePriority_<%=i %>' id='feeTypePriority_<%=i %>' >
																                    	<span class='cr'><i class='cr-icon fa fa-check'></i></span>
																                	</label>
																	    		</div>	
							                                        		</td> --%>
																			
							                                        		<td>
							                                        			<a class="edit" style="cursor: pointer;" data-toggle="tooltip" data-placement="top" title="Update" onclick="updateFees(<%=i %>, ${l.id})">
							                                        				<i class="fa fa-pencil text-warning"></i>
							                                        			</a>&nbsp; &nbsp;
							                                        			
							                                        			<a class="save" style="cursor: pointer;" data-toggle="tooltip" data-placement="top" title="Save" onclick="saveUpdateFees(<%=i %>, ${l.id})">
							                                        				<i class="fa fa-floppy-o text-warning" style="color: #2b6ed4 !important"></i>
							                                        			</a>
							                                        		</td>
							                                        		
							                                        	</tr>
							                                        </c:forEach>
							                                        </tbody>
							                                    </table>
							                                    
							                                    
							                                    <td>
							                                    <table class="table  table-striped table-bordered table-hover dataTable no-footer">
							                                    	<thead>
							                                    	<th>Fees Type</th>
							                                    	<%
							                                        	List categoryList = dao.getCategoryList();
								                                    	Iterator itr2 = categoryList.iterator();
								                                    	while(itr2.hasNext()){
								                                    		String category = itr2.next().toString();
								                                    %>
								                                    		<th><%=category%></th>
								                                    <%		
								                                    	}
								                                    	//SELECT fee_type.fees_type, caste_wise_educational_fees.fees, caste_category.category_name FROM fee_type, caste_wise_educational_fees, caste_category WHERE fee_type.id=caste_wise_educational_fees.fees_type_id AND caste_wise_educational_fees.caste_category_id=caste_category.id AND caste_wise_educational_fees.fk_class_master_standard_id=1   ORDER BY `fee_type`.`fees_type` ASC
							                                        %>
							                                    	</thead>
							                                    	<tbody>
							                                    	
							                                    		<td></td>
							                                    		<td></td>
							                                    		<td></td>
							                                    		<td></td>
							                                    		<td></td>
							                                    		<td></td>
							                                    		<td></td>
							                                    		<td></td>
							                                    		<td></td>
							                                    		<td></td>
							                                    	</tbody>
							                                    </table>
							                                    </td>
							                                    
							                                    <table class="table  table-striped table-bordered table-hover dataTable no-footer">
							                                    	<tr style="background-color: #3aaefd85;">
								                                        <td><strong style="font-size: 135%;">Total Fees of Standard(s) : </strong><strong id="stdList" style="font-size: 100%;"></strong></td>
								                                        <td id="totalStdFess" style="width: 24%;"><strong style="font-size: 135%;">0</strong></td>
							                                        </tr>
							                                    </table>
							                                </div>
							                            </div>
							                            <!-- END EXAMPLE TABLE PORTLET-->
							                        </div>
							                    </div>
							                </div>
							                <!-- /.inner -->
							            </div>
							            
							            <br>
                                      
                                      <input type="hidden" name="counter" value="<%=i%>" /> 
                                      <input type="hidden" name="tableData" id="tableData" value="" /> 
                                      
                                       <div class="form-actions form-group row">
                                           <div class="col-lg-4 push-lg-4">
                                               <input type="submit" onclick="submitForm()" value="Assign Fees" name="AssignFeesSubmit" class="btn btn-primary">
                                           </div>
                                       </div>
                                   </form>
                                  </div>
                               </div>
                           </div> <!-- /.col-lg-12 -->
                       </div> <!-- /.row -->
                   </div> <!-- /.inner -->
               </div> <!-- /.outer -->
               <!-- /.outer -->
 
 				<div class="outer">
                    <div class="inner bg-container">
                        <div class="row">
                            <div class="col-xl-12">
                                <div class="card">
                                    <div class="card-header bg-white">
                                        Standard List With Fees Assigned
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
				                                            <th class="sorting_asc wid-20" tabindex="0" rowspan="1" colspan="1">Sr.No.</th>
				                                            <th class="sorting wid-25" tabindex="0" rowspan="1" colspan="1">Class</th>
				                                           	
				                                            <% if(access==2){ %>
				                                            	<th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Actions</th>
				                                            <% } %>
				                                        </tr>
			                                        </thead>
			                                        
			                                        <tbody>
			                                        	 <%
				                                         	AssignStdWiseFeesDao aswfImpl = new AssignStdWiseFeesImpl();
					                                     	List l = aswfImpl.getFeesAssignedStds(schoolId);
					                                    
					 										int count=1;
					                                     	Iterator itr1 = l.iterator();
					                                     	while(itr1.hasNext()){
					                                     		String id = itr1.next().toString();
					                                  	%>
				                                        	<tr role="row" class="even">
				                                        		<td><%=count %></td>
				                                        		<td><%=itr1.next() %></td>
				                                        		
				                                        		<% if(access==2){ %>
				                                        		<td>
				                                        			<a class="edit" data-placement="top" title="Update" href="#update" data-toggle="modal"  onclick="updateFees(<%=id %>)"><i class="fa fa-pencil text-warning"></i></a>&nbsp; &nbsp;
				                                        			<a data-placement="top" title="View" onclick="getFeesStructure(<%=id %>)" href="#view" data-toggle="modal"><i class="fa fa-eye" style="color: #09bf41bf"></i></a>&nbsp; &nbsp;
				                                        			<a data-toggle="tooltip" data-placement="top" title="Print" href="#"><i class="fa fa-print" style="color: #f91353"></i></a>
				                                        		</td>
				                                        		<% } %>
				                                        	</tr>
				                                        <%
				                                   	count++;
				                                  	}
				                                  %> 
			                                        </tbody>
			                                    </table>
			                                </div>
			                            </div>
			                            <!-- END EXAMPLE TABLE PORTLET-->
			                        </div>
                                </div>
                            </div> <!-- /.col-lg-12 -->
                        </div> <!-- /.row -->
                    </div> <!-- /.inner -->
                </div> <!-- /.outer -->

            </div>
        </div>
        <!-- /#content -->
    </div>
    <!--wrapper-->
    
    <!-- /#content -->
  
  	<!-- Model-->
       <div class="modal fade show" id="update" role="dialog" aria-labelledby="modalLabelnews">
          <div class="modal-dialog modal-lg" role="document">
              <div class="modal-content">
                  <div class="modal-header bg-primary">
                      <h4 class="modal-title text-white" id="modalLabelnews"><strong>Update Assigned Fees</strong></h4>
                  </div>
                  <div class="modal-body">
                  	<form action="/SMGMT/Installment" class="form-horizontal  login_validator" id="form_block_validator" method="post">
                                  
                    </form>	
                  </div>
              </div>
          </div>
      </div>  
      
      
      <div class="modal fade show" id="view" role="dialog" aria-labelledby="modalLabelnews">
          <div class="modal-dialog modal-lg" role="document">
              <div class="modal-content" style="width: 140%; margin-left: -19%;">
                  <div class="modal-header bg-primary">
                      <h4 class="modal-title text-white" id="modalLabelnews"><strong>Assigned Fees</strong></h4>
                  </div>
                  <div class="modal-body">
                  	<form action="/SMGMT/Installment" class="form-horizontal  login_validator" id="form_block_validator" method="post">
                          <div class="outer">
		                    <div class="inner bg-container">
		                        <div class="row">
		                            <div class="col-xl-12">
		                                    
		                                    <div class="card-block m-t-35" id="user_body">
					                            <div class="table-toolbar">
					                                
					                                <div class="btn-group float-right users_grid_tools">
					                                    <div class="tools"></div>
					                                </div>
					                            </div>
					                                    <table class="table  table-striped table-bordered table-hover dataTable no-footer" id="FeesStructTable" role="grid">
					                                        <thead>
					                                        	<tr role="row">
						                                            <th class="sorting_asc wid-20" tabindex="0" rowspan="1" colspan="1">Sr.No.</th>
						                                            <th class="sorting wid-25" tabindex="0" rowspan="1" colspan="1">Term-I Fees</th>
						                                            <th class="sorting wid-25" tabindex="0" rowspan="1" colspan="1">Term-II Fees</th>
						                                        </tr>
					                                        </thead>
					                                        <%
					                                        	request.setAttribute("FeesTypeList", dao.getFeestypeList());
					                                        	int j=0;
					                                        %>
					                                        <tbody>
							                                        <c:forEach items="${FeesTypeList}" var="l">
							                                        	<%++j; %>
							                                        	<tr role="row" class="even" id="editFeeTR<%=i%>">
							                                        		<td><c:out value="${l.feesType}"> </c:out></td> 
							                                        		<td><c:out value="${l.termOneFees}"></c:out></td>
							                                        		<td><c:out value="${l.termTwoFees}"></c:out></td>
							                                        		
							                                        	</tr>
							                                        </c:forEach>
					                                        </tbody>
					                                    </table>
					                                    
					                                    <table class="table  table-striped table-bordered table-hover dataTable no-footer" id="castWiseFeesStructTable" role="grid">
					                                        <thead>
					                                        	
					                                        </thead>
					                                        <tbody>
					                                        
					                                        </tbody>
					                                    </table>
					                                    
					                            <!-- END EXAMPLE TABLE PORTLET-->
					                        </div>
		                            </div> <!-- /.col-lg-12 -->
		                        </div> <!-- /.row -->
		                    </div> <!-- /.inner -->
		                </div> <!-- /.outer -->        
                    </form>	
                  </div>
              </div>
          </div>
      </div> 
      
  
  
  
<!-- /#wrap -->
<!-- global scripts-->
<script type="text/javascript">

	var totalStdFess = 0;
	
	
	function getFeesStructure(stdId){
		if(stdId==""){
			return;
		}
		
		var xhttp =new XMLHttpRequest();
		try{
			xhttp.onreadystatechange = function(){
				if(this.readyState == 4 && this.status == 200){
					var getData=this.responseText.split(",");
					
					FeesStructTable
					getCastWiseFeesStructure(stdId);
				}
			}
			
			xhttp.open("GET", "/SMGMT/AssignStdWiseFees?stdId="+stdId+"&getFeesStructure=1", true);
			xhttp.send();
		}catch(e){
			alert("Unable to Connect Server!");
		}
	}
	
	function getCastWiseFeesStructure(stdId){
		if(stdId==""){
			return;
		}
		
		var xhttp =new XMLHttpRequest();
		try{
			xhttp.onreadystatechange = function(){
				if(this.readyState == 4 && this.status == 200){
					var finalStr = this.responseText.split("@@@");
					//alert(finalStr);
					var headStr = finalStr[0].split(",");
					//alert(headStr);
					var demoStr = finalStr[1].split(",");
					//alert(demoStr);
					
					var table = document.getElementById("castWiseFeesStructTable").children;
					var finalData = "";
					var headData = "";
					
					var j=0;
					headData += "<tr><th>Category</th>";
					while (j<headStr.length-1) {
						headData += "<th>"+headStr[j]+"</th>";
						j++;
					}
					headData += "</tr>";
					
					var i=0;
					var num=1;
					while (i<demoStr.length-1) {					
						var counter = headStr.length;
						var count=1;
						
						//document.getElementById("categoryFessLable").innerHTML="Category Wise Fees";
						
						finalData += "<tr id='castWiseFeesStructTableTR"+num+"'>";
						
						while(counter>0){
							
							if(count==1){
								
								if(demoStr[i]=="null"){
									finalData += "<td>-</td>";
								}
								else{
									finalData += "<td>"+demoStr[i]+"</td>";
								}
								counter--;
								i++;
							}
							else if((count+1)%2!=0){
								
								if(demoStr[i]=="null"){
									finalData += "<td>-</td>";
								}
								else{
									finalData += "<td>"+demoStr[i]+"</td>";
								}
								counter--;
								i++;
							}
							else{
								i++;
							}
							
							count++;
						}
						
						finalData += "</tr>"
						num++;
					}
					
					table[0].innerHTML=headData;
					table[1].innerHTML=finalData;
					
				}
			}
			
			xhttp.open("POST", "/SMGMT/AssignStdWiseFees?stdId="+stdId, true);
			xhttp.send();
		}catch(e){
			alert("Unable to Connect Server!");
		}
	}
	
	function selectAllChecks(){
		var c = document.getElementsByName('feeTypeCheck');
		var finalArray = [];
		totalStdFess = 0;
		
		if(document.getElementById('selectAllCheck').checked){
			for(var i=0;i<c.length;i++)
			{
				//c[i].checked=true;
				var d = document.getElementById("feeTypeCheck"+(i+1));
				d.checked=true;
				var tr = document.getElementById("editFeeTR"+(i+1)).children;
				
				if(d.checked){	
					totalStdFess = +totalStdFess+ +tr[2].innerHTML+ +tr[3].innerHTML;
				}
				//alert(totalStdFess);
				document.getElementById("totalStdFess").innerHTML = "<strong style='font-size: 135%;'>"+totalStdFess+"</Strong>";
			}
		}
		else
		{
			for(var i=0;i<c.length;i++)
			{
				c[i].checked=false;
				document.getElementById("totalStdFess").innerHTML = "<strong style='font-size: 135%;'>"+totalStdFess+"</Strong>";
			}
		}
	}
	
	function setStds() {
		var selectedStds = "";
		$('#standardId :selected').each(function(i, selectedElement) {
			if(selectedStds==""){
				selectedStds +=  $(selectedElement).text();
			}
			else{
				selectedStds +=  ", " + $(selectedElement).text();
			}
			
		});
		document.getElementById("stdList").innerHTML = "<strong style='font-size: 135%;'>"+selectedStds+"</Strong>";
	}
	
	function getFinalTotal(updateRowId){
		
		var c = document.getElementById("feeTypeCheck"+updateRowId);
		var tr = document.getElementById("editFeeTR"+updateRowId).children;
		
		if(c.checked){	
			totalStdFess = +totalStdFess+ +tr[2].innerHTML+ +tr[3].innerHTML;
		}
		else{		
			totalStdFess = +totalStdFess- +tr[2].innerHTML- +tr[3].innerHTML;
		}
		
		document.getElementById("totalStdFess").innerHTML = "<strong style='font-size: 135%;'>"+totalStdFess+"</Strong>";
		
	}
	
	function saveUpdateFees(updateRowId, updateId) {
	
		var tr = document.getElementById("editFeeTR"+updateRowId).children;
			
		tr[2].removeAttribute('contenteditable');
		tr[3].removeAttribute('contenteditable');		
	} 
	
	function updateFees(rowId, updateId){
		
		if(document.getElementById("editFeeTD1")){
			
			document.getElementById("editFeeTD1").removeAttribute('contenteditable');
			document.getElementById("editFeeTD2").removeAttribute('contenteditable');
			
			document.getElementById("editFeeTD1").setAttribute('id', '');
			document.getElementById("editFeeTD2").setAttribute('id', '');
		}
		
		
		var tr = document.getElementById("editFeeTR"+rowId).children;
			
		tr[2].setAttribute('contenteditable', 'true');
		tr[3].setAttribute('contenteditable', 'true');
		
		tr[2].setAttribute('id', 'editFeeTD1');
		tr[3].setAttribute('id', 'editFeeTD2');
		
		$("#editFeeTD1").focus();
			
		$("#editFeeTD1").click(function(evt){
			$("#editFeeTD1").focus();
		});
		$("#editFeeTD2").click(function(evt){
			$("#editFeeTD2").focus();
		});
		
		$("#editFeeTD1, #editFeeTD2").keypress(function(evt)
		{		
			var charCode = evt.keyCode;
		    var value = document.activeElement.innerHTML;
		    
		    if(charCode == 13){
		    	return false;
		    }
		    
		    if(charCode == 46){
		    	if (value != null && value.trim().indexOf('.') == -1){
	                return true;
		    	}
		    }
		    
			if (charCode > 31 && (charCode < 48 || charCode > 57)) {
		        return false;
		    }
		    

		});
	}
	
	function submitForm() 
	{
		var checked=0;
		var c = document.getElementsByName('feeTypeCheck');
		var finalArray = [];
		
		for(var i=0;i<c.length;i++)
		{	
			if (c[i].checked){
				checked++;
				var tr = document.getElementById("editFeeTR"+c[i].value).children;
				//alert(tr[0].id);
				finalArray.push(tr[0].id);
				finalArray.push(tr[1].innerHTML);
				finalArray.push(tr[2].innerHTML);
				finalArray.push(tr[3].innerHTML);
				
				//finalArray.push( document.getElementById("feeTypePriority_"+c[i].value).checked );
			}
		}	
		
		document.getElementById("tableData").value = finalArray;
		//alert(document.getElementById("tableData").value);
	}
	
	



</script>
</body>	

<script type="text/javascript" src="/SMGMT/config/js/jquery.min.js"></script>
<script type="text/javascript" src="/SMGMT/config/js/jquery-ui.js"></script>
<script type="text/javascript">
//Return a helper with preserved width of cells

// Return a helper with preserved width of cells
var fixHelper = function(e, ui) {
    ui.children().each(function() {
        $(this).width($(this).width());
    });
    return ui;
};

$("#sort tbody").sortable({
    helper: fixHelper
}).disableSelection();



</script>
<!-- common js -->
	<jsp:include page="/View/common/commonJs.jsp"></jsp:include>
<!-- common js -->

</html>