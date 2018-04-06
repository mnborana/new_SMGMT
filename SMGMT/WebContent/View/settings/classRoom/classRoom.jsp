<%@page import="com.servletStore.setup.model.SetupPOJO"%>
<%@page import="com.servletStore.setup.model.SetupImpl"%>
<%@page import="com.servletStore.setup.model.SetupDAO"%>
<%@page import="com.servletStore.settings.classRoom.model.AddClassRoomPOJO"%>
<%@page import="com.servletStore.settings.classRoom.model.AddClassRoomImpl"%>
<%@page import="com.servletStore.settings.classRoom.model.AddClassRoomDAO"%>
<%@page import="com.servletStore.settings.section.model.SectionImpl"%>
<%@page import="com.servletStore.settings.section.model.SectionPojo"%>
<%@page import="com.servletStore.settings.section.model.SectionDAO"%>
<%@page import="com.servletStore.settings.school.model.SchoolPOJO"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.servletStore.settings.standard.model.StandardPOJO"%>
<%@page import="java.util.List"%>
<%@page import="com.servletStore.settings.standard.model.StandardImpl"%>
<%@page import="com.servletStore.settings.standard.model.StandardDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    
    <jsp:include page="/View/common/commonCss.jsp"></jsp:include>
    
    
    <style type="text/css">

	 #shift, #sectionId {
		display: block !important;
	    opacity: 0;
	    margin-bottom: -10%;
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
		 while(itr.hasNext()){
			grant = itr.next();
		 }
		 
		 access = grant.getSetting();
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
                               Class Room
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
                                   <a href="#">Settings</a>
                               </li>
                               <li class="active breadcrumb-item">Class Room</li>
                           </ol>
                       </div>
                   </div>
                </div>
            </header>
            
            
            <!-- start your code from here  -->  
              
           <%
           	  if(access==2){
           %>   
           <div class="outer">
                    <div class="inner bg-container">
                        <div class="row">
                            <div class="col-xl-12">
                                <div class="card">
                                    <div class="card-header bg-white">
                                        <i class="fa fa-file-text-o"></i>
                                        Create New Class Room
                                    </div>
                                    <div class="card-block m-t-35">
                                        <form action="/SMGMT/AddClassRoom" method="post" class="form-horizontal  login_validator" id="form_block_validator">
                                       <div class="form-group row">
                                           <div class="col-lg-4  text-lg-right">
                                               <label for="required2" class="col-form-label">Select School <span style="color: red;">*</span> </label>
                                           </div>
                                           <div class="col-lg-4">
                                               <select class="form-control chzn-select" name="sectionId" onchange="getStandards()" id="sectionId" title="Select Section"  required>
			                                        <option value="">Select Section</option>
			                                        <%
				                                    	SectionDAO sdao2 = new SectionImpl();
				                                    	List<SectionPojo> l2 = sdao2.getSectionDetails();
				                                   
														int count2=1;
				                                    	Iterator itr2 = l2.iterator();
				                                    	while(itr2.hasNext()){
				                                    		SectionPojo pojo2 = (SectionPojo)itr2.next();
				                                    		int id2 = pojo2.getId();
				                                    %>
				                                            <option value="<%=id2 %>"> <%=pojo2.getName() %> </option>
				                                     <%
				                                     	count2++;
				                                    	}
				                                     %>  
			                                        
			                                    </select>
                                           </div>
                                       </div>
                                       
                                       <div class="form-group row">
                                           <div class="col-lg-4  text-lg-right">
                                               <label for="required2" class="col-form-label">Select Shift <span style="color: red;">*</span> </label>
                                           </div>
                                           <div class="col-lg-4">
                                               <select class="form-control chzn-select" name="shift" id="shift" title="Select Shift"  required>
			                                        <option value="" >Select Shift</option>
			                                        <option value="MORNING" >MORNING</option>
			                                        <option value="AFTERNOON" >AFTERNOON</option>
			                                    </select>
                                           </div>
                                       </div>
                                       
                                       <input type="hidden" value="<%=schoolId %>" name="schoolId">
                                       
                                       <div class="form-group row">
                                           <div class="col-lg-4 text-lg-right">
                                               <label for="required2" class="col-form-label">Division Name </label>
                                           </div>
                                           <div class="col-lg-4">
                                               <input class="form-control" onkeyup="this.value=this.value.toUpperCase()" placeholder="Division Name" name="divisionName" id="divisionName" autocomplete="off" />
                                           </div>
                                       </div>
                                       
                                       
                                       <div class=" form-group row" id="stdCheckboxes">
                                       
                                       
                                      </div>
                                      <br>
                                       <div class="form-actions form-group row">
                                           <div class="col-lg-4 push-lg-4">
                                               <input type="submit" name="classRoomSubmit" value="Generate Class Room" class="btn btn-primary">
                                           </div>
                                       </div>
                                   </form>
                                    </div>
                                </div>
                            </div> <!-- /.col-lg-12 -->
                        </div> <!-- /.row -->
                    </div> <!-- /.inner -->
                </div> <!-- /.outer -->
              <%
           	  	}
              %>  
               
            <div class="outer">
                <div class="inner bg-container">
                    <div class="card">
                        <div class="card-header bg-white">
                           Class Room List
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
                                            <th class="sorting wid-25" tabindex="0" rowspan="1" colspan="1">Class Room</th>
                                            <th class="sorting wid-25" tabindex="0" rowspan="1" colspan="1">Section</th>
                                            <th class="sorting wid-25" tabindex="0" rowspan="1" colspan="1">Shift</th>
                                            
                                            <% if(access==2){ %>
                                            	<th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Actions</th>
                                            <% } %>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        
                                        <%
                                         	AddClassRoomDAO classImpl = new AddClassRoomImpl();
	                                     	List l = classImpl.getClassRoomDetails(schoolId);
	                                    
	 										int count=1;
	                                     	Iterator itr = l.iterator();
	                                     	while(itr.hasNext()){
	                                     		AddClassRoomPOJO classPojo = (AddClassRoomPOJO)itr.next();
	                                     		int id = classPojo.getClassRoomId();
	                                  	%>
                                        	<tr role="row" class="even">
                                        		<td><%=count %></td>
                                        		
                                        		<% if(classPojo.getDivision().equals("")){ %>
                                        			<td><%=classPojo.getStdName()%></td>
                                        		<%}else{ %>
                                        			<td><%=classPojo.getStdName() +" (" +classPojo.getDivision() +")"%></td>
                                        		<%} %>
                                        		
                                        		<td><%=classPojo.getSectionName() %></td>
                                        		<td><%=classPojo.getShift() %></td>
                                        		
                                        		<% if(access==2){ %>
                                        		<td>
                                        			<a class="edit" data-toggle="tooltip" data-placement="top" title="Update" href="#" onclick="updateStandard(<%=id%>)"><i class="fa fa-pencil text-warning"></i></a>&nbsp; &nbsp;
                                        			<a class="delete hidden-xs hidden-sm" data-toggle="tooltip" data-placement="top" title="Delete" href="#"><i class="fa fa-trash text-danger"></i></a>
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
                </div>
                <!-- /.inner -->
            </div>
                
                <!-- /.outer -->
            </div>
        </div>
        <!-- /#content -->
    </div>
    <!--wrapper-->
    
    <!-- /#content -->
  

<!-- /#wrap -->
<!-- global scripts-->

<script type="text/javascript">

function getStandards() {

	var schoolId = <%=schoolId %>;
	var sectionId = document.getElementById("sectionId").value;
	var xhttp;
	xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			var demoStr = this.responseText.split(",");
			var count=1;
			var s="";
			
		
			for(var j=0; j<demoStr.length-1; j++){
				
				s=s+"<div class='col-lg-2 input_field_sections'> "+
           		"<div class='checkbox'>"+
                "<label class='text-mint'>"+
                    "<input type='checkbox' value='"+demoStr[j]+"' name='stds' id='basic_checkbox_"+(count)+"' >"+
                    "<span class='cr'><i class='cr-icon fa fa-check'></i></span> "+demoStr[++j]+
                "</label>"+
    		"</div>"+
    	"</div>";
				count++;
			}
			
			document.getElementById("stdCheckboxes").innerHTML=s;
			
			
		}
	};
	
	xhttp.open("POST", "/SMGMT/AddClassRoom?schoolId="+schoolId+"&sectionId="+sectionId, true);
	xhttp.send();
	
}

function setSelected() {
	var selectedSection = document.getElementById("sectionId").value;
	//alert(selectedSection);
}

</script>

 <jsp:include page="/View/common/commonJs.jsp"></jsp:include>
 
</body>

</html>