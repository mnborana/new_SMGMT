<%@page import="com.servletStore.register.model.StockRegisterPojo"%>
<%@page import="com.servletStore.register.model.StockRegisterImpl"%>
<%@page import="com.servletStore.register.model.StockRegisterDAO"%>
<%@page import="com.servletStore.register.model.OutwardRegisterPojo"%>
<%@page import="com.servletStore.register.model.OutwardRegisterImpl"%>
<%@page import="com.servletStore.register.model.OutwardRegisterDAO"%>
<%@page import="com.servletStore.register.model.InwardRegisterPojo"%>
<%@page import="com.servletStore.register.model.InwardRegisterImpl"%>
<%@page import="com.servletStore.register.model.InwardRegisterDAO"%>
<%@page import="utility.SysDate"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.servletStore.settings.school.model.SchoolImpl"%>
<%@page import="com.servletStore.settings.school.model.SchoolDAO"%>
<%@page import="com.servletStore.settings.school.model.SchoolPOJO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
	
	
	<link type="text/css" rel="stylesheet" href="/SMGMT/config/vendors/inputlimiter/css/jquery.inputlimiter.css"/>
    <link type="text/css" rel="stylesheet" href="/SMGMT/config/vendors/chosen/css/chosen.css"/>
    <link type="text/css" rel="stylesheet" href="/SMGMT/config/vendors/bootstrap-colorpicker/css/bootstrap-colorpicker.min.css"/>
    <link type="text/css" rel="stylesheet" href="/SMGMT/config/vendors/jquery-tagsinput/css/jquery.tagsinput.css"/>
    <link type="text/css" rel="stylesheet" href="/SMGMT/config/vendors/daterangepicker/css/daterangepicker.css"/>
    <link type="text/css" rel="stylesheet" href="/SMGMT/config/vendors/datepicker/css/bootstrap-datepicker.min.css"/>
    <link type="text/css" rel="stylesheet" href="/SMGMT/config/vendors/bootstrap-timepicker/css/bootstrap-timepicker.min.css"/>
    <link type="text/css" rel="stylesheet" href="/SMGMT/config/vendors/bootstrap-switch/css/bootstrap-switch.min.css"/>
    <link type="text/css" rel="stylesheet" href="/SMGMT/config/vendors/jasny-bootstrap/css/jasny-bootstrap.min.css"/>
    <link type="text/css" rel="stylesheet" href="/SMGMT/config/vendors/multiselect/css/multi-select.css"/>
    <!-- end of global styles-->
    
    <link type="text/css" rel="stylesheet" href="/SMGMT/config/css/pages/form_elements.css"/>
    <link type="text/css" rel="stylesheet" href="#" id="skin_change"/>
    
