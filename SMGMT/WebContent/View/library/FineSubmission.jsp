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
<%@page import=" utility.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    
    <style type="text/css">
    	#information{
    		margin-top: 30px;
    	}
    </style>
    
    
   
</head>
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
                                    	Issue Book Details
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
                                        <a href="#">Library</a>
                                    </li>
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
                                        <i class="fa fa-file-text-o"></i>
                                  		  Book Issue
                                    </div>
                                   <div class="row">
				                          <div class="col-12">
				                                       <div class="col-lg-8 m-t-20">
				                                          <form action="/SMGMT/Library" class="form-horizontal  login_validator" id="form_block_validator">
		                                     				 <div class="form-group row" id="stud" style="display: block">
		                                          	      		<div class="col-lg-8">
		                                          	      			<input type="hidden" name="studId" id="stud_Id">
		                                                			<input type="text" list="browseStud" autocomplete="off" onkeyup="getstuddetails(this.value)" oninput="getStudId(this.value)" class="form-control" style="margin-left: 9px;" id="searchStud"  name="searchStud" placeholder="Search Student by Id/Name" required>
			                                                		<datalist id="browseStud">
			                                                		</datalist>
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
                            <div class="card-header bg-white">
                               Issued Books List
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
                                            	<th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Student Name</th>
                                            	<th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Book Name</th>
                                                <th class="sorting wid-25" tabindex="0" rowspan="1" colspan="1">Due Date</th>
                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Return Date</th>
                                                <th class="sorting wid-20" tabindex="0" rowspan="1" colspan="1">Fine</th>
                                                <th class="sorting wid-20" tabindex="0" rowspan="1" colspan="1">Action</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                       		 	<%-- <%
                                       		 		AddBookDAO dao=new AddBookImpl();
                                       		 	//	System.out.print("***"+dao.getIssueBookDetails());
                                       		 		request.setAttribute("display_student", dao.getIssueBookDetails());
                                       		 		int bookCount=0;
                                       		 	%>
													<c:forEach items="${display_student}" var="d">
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
														<td><c:out value="${d.dueDate}"></c:out></td>
														<td><c:out value="${d.returnDate}"></c:out></td>
														<td><c:out value="${d.fine}"></c:out></td>
													
														 <td>
                                            			<a class="edit" data-placement="top" title="Pay" href="#payFine" data-toggle="modal" onclick="loadDoc(${d.getBookNo()})"><i class="fa fa-pencil text-warning"></i></a>&nbsp; &nbsp;
                                            			
                                            			</td>  
                                            		</tr>
												  </c:forEach> --%>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <!-- END EXAMPLE TABLE PORTLET-->
                            </div>
                       	 </div>
                       </div><!-- /.inner -->
                    </div><!-- /outer -->   
				                        
				                     	 
				                     	 <!-- Second Tab --> 
				                     	   
				                               <!-- Third Tab -->
				                               
				                        
				                      
				                   </div>
				                 </div>
                            </div> <!-- /.col-lg-12 -->
                        </div> <!-- /.row -->
                    </div> <!-- /.inner -->
                </div> <!-- /.outer -->
            
            
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
           
            
            
            </div> <!-- /#content -->
        </div>
        
       <!--wrapper-->
       
        

<!-- /#wrap -->


<jsp:include page="/View/common/commonJs.jsp"></jsp:include>

<!-- end plugin scripts -->
<!--Page level scripts-->
    
    <script>eval(mod_pagespeed_g_o5ieHdNa);</script>
    <script>eval(mod_pagespeed_UzcyJ5ysoL);</script>
    <script>eval(mod_pagespeed_sB4kJD0xfI);</script>
    <script>eval(mod_pagespeed_aYQJk4iDci);</script>
    <script>eval(mod_pagespeed_wVkzf2s7YZ);</script>
    <script>eval(mod_pagespeed_Ij0pRaH8BP);</script>
    <script>eval(mod_pagespeed_wfmKXYO4Nj);</script>
    <script>eval(mod_pagespeed_EYzby3B1$L);</script>

    <script type="text/javascript" src="/SMGMT/config/js/pages/users.js"></script>

