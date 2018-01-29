<%@page import="com.servletStore.setup.model.SetupPOJO"%>
<%@page import="com.servletStore.setup.model.SetupImpl"%>
<%@page import="com.servletStore.setup.model.SetupDAO"%>
<%@page import="com.servletStore.library.model.AddBookImpl"%>
<%@page import="com.servletStore.library.model.AddBookDAO"%>
<%@page import="com.servletStore.library.model.BookCatPOJO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.servletStore.library.model.BookCatImpl"%>
<%@page import="com.servletStore.library.model.BookDAO"%>.
<%@page import="utility.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>Form Validations | Admire</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<!--     <link rel="shortcut icon" href="/SMGMT/config/img/xlogo1.ico.pagespeed.ic.ONh6qx31g4.html"/> -->
<!--     global styles -->
<!--     <link type="text/css" rel="stylesheet" href="/SMGMT/config/css,_components.css+css,_custom.css+vendors,_jquery-validation-engine,_css,_validationEngine.jquery.css+vendors,_datepicker,_css,_bootstrap-datepicker.min.css+vendors,_datepicker,_css"/> -->
<!--     <link type="text/css" rel="stylesheet" href="/SMGMT/config/css,_components.css+css,_custom.css+vendors,_select2,_css,_select2.min.css+css,_pages,_dataTables.bootstrap.css+css,_pages,_tables.css.pagespeed.cc._6lRWz19bZ.css"/> -->
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
		
		//if it returns read(1) then hide form and action column in dataTable
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
	                                    Book Details
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
	                                    <li class="active breadcrumb-item">Add Books</li>
	                                </ol>
	                            </div>
	                        </div>
	                    </div>
	                </header>
	                
             <!-- start your code from here  --> 
             <div class="outer">
						<div class="inner bg-container forms">
							<div class="row">
								<div class="col-lg-12">
									<div class="card">
										<div class="card-header bg-white">
											<h3>Add Book</h3>
										</div>
										<div class="card-block">
											<div class="row">

												<div class="card-block seclect_form">
												<form action="/SMGMT/Library" method="post" class="form-horizontal login_validator" id="form_block_validator">
													<div class="row">
													<%
                                             		SysDate date=new SysDate();
                                             		%> 
													 
													<div class="form-group col-lg-4 input_field_sections">
													
															<label for="addbook_date" class="col-form-label">Addbook
																Date *</label>
															<div class="input-group input-append date" id="dp1"
																data-date-format="dd-mm-yyyy">
																<input type="text" class="form-control form_val_popup"
																	name="addbookdate" id="date"  value="<%=date.todayDate()%>"
																	placeholder="dd-mm-yyyy" required> <span
																	class="input-group-addon add-on"> <i
																	class="fa fa-calendar"></i>
																</span>
															</div>
														</div>
														
														<div class="form-group col-lg-4 input_field_sections">
															<label for="stdId" class="col-form-label">Select Category *</label> 
															<select class="form-control chzn-select" name="category"  required>
																<%
	                                               					BookDAO addb=new BookCatImpl();
                                                    				List list=addb.getCategoryDetails();   
                   													Iterator itr1=list.iterator();
                   														while(itr1.hasNext())
                   														{
                   															BookCatPOJO b=(BookCatPOJO)itr1.next();
	                                               				%>
	                                               		            <option value="<%=b.getId()%>"><%=b.getCatName()%></option>
														 	   <%}%>
										                   
										
															</select>
															<a href="#category" data-toggle="modal" data-target="#category" class="btn btn-info" style="margin-left: 101%;margin-top: -34px; width:30px; height:29px">+</a>
														</div>
													
														<div class="form-group col-lg-4 input_field_sections">
															<label for="firstName" class="col-form-label">Book
																Name </label><span style="color: red;">*</span> <input type="text" id="bookName1"
																name="bookName" class="form-control"
																placeholder="Book Name" onkeyup="this.value = this.value.toUpperCase();" pattern="[A-Za-z]" required>
														</div>
													</div>
													<div class="row">
														<div class="form-group col-lg-4 input_field_sections">
															<label for="lastname" class="col-form-label">Author
																Name </label><span style="color: red;">*</span> <input type="text" id="authorName1" name="authorName"
																class="form-control" placeholder="Author Name" onkeyup="this.value = this.value.toUpperCase();" pattern="[A-Za-z]" required />
														</div>
														<div class="form-group col-lg-4 input_field_sections">
															<label for="age" class="col-form-label">Publisher Name</label> <input
																type="text" id="pubName1" name="pubName" class="form-control"
																placeholder="Publisher Name" onkeyup="this.value = this.value.toUpperCase();" pattern="[A-Za-z]" />
														</div>
														<div class="form-group col-lg-4 input_field_sections">
															<label for="birthplace" class="col-form-label">Edition
																</label> <input type="text" id="edition1"
																name="edition" class="form-control"
																placeholder="Edition"  onkeyup="this.value = this.value.toUpperCase();" pattern="[A-Za-z]" />
														</div>
													</div>
													<div class="row">
														
														<div class="form-group col-lg-4 input_field_sections">
															<label for="height" class="col-form-label">Price</label><span style="color: red;">*</span>
															<input type="text" id="price1" name="price"
																class="form-control" placeholder="Price" pattern="[0-9]" required />
														</div>
													
													
														<div class="form-group col-lg-4 input_field_sections">
															<label for="weight" class="col-form-label">Coupboard No</label><span style="color: red;">*</span>
															<input type="text" id="cupbno1" name="cupbno"
																class="form-control" placeholder="Coupboard No" pattern="[0-9A-Za-z]" required />
														</div>
														<div class="form-group col-lg-4 input_field_sections">
															<label for="adharno" class="col-form-label">Quantity
																</label><span style="color: red;">*</span> <input type="text" id="quan1" name="quan"
																class="form-control" placeholder="Quantity" pattern="[0-9]" required />
														</div>
													</div>
														<div class="row">
														 <div class="form-group col-lg-4 input_field_sections">
															<label for="lastname" class="col-form-label">Select
																Language</label><span style="color: red;">*</span> <select class="form-control chzn-select"
																name="language">
																<option disabled selected>Choose a Language</option>
																<option value="English">English</option>
																<option value="Marathi">Marathi</option>
																<option value="Hindi">Hindi</option>
																<option value="English">Urdu</option>
															</select>
														</div>
														</div>
														<div class="form-actions form-group row">
	                                           				 <input type="submit" value="Add Book" name="addbook" class="btn btn-primary"  style="margin-top: 3%;margin-left: 2%;">
	                                             				&nbsp;&nbsp;&nbsp;<input type="reset" value="Cancel" class="btn btn-primary" style="margin-top: 3%;">
	                                  					</div>
														
													</form>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				
            
            <!-- Modal for category -->
            <div class="modal fade show" id="category" role="dialog" aria-labelledby="modalLabelnews">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header bg-primary">
                                <h4 class="modal-title text-white" id="modalLabelnews">Category</h4>
                            </div>
                            <div class="modal-body">
                            	<form action="/SMGMT/Library" class="form-horizontal" id="form_block_validator" method="POST">
                            		 		<div class="form-group row">
                            		 			<div class="col-lg-8 ">
                                                    <label for="catName" class="col-form-label">Category Name </label><span style="color: red;">*</span>
                                               	    <input type="text" id="catName" name="catName" class="form-control" onkeyup="this.value = this.value.toUpperCase();" pattern="[A-Za-z]" required>
                                               	    
                                               	    
                                               	    <!-- <div class="form-group col-lg-4 input_field_sections">
															<label for="firstName" class="col-form-label">Book
																Name *</label> <input type="text" id="bookName1"
																name="bookName" class="form-control"
																placeholder="Book Name" onkeyup="this.value = this.value.toUpperCase();" pattern="[A-Za-z]" required>
														</div> -->
                                                </div>
                                            </div>
                                             <div class="modal-footer">
                               					 <button class="btn btn-success" type="submit" name="savecat" id="updateId">Save</button> 
					                           	<button class="btn btn-warning" data-dismiss="modal">Cancel</button>
                            				</div>
                           	    </form>   
                            </div>
                           
                        </div>
                    </div>
                </div>  <!-- /Modal  -->
          
          <!-- Book Table -->  
            <div class="outer">
                    <div class="inner bg-container">
                        <div class="card">
                            <div class="card-header bg-white">
                               Book List
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
                                                <th class="sorting_asc wid-20" tabindex="0" rowspan="1" colspan="1">Book NO</th>
                                                <th class="sorting wid-25" tabindex="0" rowspan="1" colspan="1">Book Name</th>
                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Author Name</th>
                                                <!-- <th class="sorting wid-20" tabindex="0" rowspan="1" colspan="1">Publisher Name</th>
                                                <th class="sorting wid-15" tabindex="0" rowspan="1" colspan="1">Edition</th>
                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Price</th> -->
                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Cupboard No</th>
                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Quantity</th>
                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Language</th>
                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Action</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                       		 	<%
                                       		 		AddBookDAO dao=new AddBookImpl();
                                       		 		request.setAttribute("display_book", dao.getBookDetails());
                                       		 		int bookCount=0;
                                       		 	%>
													<c:forEach items="${display_book}" var="d">
													  <tr role="row" class="even">
														<td><%=(++bookCount) %></td>
														<td><c:out value="${d.bookName}"></c:out></td>
														<td><c:out value="${d.authorName}"></c:out></td>
														<%-- <td><c:out value="${d.publisherName}"></c:out></td>
														<td><c:out value="${d.edition}"></c:out></td>
														<td><c:out value="${d.price}"></c:out></td> --%>
														<td><c:out value="${d.cupboardNo}"></c:out></td>
														<td><c:out value="${d.quantity}"></c:out></td>
														<td><c:out value="${d.language}"></c:out></td>
														<td>
                                            			<a class="edit" data-placement="top" title="Edit" href="#update" data-toggle="modal" onclick="loadDoc(${d.getBookNo()})"><i class="fa fa-pencil text-warning"></i></a>&nbsp; &nbsp;
                                            			<a class="delete hidden-xs hidden-sm" data-toggle="tooltip" data-placement="top" title="Delete" href="/SMGMT/Library?bookNo=${d.getBookNo()}"><i class="fa fa-trash text-danger"></i></a>
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
               
                <!-- Modal for Update -->
                  <div class="modal fade show" id="update" role="dialog" aria-labelledby="modalLabelnews">
                  	 <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header bg-primary">
                                <h4 class="modal-title text-white" id="modalLabelnews">Update</h4>
                            </div>
                            <div class="modal-body">   
								 <form action="/SMGMT/Library" method="post" class="form-horizontal  login_validator" id="form_block_validator">
                                             <div class="form-group row">
                                             
                                             
                                                <div class="col-lg-4">
                                               		 <input type="hidden" name="bno" id="bid">
                                                     <label class="col-form-label">Date </label>
                                                     
                                                      <input type="text" class="form-control form_val_popup_dp3" value="<%=date.todayDate() %>" name="date" id="date" placeholder="YYYY-MM-DD"/>
                                                 </div>
                                               
                                                <div class="col-lg-4 ">
                                                    <label for="required2" class="col-form-label">Book Name </label>
                                               	    <input type="text" name="bookName" id="bookName" class="form-control" onkeyup="this.value = this.value.toUpperCase();" required>
                                                </div>
                                            	 <div class="col-lg-4">
                                                    <label for="required2" class="col-form-label">Author Name </label>
                                                	 <input type="text" name="authorName" id="authorName" class="form-control" onkeyup="this.value = this.value.toUpperCase();" required>
                                                </div>
                                           		 <div class="col-lg-4 ">
                                                    <label for="required2" class="col-form-label" style="margin-top: 11%;">Publisher Name </label>
                                               	    <input type="text" name="pubName" id="pubName" class="form-control" onkeyup="this.value = this.value.toUpperCase();" required>
                                                </div>
                                                <div class="col-lg-4">
                                                     <label for="required2" class="col-form-label" style="margin-top: 11%;">Edition </label>
                                                	 <input type="text" name="edition" id="edition" class="form-control" onkeyup="this.value = this.value.toUpperCase();" pattern="[A-Za-z0-9]" required>
                                                </div> 
                                                <div class="col-lg-4 ">
                                                    <label for="required2" class="col-form-label" style="margin-top: 11%;">Price </label>
                                               	    <input type="text" name="price" id="price" class="form-control">
                                                </div>
                                            	 <div class="col-lg-4">
                                                    <label for="required2" class="col-form-label" style="margin-top: 13%;">Cupboard No </label>
                                                	 <input type="text" name="cupbno" id="cupbNo" class="form-control" onkeyup="this.value = this.value.toUpperCase();" pattern="[A-Za-z0-9]">
                                                </div>
                                                <div class="col-lg-4">
                                                     <label for="required2" class="col-form-label" style="margin-top: 13%;">Quantity </label>
                                                	 <input type="text" name="quan" id="qty" class="form-control" pattern="[0-9]" required>
                                                </div>
                                                <div class="form-group col-lg-4 input_field_sections">
															<label for="lastname" class="col-form-label">Select
																Language </label> <select class="form-control"
																name="language" id="lang" style="margin-top: -2%;">
																<option value="English">English</option>
																<option value="Marathi">Marathi</option>
																<option value="Hindi">Hindi</option>
																<option value="English">Urdu</option>
															</select>
												</div>
												</div>
                                                <!-- <div class="col-lg-4 input_field_sections">
	                                            	<h5>Select Language *</h5>
	                                            	<div class="form-group">
		                                            	<select class="form-control"  name="language" id="lang">
		                                                   <option value="English">English</option>
		                                                    <option value="Hindi">Hindi</option>
		                                                    <option value="Marathi">Marathi</option>
		                                                    <option value="Urdu">Urdu</option>
														 </select>
                                           			</div> 
                                        		</div> -->
			                         		 <div class="modal-footer">
					                            <button class="btn btn-primary waves-effect" type="submit" name="updatebook" id="sub">Update Book</button> 
					                           	<button class="btn btn-warning" data-dismiss="modal">Close</button>  
					              	         </div>
			                       	  
                       				</form>
                            	</div>
                          </div>
                    </div>  
                </div>
             </div>
            
            
            </div> <!-- /#content -->
        </div>
        
       <!--wrapper-->
       
        
        
