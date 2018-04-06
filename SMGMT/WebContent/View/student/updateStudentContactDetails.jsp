
<%@page import="utility.CommonStudent"%>
<%@page import="java.util.*"%>
<%@page import="com.servletStore.student.updateStudentContactDetails.model.updateStudentContactImpl"%>
<%@page import="com.servletStore.student.updateStudentContactDetails.model.updateStudentContactDAO"%>
<%@page import="com.servletStore.student.updateStudentContactDetails.model.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta charset="UTF-8">
    <title>Form Validations | Admire</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="/SMGMT/config/img/xlogo1.ico.pagespeed.ic.ONh6qx31g4.html"/>
    <!-- global styles-->
    <link type="text/css" rel="stylesheet" href="/SMGMT/config/css,_components.css+css,_custom.css+vendors,_jquery-validation-engine,_css,_validationEngine.jquery.css+vendors,_datepicker,_css,_bootstrap-datepicker.min.css+vendors,_datepicker,_css"/>
    <link type="text/css" rel="stylesheet" href="/SMGMT/config/css,_components.css+css,_custom.css+vendors,_select2,_css,_select2.min.css+css,_pages,_dataTables.bootstrap.css+css,_pages,_tables.css.pagespeed.cc._6lRWz19bZ.css"/>

    <!-- end of global styles-->
<meta charset="UTF-8">
    <title>Form Elements | Admire</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <jsp:include page="/View/common/commonCss.jsp"></jsp:include>
</head>