</body>
<script type="text/javascript">



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
			alert('not count');	
			document.getElementById('remainAmount').value=oldRemainAmt;
			document.getElementById("error").innerHTML="Number should less than Fine";
		}
		else
		{
			var totalFine=remainAmt-paidAmount;
			alert(totalFine);
			// var totalAmt=remainAmt-paidAmt;
			document.getElementById('remainAmount').value=totalFine;
			document.getElementById("discount").readOnly = true;
			document.getElementById("information").innerHTML="* If you want to give discount then...";	
			document.getElementById("information").style.color='#27ae60';
		}
	}	
		else
		{
			
			var totalAmt=parseInt(document.getElementById('totalAmount').value);
			if(totalAmt<paidAmount)
			{
				alert('not count');
				document.getElementById('remainAmount').value=0;
			}
			else
			{
				var totalFine=totalAmt-paidAmount;
				alert(totalFine);
				// var totalAmt=remainAmt-paidAmt;
				document.getElementById('remainAmount').value=totalFine; 
				document.getElementById("error").innerHTML="";	
			}
			
		}
	
	
	/* else
	{
		alert('count');
		var totalFine=oldRemainAmt-paidAmount;
		alert(totalFine);
		// var totalAmt=remainAmt-paidAmt;
		document.getElementById('remainAmount').value=totalFine; 
		document.getElementById("error").innerHTML="";
	}  */
	
	 
	 
	 //discount
		/* var disTotalAmount=document.getElementById("totalAmount").value;
		//alert(disTotalAmount);
		var paidAmt=document.getElementById('paidAmountId').value;
		//alert(paidAmt);
		var total=disTotalAmount-paidAmt;
		//alert(total);
		document.getElementById("remainAmount").value=total;  */
		
		
		
		
		
	
	/* var remainAmt=document.getElementById('remainAmount').value;
	var totalAmt=remainAmt-val;
	if (totalAmt > 0) {
		document.getElementById('remainAmount').value=totalAmt;
	}
	else
	{
		alert('negative value');	
		var paidAmt=document.getElementById('paidAmountId').value;
		
			document.getElementById('remainAmount').value=oldRemainAmt;
		
		//document.getElementById('remainAmount').value=remainAmt;
	} */
	
}

function checkedPay(checkId)
{
	if($(checkId).is(":checked"))
		{
		document.getElementById("returnSubmit").disabled=false;
		document.getElementById("remainAmount").value=famount;
		}
	else{
		document.getElementById("returnSubmit").disabled=true;
	}
	
}
	