</div>
<!-- /#wrap -->

<!-- 	<script type="text/javascript" src="/SMGMT/config/js/components.js"></script> -->
<!-- 	<script type="text/javascript" src="/SMGMT/config/js/custom.js"></script> -->

<!--     <script type="text/javascript" src="/SMGMT/config/vendors/jquery-validation-engine/js/jquery.validationEngine.js"></script> -->
<!--     <script type="text/javascript" src="/SMGMT/config/vendors/jquery-validation-engine/js/jquery.validationEngine-en.js"></script> -->
<!--     <script type="text/javascript" src="/SMGMT/config/vendors/jquery-validation/js/jquery.validate.js"></script> -->
<!--     <script type="text/javascript" src="/SMGMT/config/vendors/datepicker/js/bootstrap-datepicker.min.js"></script> -->
<!--     <script type="text/javascript" src="/SMGMT/config/vendors/datetimepicker/js/DateTimePicker.min.js"></script> -->
<!--     <script type="text/javascript" src="/SMGMT/config/vendors/bootstrapvalidator/js/bootstrapValidator.min.js"></script> -->
<!--     <script type="text/javascript" src="/SMGMT/config/vendors/moment/js/moment.min.js"></script> -->
<!-- 	<script type="text/javascript" src="/SMGMT/config/js/form.js"></script> -->
<!--     <script type="text/javascript" src="/SMGMT/config/js/pages/form_validation.js"></script> -->
<!-- 	<script type="text/javascript" src="js/components.js.pagespeed.jm.vxV3GQYFro.js"></script> -->
<!-- 	<script type="text/javascript" src="js/custom.js.pagespeed.jm.CN8Ow3CJOG.js"></script> -->

