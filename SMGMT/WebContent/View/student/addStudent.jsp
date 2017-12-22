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
    
    <jsp:include page="/View/common/commonCss.jsp"></jsp:include>
    <style type="text/css">
    #academicYearId{
    	opacity: 0;
    	margin-bottom:-35px; 
    	display: block !important;"
    }
    </style>
</head>

<body onload="loadFunction()">
<%
	session.setAttribute("schoolId", "2");
	String schoolId=session.getAttribute("schoolId").toString();
%>
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
              <form action="#" class="form-horizontal  login_validator" id="form_block_validator">
               <div class="outer">
                <div class="inner bg-container forms">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="card">
                                <div class="card-header bg-white">
                                 <h3>   Official Details</h3>
                                </div>
                                <div class="card-block">
                                    <div class="row">
                                        <div class="card-block seclect_form">
	                                        <div class="row">
	                                            <div class="form-group col-lg-4 input_field_sections">
	                                                <label for="academicYearId" class="col-form-label">Select Academic Year *</label>
	                                                <select class="validate[required] form-control chzn-select" tabindex="2" name="academicYearId" id="academicYearId" required>
	                                                    <option disabled selected>Select Academic Year</option>
	                                                    <option value="2">2016-2017</option>
				                                        <option>2017-2018</option>                                                    
	                                                </select>
	                                            </div>
	                                        	<div class="form-group col-lg-4 input_field_sections">
	                                                <label for="firstName" class="col-form-label">Select Section *</label>
	                                                <select class="form-control chzn-select" tabindex="" name="sectionId" id="sectionId" onchange="standardList(this.value)" title="Select Section">
	                                                    <option disabled selected>Select Section</option>
	                                                </select>
	                                            </div>
	                                            
	                                        	<div class="form-group col-lg-4 input_field_sections">
	                                                <label for="firstName" class="col-form-label">Select Standard *</label>
	                                                <select class="form-control chzn-select" tabindex="2" name="stdId"  id="stdId" title="Select Standard">
	                                                    <option disabled selected>Select Standard</option>
	                                                             
	                                                </select>
	                                            </div>
	                                    	</div>
                                    <div class="row">
                                         <div class="form-group col-lg-4 input_field_sections">
                                                <label for="firstName" class="col-form-label">Select Division *</label>
                                                <select class="form-control chzn-select" tabindex="2" name="divId" title="Select Division">
                                                    <option disabled selected>Select Division</option>
                                               		                                                   
                                                </select>
                                                <!--</div>-->
                                            </div>
                                        <div class="form-group col-lg-4 input_field_sections">
                                            <label for="booknumber" class="col-form-label">Book Number *</label>
                                            
                                                <input type="text" id="booknumber" name="booknumber" class="form-control" placeholder="Book Number" required />
                                            
                                            <!--</div>-->
                                        </div>
                                        <div class="form-group col-lg-4 input_field_sections">
                                            <label for="gen_reg_number" class="col-form-label">General Register Number *</label>
                                            
                                                <input type="text" id="gen_reg_number" name="gen_reg_number" class="form-control" placeholder="General Register Number" required/>
                                            
                                            <!--</div>-->
                                        </div>
                                    </div>
                                    <div class="row">
                                         <div class="form-group col-lg-4 input_field_sections">
                                            <label for="admission_date" class="col-form-label">Admission Date *</label>
                                            <div class="input-group input-append date" id="dp1" data-date-format="dd-mm-yyyy">
                                                <input class="form-control" type="text" placeholder="dd-mm-yyyy">
                                                <span class="input-group-addon add-on">
                                                <i class="fa fa-calendar"></i>
                                            	</span>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group col-lg-4 input_field_sections">
                                        	<label class="col-form-label" style="margin-bottom: 7%;"></label>
                                         		<div class="checkbox">
		                                            <label>
		                                                <input type="checkbox" value="">
		                                                <span class="cr"><i class="cr-icon fa fa-check"></i></span>
		                                                Class Allocated
		                                            </label>
		                                        </div>
                                        </div>
                                        
                                        <div class="form-group col-lg-4 input_field_sections">
                                            <label for="admission_date" class="col-form-label">Previous School Name *</label>
                                                <input type="text" id="admission_date" name="admission_date" class="form-control" placeholder="Previous School Name" required/>
                                            <!--</div>-->
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-lg-4 input_field_sections">
                                                <label for="firstName" class="col-form-label">Select with search *</label>
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
											<div class="form-group col-lg-4 input_field_sections">
                                                <label for="firstName" class="col-form-label">Select with search *</label>
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
                                            <div class="form-group col-lg-4 input_field_sections">
                                                <label for="firstName" class="col-form-label">Select with search *</label>
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
                                        <div class="form-group col-lg-4 input_field_sections">
                                         	<div class="checkbox">
		                                            <label>
		                                                <input type="checkbox" value="">
		                                                <span class="cr"><i class="cr-icon fa fa-check"></i></span>
		                                                Semi-English
		                                            </label>
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
                                            <div class="form-group col-lg-4 input_field_sections">
	                                             <label for="firstName" class="col-form-label">First Name *</label>
	                                             <input type="text" id="firstName" name="firstName" class="form-control" placeholder="First Name" required> 
                                        	</div>
                                        	<div class="form-group col-lg-4 input_field_sections">
                                           		<label for="middlename" class="col-form-label">Middle Name *</label>
                                               	<input type="text" id="middlename" name="middlename" class="form-control" placeholder="Middle Name" required/>
                                        	</div>
                                        	<div class="form-group col-lg-4 input_field_sections">
                                            	<label for="lastname" class="col-form-label">Last Name *</label>
                                                <input type="text" id="lastname" name="lastname" class="form-control" placeholder="Last Name" required/>
                                        	</div>
                                    	</div>
                                    
                                    <div class="row">
                                         <div class="form-group col-lg-4 input_field_sections">
                                            <label for="dob" class="col-form-label">Date Of Birth *</label>
                                            <div class="input-group input-append date" id="dp3" data-date-format="dd-mm-yyyy">
                                                <input class="form-control" type="text" name="dob" id="dob" onchange="getAge()"  placeholder="dd-mm-yyyy">
                                                <span class="input-group-addon add-on">
                                                <i class="fa fa-calendar"></i>
                                            	</span>
                                            </div>
                                        </div>
                                        <div class="form-group col-lg-4 input_field_sections">
                                            <label for="age" class="col-form-label">Age *</label>
                                            <input type="text" id="age" name="age" class="form-control" placeholder="Age" required/>
                                        </div>
                                        <div class="form-group col-lg-4 input_field_sections">
                                           <label for="birthplace" class="col-form-label">Birth Place *</label>
                                           <input type="text" id="birthplace" name="birthplace" class="form-control" placeholder="Birth Place" required />
                                        </div>
                                    </div>
                                    <div class="row">
                                         <div class="form-group col-lg-4 input_field_sections">
                                            <label for="lastname" class="col-form-label">Gender *</label>
                                            	<div class="radio">
		                                            <label>
		                                                <input type="radio" name="gender" value="Male">
		                                                <span class="cr"><i class="cr-icon fa fa-circle"></i></span>
		                                                Male
		                                            </label>
		                                            <label>
		                                                <input type="radio" name="gender" value="Female">
		                                                <span class="cr"><i class="cr-icon fa fa-circle"></i></span>
		                                                Female
		                                            </label>
		                                        </div>
		                                        
                                        </div>
                                        
                                       <div class="form-group col-lg-4 input_field_sections">
                                                <label for="lastname" class="col-form-label">Blood Group *</label>
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
                                        
                                        <div class="form-group col-lg-4 input_field_sections">
                                            <label for="height" class="col-form-label">Height *</label>
                                           <input type="text" id="height" name="height" class="form-control" placeholder="Height" required />
                               
                                            <!--</div>-->
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-lg-4 input_field_sections">
                                            <label for="weight" class="col-form-label">Weight *</label>
                                            <input type="text" id="weight" name="weight" class="form-control" placeholder="Weight" required />
                                        </div>
                                        	
                                        	<div class="form-group col-lg-4 input_field_sections">
                                            <label for="adharno" class="col-form-label">Aadhar Card No *</label>
                                             <input type="text" id="adharno" name="adharno" class="form-control" placeholder="Aadhar Card No" required />
                                            
                                            <!--</div>-->
                                        	</div>
                                        	
                                        	<div class="form-group col-lg-4 input_field_sections">
                                            <label for="nationality" class="col-form-label">Nationality *</label>
                                             <input type="text" id="nationality" name="nationality" class="form-control" placeholder="Nationality" required/>
                                        	</div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="form-group col-lg-4 input_field_sections">
                                                <label for="lastname" class="col-form-label">Language *</label>
                                                <select class="form-control chzn-select" tabindex="2">
                                                    <option disabled selected>Choose a Language</option>
                                                    <option value="Uruguay">Marathi</option>
                                                    <option value="Uzbekistan">Hindi</option>
                                                    <option value="Vanuatu">English</option>
                                                 </select>
                                                <!--</div>-->
                                            </div>
											<div class="form-group col-lg-4 input_field_sections">
                                                <label for="lastname" class="col-form-label">Religion *</label>
                                                <select class="form-control chzn-select" tabindex="2">
                                                    <option disabled selected>Choose a Religion</option>
                                                    <option value="Uruguay">Hindu</option>
                                                    <option value="Uzbekistan">Muslim</option>
                                                    <option value="Vanuatu">Seekh</option>
                                                    <option value="Venezuela">Isai</option>
                                                </select>
                                                <!--</div>-->
                                            </div>
                                            <div class="form-group col-lg-4 input_field_sections">
                                                <label for="lastname" class="col-form-label">Select with search *</label>
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
                                        <div class="form-group col-lg-4 input_field_sections">
                                                <label for="lastname" class="col-form-label">Caste *</label>
                                                <select class="form-control chzn-select" tabindex="2">
                                                    <option disabled selected>Choose a Caste</option>
                                                    <option value="Uruguay">Open</option>
                                                    <option value="Uzbekistan">OBC</option>
                                                    <option value="Vanuatu">NT-D</option>
                                                 </select>
                                                <!--</div>-->
                                            </div>
											
										<div class="form-group col-lg-4 input_field_sections">
											<label class="col-form-label" style="margin-bottom: 7%;"></label>
                                            	<div class="checkbox">
		                                            <label>
		                                                <input type="checkbox" value="">
		                                                <span class="cr"><i class="cr-icon fa fa-check"></i></span>
		                                                Minority
		                                            </label>
		                                        </div>
                                        </div>
                                        
                                        <div class="form-group col-lg-4 input_field_sections">
                                            	<label class="col-form-label" style="margin-bottom: 7%;"></label>
                                            	<div class="checkbox">
		                                            <label>
		                                                <input type="checkbox" value="">
		                                                <span class="cr"><i class="cr-icon fa fa-check"></i></span>
		                                                Physical Handicap
		                                            </label>
		                                        </div>
                                        </div>
											
                                    </div>
                                    
                                    
                                    <div class="row">
                                        <div class="form-group col-lg-4 input_field_sections">
                                            <label for="handitype" class="col-form-label">Physical Handicap Type *</label>
                                           
                                                <input type="text" id="handitype" name="handitype" class="form-control" placeholder="Physical Handicap Type" required/>
                                            
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
                                           
                                            <div class="form-group col-lg-4 input_field_sections">
                                            <label for="father_name" class="col-form-label">Name *</label>
                                                <input type="text" id="father_name" name="father_name" class="form-control" placeholder="" required/>
                                        </div>
                                        
                                        <div class="form-group col-lg-4 input_field_sections">
                                            <label for="father_mob_number" class="col-form-label">Mobile Number *</label>
                                           
                                                <input type="text" id="father_mob_number" name="father_mob_number" class="form-control" placeholder="Mobile Number" required />
                                            
                                            <!--</div>-->
                                        </div>
                                            
                                        <div class="form-group col-lg-4 input_field_sections">
                                            <label for="father_aadhar_number" class="col-form-label">Aadhar Number *</label>
                                           
                                                <input type="text" id="father_aadhar_number" name="father_aadhar_number" class="form-control" placeholder="Aadhar Number" required />
                                            
                                            <!--</div>-->
                                        </div>
                                    </div>
                                    <div class="row">
                                         <div class="form-group col-lg-4 input_field_sections">
                                            <label for="father_occu" class="col-form-label">Occupation *</label>
                                           
                                                <input type="text" id="father_occu" name="father_occu" class="form-control" placeholder="Occupation" required />
                                            
                                            <!--</div>-->
                                        </div>
                                        <div class="form-group col-lg-4 input_field_sections">
                                            <label for="father_income" class="col-form-label">Income *</label>
                                           
                                                <input type="text" id="father_income" name="father_income" class="form-control" placeholder="Income" required />
                                           
                                            <!--</div>-->
                                        </div>
                                            <div class="form-group col-lg-4 input_field_sections">
                                            <label for="father_email" class="col-form-label">Email Address *</label>
                                            
                                                <input type="text" id="father_email" name="father_email" class="form-control" placeholder="Email Address" required />
                                            
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
                                           
                                            <div class="form-group col-lg-4 input_field_sections">
                                            <label for="mother_name" class="col-form-label">Name *</label>
                                          
                                                <input type="text" id="mother_name" name="mother_name" class="form-control" placeholder="Name" required />
                                            
                                            <!--</div>-->
                                        </div>
                                        
                                        <div class="form-group col-lg-4 input_field_sections">
                                            <label for="mother_mob_number" class="col-form-label">Mobile Number *</label>
                                            
                                                <input type="text" id="mother_mob_number" name="mother_mob_number" class="form-control" placeholder="Mobile Number" required />
                                            
                                            <!--</div>-->
                                        </div>
                                            
                                        <div class="form-group col-lg-4 input_field_sections">
                                            <label for="mother_aadhar_number" class="col-form-label">Aadhar Number *</label>
                                           
                                                <input type="text" id="mother_aadhar_number" name="mother_aadhar_number" class="form-control" placeholder="Aadhar Number" required />
                                            
                                            <!--</div>-->
                                        </div>
                                    </div>
                                    <div class="row">
                                         <div class="form-group col-lg-4 input_field_sections">
                                            <label for="mother_occu" class="col-form-label">Occupation *</label>
                                           
                                                <input type="text" id="mother_occu" name="mother_occu" class="form-control" placeholder="Occupation" required />
                                            <!--</div>-->
                                        </div>
                                        <div class="form-group col-lg-4 input_field_sections">
                                            <label for="mother_income" class="col-form-label">Income *</label>
                                            
                                                <input type="text" id="mother_income" name="mother_income" class="form-control" placeholder="Income" required />
                                            
                                            <!--</div>-->
                                        </div>
                                            <div class="form-group col-lg-4 input_field_sections">
                                            <label for="mother_email" class="col-form-label">Email Address *</label>
                                            
                                                <input type="text" id="mother_email" name="mother_email" class="form-control" placeholder="Email Address" required />
                                            
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
                                           
                                            <div class="form-group col-lg-4 input_field_sections">
                                            <label for="pinCode" class="col-form-label">Pin Code *</label>
                                            
                                                <input type="text" id="pinCode" name="pinCode" class="form-control" placeholder="Pin Code" required onblur="loadDoc()"/>
                                            
                                            <!--</div>-->
                                        </div>
                                        
                                        <div class="form-group col-lg-4 input_field_sections">
                                            <label for="taluk" class="col-form-label">Taluka *</label>
                                            
                                                <input type="text" id="taluk" name="taluk" class="form-control" placeholder="Taluka" required  tabindex="-98" />
                                            
                                            <!--</div>-->
                                        </div>
                                            
                                        <div class="form-group col-lg-4 input_field_sections">
                                            <label for="district" class="col-form-label">District *</label>
                                           
                                                <input type="text" id="district" name="district" class="form-control" placeholder="District" required  tabindex="-98" />
                                            
                                            <!--</div>-->
                                        </div>
                                    </div>
                                    <div class="row">
                                         <div class="form-group col-lg-4 input_field_sections">
                                            <label for="state" class="col-form-label">State *</label>
                                           
                                                <input type="text" id="state" name="state" class="form-control" placeholder="State" required  tabindex="-98" />
                                            
                                            <!--</div>-->
                                        </div>
                                        
                                        <div class="form-group col-lg-4 input_field_sections">
                                                <label for="lastname" class="col-form-label">Address *</label>
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
                                           
                                            <div class="form-group col-lg-4 input_field_sections">
                                            <label for="bankname" class="col-form-label">Bank Name *</label>
                                           
                                                <input type="text" id="bankname" name="bankname" class="form-control" placeholder="Bank Name" required />
                                            
                                            <!--</div>-->
                                        </div>
                                        
                                        <div class="form-group col-lg-4 input_field_sections">
                                            <label for="ifsc" class="col-form-label">IFSC Code *</label>
                                            
                                                <input type="text" id="ifsc" name="ifsc" class="form-control" placeholder="IFSC Code" required />
                                            
                                            <!--</div>-->
                                        </div>
                                            
                                        <div class="form-group col-lg-4 input_field_sections">
                                            <label for="accnt_no" class="col-form-label">Account No *</label>
                                            
                                                <input type="text" id="accnt_no" name="accnt_no" class="form-control" placeholder="Account No" required/>
                                            
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
                                           
                                           <div class="form-group col-lg-4 input_field_sections">
                                                <label for="lastname" class="col-form-label">Caste *</label>
                                                <select class="form-control chzn-select" tabindex="2">
                                                    <option disabled selected>Choose a Caste</option>
                                                    <option value="Uruguay">Open</option>
                                                    <option value="Uzbekistan">OBC</option>
                                                    <option value="Vanuatu">NT-D</option>
                                                 </select>
                                                <!--</div>-->
                                            </div>
                                        <div class="form-group col-lg-4 input_field_sections">
                                            <label for="trans_month" class="col-form-label">Transportation Month *</label>
                                           
                                                <input type="text" id="trans_month" name="trans_month" class="form-control" placeholder="Transportation Month" required/>
                                            
                                            <!--</div>-->
                                        </div>
                                            
                                        <div class="form-group col-lg-4 input_field_sections">
                                            <label for="trans_disc" class="col-form-label">Transportation Discount *</label>
                                            
                                                <input type="text" id="trans_disc" name="trans_disc" class="form-control" placeholder="Transportation Discount" required/>
                                            
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
        </form>
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


