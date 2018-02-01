<%@page import="com.servletStore.setup.model.SetupPOJO"%>
<%@page import="com.servletStore.setup.model.SetupImpl"%>
<%@page import="com.servletStore.setup.model.SetupDAO"%>
<%@page import="com.servletStore.fees.assignStdWiseFees.model.AssignStdWiseFeesImpl"%>
<%@page import="com.servletStore.fees.assignStdWiseFees.model.AssignStdWiseFeesDao"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
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
		
		 while(itr.hasNext()){
			grant = itr.next();
		 }
		 
		 access = grant.getFee();
		 //System.out.println("roll "+roll + " schoolId "+schoolId +" access "+access);
		 
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
            
            
           <% if(access==2){ %>  
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
                                               <select multiple class="form-control chzn-select" name="standardIds" id="standardId" title="Select Standard"  required>
			                                        
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
							                                            <th></th>
							                                            <th>Fees Type</th>
							                                            <th>Term One Fees</th>
							                                            <th>Term Two Fees</th>
							                                            <th>Priority</th>
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
																                    	<input type='checkbox' value='<%=i %>' name='feeTypeCheck' id='feeTypeCheck' >
																                    	<span class='cr'><i class='cr-icon fa fa-check'></i></span>
																                	</label>
																	    		</div>
							                                        		</td>
							                                        		<td><c:out value="${l.feesType}"> </c:out></td> 
							                                        		<td><c:out value="${l.termOneFees}"></c:out></td>
							                                        		<td><c:out value="${l.termTwoFees}"></c:out></td>
							                                        		
							                                        		<td>
							                                        			<div class='checkbox'>
																                	<label class='text-mint'>
																                    	<input type='checkbox' value='1' name='feeTypePriority_<%=i %>' id='feeTypePriority_<%=i %>' >
																                    	<span class='cr'><i class='cr-icon fa fa-check'></i></span>
																                	</label>
																	    		</div>	
							                                        		</td>
																			
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
                
                <% } %>
               
            
                
                <!-- /.outer -->
            </div>
        </div>
        <!-- /#content -->
    </div>
    <!--wrapper-->
    
    <!-- /#content -->
  

</div>
<!-- /#wrap -->
<!-- global scripts-->


<!-- common js -->
	<jsp:include page="/View/common/commonJs.jsp"></jsp:include>
<!-- common js -->

</body>

</html>