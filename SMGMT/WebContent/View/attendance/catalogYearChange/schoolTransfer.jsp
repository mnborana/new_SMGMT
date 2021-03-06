<%@page import="com.servletStore.attendance.schoolTransfer.model.SchoolTransferPOJO"%>
<%@page import="com.servletStore.attendance.schoolTransfer.model.SchoolTransferImpl"%>
<%@page import="com.servletStore.attendance.schoolTransfer.model.SchoolTransferDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
   
</head>
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
                                   School Transfer
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
                                        <a href="#">Attendance</a>
                                    </li>
                                    <li class="active breadcrumb-item">School Transfer</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </header>
                
             <!-- start your code from here  -->  
              
              <!-- Catalog Info Begin -->
              
                <div class="outer">
                    <div class="inner bg-container">
                        <div class="row">
                            <div class="col-xl-12">
                                <div class="card">
                                    <div class="card-header bg-white">
                                        <i class="fa fa-file-text-o"></i>
                                        School Transfer Details
                                    </div>
                                    <div class="card-block m-t-35" id="catalog_info">
                                    <%
                                    	SchoolTransferDAO s_dao=new SchoolTransferImpl();
                                    	List<SchoolTransferPOJO> school_pojo=s_dao.getSchoolList();
                                    	List<SchoolTransferPOJO> aca_year_pojo=s_dao.getAcademicYears();
                                    
                                    %>
                                        <form action="" class="form-horizontal  login_validator" id="form_block_validator" method="post">
                                        	 
                                        	 <div class="form-group row">
                                                <div class="col-lg-2 text-lg-right">
                                                    <label class="col-form-label">Select School</label>
                                                </div>
                                               
                                                <div class="col-lg-4">
                                               		<select class="form-control chzn-select" id="school_id1" name="school_name1" onchange="standardList('school_id1','std_div_id1','DESC')">
                                                		<option disabled selected>Select a School Name</option>
                                                		<%
                                                	    	for(int i=0;i<school_pojo.size();i++)
                                                			{
                                                	    %>
	                                                	    	<option value="<%=school_pojo.get(i).getSchoolId()%>"><%=school_pojo.get(i).getSchool_name()%></option>
                                                	    <%
                                                	    	}
                                                	    %>                                             		
                                                	</select>
                                               	</div>
                                               	
                                                <div class="col-lg-2 text-lg-right">
                                                    <label class="col-form-label">Select School</label>
                                                </div>
                                               
                                                <div class="col-lg-4">
                                               		<select class="form-control chzn-select" id="school_id2" name="school_name2" onchange="getStdDivList();">
                                                		<option disabled selected>Select a School Name</option> 
                                                		<%
                                                	    	for(int i=0;i<school_pojo.size();i++)
                                                			{
                                                	    %>
	                                                	    	<option value="<%=school_pojo.get(i).getSchoolId()%>"><%=school_pojo.get(i).getSchool_name()%></option>
                                                	    <%
                                                	    	}
                                                	    %>                                                		
                                                	</select>
                                               	</div>
                                            </div> 
                                        
                                            <div class="form-group row">
                                                <div class="col-lg-2 text-lg-right">
                                                    <label class="col-form-label">Select Std/Div</label>
                                                </div>
                                               
                                                <div class="col-lg-4">
                                                	<input type="hidden" id="sec_id" name="sec_name"/>
                                               		<select class="form-control chzn-select" id="std_div_id1" name="std_div_name1" onchange="getSectionsList();">
                                                		<option disabled selected>Select a Std/Div</option>                                                		
                                                	</select>
                                               	</div>
                                               	
                                               	<div class="col-lg-2 text-lg-right">
                                                    <label class="col-form-label">Select Std/Div</label>
                                                </div>
                                                <div class="col-lg-4">
                                               		<select class="form-control chzn-select" id="std_div_id2" name="std_div_name2" onchange="">
                                                		<option disabled selected>Select a Std/Div</option>                                                		
                                                	</select>
                                               	</div>
                                            </div> 
                                           <div class="form-group row">
                                                <div class="col-lg-2 text-lg-right">
                                                    <label class="col-form-label">Select Academic Year</label>
                                                </div>
                                                <div class="col-lg-4">
                                               		<select class="form-control chzn-select" id="academic_id1" name="academic_name1" onchange="getStudentDetails();getHigherSchoolList();">
                                                		<option disabled selected>Choose a year</option>
                                                		<%
                                                	    	for(int i=0;i<aca_year_pojo.size();i++)
                                                			{
                                                	    %>
	                                                	    	<option value="<%=aca_year_pojo.get(i).getAca_year()%>"><%=aca_year_pojo.get(i).getAca_year()%></option>
                                                	    <%
                                                	    	}
                                                	    %>   
                                                	</select>
                                               	</div>
                                               	
                                               	<div class="col-lg-2 text-lg-right">
                                                    <label class="col-form-label">Select Academic Year</label>
                                                </div>
                                                <div class="col-lg-4">
                                               		<select class="form-control chzn-select" id="academic_id2" name="academic_name2">
                                                		<option disabled selected>Choose a year</option>
                                                		<%
                                                	    	for(int i=0;i<aca_year_pojo.size();i++)
                                                			{
                                                	    %>
	                                                	    	<option value="<%=aca_year_pojo.get(i).getAca_year()%>"><%=aca_year_pojo.get(i).getAca_year()%></option>
                                                	    <%
                                                	    	}
                                                	    %>   
                                                	</select>
                                               	</div>
                                            </div> 
                                            
                                           <div class="form-group row">
                                           
                                               <div class="col-lg-4 push-lg-4">
                                                    <label class="custom-control custom-radio">
                                                        <input name="radio3" type="radio" class="custom-control-input" checked>
                                                        <span class="custom-control-indicator"></span>
                                                        <span class="custom-control-description"><strong>Same As Previous</strong></span>
                                                    </label>
                                               </div>     
                                               <div class="col-lg-4 push-lg-2">
                                                    <label class="custom-control custom-radio">
                                                        <input name="radio3" type="radio" class="custom-control-input">
                                                        <span class="custom-control-indicator"></span>
                                                        <span class="custom-control-description"><strong> Start From</strong></span>
                                                    </label>
                                               </div>
                                                <div class="col-lg-2 push-lg-0">
                                                    <input type="text" id="required2" name="driver_name"  value="" class="form-control" required >
                                                </div>
                                            </div>
                                         </form>
                                    </div>
                                </div>
                            </div> <!-- /.col-lg-12 -->
                        </div> <!-- /.row -->
                    </div> <!-- /.inner -->
                </div> <!-- /.outer -->
            
            <!-- Catalog Info End -->
      
      
      		<!-- Table Start -->      	
          <div class="outer" id="outer3">
                    <div class="inner bg-container">
                        <div class="card">
                            <div class="card-header bg-white">
                                Catalog Info
                            </div>        
                            <br>    <div class="form-group row">
                                                <div class="col-lg-4 text-lg-right">
                                                    <label class="col-form-label">Search:</label>
                                                </div>
                                                <div class="col-lg-2">
                                                    <input type="text" class="form-control focused_input" id="myInput" onkeyup="myFunction()" placeholder="Search"/>
                                                </div>
                                            </div>                                     
                            <div class="card-block m-t-35" id="user_body">
                                <div class="table-toolbar">                                   
                                    <div class="btn-group float-right users_grid_tools">
                                        <div class="tools">
                                         
                                        </div>
                                    </div>
                                </div>
                                <div>
                                 <div>
                                    <form>
                                       <table class="table  table-striped table-bordered table-hover dataTable no-footer" id="editable_table" role="grid">
                                            <thead>
	                                            <tr role="row">
		                                            <th tabindex="0" rowspan="1" colspan="1">Roll no</th>
	                                                <th tabindex="0" rowspan="1" colspan="1">GR. No</th> 
	                                                <th tabindex="0" rowspan="1" colspan="1">Student Name</th>
	                                                <th tabindex="0" rowspan="1" colspan="1">New Roll no</th>
	                                                <th tabindex="0" rowspan="1" colspan="1">New GR. No</th> 
	                                                <th>
		                                            		<div >
		                                                    	<label class="custom-control custom-checkbox">
		                                                    	    <input type="checkbox" id="check_all" class="custom-control-input" checked>
		                                                    	    <span class="custom-control-indicator"></span>
		                                                    	    <span class="custom-control-description">Select All</span>
		                                                    	</label>
		                                                	</div>                                                		
	                                            	</th>
	                                            </tr>
                                            </thead>
                                          
                                            <tbody id="tbody_id">
                                                                      		
                                            </tbody>
                                        </table>                                        
                                      </form>
                                    </div>
                                </div>
                                <!-- END EXAMPLE TABLE PORTLET-->
                            </div>
                        </div>
                    </div>                    
                </div>
      
      
      		<!-- Table End -->
      
      		<!-- Submit_Exit Begin -->
      		
      		<div class="outer">
                    <div class="inner bg-container">
                        <div class="row">
                            <div class="col-xl-12">
                                <div class="card">
                                    <div class="card-block m-t-35">
                                        <form action="/SMGMT/CatalogYearChange" class="form-horizontal  login_validator" id="form_block_validator" method="post">
                                           <div class="form-actions form-group row">
                                                <div class="col-lg-4 push-lg-4">
                                                	<input type="hidden" id="updatecatalog_id" name="updatecatalog_name"/>
                                                    <input type="submit" value="Update Catalog" id="btn_id" name="catalog_btn" class="btn btn-primary" onclick="updateCatalog()">
                                                    <input type="submit" value="Exit" class="btn btn-primary">
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div> <!-- /.col-lg-12 -->
                        </div> <!-- /.row -->
                    </div> <!-- /.inner -->
                </div> <!-- /.outer -->
                
                <!-- Submit_Exit End -->
      
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
                
               <!-- Modal End -->
                
            </div>
            
            
            </div> <!-- /#content -->
        </div>
        
       <!--wrapper-->
       
        
        