<jsp:include page="/View/common/commonJs.jsp"></jsp:include>


<script type="text/javascript">
//====================================== loadFunction  =====================================
function loadFunction(){
	sectionList();
}
//======================================End loadFunctionr  =====================================
//====================================== Section List  =====================================
	function sectionList(){
		var schoolId=<%=schoolId %>
		if(schoolId==""){
			return;
		}
		var xhttp =new XMLHttpRequest();
		try{
			xhttp.onreadystatechange = function(){
				if(this.readyState == 4 && this.status == 200){
					var getData=this.responseText.split("~");
					var row="";
					var i=0;
					for(;getData[i];){
						
						row += "<option value="+getData[i]+">";
						i++;
						row += getData[i] + "</option>";
						i++;
	
					}					
					document.getElementById("sectionId").innerHTML+=row;
					$("#sectionId").trigger('chosen:updated');
				}
			}
			xhttp.open("GET", "/SMGMT/Student?sectionList="+schoolId, true);
			xhttp.send();
		}catch(e){
			alert("Unable to Connect Server!");
		}
	}
//======================================End Section List  =====================================
//====================================== Section List  =====================================
	function standardList(std){
		
		if(std==""){
			return;
		}
		document.getElementById("stdId").innerHTML=""
		var xhttp =new XMLHttpRequest();
		try{
			xhttp.onreadystatechange = function(){
				if(this.readyState == 4 && this.status == 200){
					var getData=this.responseText.split("~");
					var row="";
					var i=0;
					for(;getData[i];){
						row += "<option value="+getData[i]+">";
						i++;
						row += getData[i] ;
						i++;
						row += " ("+ getData[i] +" - ";
						i++;
						row += getData[i]+ ")</option>";
						i++;
	
					}					
					document.getElementById("stdId").innerHTML+=row;
					$("#stdId").trigger('chosen:updated');
				}
			}
			xhttp.open("GET", "/SMGMT/Student?standardList="+std, true);
			xhttp.send();
		}catch(e){
			alert("Unable to Connect Server!");
		}
	}