<!--     <script type="text/javascript" src="/SMGMT/config/vendors/select2/js/select2.js.pagespeed.jm.Eugd1Y0BmV.js"></script> -->
<!--     <script src="/SMGMT/config/vendors/datatables/js/jquery.dataTables.min.js+dataTables.bootstrap.min.js.pagespeed.jc.HRNT0WoBU9.js"></script> -->
<!--     <script src="/SMGMT/config/vendors/datatables/js/dataTables.responsive.min.js+dataTables.buttons.min.js+buttons.colVis.min.js+buttons.html5.min.js+buttons.bootstrap.min.js+buttons.print.min.js.pagespeed.jc.TdR_"></script> -->
    
<!--     <script>eval(mod_pagespeed_g_o5ieHdNa);</script> -->
<!--     <script>eval(mod_pagespeed_UzcyJ5ysoL);</script> -->
<!--     <script>eval(mod_pagespeed_sB4kJD0xfI);</script> -->
<!--     <script>eval(mod_pagespeed_aYQJk4iDci);</script> -->
<!--     <script>eval(mod_pagespeed_wVkzf2s7YZ);</script> -->
<!--     <script>eval(mod_pagespeed_Ij0pRaH8BP);</script> -->
<!--     <script>eval(mod_pagespeed_wfmKXYO4Nj);</script> -->
<!--     <script>eval(mod_pagespeed_EYzby3B1$L);</script> -->