</head>
<body onload="setFocusToTextBox()"">
<div class="preloader" style=" position: fixed;
  width: 100%;
  height: 100%;
  top: 0;/*
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
                                    Stock Register
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
                                    <li class="active breadcrumb-item">Stock Register</li>
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
                                       Stock Register
                                    </div>
                                    <div class="card-block m-t-35" style="margin-top: 47px;">
                                        <form action="/SMGMT/StockRegister" method="post" class="form-horizontal  login_validator" id="form_block_validator">
                                            <div class="form-group row">
                                                <div class="col-lg-3  text-lg-right">
                                                    <label for="required2" class="col-form-label"> Sr.No*</label>
                                                </div>
                                                <%
												int l=1;
												StockRegisterDAO stockDao=new StockRegisterImpl();
												StockRegisterPojo pojo=stockDao.getStockNo();
												int id=pojo.getId();
											//	System.out.println("id:"+id);
												int stockId=id+l;
												%>
                                                <div class="col-lg-2">
                                                    <input type="text" id="required2" name="stockId"  value="<%=stockId %>" class="form-control" required >
                                                </div>
                                                
                                                <div class="col-lg-2 text-lg-right">
                                                    <label class="col-form-label">Date*</label>
                                                </div>
                                                <%
                                                SysDate requireddate=new SysDate(); 
                                                
                                                %>
                                                <div class="col-lg-3">
                                                    <input type="text" class="form-control form_val_popup_dp3" name="requireddate" style="float: right;" value="<%=requireddate.todayDate()%>"/>
                                                </div>
                                                
                                          
                                            </div>
                                            
                                      	                                    
                                          <div class="form-group row">
                                           <div class="col-lg-3 text-lg-right">
                                               <label for="required2" class="col-form-label">Item Name*</label>
                                           </div>
                                           <%
                                           StockRegisterDAO staockDAO=new StockRegisterImpl();
                                           List<StockRegisterPojo> list=staockDAO.getItemName();
                                           Iterator<StockRegisterPojo> itr=list.iterator();
                                           %>
                                           
                                           <div class="col-lg-7">
                                               <input class="form-control" list="browsers" name="itemName" id="senderNameId" onkeyup="this.value=this.value.toUpperCase()" autocomplete="off" required />
                                                <datalist id="browsers">
                                               <%
                                               while(itr.hasNext())
                                               {
                                            	   StockRegisterPojo pojo3=(StockRegisterPojo)itr.next();
                                            	   
                                            	   String itemName=((StockRegisterPojo)pojo3).getItemName();
                                               		//System.out.println("senderName:"+itemName);
                                               %>
                                               
													<option ><%=itemName %></option>
													
											
												<%} %>
													
												</datalist>
                                          </div>                     	 
                                     	  </div><!-- <input type="button" value="+" href="#addReceiver" data-toggle="modal" style="margin-left: 848px;margin-top: -53px;background-color: blue;color: white;"/>
                                     	  -->
                                     	 <div class="form-group row">
                                                <div class="col-lg-3  text-lg-right">
                                                    <label for="required2" class="col-form-label"> Item Amount*</label>
                                                </div>
                                                
                                                <div class="col-lg-2">
                                                    <input type="text" id="myInput" oninput="myFunction()"" name="itemAmount" class="form-control" required >
                                                </div>
                                                
                                                                                               
                                                <div class="col-lg-2  text-lg-right">
                                                    <label for="required2" class="col-form-label"> Deduction Amount*</label>
                                                </div>
                                                
                                                <div class="col-lg-3">
                                                    <input type="text" id="deductionAmt" name="deductionAmount" class="form-control" required >
                                                </div>
                                                
                                          
                                            </div>
                                            
                                             <div class="form-group row">
                                                <div class="col-lg-3  text-lg-right">
                                                    <label for="required2" class="col-form-label">No.Of.Items*</label>
                                                </div>
                                                
                                                <div class="col-lg-2">
                                                    <input type="text" id="noofitemns" oninput="myFunction()" name="numberOfItems" class="form-control" required >
                                                </div>
                                                
                                                <div class="col-lg-2  text-lg-right">
                                                    <label for="required2" class="col-form-label"> Total Amount*</label>
                                                </div>
                                                
                                                <div class="col-lg-3">
                                                    <input type="text" id="totalAmount" name="totalAmount" class="form-control" required >
                                                </div>
                                                
                                          
                                            </div>
                                            
                                             <div class="form-group row">
                                                <div class="col-lg-3  text-lg-right">
                                                    <label for="required2" class="col-form-label"> Percentage*</label>
                                                </div>
                                                
                                                <div class="col-lg-2">
                                                    <input type="text" id="percentage" oninput="myFunction()" name="percentage" class="form-control" required >
                                                </div>
                                                
                                                <div class="col-lg-2  text-lg-right">
                                                    <label class="col-form-label"> Voucher No.*</label>
                                                </div>
                                                
                                                <div class="col-lg-3">
                                                    <input type="text"  value="0" name="voucherNo" placeholder="" class="form-control" >
                                                </div>                                    
                                          
                                            </div>   
                                                                        	  
                                     	  <div class="form-group row">
                                           <div class="col-lg-3 text-lg-right">
                                               <label for="required2" class="col-form-label">Description*</label>
                                           </div>
                                           <div class="col-lg-7">
                                               <textarea class="form-control" name="description" id="required2" onkeyup="this.value=this.value.toUpperCase()" required ></textarea>
                                                
                                           </div>
                                     	  </div>                                 	               	                                  
                                           
                                            <div class="modal-footer">
                                                <div class="col-lg-4 push-lg-4">
                                                     <button type="submit" name="SubmitStock" class="btn btn-success" style="margin-left: -550px;">Submit</button>
                                                    <button type="button" class="btn btn-danger" style="margin-left: 10px;">Exit</button>
                                                </div>
                                            </div>                                            
                                        </form>
                                    </div>
                                </div>
                            </div>  
                            
                        </div>                                      
       		     </div>           
           	 </div> 
           	 
           	  <div class="outer">
                    <div class="inner bg-container">
                        <div class="card">
                            <div class="card-header bg-white">
                                Stock Register Details
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
                                                <th class="sorting_asc wid-20" tabindex="0" rowspan="1" colspan="1">Sr.No</th>
                                                <th class="sorting wid-25" tabindex="0" rowspan="1" colspan="1">Date</th>
                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Item Name</th>
                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Number Of Items</th>
                                                <th class="sorting wid-20" tabindex="0" rowspan="1" colspan="1">Item Amount</th>
                                                <th class="sorting wid-15" tabindex="0" rowspan="1" colspan="1">Deduction Amount</th>
                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Percentage</th>
                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Total Amount</th>
                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Description</th>
                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Action</th>

		                                       </tr>     	
                                           </thead>
                                           <%
                                           int count=1;
                                           StockRegisterDAO stockdao=new StockRegisterImpl();
                                           List<StockRegisterPojo> list1=stockdao.showStockDetails();
                                           Iterator<StockRegisterPojo> itr1=list1.iterator();
                                           %>
                                           
                                             <tbody>
                                             <%
                                             while(itr1.hasNext())
                                             {
                                            	 StockRegisterPojo pojo2=(StockRegisterPojo)itr1.next();
                                            	 int id1=((StockRegisterPojo)pojo2).getId();
                                            	 String reqdate=((StockRegisterPojo)pojo2).getRequireddate();
                                            	 String itemName=((StockRegisterPojo)pojo2).getItemName();
                                             	 String itemAmout=((StockRegisterPojo)pojo2).getItemAmt();
                                             	 String deductionAmt=((StockRegisterPojo)pojo2).getDeductionAmt();
                                             	 int noofitems=((StockRegisterPojo)pojo2).getNoOfItems();
                                             	 String totalAmt=((StockRegisterPojo)pojo2).getTotalAmt();
                                             	 String percentage=((StockRegisterPojo)pojo2).getPercentage();
                                              	 String description=((StockRegisterPojo)pojo2).getDescription();
                                     			  System.out.println("id is:"+id1);
                                     			  System.out.println("descrition:"+description);
                                              	 
                                              	 %>
                                            
                                             <tr>
                                             <td id="<%=id1%>"><%=count %></td>
                                             <td><%=reqdate %></td>
                                             <td><%=itemName%></td>
                                             <td><%=noofitems %></td>
                                             <td><%=itemAmout %></td>
                                             <td><%=deductionAmt %></td>  
                                             <td><%=percentage %></td>                                           
                                             <td><%=totalAmt%></td>                                            
                                             <td><%=description%></td>
                                             <td>
                                        			<a class="edit" data-toggle="modal" data-placement="top" title="Update" href="#update" onclick="searchName(<%=id1%>)"><i class="fa fa-pencil text-warning"></i></a>&nbsp; &nbsp;
                                        			<a class="delete hidden-xs hidden-sm" data-toggle="tooltip" data-placement="top" title="Delete" href="/SMGMT/StockRegister?deleteStockId=<%=id1%>"><i class="fa fa-trash text-danger"></i></a>
                                        	</td>
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
           	 
        	</div>
       	</div>
       </div>
        
       <!--wrapper-->

	<!-- start modal -->

	 <div class="modal fade pullDown" id="update" role="dialog" aria-labelledby="modalLabelnews">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header bg-warning">
                                <h4 class="modal-title text-white" id="modalLabelnews" style="margin-right: 588px;">Update Stock Details</h4>
                            </div>
                            <div class="modal-body">
                                           <form action="/SMGMT/StockRegister" method="post" class="form-horizontal  login_validator" id="form_block_validator">
                                            <div class="form-group row">
                                                  
                                                  
                                                 <div class="col-lg-3 text-lg-right">
                                                    <label class="col-form-label">Date*</label>
                                                </div>
                                                
                                                <div class="col-lg-2">
                                                <input type="hidden" name="UpdateId" id="Updateid">
                                                    <input type="text" class="form-control form_val_popup_dp3" style="width: 150px;" name="updateDate" id="updateDateId" style="float: right;"/>
                                                </div>   
                                                     
                                            <div class="col-lg-3 text-lg-right">
                                               <label for="required2" class="col-form-label">Item Name*</label>
                                           </div>
                                                                                     
                                           <div class="col-lg-3">
                                           <%
                                                StockRegisterDAO stdao=new StockRegisterImpl();
                                            	List<StockRegisterPojo> lis=stdao.setItemInModel();
                                            	Iterator<StockRegisterPojo> itr2=lis.iterator();	   
                                                %>  
                                           
                                               <input class="form-control" list="itemName" name="updateItem" id="updatedItemId"  onkeyup="this.value=this.value.toUpperCase()" autocomplete="off" required />
                                                <datalist id="itemName">  
                                                <%
                                                	while(itr2.hasNext())
                                                	{
                                                		StockRegisterPojo pojo2=(StockRegisterPojo)itr2.next();
                                                		String setItemIn=((StockRegisterPojo)pojo2).getItemName();
                                                	
                                                %>                                           
                                               
													<option ><%=setItemIn %></option>				
													<%
													}
													%>
													
												</datalist>
                                          </div>
                                                                                                
                                              
                                                
                                          
                                            </div>
                                            
                                      	                                    
                                          <div class="form-group row">
                                                              	 
                                     	  </div><!-- <input type="button" value="+" href="#addReceiver" data-toggle="modal" style="margin-left: 848px;margin-top: -53px;background-color: blue;color: white;"/>
                                     	  -->
                                     	 <div class="form-group row">
                                                <div class="col-lg-3  text-lg-right">
                                                    <label for="required2" class="col-form-label"> Item Amount*</label>
                                                </div>
                                                
                                                <div class="col-lg-2">
                                                    <input type="text" id="updateItemAmount" oninput="myStcok()" style="width: 150px;" name="updateItemAmount" class="form-control" required >
                                                </div>
                                                
                                                                                               
                                                <div class="col-lg-3  text-lg-right">
                                                    <label for="required2" class="col-form-label"> Deduction Amount*</label>
                                                </div>
                                                
                                                <div class="col-lg-3">
                                                    <input type="text" id="deductAmt" name="updateDudeductionAmt" class="form-control" required >
                                                </div>
                                                
                                          
                                            </div>
                                            
                                             <div class="form-group row">
                                                <div class="col-lg-3  text-lg-right">
                                                    <label for="required2" class="col-form-label">No.Of.Items*</label>
                                                </div>
                                                
                                                <div class="col-lg-2">
                                                    <input type="text" id="updateNumberOfItems" oninput="myStcok()"  style="width: 150px;" name="updateNumberOfItems" class="form-control" required >
                                                </div>
                                                
                                                <div class="col-lg-3  text-lg-right">
                                                    <label for="required2" class="col-form-label"> Total Amount*</label>
                                                </div>
                                                
                                                <div class="col-lg-3">
                                                    <input type="text" id="totAmount" name="updateAmount" class="form-control" required >
                                                </div>
                                                
                                          
                                            </div>
                                            
                                             <div class="form-group row">
                                                <div class="col-lg-3  text-lg-right">
                                                    <label for="required2" class="col-form-label"> Percentage*</label>
                                                </div>
                                                
                                                <div class="col-lg-2">
                                                    <input type="text" id="updatePercentage" oninput="myStcok()" name="updatePercentage" style="width: 150px;" class="form-control" required >
                                                </div>
                                                
                                                <div class="col-lg-3  text-lg-right">
                                                    <label class="col-form-label"> Voucher No.*</label>
                                                </div>
                                                
                                                <div class="col-lg-3">
                                                    <input type="text"  value="0" name="updateVoucherNo" id="updateVoucher" placeholder="" class="form-control" >
                                                </div>                                    
                                          
                                            </div>   
                                                                        	  
                                     	  <div class="form-group row">
                                           <div class="col-lg-3 text-lg-right">
                                               <label for="required2" class="col-form-label">Description*</label>
                                           </div>
                                           <div class="col-lg-8">
                                               <textarea class="form-control" name="updateDescription" id="updateDescription" onkeyup="this.value=this.value.toUpperCase()" required ></textarea>
                                                
                                           </div>
                                     	  </div>                                                                           
                                       
			                            <div class="modal-footer">
			                             <button class="btn  btn-success" name="updateStockDetailsBtn">Update</button>
			                                <button class="btn  btn-warning" data-dismiss="modal">Close</button>
			                            </div>
			                             </form>
			                            </div>
			                        </div>
			                    </div>
			                </div>    
      
       
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
    
    
    
    
<!-- plugin level scripts -->
<script type="text/javascript" src="/SMGMT/config/vendors/jquery.uniform/js/jquery.uniform.js"></script>
<script type="text/javascript" src="/SMGMT/config/vendors/inputlimiter/js/jquery.inputlimiter.js"></script>
<script type="text/javascript" src="/SMGMT/config/vendors/chosen/js/chosen.jquery.js"></script>
<script type="text/javascript" src="/SMGMT/config/vendors/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js"></script>
<script type="text/javascript" src="/SMGMT/config/vendors/jquery-tagsinput/js/jquery.tagsinput.js"></script>
<script type="text/javascript" src="/SMGMT/config/js/pluginjs/jquery.validVal.min.js"></script>
<script type="text/javascript" src="/SMGMT/config/vendors/moment/js/moment.min.js"></script>
<script type="text/javascript" src="/SMGMT/config/vendors/daterangepicker/js/daterangepicker.js"></script>
<script type="text/javascript" src="/SMGMT/config/vendors/datepicker/js/bootstrap-datepicker.min.js"></script>
<script type="text/javascript" src="/SMGMT/config/vendors/bootstrap-timepicker/js/bootstrap-timepicker.min.js"></script>
<script type="text/javascript" src="/SMGMT/config/vendors/bootstrap-switch/js/bootstrap-switch.min.js"></script>
<script type="text/javascript" src="/SMGMT/config/vendors/autosize/js/jquery.autosize.min.js"></script>
<script type="text/javascript" src="/SMGMT/config/vendors/inputmask/js/inputmask.js"></script>
<script type="text/javascript" src="/SMGMT/config/vendors/inputmask/js/jquery.inputmask.js"></script>
<script type="text/javascript" src="/SMGMT/config/vendors/inputmask/js/inputmask.date.extensions.js"></script>
<script type="text/javascript" src="/SMGMT/config/vendors/inputmask/js/inputmask.extensions.js"></script>
<script type="text/javascript" src="/SMGMT/config/vendors/multiselect/js/jquery.multi-select.js"></script>

<script type="text/javascript" src="/SMGMT/config/js/form.js"></script>
<script type="text/javascript" src="/SMGMT/config/js/pages/form_elements.js"></script>


<!--plugin scripts-->
    <script type="text/javascript" src="/SMGMT/config/vendors/select2/js/select2.js.pagespeed.jm.Eugd1Y0BmV.js"></script>
    <script type="text/javascript" src="/SMGMT/config/vendors/datatables/js/jquery.dataTables.min.js.pagespeed.jm.pVBv4jsFm2.js"></script>
    <script type="text/javascript" src="/SMGMT/config/js/pluginjs/dataTables.tableTools.js.pagespeed.jm.jv43zkM1QG.js"></script>
    <script type="text/javascript" src="/SMGMT/config/vendors/datatables/js/dataTables.colReorder.min.js"></script>
    <script src="/SMGMT/config/vendors/datatables/js/dataTables.bootstrap.min.js%2bdataTables.buttons.min.js.pagespeed.jc.NLPqlFNtdC.js"></script><script>eval(mod_pagespeed_UzcyJ5ysoL);</script>
    <script>eval(mod_pagespeed_aYQJk4iDci);</script>
    <script type="text/javascript" src="/SMGMT/config/js/pluginjs/jquery.dataTables.min.js"></script>
    <script src="/SMGMT/config/vendors/datatables/js/dataTables.responsive.min.js%2bdataTables.rowReorder.min.js%2bbuttons.colVis.min.js%2bbuttons.html5.min.js%2bbuttons.bootstrap.min.js%2bbuttons.print.min.js%2bdataTables.scr"></script><script>eval(mod_pagespeed_sB4kJD0xfI);</script>
    <script>eval(mod_pagespeed_FESMSNjrvX);</script>
    <script>eval(mod_pagespeed_wVkzf2s7YZ);</script>
    <script>eval(mod_pagespeed_Ij0pRaH8BP);</script>
    <script>eval(mod_pagespeed_wfmKXYO4Nj);</script>
    <script>eval(mod_pagespeed_EYzby3B1$L);</script>
    <script>eval(mod_pagespeed_ZN6rVE$v$y);</script>
    <!-- end of plugin scripts -->
    <!--Page level scripts-->
    <script type="text/javascript" src="/SMGMT/config/js/pages/datatable.js"></script>
    <!-- end of global scripts-->

<script type="text/javascript">


function searchName(id1) {
	
	alert(id1);
	var xhttp;
	xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			
			var demoStr = this.responseText.split(",");
			alert(demoStr);
			document.getElementById("Updateid").value = demoStr[0];
			document.getElementById("updateDateId").value = demoStr[1];
			document.getElementById("updatedItemId").value = demoStr[2];
			document.getElementById("updateItemAmount").value = demoStr[3];	
			document.getElementById("deductAmt").value = demoStr[4];
			document.getElementById("updateNumberOfItems").value = demoStr[5];					
			document.getElementById("totAmount").value = demoStr[6];
			document.getElementById("updatePercentage").value = demoStr[7];
			document.getElementById("updateVoucher").value = demoStr[8];
			document.getElementById("updateDescription").value = demoStr[9];
			
			
			
			}
		};
	xhttp.open("POST","/SMGMT/StockRegister?updateStockId="+id1, true);
	xhttp.send();
	
	
} 

	function setFocusToTextBox() {
		
	
		document.getElementById("senderNameId").focus();
		myFunction();
	}

	
	function myFunction() {
	    var x = document.getElementById("myInput").value;
	    var y = document.getElementById("noofitemns").value;
	    var z = document.getElementById("percentage").value;
	    
	    var deduction=x*y*z/100;
	    document.getElementById("deductionAmt").value=deduction;
	    var total=(x*y*z)-deduction;
	    document.getElementById("totalAmount").value=total;
	}
	
	function myStcok()
	{
		    var x1 = document.getElementById("updateItemAmount").value;
		    var y1 = document.getElementById("updateNumberOfItems").value;
		    var z1 = document.getElementById("updatePercentage").value;
		    
		    var deduction1=x1*y1*z1/100;
		    document.getElementById("deductAmt").value=deduction1;
		    var total1=(x1*y1*z1)-deduction1;
		    document.getElementById("totAmount").value=total1;
	}
	


	</script>
</body>

</html>