<%
	 String schoolId=null;
	 String academicYear=null;
	if(session.getAttribute("userName")==null)
	{
		response.sendRedirect("/SMGMT");
	}
	else
	{
		schoolId=session.getAttribute("schoolId").toString();
		academicYear=session.getAttribute("year").toString();		
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
                                    Form Validations
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
                                        <a href="#">Forms</a>
                                    </li>
                                    <li class="active breadcrumb-item">Form Validations</li>
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
                                        <i class="fa fa-file-text-o"> Update Student Contact Details</i>
                                    
                                    </div>
                                    <div class="card-block m-t-35">
                                       
                                           <%
                                           CommonStudent cs=new CommonStudent();
                                           List<Object> list=cs.getStandardList("1");
                                           
                                           
                                           %>
                                                <div class="row">
                                                   <label for="required2" class="col-form-label">Standard/Division *</label>   
                                                <div class="col-lg-4">
                                                   	<select class="form-control chzn-select" tabindex="2" id="stddiv" name="stddiv">
                                                	    <option disabled selected>Choose a standard and division</option>
                                                	    <%
                                                	    Object id="";
                                                		Object std="";
                                                	    Iterator<Object> itr=list.iterator();
                                            			while(itr.hasNext())
                                            			{
                                            				
                                            				id=itr.next();
                                            				//System.out.print("id of standard= "+id);
                                            				std=itr.next()+"("+itr.next()+" - "+itr.next()+")";
                                            			%>
                                            			<option value="<%=id %>"><%=std %></option>
                                            			<%}%>
                                                	    	
                                                	    	
                                                	    	
                                                	    	
                                                	    	
                                                	    
                                                	    
                                                	   
                                               </select>
                                                </div>
                                                <div>
                                                
                                                
                                                
                                                </div>
                                          
                                           <!--   <label for="required2" class="col-form-label">Student Name*</label>   
                                                <div class="col-lg-4">
                                                   	<select class="form-control chzn-select" tabindex="2" id="student_name" name="student_name">
                                                	    <option disabled selected>Choose a student name</option>
                                               </select>
                                                </div>--><br><br><br><br> 
                                            	
                                           
                                            </div>
                                            <div class="row">
                                            
                                         
                                  
                                    <div class="left_align">
                                        <div class="radio">
                                            <label>
                                                <input type="radio" id="contactId" name="radio1" value="1" onclick="searchByStdDiv();setValues()">
                                                <span class="cr"><i class="cr-icon fa fa-circle"></i></span>
                                              Contact Details   &nbsp;&nbsp;&nbsp;&nbsp;
                                            </label>
                                           
                                        </div>
                                       </div>  
                                        
                                       <div class="radio">
                                            <label>
                                              <input type="radio" id="adharId" name="radio1" value="2" onclick="searchByAdharDetails();setValues()" >
                                                <span class="cr"><i class="cr-icon fa fa-circle"></i></span>
                                          Adhar Card Details&nbsp;&nbsp;&nbsp;&nbsp;
                                            </label>
                                        </div>
                                        
                                        <div class="radio">
                                            <label>
                                                <input  type="radio" id="bankId" name="radio1" value="3" onclick="searchByBankDetails();setValues()" >
                                                <span class="cr"><i class="cr-icon fa fa-circle"></i></span>
                                          Bank Details
                                            </label>
                                        </div>
                                        </div>
                                       
                                    </div>
                                </div>
                            </div> <!-- /.col-lg-12 -->
                        </div> <!-- /.row -->
                        
                       
                    </div> <!-- /.inner -->
                </div> <!-- /.outer -->
           
            <div class="outer">
            <form action="/SMGMT/updateStudentContactDetails" method="post">
            	
            	 <input type="hidden" name="std_name" id="std_id" value=""/>  
            	 <input type="hidden" name="data" id="data" value=""/>  
                    <div class="inner bg-container">
                    <!--  <form action="/SMGMT/RemoveNameFromCatlog" class="form-horizontal  login_validator" id="form_block_validator"> -->
                        <div class="card">
                            <div class="card-header bg-white" id="show" value=" ">
                                User Grid
                                </div>
                            </div><br>
                            <div class="col-lg-4">
                           <label class="col-form-label"><b>Search Box</b></label>
                              </div>
                            <div class="col-lg-2">
                           <input class="form-control focused_input" type="text" id="search" name="m" onkeyup="myFunction()">
                               </div>
                            
                            <div class="card-block m-t-35" id="user_body">
                                <div class="table-toolbar">
                                    
                                    <div class="btn-group float-right users_grid_tools">
                                        <div class="tools"></div>
                                    </div>
                                </div>
                                <div>
                                    <div>
                                    <style>
							 table { table-layout: fixed; }
							 table th, table td { overflow: hidden; }
							</style>
							                                    
                                        <table class="table  table-striped" id="tableBody">
                                            <thead>
                                            <tr role="row">
                                           
                                            	<!--   <th tabindex="0" rowspan="1" colspan="1"></th>
                                                <th tabindex="0" rowspan="1" colspan="1">Student Name</th>
                                                <th  tabindex="0" rowspan="1" colspan="1">Student Mobile Number</th>
                                                <th tabindex="0" rowspan="1" colspan="1">Father Mobile Number</th>
                                                <th  tabindex="0" rowspan="1" colspan="1">Mother Mobile Number</th> 
                                                <th  tabindex="0" rowspan="1" colspan="1">Stud Account Number</th>
                                                <th  tabindex="0" rowspan="1" colspan="1">Student Adhar Card No.</th>
                                               <th  tabindex="0" rowspan="1" colspan="1">Father Adhar Card No.</th>
                                               <th  tabindex="0" rowspan="1" colspan="1">Mother Adhar Card No.</th>
                                             
                                                <th  tabindex="0" rowspan="1" colspan="1">Bank Name </th>
                                                <th  tabindex="0" rowspan="1" colspan="1">Account NO </th>
                                                <th  tabindex="0" rowspan="1" colspan="1">IFSC Code </th>  -->
                                               </tr>
                                            </thead>
                                            <tbody id="showtable">
                                           
                                            
                                            </tbody>
                                            		
                                        </table>
                                    </div>
                                </div>
                                <!-- END EXAMPLE TABLE PORTLET-->
                            
            
            </div> <!-- /#content -->
        </div>
        
       <!--wrapper-->
      
    <!--   <input type="submit" name="update" id="update" value="Update"> -->
            </div>
         </div>
               
       
</div>
</form>
</div>
<script type="text/javascript">
/* var c1="";
var c2="";
function setValues()
{
	document.getElementById("std_id").value=document.getElementById("stddiv").value;
	alert(document.getElementById("std_id").value);
	var table=document.getElementById("showtable");
	var tr=table.getElementsByTagName("tr");
	var data="";
	 for (i = 1; i < tr.length; i++) 
	  {
	   	 	td = tr[i].getElementsByTagName("td");
	   	 	for(var j=0;j<td.length;j++)
	   	 	{ 	
				data+=td[j].innerHTML+"/";
	   	 	}
	   	 	data+="~";
	  }
	 alert("length of tr "+tr.length+"length of td "+td.length);
	document.getElementById("data").value=data;
} */
 function searchByStdDiv() {
		var x="";
		if(document.getElementById("contactId").checked)
			{
			x=1;
			}
		else if(document.getElementById("adharId").checked)
			{
			x=2;
			}
		else
			{
			x=3;
			}
		//alert("x :"+x);
		var id=document.getElementById("stddiv").value;
		//alert(id);
	
	var xhttp;   		
		xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
			//alert("STD "+id);
				var demoStr = this.responseText.split("~");	
				//var cnt=1;
				var i=0,j=0;
				var cnt=1;
				var row="";
				var sid="";
				//row+="<table style='width:100%'>"
				row+="<tr><th>Sr.No</th><th style='display:none'>sid</th><th>Roll No</th><th>Student Name</th><th>Stud Mobile No</th><th>Father Mob.No.</th><th>Mother Mob.NO</th></tr>";
				//alert(demoStr);
				for(;demoStr[i];)
					{	
						//alert("IN")
						row+="<tr><td>"+cnt;
						//student_id=demoStr[i];
						//alert(student_id);
						row+="</td><td id="+j+" style='display:none'>"+demoStr[i];
						//student_id=document.getElementById('sid').value;
						i++;
						row+="</td><td>"+demoStr[i];
						i++;
						row+="</td><td>"+demoStr[i];
						i++;
						sid=document.getElementById('stud_id');
						row+="</td><td id='contact1"+j+"' maxlength='10' contenteditable='true' onkeyup=updateCell("+j+",1,'contact1"+j+"',event)>"+demoStr[i];
					
						i++
						row+="</td><td id='contact2"+j+"' contenteditable='true'  onkeyup=updateCell("+j+",2,'contact2"+j+"',event)>"+demoStr[i];
						i++;
						row+="</td><td id='contact3"+j+"' contenteditable='true' onkeyup=updateCell("+j+",3,'contact3"+j+"',event)>"+demoStr[i];
						i++;
					cnt++;
					j++;
					}
			
				//document.getElementById('stud_id').innerHTML=sid;
				//student_id=document.getElementById("sid").value;
			//	student_id=document.getElementById("stud_id").value
				//alert(student_id);
				document.getElementById("showtable").innerHTML=row;
				//row+="</table>";
				 
				}
			};
		xhttp.open("POST","/SMGMT/updateStudentContactDetails?std="+id+"&ch="+x, true);
		xhttp.send();
	}
 function checkdata(id)
 {
	 var mob_no=document.getElementById(id).innerHTML;
	 alert(mob_no);
	 var keyCode = e.which ? e.which : e.keyCode
			    var ret = ((keyCode >= 48 && keyCode <= 57) || specialKeys.indexOf(keyCode) != -1);
			    document.getElementById(msg).style.display = ret ? "none" : "inline";
			    return ret;
 }
 
 function isNumber(evt) {
	
	    evt = (evt) ? evt : window.event;
	    var charCode = (evt.which) ? evt.which : evt.keyCode;
	    if (charCode > 31 && ( charCode < 48 || charCode > 57)) {
	    	 alert("in");
	        return false;
	    }
	    return true;
	}