<!--     <script type="text/javascript" src="/SMGMT/config/js/pages/users.js"></script> -->
<jsp:include page="/View/common/commonJs.jsp"></jsp:include>
</body>

<script type="text/javascript">
function myFunction()    
{
	 /*<<<<<<<<<<<<<<<<< For snackbar >>>>>>>>>>>>>>>>>>>>>>> */
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

function loadDoc(id) {
		 var xhttp = new XMLHttpRequest();
		 xhttp.onreadystatechange = function() {
	     if (this.readyState == 4 && this.status == 200) {
	     var demoData = this.responseText;
	     var str=demoData.split(",");
	     document.getElementById("bid").value=str[0];
	   	 document.getElementById("date").value=str[1];
	   	 document.getElementById("bookName").value=str[2];
	     document.getElementById("authorName").value=str[3];
	     document.getElementById("pubName").value=str[4];
	     document.getElementById("edition").value=str[5];
	     document.getElementById("price").value=str[6];
	     document.getElementById("cupbNo").value=str[7];
	     document.getElementById("qty").value=str[8];   
	   //  document.getElementById("lang").value=str[9]; 
	     var dd=document.getElementById("lang");
	 
		for (var i = 0; i < dd.options.length; i++) {
		    if (dd.options[i].text ==str[9].trim()) {
		        dd.selectedIndex = i;
		        getSetSelect('s2id_lang',str[9]);
		        break;
		    }
		}

	   }
	  };
	  xhttp.open("POST","/SMGMT/Library?updateId="+id, true);
	  xhttp.send();
	}

</script>
</html>