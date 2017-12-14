<%@page import="com.servletStore.library.model.AddBookImpl"%>
<%@page import="com.servletStore.library.model.AddBookDao"%>
<%@page import="com.servletStore.library.model.BookCatPojo"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.servletStore.library.model.BookCatImpl"%>
<%@page import="com.servletStore.library.model.BookDAO"%>.
<%@page import=" utility.*" %>
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
                                        <i class="fa fa-file-text-o"></i>
                                        Basic Validation
                                    </div>
                                    <div class="card-block m-t-35">
                                        <form action="/SMGMT/MainServlet" method="post" class="form-horizontal  login_validator" id="form_block_validator">
                                           <div class="form-group row">
                                             	<%
                                                   SysDate requireddate=new SysDate();
                                                 %> 
                                                <div class="col-lg-4">
                                                    <label class="col-form-label">Date *</label>
                                                    <input type="text" class="form-control form_val_popup_dp3" value="<%=requireddate.todayDate() %>" name="date" placeholder="YYYY-MM-DD"/>
                                                </div>
                                                 <div class="col-lg-4">
                                                    <label for="sport" class="col-form-label">Select Category *</label>
                                               			<select name="category" class="validate[required] form-control select2">
	                                               			<%
				 													BookDAO addb=new BookCatImpl();
																	List l=addb.getCategoryDetails();   
																	Iterator itr=l.iterator();
																	while(itr.hasNext()){
																	BookCatPojo b=(BookCatPojo)itr.next();
															%>
														 			<option value="<%=b.getId()%>"><%=b.getCatName()%></option>
														 	<%} %>
                                                    	 </select>
                                               		<a href="#category" data-toggle="modal" data-target="#category" class="btn btn-info" style="margin-left: 319px;margin-top: -34px; width:30px; height:29px">+</a>
                                                </div>
                                                <div class="col-lg-4 ">
                                                    <label for="required2" class="col-form-label">Book Name *</label>
                                               	    <input type="text" id="required2" name="bookName" class="form-control" required>
                                                </div>
                                             	 <div class="col-lg-4">
                                                    <label for="required2" class="col-form-label">Author Name *</label>
                                                	 <input type="text" id="required2" name="authorName" class="form-control" required>
                                                </div>
                                           		<div class="col-lg-4 ">
                                                    <label for="required2" class="col-form-label">Publisher Name *</label>
                                               	    <input type="text" id="required2" name="pubName" class="form-control" required>
                                                </div>
                                                <div class="col-lg-4">
                                                     <label for="required2" class="col-form-label">Edition *</label>
                                                	 <input type="text"  id="required2" name="edition" class="form-control" required>
                                                </div>
                                                <div class="col-lg-4 ">
                                                    <label for="required2" class="col-form-label">Price *</label>
                                               	    <input type="text" id="required2" name="price" class="form-control" required>
                                                </div>
                                            	<div class="col-lg-4">
                                                    <label for="required2" class="col-form-label">Cupboard No *</label>
                                                	 <input type="text" id="required2" name="cupbno" class="form-control">
                                                </div>
                                                <div class="col-lg-4">
                                                     <label for="required2" class="col-form-label">Quantity *</label>
                                                	 <input type="text" id="required2" name="quan" class="form-control" required>
                                                </div>
                                             	<div class="col-lg-4 input_field_sections">
                                            		<h5>Select Language *</h5>
                                          			  <div class="form-group">
                                               			 <select class="form-control" name="language">
			                                                   	<option></option>
			                                                    <option>English</option>
			                                                    <option>Hindi</option>
			                                                    <option>Marathi</option>
			                                                    <option>Urdu</option>
                                                  		</select>
                                            		</div> 
                                        		</div>
                                           </div>
                                       <div class="form-actions form-group row">
	                                            <input type="submit" value="Add Book" name="addbook" class="btn btn-primary">
	                                             &nbsp;&nbsp;&nbsp;<input type="reset" value="Cancel" class="btn btn-primary">
	                                  </div>
                                     </form>
								 </div>
                                </div>
                            </div> <!-- /.col-lg-12 -->
                        </div> <!-- /.row -->
                    </div> <!-- /.inner -->
                </div> <!-- /.outer -->
            
            <!-- Modal for category -->
            <div class="modal fade pullDown" id="category" role="dialog" aria-labelledby="modalLabelnews">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header bg-warning">
                                <h4 class="modal-title text-white" id="modalLabelnews">Pulldown</h4>
                            </div>
                            <div class="modal-body">
                            	<form action="/SMGMT/MainServlet" id="catid" method="POST">
                            		 		<div class="form-group row">
                            		 			<div class="col-lg-4 ">
                                                    <label for="required2" class="col-form-label">Category Name *</label>
                                               	    <input type="text" id="catName" name="catName" class="form-control" required>
                                                </div>
                                            </div>
                                             <div class="modal-footer">
                               					 <input type="submit" name="savecat" value="Save">
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
                                                <th class="sorting wid-20" tabindex="0" rowspan="1" colspan="1">Publisher Name</th>
                                                <th class="sorting wid-15" tabindex="0" rowspan="1" colspan="1">Edition</th>
                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Price</th>
                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Cupboard No</th>
                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Quantity</th>
                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Language</th>
                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Action</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                       		 	<%
													AddBookDao casteDAO=new AddBookImpl();
													request.setAttribute("display_book", casteDAO.getBookDetails());
													int j=0;
												%>
													<c:forEach items="${display_book}" var="d">
													  <tr role="row" class="even">
														<td><%=(++j) %></td>
														<%-- <td><c:out value="${d.bookNo}"></c:out></td> --%>
														<td><c:out value="${d.bookName}"></c:out></td>
														<td><c:out value="${d.authorName}"></c:out></td>
														<td><c:out value="${d.publisherName}"></c:out></td>
														<td><c:out value="${d.edition}"></c:out></td>
														<td><c:out value="${d.price}"></c:out></td>
														<td><c:out value="${d.cupboardNo}"></c:out></td>
														<td><c:out value="${d.quantity}"></c:out></td>
														<td><c:out value="${d.language}"></c:out></td>
														<td>
                                            			<a class="edit" data-placement="top" title="Edit" href="#update" data-toggle="modal" onclick="loadDoc(${d.getBookNo()})"><i class="fa fa-pencil text-warning"></i></a>&nbsp; &nbsp;
                                            			<a class="delete hidden-xs hidden-sm" data-toggle="tooltip" data-placement="top" title="Delete" href="/SMGMT/MainServlet?bookNo=${d.getBookNo()}"><i class="fa fa-trash text-danger"></i></a>
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
                  <div class="modal fade pullDown" id="update" role="dialog" aria-labelledby="modalLabelnews">
                  	 <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header bg-warning">
                                <h4 class="modal-title text-white" id="modalLabelnews">Pulldown</h4>
                            </div>
                            <div class="modal-body">   
								 <form action="/SMGMT/MainServlet" method="post" class="form-horizontal  login_validator" id="form_block_validator">
                                             <div class="form-group row">
                                             
                                                <div class="col-lg-4">
                                               		 <input type="hidden" name="bno" id="bid">
                                                     <label class="col-form-label">Date *</label>
                                                     
                                                      <input type="text" class="form-control form_val_popup_dp3" value="<%=requireddate.todayDate() %>" name="date" id="date" placeholder="YYYY-MM-DD"/>
                                                 </div>
                                               
                                                <div class="col-lg-4 ">
                                                    <label for="required2" class="col-form-label">Book Name *</label>
                                               	    <input type="text" name="bookName" id="bookName" class="form-control" required>
                                                </div>
                                            	 <div class="col-lg-4">
                                                    <label for="required2" class="col-form-label">Author Name *</label>
                                                	 <input type="text" name="authorName" id="authorName" class="form-control" required>
                                                </div>
                                           		 <div class="col-lg-4 ">
                                                    <label for="required2" class="col-form-label">Publisher Name *</label>
                                               	    <input type="text" name="pubName" id="pubName" class="form-control" required>
                                                </div>
                                                <div class="col-lg-4">
                                                     <label for="required2" class="col-form-label">Edition *</label>
                                                	 <input type="text" name="edition" id="edition" class="form-control" required>
                                                </div>
                                                <div class="col-lg-4 ">
                                                    <label for="required2" class="col-form-label">Price *</label>
                                               	    <input type="text" name="price" id="price" class="form-control" required>
                                                </div>
                                            	 <div class="col-lg-4">
                                                    <label for="required2" class="col-form-label">Cupboard No *</label>
                                                	 <input type="text" name="cupbno" id="cupbNo" class="form-control">
                                                </div>
                                                <div class="col-lg-4">
                                                     <label for="required2" class="col-form-label">Quantity *</label>
                                                	 <input type="text" name="quan" id="qty" class="form-control" required>
                                                </div>
                                                <div class="col-lg-4 input_field_sections">
	                                            	<h5>Select Language *</h5>
	                                            	<div class="form-group">
		                                            	<select class="form-control"  name="language" id="lang">
		                                                   <option value="English">English</option>
		                                                    <option value="Hindi">Hindi</option>
		                                                    <option value="Marathi">Marathi</option>
		                                                    <option value="Urdu">Urdu</option>
														 </select>
                                           			</div> 
                                        		</div>
			                         		 <div class="modal-footer">
					                            <button class="btn btn-primary waves-effect" type="submit" name="updatebook" id="sub">Update Book</button> 
					                           	<button data-dismiss="modal" type="button">Close</button>  
					              	         </div>
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
    <script src="/SMGMT/config/vendors/datatables/js/jquery.dataTables.min.js+dataTables.bootstrap.min.js.pagespeed.jc.HRNT0WoBU9.js"></script>
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

<script type="text/javascript">
     
function loadDoc(id) {
	alert(id);
	  var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	     var demoData = this.responseText;
	     alert(demoData);
	     /* //alert(demoData);
	     if(demoData!=null){
	    	 document.getElementById("demo").style.display="block"; */
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
		        //alert(demoStr[4]);
		        getSetSelect('s2id_lang',str[9]);
		        break;
		    }
		}

	   }
	  };
	  xhttp.open("POST","/SMGMT/MainServlet?updateId="+id, true);
	  xhttp.send();
	}

</script>
</html>