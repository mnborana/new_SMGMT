<%@page import="com.servletStore.fees.feeType.model.FeeTypeDAO"%>
<%@page import="com.servletStore.setup.model.SetupPOJO"%>
<%@page import="com.servletStore.setup.model.SetupImpl"%>
<%@page import="com.servletStore.setup.model.SetupDAO"%>
<%@page import="com.servletStore.fees.feeType.model.FeeTypeImpl"%>

<%@page import="com.servletStore.settings.standard.model.StandardPOJO"%>
<%@page import="java.util.List"%>
<%@page import="com.servletStore.settings.school.model.SchoolPOJO"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.servletStore.settings.standard.model.StandardImpl"%>
<%@page import="com.servletStore.settings.standard.model.StandardDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>Form Elements | Admire</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
     <jsp:include page="/View/common/commonCss.jsp"></jsp:include>
    <!-- end of page level styles -->
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
        <img src="" style=" width: 40px;" alt="loading...">
    </div>
</div>
<div id="wrap">
    <div id="top">
        <!-- .navb	ar -->
        	<jsp:include page="/View/common/header.jsp"></jsp:include>
        <!-- /.navbar -->
        <!-- /.head -->
    </div>
    <!-- /#top -->
    <div class="wrapper">
       <jsp:include page="/View/common/left-navbar.jsp"></jsp:include>
        <!-- /#left -->
        <div id="content" class="bg-container">
            <header class="head">
                <div class="main-bar">
                   <div class="row no-gutters">
                       <div class="col-sm-5 col-lg-6 skin_txt">
                           <h4 class="nav_top_align">
                               <i class="fa fa-pencil"></i>
                               Fees Type
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
                               <li class="active breadcrumb-item">Fees Type</li>
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
                                        	Fees Type
                                    </div>
                                    <div class="card-block m-t-35">
                                        <form action="/SMGMT/FeeType" method="post" class="form-horizontal  login_validator" id="form_block_validator">
                                            <div class="form-group row">
                                                <div class="col-lg-4 text-lg-right">
                                                    <label for="required2" class="col-form-label">Fees Type</label><span style="color: red;">*</span>
                                                </div>
                                                <div class="col-lg-4">
                                                   <input type="text" id="feeType" name="feeType" class="form-control" onkeyup="this.value=this.value.toUpperCase()" pattern="[A-Za-z]" onblur="this.value=$.trim(this.value)" required/>
                                                </div>
                                           </div>
                                           <div class="form-group row">
                                                <div class="col-lg-4 text-lg-right">
                                                    <label for="required2" class="col-form-label">Fees</label><span style="color: red;">*</span>
                                                </div>
                                                <div class="col-lg-4">
                                                    <input type="text" id="fee" name="fee" class="form-control" onblur="this.value=$.trim(this.value)" pattern="[0-9]+" required/>
                                                </div>
                                            </div>
                                             <div class="form-group row">
                                                <div class="col-lg-4 text-lg-right">
                                                    <label for="required2" class="col-form-label">Term</label><span style="color: red;">*</span>
                                                </div>
                                                <div class="col-lg-4">
                                                    <label class="custom-control custom-checkbox">&nbsp;&nbsp;
                                                        <input type="checkbox" name="term1" value="1" class="custom-control-input" checked>
                                                        <span class="custom-control-indicator"></span>
                                                        <span class="custom-control-description">I Term</span>
                                                    </label>
                                                    <label class="custom-control custom-checkbox">
                                                        <input type="checkbox" name="term2" value="1" class="custom-control-input">
                                                        <span class="custom-control-indicator"></span>
                                                        <span class="custom-control-description">II Term</span>
                                                    </label>
                                                </div>
                                            </div>
                                              <div class="form-group row">
                                                <div class="col-lg-4 text-lg-right">
                                                    <label for="required2" class="col-form-label">Caste</label>
                                                </div>
                                                <div class="col-lg-4">
                                                    <label class="custom-control custom-checkbox">&nbsp;&nbsp;
                                                        <input type="checkbox" name="caste" value="1" class="custom-control-input">
                                                        <span class="custom-control-indicator"></span>
                                                        <span class="custom-control-description"></span>
                                                    </label>
                                                </div>
                                            </div>
                                             <div class="form-actions form-group row">
                                                <div class="col-lg-4 push-lg-4">
                                                    <input type="submit" value="OK" name="submitFee" class="btn btn-primary">
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div> <!-- /.col-lg-12 -->
                        </div> <!-- /.row -->
                    </div> <!-- /.inner -->
                </div> <!-- /.outer -->
                
                
                <!-- Book Table -->  
            <div class="outer">
                    <div class="inner bg-container">
                        <div class="card">
                            <div class="card-header bg-white">
                               Fees List
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
                                                <th class="sorting wid-25" tabindex="0" rowspan="1" colspan="1">Fee Type</th>
                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Term(I)</th>
                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Term(II)</th>
                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Caste</th>
                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Action</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                       		 	<%
                                       		 		FeeTypeDAO dao=new FeeTypeImpl();
                                       		 	    request.setAttribute("display_fees", dao.getFeeType());
                                       		 	    int feeCount=0;
                                       		 	%> 
													<c:forEach items="${display_fees}" var="d">
													  <tr role="row" class="even">
														<td><%=(++feeCount) %></td>
														<td><c:out value="${d.feesType}"></c:out></td>
														
														<c:if test="${d.firstTerm!=0 }">
																<td><c:out value="${d.fees}"></c:out></td>
														</c:if>
														<c:if test="${d.firstTerm==0 }">
																 <td><c:out value="-"></c:out></td> 
														</c:if>
														<c:if test="${d.secondTerm!=0 }">
															<td><c:out value="${d.fees}"></c:out></td>
														</c:if>
														<c:if test="${d.secondTerm==0 }">
														<td><c:out value="-"></c:out></td>
														</c:if>
														
														<c:if test="${d.caste!=0 }">
														<td><c:out value="Yes"></c:out></td>
														<%-- <td><c:out value="${d.caste}"></c:out></td> --%>
														</c:if>
														<c:if test="${d.caste==0 }">
														<td><c:out value="-"></c:out></td>
														</c:if>
														<td>
                                            			<a class="edit" data-placement="top" title="Edit" href="#update" data-toggle="modal" onclick="loadDoc(${d.getId()})"><i class="fa fa-pencil text-warning"></i></a>&nbsp; &nbsp;
                                            			<a class="delete hidden-xs hidden-sm" data-toggle="tooltip" data-placement="top" title="Delete" href="#"><i class="fa fa-trash text-danger"></i></a>
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
                       </div><!-- /.inner -->
                    </div><!-- /outer -->
                 
                 <!--  Model for update -->   
                 <div class="modal fade show" id="update" role="dialog" aria-labelledby="modalLabelnews">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header bg-primary">
                                <h4 class="modal-title text-white" id="modalLabelnews"><strong>Update</strong></h4>
                            </div>
                            <div class="modal-body">
                            	 <form action="/SMGMT/FeeType" method="post" class="form-horizontal  login_validator" id="form_block_validator1">
                                              <div class="form-group row">
                                                <div class="col-lg-4  text-lg-right">
                                                    <label for="required2" class="col-form-label">Fees Type </label>
                                                </div>
                                                <div class="col-lg-4">
                                                 <input type="hidden" id="idId" name="id" class="form-control" onblur="this.value=$.trim(this.value)" >
                                                    <input type="text" id="feeTypeId" name="feeTypeUp" class="form-control" onblur="this.value=$.trim(this.value)" onkeyup="this.value = this.value.toUpperCase();" required >
                                                </div>
                                           </div>
                                           <div class="form-group row">
                                                <div class="col-lg-4 text-lg-right">
                                                    <label for="required2" class="col-form-label">Fees </label>
                                                </div>
                                                <div class="col-lg-4">
                                                    <input type="text" id="feeId" name="feeUp" class="form-control" onblur="this.value=$.trim(this.value)" required>
                                                </div>
                                            </div>
                                             <div class="form-group row">
                                                <div class="col-lg-4 text-lg-right">
                                                    <label for="required2" class="col-form-label">Term </label>
                                                </div>
                                                <div class="col-lg-4">
                                                    <label class="custom-control custom-checkbox">&nbsp;&nbsp;
                                                        <input type="checkbox" name="term1Up" value="1" id="term1Id" class="custom-control-input">
                                                        <span class="custom-control-indicator"></span>
                                                        <span class="custom-control-description">I Term</span>
                                                    </label>
                                                    <label class="custom-control custom-checkbox">
                                                        <input type="checkbox" name="term2Up" value="1" id="term2Id" class="custom-control-input">
                                                        <span class="custom-control-indicator"></span>
                                                        <span class="custom-control-description">II Term</span>
                                                    </label>
                                                </div>
                                            </div>
                                              <div class="form-group row">
                                                <div class="col-lg-4 text-lg-right">
                                                    <label for="required2" class="col-form-label">Caste </label>
                                                </div>
                                                <div class="col-lg-4">
                                                    <label class="custom-control custom-checkbox">&nbsp;&nbsp;
                                                        <input type="checkbox" name="casteUp" value="1" id="casteId" class="custom-control-input">
                                                        <span class="custom-control-indicator"></span>
                                                        <span class="custom-control-description"></span>
                                                    </label>
                                                </div>
                                            </div>
			                         		 <div class="modal-footer">
					                            <button class="btn btn-success" type="submit" name="updateFee" id="updateId">Update</button> 
					                           	<button class="btn btn-warning" data-dismiss="modal">Close</button>  
					              	         </div>
                       				</form>
                            </div>
                        </div>
                    </div>
                </div>  <!-- /Modal  -->
           </div>
        <!-- /#content -->
    </div>
    <!--wrapper-->
    <!-- /#content -->