<!-- /#wrap -->

<script type="text/javascript" src="/SMGMT/config/js/jquery.min.js"></script>
<script type="text/javascript">	
	
var getData=[];

function myFunction() {
	  // Declare variables 
	  var input, filter, table, tr, td, i;
	  input = document.getElementById("myInput");
	  filter = input.value;
	  table = document.getElementById("editable_table");
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

function standardList(schoolID,stdID,order)
{
	var std=document.getElementById(schoolID).value;
	//alert("OREDR BY "+order);
	
	document.getElementById(stdID).innerHTML="";
	//document.getElementById("std_div_id2").innerHTML="";
	//document.getElementById("stdIdAlo").innerHTML="";
	var xhttp =new XMLHttpRequest();
	try{
		xhttp.onreadystatechange = function(){
			if(this.readyState == 4 && this.status == 200){
				var getData1=this.responseText.split("~");
				var row="<option disabled selected>Select a Std/Div</option>";
				var i=0;
				for(;getData1[i];)
				{
					row += "<option value="+getData1[i]+">";
					i++;
					row += getData1[i] ;
					i++;
					row += "\t"+getData1[i] +"\t( ";
					i++;
					row += getData1[i]+ ")</option>";
					i++;

				}					
				document.getElementById(stdID).innerHTML+=row;
				$("#"+stdID).trigger('chosen:updated');
				//document.getElementById("std_div_id2").innerHTML+=row;
				//$("#std_div_id2").trigger('chosen:updated');				
			}
		}
		
		xhttp.open("POST", "/SMGMT/SchoolTransfer?standardList="+std+"&order="+order, true);
		xhttp.send();
	}
	catch(e)
	{
		alert("Unable to Connect Server!");
	}
}	
function getStudentDetails()
{
	var id=document.getElementById("std_div_id1").value;
	var year=document.getElementById("academic_id1").value;
	var xhttp =new XMLHttpRequest();
	try{
		xhttp.onreadystatechange = function(){
			if(this.readyState == 4 && this.status == 200){
				getData=this.responseText.split("~");
				$("#editable_table > tbody").empty();
				//alert("GetData : "+getData.length)
				for(var i=0;i<getData.length-1;i++)
				{
					var info=getData[i].split("/");
					var markup = "<tr><td>"+info[0]+"</td> <td>"+info[1]+"</td> <td>"+info[2]+"</td>";					
					markup += "<td>"+info[1]+"</td> <td>"+info[1]+"</td>";
					markup+= "<td> <input type='checkbox' name="+info[0]+" id="+i+" onclick='selectStudents(this.id)'></td></tr>";
					$("table tbody").append(markup);					
					document.getElementById(i).checked = true;
					
					//alert("Checked "+document.getElementById(info[0]).id);
				}						
			}
		}
		
		xhttp.open("POST", "/SMGMT/SchoolTransfer?studentList="+id+"&year="+year, true);
		xhttp.send();
	}
	catch(e)
	{
		alert("Unable to Connect Server!");
	}
}
function getSectionsList()
{
	var std_id=document.getElementById("std_div_id1").value;
	//alert(std_id);
	var xhttp =new XMLHttpRequest();
	try
	{
		xhttp.onreadystatechange = function()
		{
			if(this.readyState == 4 && this.status == 200)
			{
				var sec_id=this.responseText;
				document.getElementById("sec_id").value=sec_id;
				//alert("Section ID : "+document.getElementById("sec_id").value);
			}
		}
		
		xhttp.open("POST", "/SMGMT/SchoolTransfer?sectionList="+std_id, true);
		xhttp.send();
	}
	catch(e)
	{
		alert("Unable to Connect Server!");
	}

}
function selectStudents(ap)
{
	alert("AP : "+document.getElementById(ap).name);
}
function updateCatalog()
{
	var ap="";
	var id=document.getElementById("std_div_id2").value;
	var year=document.getElementById("academic_id2").value;
	ap+=id+"/"+year;
	//alert("PS : "+ap)
	//alert(id+"  "+year+" "+getData.length)
	for(var i=0;i<getData.length;i++)
	{
		var check=document.getElementById(i).checked;
		if(check)
		{
			ap+="/"+document.getElementById(i).name;
			document.getElementById("updatecatalog_id").value="";
			document.getElementById("updatecatalog_id").value=ap;
		}
	}
	
}
function selectToStdDiv()
{
	document.getElementById("std_div_id2").innerHTML="";
	var id=document.getElementById("std_div_id1");
	var ap=parseInt(id.options[id.selectedIndex].value);
	var id_val="",id_text="",row="";
	//alert(id.options.length+"=="+id.selectedIndex)
	if(id.selectedIndex==1)
	{
		//row+="<option disabled selected>Select a Std/Div</option>";
		id_val = id.options[id.selectedIndex].value;
		id_text = id.options[id.selectedIndex].text;
		row += "<option value="+(id_val)+">";
		row += id_text;
		row += "</option>";
		
		id_val = id.options[id.selectedIndex+1].value;
		id_text = id.options[id.selectedIndex+1].text;
		row += "<option selected value="+(id_val)+">";
		row += id_text;
		row += "</option>";
	}
	else if(id.selectedIndex==id.options.length-1)
	{	
		id_val = id.options[id.selectedIndex].value;
		id_text = id.options[id.selectedIndex].text;
		row += "<option selected value="+(id_val)+">";
		row += id_text;
		row += "</option>";
	}	
	else
	{
		id_val = id.options[id.selectedIndex].value;
		id_text = id.options[id.selectedIndex].text;
		row += "<option value="+(id_val)+">";
		row += id_text;
		row += "</option>";
			
		id_val = id.options[id.selectedIndex+1].value;
		id_text = id.options[id.selectedIndex+1].text;
		row += "<option selected value="+(id_val)+">";
		row += id_text;
		row += "</option>";		
	}	
	document.getElementById("std_div_id2").innerHTML+=row;
	
}
function getHigherSchoolList()
{
		document.getElementById("school_id2").innerHTML="";
		alert("School ID : "+document.getElementById("school_id1").value+" Section ID : "+document.getElementById("sec_id").value);
		var sec_id=document.getElementById("sec_id").value;
		//alert(std_id);
		var xhttp =new XMLHttpRequest();
		try
		{
			xhttp.onreadystatechange = function()
			{
				if(this.readyState == 4 && this.status == 200)
				{
					var i=0;
					var schoolList=this.responseText.split("/");
					alert("GetData : "+schoolList.length)
					var row="<option disabled selected>Select a School Name</option>";
					for(;i<schoolList.length-1;)
					{
							row += "<option value="+schoolList[i]+">";
							i++;
							row += schoolList[i]+"</option>";
							//alert(schoolList[i]);
							i++;
							
					}
					document.getElementById("school_id2").innerHTML+=row;
					$("#school_id2").trigger('chosen:updated');
				}
			}
			
			xhttp.open("POST", "/SMGMT/SchoolTransfer?sectionID="+sec_id, true);
			xhttp.send();
		}
		catch(e)
		{
			alert("Unable to Connect Server!");
		}
}
function getStdDivList()
{
	var sec_id=document.getElementById("sec_id").value;
	var school_id=document.getElementById("school_id2").value;
	document.getElementById("std_div_id2").innerHTML="";
	alert("Sec : "+sec_id+"School ID : "+school_id);
	var xhttp =new XMLHttpRequest();
	try
	{
		xhttp.onreadystatechange = function()
		{
			if(this.readyState == 4 && this.status == 200)
			{
				var i=0;
				var stdList=this.responseText.split("/");
				alert("Std1 : "+stdList[0]+"Std2 : "+stdList[1]+"Std3 : "+stdList[2]+"Std4 : "+stdList[3])
				var row="<option disabled selected>Select a Std/Div</option>";
				for(;i<stdList[i].length-1;)
				{
					row += "<option value="+stdList[i]+">";
					i++;
					row += stdList[i] ;
					i++;
					row += "\t"+stdList[i] +"\t( ";
					i++;
					row += stdList[i]+ ")</option>";
					i++;
						
				}
				document.getElementById("std_div_id2").innerHTML+=row;
				$("#std_div_id2").trigger('chosen:updated');
			}
		}
		
		xhttp.open("POST", "/SMGMT/SchoolTransfer?sectionID1="+sec_id+"&schoolID1="+school_id, true);
		xhttp.send();
	}
	catch(e)
	{
		alert("Unable to Connect Server!");
	}
}
/* function checkAll()
{
	var i=0;
	//document.getElementById(0).checked=false;
	/* if(document.getElementById("check_all").checked)
		{
			while(i<getData.length)
			{				
				//$("#"+i).prop("checked", true);
				document.getElementById(i).checked=true;
				//document.getElementById("fee"+i).innerHTML=fee;
				i++;
			}	
		}
		else 
		{
				i=0;
				while(i<getData.length)
				{
					document.getElementById(i).checked=false;
					i++;
				}	
		} 

} */
</script>

	<script type="text/javascript" src="/SMGMT/config/js/components.js"></script>
	<script type="text/javascript" src="/SMGMT/config/js/custom.js"></script>

    <script type="text/javascript" src="/SMGMT/config/vendors/jquery-validation-engine/js/jquery.validationEngine.js"></script>
    <script type="text/javascript" src="/SMGMT/config/vendors/jquery-validation-engine/js/jquery.validationEngine-en.js"></script>
    <script type="text/javascript" src="/SMGMT/config/vendors/jquery-validation/js/jquery.validate.js"></script>
    <script type="text/javascript" src="/SMGMT/config/vendors/datepicker/js/bootstrap-datepicker.min.js"></script>
    <script type="text/javascript" src="/SMGMT/config/vendors/datetimepicker/js/DateTimePicker.min.js"></script>
    <script type="text/javascript" src="/SMGMT/config/vendors/bootstrapvalidator/js/bootstrapValidator.min.js"></script>
    <script type="text/javascript" src="/SMGMT/config/vendors/moment/js/moment.min.js"></script>
	<script type="text/javascript" src="/SMGMT/config/js/form.js"></script>
    <script type="text/javascript" src="/SMGMT/config/js/pages/form_validation.js"></script>
	<script type="text/javascript" src="js/components.js.pagespeed.jm.vxV3GQYFro.js"></script>
	<script type="text/javascript" src="js/custom.js.pagespeed.jm.CN8Ow3CJOG.js"></script>

    <script type="text/javascript" src="/SMGMT/config/vendors/select2/js/select2.js.pagespeed.jm.Eugd1Y0BmV.js"></script>
    <script src="/SMGMT/config/vendors/datatables/js/dataTables.responsive.min.js+dataTables.buttons.min.js+buttons.colVis.min.js+buttons.html5.min.js+buttons.bootstrap.min.js+buttons.print.min.js.pagespeed.jc.TdR_"></script>
    
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

</html>