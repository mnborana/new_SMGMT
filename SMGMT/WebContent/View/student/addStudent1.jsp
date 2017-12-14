<%@page import="com.servletStore.settings.standard.model.StandardPOJO"%>
<%@page import="java.util.List"%>
<%@page import="com.servletStore.settings.school.model.SchoolPOJO"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.servletStore.settings.standard.model.StandardImpl"%>
<%@page import="com.servletStore.settings.standard.model.StandardDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>Form Elements | Admire</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="/SMGMT/config/img/xlogo1.ico.pagespeed.ic.ONh6qx31g4.html"/>
    <!-- global styles-->
    <link type="text/css" rel="stylesheet" href="/SMGMT/config/css/components.css"/>
    <link type="text/css" rel="stylesheet" href="/SMGMT/config/css/custom.css"/>
    <!-- end of page level styles -->
    <!--Plugin styles-->
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
    <!--End of plugin styles-->
    <!--Page level styles-->
    <link type="text/css" rel="stylesheet" href="/SMGMT/config/css/pages/form_elements.css"/>
    <link type="text/css" rel="stylesheet" href="#" id="skin_change"/>
    <!-- end of page level styles -->
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
        <img src="" style=" width: 40px;" alt="loading...">
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
              
              <!-- Official Details -->
              
               <div class="outer">
                <div class="inner bg-container forms">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-header bg-white">
                                 <h3>   Official Details</h3>
                                </div>
                                <div class="card-block">
                                    <div class="row">
                                        
                                        <div class="card-block seclect_form">
                                    
                                        <div class="row">
                                           
                                            <div class="col-lg-4 input_field_sections">
                                                <h5>Select with search</h5>
                                                <select class="form-control chzn-select" tabindex="2">
                                                    <option disabled selected>Choose a Country</option>
                                                    <option value="Uruguay">Uruguay</option>
                                                    <option value="Uzbekistan">Uzbekistan</option>
                                                    <option value="Vanuatu">Vanuatu</option>
                                                    <option value="Venezuela">Venezuela</option>
                                                    <option value="Viet Nam">Viet Nam</option>                                                    
                                                </select>
                                                <!--</div>-->
                                            </div>
                                        
                                        
                                        <div class="col-lg-4 input_field_sections">
                                                <h5>Select with search</h5>
                                                <select class="form-control chzn-select" tabindex="2">
                                                    <option disabled selected>Choose a Country</option>
                                                    <option value="Uruguay">Uruguay</option>
                                                    <option value="Uzbekistan">Uzbekistan</option>
                                                    <option value="Vanuatu">Vanuatu</option>
                                                    <option value="Venezuela">Venezuela</option>
                                                    <option value="Viet Nam">Viet Nam</option>
                                                </select>
                                                <!--</div>-->
                                            </div>
                                            
                                        <div class="col-lg-4 input_field_sections">
                                                <h5>Select with search</h5>
                                                <select class="form-control chzn-select" tabindex="2">
                                                    <option disabled selected>Choose a Country</option>
                                                    <option value="Uruguay">Uruguay</option>
                                                    <option value="Uzbekistan">Uzbekistan</option>
                                                    <option value="Vanuatu">Vanuatu</option>
                                                    <option value="Venezuela">Venezuela</option>
                                                    <option value="Viet Nam">Viet Nam</option>                                                    
                                                </select>
                                                <!--</div>-->
                                            </div>
                                    </div>
                                    <div class="row">
                                         <div class="col-lg-4 input_field_sections">
                                                <h5>Select with search</h5>
                                                <select class="form-control chzn-select" tabindex="2">
                                                    <option disabled selected>Choose a Country</option>
                                                    <option value="Uruguay">Uruguay</option>
                                                    <option value="Uzbekistan">Uzbekistan</option>
                                                    <option value="Vanuatu">Vanuatu</option>
                                                    <option value="Venezuela">Venezuela</option>
                                                    <option value="Viet Nam">Viet Nam</option>                                                    
                                                </select>
                                                <!--</div>-->
                                            </div>
                                        <div class="col-lg-4 input_field_sections">
                                            <h5>Book Number</h5>
                                            
                                                <input name="booknumber" type="text" class="form-control"/>
                                            
                                            <!--</div>-->
                                        </div>
                                        <div class="col-lg-4 input_field_sections">
                                            <h5>General Register Number</h5>
                                            
                                                <input name="gen_reg_number" type="text" class="form-control"/>
                                            
                                            <!--</div>-->
                                        </div>
                                    </div>
                                    <div class="row">
                                         <div class="col-lg-4 input_field_sections">
                                            <h5>Admission Date</h5>
                                               <input name="admission_date" type="text" class="form-control"/>
                                            <!--</div>-->
                                        </div>
                                        
                                        <div class="col-lg-4 input_field_sections">  <br>                                          
                                            	<h5><label><input class="checkbox-hey" type="checkbox"/><span>  Class Allocated</span></label></h5>
                                         	
                                        </div>
                                        
                                        <div class="col-lg-4 input_field_sections">
                                            <h5>Previous School Name</h5>
                                                <input name="admission_date" type="text" class="form-control"/>
                                            <!--</div>-->
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-4 input_field_sections">
                                                <h5>Select with search</h5>
                                                <select class="form-control chzn-select" tabindex="2">
                                                    <option disabled selected>Choose a Country</option>
                                                    <option value="Uruguay">Uruguay</option>
                                                    <option value="Uzbekistan">Uzbekistan</option>
                                                    <option value="Vanuatu">Vanuatu</option>
                                                    <option value="Venezuela">Venezuela</option>
                                                    <option value="Viet Nam">Viet Nam</option>                                                    
                                                </select>
                                                <!--</div>-->
                                            </div>
											<div class="col-lg-4 input_field_sections">
                                                <h5>Select with search</h5>
                                                <select class="form-control chzn-select" tabindex="2">
                                                    <option disabled selected>Choose a Country</option>
                                                    <option value="Uruguay">Uruguay</option>
                                                    <option value="Uzbekistan">Uzbekistan</option>
                                                    <option value="Vanuatu">Vanuatu</option>
                                                    <option value="Venezuela">Venezuela</option>
                                                    <option value="Viet Nam">Viet Nam</option>                                                    
                                                </select>
                                                <!--</div>-->
                                            </div>
                                            <div class="col-lg-4 input_field_sections">
                                                <h5>Select with search</h5>
                                                <select class="form-control chzn-select" tabindex="2">
                                                    <option disabled selected>Choose a Country</option>
                                                    <option value="Uruguay">Uruguay</option>
                                                    <option value="Uzbekistan">Uzbekistan</option>
                                                    <option value="Vanuatu">Vanuatu</option>
                                                    <option value="Venezuela">Venezuela</option>
                                                    <option value="Viet Nam">Viet Nam</option>                                                    
                                                </select>
                                                <!--</div>-->
                                            </div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-lg-4 input_field_sections">  <br>                                          
                                            	<h5><label><input class="checkbox-hey" type="checkbox"/><span>  Semi-English</span></label></h5>
                                         	
                                        </div>
                                      </div>
                                </div>
                            </div>
                        </div>
                    </div>
				</div>
			</div>
		</div>
	</div>	
                <!-- End of Official Details -->
                
                
                <!-- Personal Details -->
                
                <div class="outer">
                <div class="inner bg-container forms">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-header bg-white">
                                 <h3> Personal Details</h3>
                                </div>
                                <div class="card-block">
                                    <div class="row">
                                        
                                        <div class="card-block seclect_form">
                                    
                                        <div class="row">
                                           
                                            <div class="col-lg-4 input_field_sections">
                                            <h5>First Name</h5>
                                                <input name="firstname" type="text" class="form-control"/>
                                            <!--</div>-->
                                        	</div>
                                        	
                                        	<div class="col-lg-4 input_field_sections">
                                            <h5>Middle Name</h5>
                                                <input name="middlename" type="text" class="form-control"/>
                                            <!--</div>-->
                                        	</div>
                                        	
                                        	<div class="col-lg-4 input_field_sections">
                                            <h5>Last Name</h5>
                                                <input name="lastname" type="text" class="form-control"/>
                                            <!--</div>-->
                                        	</div>
                                    </div>
                                    
                                    <div class="row">
                                         <div class="col-lg-4 input_field_sections">
                                            <h5>Date Of Birth</h5>
                                             <input type="text" class="form-control" placeholder="dd/mm/yyyy" data-date-format="dd/mm/yyyy" id="dp2">
                                            
                                        </div>
                                        <div class="col-lg-4 input_field_sections">
                                            <h5>Age</h5>
                                             <input name="age" type="text" class="form-control"/>
                                            
                                            <!--</div>-->
                                        </div>
                                            <div class="col-lg-4 input_field_sections">
                                            <h5>Birth Place</h5>
                                           <input name="birthplace" type="text" class="form-control"/>
                                           
                                            <!--</div>-->
                                        </div>
                                    </div>
                                    <div class="row">
                                         <div class="col-lg-4 input_field_sections">
                                            <h5>Gender</h5>
                                                 <h5>  <label>  <input class="radiobox-boom" type="radio" name="x" value="3"/><span> Male</span></label>
                                                  <label>  <input class="radiobox-wheel" type="radio" name="x"/><span> Female</span></label>     </h5>
                                            <!--</div>-->
                                        </div>
                                        
                                       <div class="col-lg-4 input_field_sections">
                                                <h5>Blood Group</h5>
                                                <select class="form-control chzn-select" tabindex="2">
                                                    <option disabled selected>Choose a blood group</option>
                                                    <option value="A+">A+</option>
                                                    <option value="O+">O+</option>
                                                    <option value="B+">B+</option>
                                                    <option value="AB+">AB+</option>
                                                    <option value="A-">A-</option>                                                    
                                                    <option value="O-">O-</option>
                                                    <option value="B-">B-</option>
                                                    <option value="AB-">AB-</option>
                                                </select>
                                                <!--</div>-->
                                            </div>
                                        
                                        <div class="col-lg-4 input_field_sections">
                                            <h5>Height</h5>
                                           <input name="height" type="text" class="form-control"/>
                               
                                            <!--</div>-->
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-4 input_field_sections">
                                            <h5>Weight</h5>
                                            <input name="weight" type="text" class="form-control"/>
                                            
                                            <!--</div>-->
                                        	</div>
                                        	
                                        	<div class="col-lg-4 input_field_sections">
                                            <h5>Aadhar Card No</h5>
                                             <input name="adharno" type="text" class="form-control"/>
                                            
                                            <!--</div>-->
                                        	</div>
                                        	
                                        	<div class="col-lg-4 input_field_sections">
                                            <h5>Nationality</h5>
                                             <input name="nationality" type="text" class="form-control"/>
                                            
                                            <!--</div>-->
                                        	</div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-lg-4 input_field_sections">
                                                <h5>Language</h5>
                                                <select class="form-control chzn-select" tabindex="2">
                                                    <option disabled selected>Choose a Language</option>
                                                    <option value="Uruguay">Marathi</option>
                                                    <option value="Uzbekistan">Hindi</option>
                                                    <option value="Vanuatu">English</option>
                                                 </select>
                                                <!--</div>-->
                                            </div>
											<div class="col-lg-4 input_field_sections">
                                                <h5>Religion</h5>
                                                <select class="form-control chzn-select" tabindex="2">
                                                    <option disabled selected>Choose a Religion</option>
                                                    <option value="Uruguay">Hindu</option>
                                                    <option value="Uzbekistan">Muslim</option>
                                                    <option value="Vanuatu">Seekh</option>
                                                    <option value="Venezuela">Isai</option>
                                                </select>
                                                <!--</div>-->
                                            </div>
                                            <div class="col-lg-4 input_field_sections">
                                                <h5>Select with search</h5>
                                                <select class="form-control chzn-select" tabindex="2">
                                                    <option disabled selected>Choose a Country</option>
                                                    <option value="Uruguay">Uruguay</option>
                                                    <option value="Uzbekistan">Uzbekistan</option>
                                                    <option value="Vanuatu">Vanuatu</option>
                                                    <option value="Venezuela">Venezuela</option>
                                                    <option value="Viet Nam">Viet Nam</option>                                                    
                                                </select>
                                                <!--</div>-->
                                            </div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-lg-4 input_field_sections">
                                                <h5>Caste</h5>
                                                <select class="form-control chzn-select" tabindex="2">
                                                    <option disabled selected>Choose a Caste</option>
                                                    <option value="Uruguay">Open</option>
                                                    <option value="Uzbekistan">OBC</option>
                                                    <option value="Vanuatu">NT-D</option>
                                                 </select>
                                                <!--</div>-->
                                            </div>
											
										<div class="col-lg-4 input_field_sections">  <br>                                          
                                            	<h5><label><input class="checkbox-hey" type="checkbox"/><span>  Minority</span></label></h5>
                                        </div>
                                        
                                        <div class="col-lg-4 input_field_sections">  <br>                                          
                                            	<h5><label><input class="checkbox-hey" type="checkbox"/><span>  Physical Handicap</span></label></h5>
                                        </div>
											
                                    </div>
                                    
                                    
                                    <div class="row">
                                        <div class="col-lg-4 input_field_sections">
                                            <h5>Physical Handicap Type</h5>
                                           
                                                <input name="handitype" type="text" class="form-control"/>
                                            
                                            <!--</div>-->
                                        	</div>
                                      </div>
                                </div>
                            </div>
                        </div>
                    </div></div></div></div></div>
                
                
                <!-- End of Personal Details -->
                
                
                <!-- Father's Details -->
              
               <div class="outer">
                <div class="inner bg-container forms">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-header bg-white">
                                 <h3>   Father's Details</h3>
                                </div>
                                <div class="card-block">
                                    <div class="row">
                                        
                                        <div class="card-block seclect_form">
                                    
                                        <div class="row">
                                           
                                            <div class="col-lg-4 input_field_sections">
                                            <h5>Name</h5>
                                           
                                                <input name="father_name" type="text" class="form-control"/>
                                           
                                            <!--</div>-->
                                        </div>
                                        
                                        <div class="col-lg-4 input_field_sections">
                                            <h5>Mobile Number</h5>
                                           
                                                <input name="father_mob_number" type="text" class="form-control"/>
                                            
                                            <!--</div>-->
                                        </div>
                                            
                                        <div class="col-lg-4 input_field_sections">
                                            <h5>Aadhar Number</h5>
                                           
                                                <input name="father_aadhar_number" type="text" class="form-control"/>
                                            
                                            <!--</div>-->
                                        </div>
                                    </div>
                                    <div class="row">
                                         <div class="col-lg-4 input_field_sections">
                                            <h5>Occupation</h5>
                                           
                                                <input name="father_occu" type="text" class="form-control"/>
                                            
                                            <!--</div>-->
                                        </div>
                                        <div class="col-lg-4 input_field_sections">
                                            <h5>Income</h5>
                                           
                                                <input name="father_income" type="text" class="form-control"/>
                                           
                                            <!--</div>-->
                                        </div>
                                            <div class="col-lg-4 input_field_sections">
                                            <h5>Email Address</h5>
                                            
                                                <input name="father_email" type="text" class="form-control"/>
                                            
                                            <!--</div>-->
                                        </div>
                                    </div>                                  
                                </div>
                            </div>
                        </div>
                    </div>
                    </div>
                    </div>
                    </div>
                    </div>
                   

                <!-- End of Father's Details -->
                
                
                <!-- Mother's Details -->
              
               <div class="outer">
                <div class="inner bg-container forms">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-header bg-white">
                                 <h3>   Mother's Details</h3>
                                </div>
                                <div class="card-block">
                                    <div class="row">
                                        
                                        <div class="card-block seclect_form">
                                    
                                        <div class="row">
                                           
                                            <div class="col-lg-4 input_field_sections">
                                            <h5>Name</h5>
                                          
                                                <input name="mother_name" type="text" class="form-control"/>
                                            
                                            <!--</div>-->
                                        </div>
                                        
                                        <div class="col-lg-4 input_field_sections">
                                            <h5>Mobile Number</h5>
                                            
                                                <input name="mother_mob_number" type="text" class="form-control"/>
                                            
                                            <!--</div>-->
                                        </div>
                                            
                                        <div class="col-lg-4 input_field_sections">
                                            <h5>Aadhar Number</h5>
                                           
                                                <input name="mother_aadhar_number" type="text" class="form-control"/>
                                            
                                            <!--</div>-->
                                        </div>
                                    </div>
                                    <div class="row">
                                         <div class="col-lg-4 input_field_sections">
                                            <h5>Occupation</h5>
                                           
                                                <input name="mother_occu" type="text" class="form-control"/>
                                            <!--</div>-->
                                        </div>
                                        <div class="col-lg-4 input_field_sections">
                                            <h5>Income</h5>
                                            
                                                <input name="mother_income" type="text" class="form-control"/>
                                            
                                            <!--</div>-->
                                        </div>
                                            <div class="col-lg-4 input_field_sections">
                                            <h5>Email Address</h5>
                                            
                                                <input name="mother_email" type="text" class="form-control"/>
                                            
                                            <!--</div>-->
                                        </div>
                                    </div>                                  
                                </div>
                            </div>
                        </div>
                    </div>
                    </div>
                    </div>
                    </div>
                    </div>

                <!-- End of Mother's Details -->
                
                <!-- Contact Details -->
              
               <div class="outer">
                <div class="inner bg-container forms">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-header bg-white">
                                 <h3>   Contact Details</h3>
                                </div>
                                <div class="card-block">
                                    <div class="row">
                                        
                                        <div class="card-block seclect_form">
                                   
                                        <div class="row">
                                           
                                            <div class="col-lg-4 input_field_sections">
                                            <h5>Pin Code</h5>
                                            
                                                <input name="pincode" type="text" class="form-control"/>
                                            
                                            <!--</div>-->
                                        </div>
                                        
                                        <div class="col-lg-4 input_field_sections">
                                            <h5>Taluka</h5>
                                            
                                                <input name="taluka" type="text" class="form-control"/>
                                            
                                            <!--</div>-->
                                        </div>
                                            
                                        <div class="col-lg-4 input_field_sections">
                                            <h5>District</h5>
                                           
                                                <input name="district" type="text" class="form-control"/>
                                            
                                            <!--</div>-->
                                        </div>
                                    </div>
                                    <div class="row">
                                         <div class="col-lg-4 input_field_sections">
                                            <h5>State</h5>
                                           
                                                <input name="state" type="text" class="form-control"/>
                                            
                                            <!--</div>-->
                                        </div>
                                        
                                        <div class="col-lg-4 input_field_sections">
                                                <h5>Address</h5>
                                                <textarea id="autosize" class="form-control" cols="50" rows="5"></textarea>
				                        </div>
                    </div>
                    </div>
                    </div>
                    </div>
                    </div></div></div></div></div>

                <!-- End of Contact Details -->
                 
                <!-- Bank Details -->
              
               <div class="outer">
                <div class="inner bg-container forms">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-header bg-white">
                                 <h3>   Bank Details</h3>
                                </div>
                                <div class="card-block">
                                    <div class="row">
                                        
                                        <div class="card-block seclect_form">
                                    
                                        <div class="row">
                                           
                                            <div class="col-lg-4 input_field_sections">
                                            <h5>Bank Name</h5>
                                           
                                                <input name="bankname" type="text" class="form-control"/>
                                            
                                            <!--</div>-->
                                        </div>
                                        
                                        <div class="col-lg-4 input_field_sections">
                                            <h5>IFSC Code</h5>
                                            
                                                <input name="ifsc" type="text" class="form-control"/>
                                            
                                            <!--</div>-->
                                        </div>
                                            
                                        <div class="col-lg-4 input_field_sections">
                                            <h5>Account No</h5>
                                            
                                                <input name="accnt_no" type="text" class="form-control"/>
                                            
                                            <!--</div>-->
                                        </div>
                                    </div>                                    
                    </div>
                    </div>
                    </div>
                    </div>
					</div></div></div></div>
                <!-- End of Bank Details -->
                 


                <!-- Transportation Details -->
              
               <div class="outer">
                <div class="inner bg-container forms">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-header bg-white">
                                 <h3>  Transportation Details</h3>
                                </div>
                                <div class="card-block">
                                    <div class="row">
                                        
                                        <div class="card-block seclect_form">
                                    
                                        <div class="row">
                                           
                                           <div class="col-lg-4 input_field_sections">
                                                <h5>Caste</h5>
                                                <select class="form-control chzn-select" tabindex="2">
                                                    <option disabled selected>Choose a Caste</option>
                                                    <option value="Uruguay">Open</option>
                                                    <option value="Uzbekistan">OBC</option>
                                                    <option value="Vanuatu">NT-D</option>
                                                 </select>
                                                <!--</div>-->
                                            </div>
                                        <div class="col-lg-4 input_field_sections">
                                            <h5>Transportation Month</h5>
                                           
                                                <input name="trans_month" type="text" class="form-control"/>
                                            
                                            <!--</div>-->
                                        </div>
                                            
                                        <div class="col-lg-4 input_field_sections">
                                            <h5>Transportation Discount</h5>
                                            
                                                <input name="trans_disc" type="text" class="form-control"/>
                                            
                                            <!--</div>-->
                                        </div>
                                       
                                    </div>
            	                  </div>
	    	    	            </div>
    	            	    </div>
                    	</div>
                    	</div>
                    	</div>
                    	</div>
                    	</div>

                <!-- End of Transportation Details -->
                
                
                
                                
 			<div class="outer">
               <div class="inner bg-container forms">
                   <div class="row">
                       <div class="col-lg-12">
                           <div class="card">
                              
                               <div class="card-block">
                                   <div class="row">
                                       
                                       <div class="card-block seclect_form">
                                       <div class="row">
                                       
                                       <div class="col-xl-4 col-lg-6 col-md-4 col-sm-6 col-6 m-t-15">
                                                  <button class="btn btn-secondary">Submit</button>
							        </div>
                                   </div>
           	                  </div>
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
                                User Grid
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
                                                <th class="sorting wid-25" tabindex="0" rowspan="1" colspan="1">Standard Name</th>
                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Actions</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            
                                            <%-- <%
	                                            StandardDAO sdao = new StandardImpl();
	                                        	List<StandardPOJO> l = sdao.getStandardDetails();
	                                       
	    										int count=1;
	                                        	Iterator itr = l.iterator();
	                                        	while(itr.hasNext()){
	                                        		StandardPOJO stdPojo = (StandardPOJO)itr.next();
	                                        		int id = stdPojo.getId();
		                                    %>
                                            	<tr role="row" class="even">
                                            		<td><%=count %></td>
                                            		<td><%=stdPojo.getStdName() %></td>
                                            		<td>
                                            			<a class="edit" data-toggle="tooltip" data-placement="top" title="Update" href="#" onclick="updateStandard(<%=id%>)"><i class="fa fa-pencil text-warning"></i></a>&nbsp; &nbsp;
                                            			<a class="delete hidden-xs hidden-sm" data-toggle="tooltip" data-placement="top" title="Delete" href="#"><i class="fa fa-trash text-danger"></i></a>
                                            		</td>
                                            	</tr>
                                            <%
		                                     	count++;
		                                    	}
		                                    %>  --%>
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
    
      </div>
    <!-- /#content -->
  
<!-- /#wrap -->
<!-- global scripts-->

<script type="text/javascript">



</script>


<script type="text/javascript" src="/SMGMT/config/js/components.js"></script>
<script type="text/javascript" src="/SMGMT/config/js/custom.js"></script>

<!-- end of global scripts-->
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
<!-- <script type="text/javascript" src="../../cdnjs.cloudflare.com/ajax/libs/jquery.quicksearch/2.3.1/jquery.quicksearch.min.js"></script> -->
<!--end of plugin scripts-->
<script type="text/javascript" src="/SMGMT/config/js/form.js"></script>
<script type="text/javascript" src="/SMGMT/config/js/pages/form_elements.js"></script>



</body>



</html>