</div>
<!-- /#wrap -->
<!-- global scripts-->

	<jsp:include page="/View/common/commonJs.jsp"></jsp:include>

</body>
<script type="text/javascript">
function loadDoc(id)
{
	var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	     var demoData = this.responseText;
	     var str=demoData.split(",");
	     document.getElementById("idId").value=str[0];
	     document.getElementById("feeTypeId").value=str[1];
	   	 document.getElementById("feeId").value=str[2];
	   	 var termFrst=str[3];
	   	 var termSecnd=str[4];
	   	 if(termFrst==1){
		   		document.getElementById("term1Id").checked=true; 
		 }
	   	 else{
	   		document.getElementById("term1Id").checked=false; 
	   	 }
	   	 if(termSecnd==1){
	   		alert(termSecnd);
			   	document.getElementById("term2Id").checked=true;  
		 }
	   	 else{
		   		document.getElementById("term2Id").checked=false; 
		   	 }
	   	 var caste=str[5];
	   	 if(caste==1)
	   		 {
	   		 document.getElementById("casteId").checked=true;
	   		 }
	   	 else
	   		 {
	   		document.getElementById("casteId").checked=false;
	   		 }
	    }
	  };
	  xhttp.open("POST","/SMGMT/FeeType?updateId="+id, true);
	  xhttp.send();

}

</script>


</html>