/* function changeData(id)
 {
	 var cellid = id;
	 var standard_id=document.getElementById("stddiv").value;

	 var t = document.getElementById('showtable');
	
	    var rows = t.rows; //rows collection - https://developer.mozilla.org/en-US/docs/Web/API/HTMLTableElement
	    for (var i=0; i<rows.length; i++)
	    {
	        rows[i].onclick = function () 
	        {
	            if (this.parentNode.nodeName == 'THEAD')
	            {
	                return;
	            }
	            var cells = this.cells; //cells collection
	          
	           c1 = cells[1].innerHTML;
	          
	            
	            if(id=='1' || id=='11' || id=='111')
	            	{
	            	 c2 = cells[4].innerHTML;
	            	}
	            else if(id=='2' || id=='22' || id=='222')
	            	{
	            	 c2 = cells[5].innerHTML;
	            	}
	            else if(id =='3' || id=='33' || id=='333')
	            	{
	            	 c2 = cells[6].innerHTML;
	            	}
	          
	            var values =[c1,c2,standard_id,cellid];
	           
	         //  updateCell(values);
	          
	        };
	    }
 }
*/
 function updateCell(stud_id,cell_no,id,event)
 {
	 var mob_no=document.getElementById(id).innerHTML;
	 var phoneno = /^\d{10}$/;
	 var adharno = /^\d{12}$/;
	 var alpha = /^[a-zA-Z]+$/;
	var acc_no=/^[0-9]+$/;
	//var adhar_no=document.getElementById(id).innerHTML;
//var iii=document.getElementById(stud_id).value;
//alert(cell_no);
// 	if(mob_no.length>10)
// 	{			
// 		//alert()
// 		document.getElementById(id).innerHTML=mob_no.substring(0,mob_no.length-1) 
// 		document.getElementById(id).style.borderColor="white";
// 	}	
	if((cell_no==1 || cell_no==2 ||cell_no==3) && (mob_no.match(phoneno)&&mob_no.length==10))
	{	
		document.getElementById(id).style.borderColor="white";
	    document.getElementById(id).style.border = "thick solid white";
		ap=0;
		var a=[document.getElementById(stud_id).innerHTML,document.getElementById(id).innerHTML,document.getElementById("stddiv").value,cell_no];
		//alert("Stud : "+stud_id+" "+cell_no+" "+id)
		//var cell_id="contact"+cell_no+""+id;
		//alert(document.getElementById(id).innerHTML)
		// alert("Stud Id : "+a[0]+" Cell No : "+a[1]+" Value : "+a[2]+" sksk"+a[3]);
	   
		    var xhttp;   		
			xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) 
				{
					
				}
			};
			//alert("hiii");
			xhttp.open("POST","/SMGMT/updateStudentContactDetails?standard="+a, true);
			xhttp.send();
	}	
	else if((cell_no==11 || cell_no==22 ||cell_no==33) && (mob_no.match(adharno)&&mob_no.length==12))
		{
		
		document.getElementById(id).style.borderColor="white";
	    document.getElementById(id).style.border = "thick solid white";
		ap=0;
		var a=[document.getElementById(stud_id).innerHTML,document.getElementById(id).innerHTML,document.getElementById("stddiv").value,cell_no];
		//alert("Stud : "+stud_id+" "+cell_no+" "+id)
		//var cell_id="contact"+cell_no+""+id;
		//alert(document.getElementById(id).innerHTML)
		// alert("Stud Id : "+a[0]+" Cell No : "+a[1]+" Value : "+a[2]+" sksk"+a[3]);
	   
		    var xhttp;   		
			xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) 
				{
					
				}
			};
			//alert("hiii");
			xhttp.open("POST","/SMGMT/updateStudentContactDetails?standard="+a, true);
			xhttp.send();
		
		
		}
	else
		if((cell_no==111 || cell_no==222 ||cell_no==333))
		{
		
		document.getElementById(id).style.borderColor="white";
	    document.getElementById(id).style.border = "thick solid white";
		ap=0;
		var a=[document.getElementById(stud_id).innerHTML,document.getElementById(id).innerHTML,document.getElementById("stddiv").value,cell_no];
		//alert("Stud : "+stud_id+" "+cell_no+" "+id)
		//var cell_id="contact"+cell_no+""+id;
		//alert(document.getElementById(id).innerHTML)
		// alert("Stud Id : "+a[0]+" Cell No : "+a[1]+" Value : "+a[2]+" sksk"+a[3]);
	   
		    var xhttp;   		
			xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) 
				{
					
				}
			};
			//alert("hiii");
			xhttp.open("POST","/SMGMT/updateStudentContactDetails?standard="+a, true);
			xhttp.send();
		
		
		}
	else
		{
		document.getElementById(id).style.borderWidth = "thick";
		document.getElementById(id).style.border="thick solid red";;
		
		
		}
		
 }
 function searchByAdharDetails()
 {
	 
	 var x="";
		if(document.getElementById("contactId").checked)
			{
			x=1;
			}
		else if(document.getElementById("adharId").checked)
			{
			x=2;
			}
		else
			{
			x=3;
			}
		//alert("x :"+x);
		var id=document.getElementById("stddiv").value;
	//	alert(id);
	
	var xhttp;   		
		xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
			//alert("STD "+id);
				var demoStr = this.responseText.split("~");	
				//var cnt=1;
				var i=0,j=0;
				var cnt=1;
				var row="";
				row+="<tr><th>Sr.No<th style='display:none'>sid</th></th><th>Roll No</th><th>Student Name</th><th>Stud Adhar No</th><th>Father Adhar No.</th><th>Mother Adhar NO</th></tr>";
				//alert(demoStr);
				for(;demoStr[i];)
					{	
						row+="<tr><td>"+cnt;
						row+="</td><td id="+j+" style='display:none'>"+demoStr[i];
						i++;
						row+="</td><td>"+demoStr[i];
						i++;
						row+="</td><td>"+demoStr[i];
						i++;
						row+="</td><td id='contact11"+j+"' maxlength='10' contenteditable='true' onkeyup=updateCell("+j+",11,'contact11"+j+"',event)>"+demoStr[i];
						i++;
						row+="</td><td id='contact22"+j+"' maxlength='10' contenteditable='true' onkeyup=updateCell("+j+",22,'contact22"+j+"',event)>"+demoStr[i];
						i++;
						row+="</td><td id='contact33"+j+"' maxlength='10' contenteditable='true' onkeyup=updateCell("+j+",33,'contact33"+j+"',event)>"+demoStr[i]+"</td></tr>";
						i++;
					cnt++;
					j++;

					}
				
				document.getElementById("showtable").innerHTML=row;
				
				 
				}
			};
		xhttp.open("POST","/SMGMT/updateStudentContactDetails?std="+id+"&ch="+x, true);
		xhttp.send();
	 
 }
 
 
 function searchByBankDetails()
 {
	 
	 
	 var x="";
		if(document.getElementById("contactId").checked)
			{
			x=1;
			}
		else if(document.getElementById("adharId").checked)
			{
			x=2;
			}
		else
			{
			x=3;
			}
		//alert("x :"+x);
		var id=document.getElementById("stddiv").value;
		//alert(id);
	
	var xhttp;   		
		xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
			//alert("STD "+id);
				var demoStr = this.responseText.split("~");	
				//alert("DEMO : "+demoStr)
				//var cnt=1;
				var i=0,j=0;
				var cnt=1;
				var row="";
				row+="<tr><th>Sr.No<th style='display:none'>sid</th></th><th>Roll No</th><th>Student Name</th><th>Bank Name</th><th>Account No.</th><th>IFSC Code</th></tr>";
				//alert(demoStr);
				for(;demoStr[i];)
					{	//alert(demoStr[i])
						row+="<tr><td>"+cnt;
						row+="</td><td id="+j+" style='display:none'>"+demoStr[i];
						i++;
						row+="</td><td>"+demoStr[i];
						i++;
						row+="</td><td>"+demoStr[i];
						i++;
						row+="</td><td id='contact111"+j+"' maxlength='10' contenteditable='true' onkeyup=updateCell("+j+",111,'contact111"+j+"',event)>"+demoStr[i];
						i++;
						row+="</td><td id='contact222"+j+"' maxlength='10' contenteditable='true' onkeyup=updateCell("+j+",222,'contact222"+j+"',event)>"+demoStr[i];
						i++;
						row+="</td><td id='contact333"+j+"' maxlength='10' contenteditable='true' onkeyup=updateCell("+j+",333,'contact333"+j+"',event)>"+demoStr[i]+"</td></tr>";
						i++;
					cnt++;
					j++;

					}
				
				document.getElementById("showtable").innerHTML=row;
				
				 
				}
			};
		xhttp.open("POST","/SMGMT/updateStudentContactDetails?std="+id+"&ch="+x, true);
		xhttp.send();
	   
 }
 function setValues()
 {
	 var x;
	 var std=document.getElementById("stddiv");
	 var s = std.options[std.selectedIndex].text;
	 if(document.getElementById("contactId").checked)
		{
		x="Update  Contact  Details of";
		}
	else if(document.getElementById("adharId").checked)
		{
		x="Update  Adhar Card  details of";
		}
	else
		{
		x="update  Bank  Details of";
		}
	
	//alert(x);
		document.getElementById("show").innerHTML= x.fontcolor("Red")+ "      "  +s.fontcolor("Red");
 }
 
 function myFunction() {
	  // Declare variables 
	  var input, filter, table, tr, td, i;
	  input = document.getElementById("search");
	  filter = input.value;
	  table = document.getElementById("showtable");
	  tr = table.getElementsByTagName("tr");
		//alert("Len:"+table.rows[0].cells[2].innerHTML);
	  // Loop through all table rows, and hide those who don't match the search query
	  for (i = 1; i < tr.length; i++) 
	  {
	   	 	td = tr[i].getElementsByTagName("td");
	   	 	for(var j=0;j<td.length;j++)
	   	 	{	
	   	 		//alert("A"+table.rows[i].cells[j].innerHTML);
		    	if (table.rows[i].cells[j].innerHTML.toUpperCase().includes(filter.toUpperCase())) 
		    	{
		        	tr[i].style.display = "";
		        	break;
		      	} 
		    	else 
		    	{
		        	tr[i].style.display = "none";
		      	}	  
	   	 	}
	  }
	}
	
 
	</script>
	

	<jsp:include page="/View/common/commonJs.jsp"></jsp:include>
</body>

</html>