function countPay(val)
{
	
	alert(val);
	var oldFineAmount=parseInt(document.getElementById("oldRemainFine").value);
	var dis=parseInt(document.getElementById("discount").value);
	
	if(dis<oldFineAmount)
	{
		alert('count');
		var total=oldFineAmount-dis;
		document.getElementById("totalAmount").value=total;
		
	}
	else
	{
		alert('not count');	
		document.getElementById("totalAmount").value=total;
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
			     //alert(stud);
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
		
	var issueDate=document.getElementById('issueDate_id').value;
	
	var date = new Date(issueDate);
    var newdate = new Date(date);

    newdate.setDate(newdate.getDate() + 7);
    
    var dd = newdate.getDate();
    var mm = newdate.getMonth() + 1;
    var y = newdate.getFullYear();
	
    var someFormattedDate = y + '-' + mm + '-' + dd;
    document.getElementById('dueDate_id').value = someFormattedDate;
    
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
	var studId= document.getElementById("student_Id").value;
	//alert(studId);
	
	
	document.getElementById("oldDueDate").innerHTML=" Due Date";
	//document.getElementById("dueDate1").disabled=true;
	getFineCount(tDate, dDate, radioValue,studId);
			
	}

function getFineCount(tDate, dDate, radioValue,studId) {
	
	
	if(radioValue=="RETURN")
		{
			document.getElementById("returnBk").style.display="block";
			document.getElementById("renew").style.display="none";
			
			var oneDay = 24*60*60*1000; // hours*minutes*seconds*milliseconds
			var firstDate = new Date(tDate);
			var secondDate = new Date(dDate);

			var diffDays = Math.round(Math.abs((firstDate.getTime() - secondDate.getTime())/(oneDay)));
			
			document.getElementById("days").value=diffDays;
			
		}
	

	 var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			var str = this.responseText.split(",");
			//var demo=str[0];
			
			//document.getElementById("days").value = demo;
			
			//var tDate = document.getElementById("currentDate").value;
			//var dDate = document.getElementById("dueDate1").value;
			var issueDate=document.getElementById("issueDate1").value; 
			
			
			
			//set remainfine in this id previousFine
			//var remainFine=document.getElementById("remainAmount").value;
			//alert(remainFine+"RamianAmount");
			
			
			
			if(radioValue=="RETURN")
 			{
	 			document.getElementById("returnBk").style.display="block";
	 			document.getElementById("renew").style.display="none";
	 			
	 			
	 			
	 			if(tDate<dDate)
	 			{
	 				//alert(tDate+" "+dDate+" if");
	 				 document.getElementById("days").value=0;
	 				document.getElementById("remainAmount").value=str[1]; 
	 				document.getElementById("oldRemainFine").value=str[1]; 
	 				document.getElementById("previousFine").value=str[1]; 
					document.getElementById("fineAmount").value =0;
					
		 			
	 			}
	 			else
	 			{
	 				
	 				//alert("else");
		 			 var oneDay = 24*60*60*1000; // hours*minutes*seconds*milliseconds
					var firstDate = new Date(tDate);
					var secondDate = new Date(dDate);
	
					var diffDays = Math.round(Math.abs((firstDate.getTime() - secondDate.getTime())/(oneDay)));
					
					document.getElementById("days").value=diffDays;
					
					var totalFine = diffDays * str[0];
					
					document.getElementById("fineAmount").value = totalFine;
					
		 			document.getElementById("remainAmount").value=totalFine;
		 			
		 			document.getElementById("previousFine").value=str[1]; 
		 			if(diffDays==0)
		 				{
		 				document.getElementById("fineAmount").value = 0;
		 				}
		 			
		 			if(!str[1]==0)
		 			{
		 				var previousFine=parseInt(str[1]);
		 				var fineAmount=parseInt(str[0]);
		 				var totalRemainAmt=previousFine+fineAmount;
		 				document.getElementById("remainAmount").value=totalRemainAmt;
		 				document.getElementById("oldRemainFine").value=totalRemainAmt;
		 			}
	 			}
	 			var studId= document.getElementById("student_Id").value;
	 			
	 			
	 			
	 			
	 			document.getElementById("returnSubmit").disabled=true;
	 			 if(totalFine==0 )
	 				{
	 				 	alert('enable');
	 					document.getElementById("returnSubmit").disabled=false;
	 				}
	 			 else if(tDate!=issueDate)
					{
	 					alert('enable');
						document.getElementById("returnSubmit").disabled=false;
					} 
	 			 else if(!totalFine==0)
	 				 {
		 				alert('disable');
		 				document.getElementById("returnSubmit").disabled=true;
		 			}
	 			}
	 		else if(radioValue=="RENEW"){
	 			document.getElementById("renew").style.display="block";
	 			document.getElementById("returnBk").style.display="none";
	 			document.getElementById("dueDateRn").value="";
	 			//document.getElementById("dueDateRn").focus();
	 		}

		}
	};
	//get student id in javascript variable and pass it in servlet
	xhttp.open("POST", "/SMGMT/Library?countDetail=1"
			+ "&currentDate=" + tDate + "&dueDate=" + dDate+ "&studId=" +studId, true);
	xhttp.send(); 

	
}
	

	

</script>



</html>