//======================================End Section List  =====================================


//====================================== AGE Calculator  =====================================
	function getAge() {
		var inputDate = document.getElementById("dob").value;
		var newDate=inputDate.split("-");
		

	    var byr = newDate[2];
	    var bmo = newDate[1];
	    bmo=bmo-1;
	    var bday = newDate[0];
	    
	    var byr;
	    var age;
	    var now = new Date();
	    tday=now.getDate();
	    tmo=(now.getMonth());
	    tyr=(now.getFullYear());
	    
	    if((tmo > bmo)||(tmo==bmo & tday>=bday)){
	    	age=byr;
	    }
	    else{
	    	age=parseInt(byr)+parseInt(1);
	    }
	    document.getElementById("age").value=(tyr-age);
	    
}
//======================================End  AGE Calculator  =====================================


//====================================== PINCODE SEARCH =====================================
	function loadDoc() {
		var pinNew="";
		$.getJSON("/SMGMT/config/json/PincodeJson.json", function(json) {
			pinNew=json;
			myFunction(pinNew);
		});
	}
	
	function myFunction(x) {
		var pinNo=document.getElementById("pinCode").value;
		document.getElementById("taluk").value="";
	    document.getElementById("district").value="";
	    document.getElementById("state").value="";
	  var i;
	  for (i = 0; i <x.length; i++) {
		var pin=x[i].pincode;
	    if(pin == pinNo){
	      //document.getElementById("pinNo").value=x[i].pincode;
	      document.getElementById("taluk").value=x[i].taluk;
	      document.getElementById("district").value=x[i].districtname;
	      document.getElementById("state").value=x[i].statename;
		  break;
	     }
	  }
	}
//====================================== END PINCODE SEARCH =====================================
</script>


</body>
</html>