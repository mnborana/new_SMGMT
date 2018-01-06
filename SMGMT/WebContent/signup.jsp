<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<link rel="shortcut icon" href="/SMGMT/config/img/xlogo1.ico.pagespeed.ic.ONh6qx31g4.html"/>
<!-- Global styles -->
<link type="text/css" rel="stylesheet" href="/SMGMT/config/css,_components.css+css,_custom.css+vendors,_datepicker,_css,_bootstrap-datepicker.min.css+vendors,_select2,_css,_select2.min.css+vendors,_bootstrapvalidator,_css,_bootstrapValidator"/>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="/View/common/commonCss.jsp"></jsp:include>
<title>Sign Up</title>
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
<div class="container wow fadeInDown" data-wow-duration="1s" data-wow-delay="0.5s">
    <div class="row login_top_bottom">
        <div class="col-lg-10 push-lg-1 col-sm-10 push-sm-1">
            <div class="row">
                <div class="col-lg-6 push-lg-3 col-sm-10 push-sm-1">
                    <div class="login_logo login_border_radius1">
                        <h3 class="text-center">
                            <img src="/SMGMT/config/img/logow2.png.pagespeed.ce.3qFWgMzjGO.png" alt="josh logo" class="admire_logo"><span class="text-white"> VERTICAL SOFT<br/>
                                Sign Up</span>
                        </h3>
                    </div>
                    <div class="bg-white login_content login_border_radius">
                        <form class="form-horizontal login_validator m-b-20" id="register_valid" action="#" method="post">
                            
                            <div class="form-group row">
                            	<div class="col-sm-12">
	                                <label for="user" class="col-form-label"> Select School</label>
	                                <div class="input-group">
	                                    <select class="form-control chzn-select" name="loginYear">
	                                    		<option value="">School Name</option>
	                                    </select>
	                                </div>
                                </div>
                            </div>
                           
                            <div class="form-group row">
                                <div class="col-sm-12">
                                    <label for="username" class="col-form-label">Username *</label>
                                    <div class="input-group">
                                    <span class="input-group-addon"> <i class="fa fa-user text-primary"></i>
                                    </span>
                                        <input type="text" class="form-control" name="UserName" id="username" placeholder="Username">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-12">
                                    <label for="email" class="col-form-label">Email *</label>
                                    <div class="input-group">
                                    <span class="input-group-addon">
                                        <i class="fa fa-envelope text-primary"></i>
                                    </span>
                                        <input type="text" placeholder="Email Address" name="email" id="email" class="form-control"/>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-12">
                                    <label for="password" class="col-form-label text-sm-right">Password *</label>
                                    <div class="input-group">
                                    <span class="input-group-addon">
                                        <i class="fa fa-key text-primary"></i>
                                    </span>
                                        <input type="password" placeholder="Password" id="password" name="password" class="form-control"/>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-12">
                                    <label for="confirmpassword" class="col-form-label">Confirm Password *</label>
                                    <div class="input-group">
                                    <span class="input-group-addon">
                                        <i class="fa fa-key text-primary"></i>
                                    </span>
                                        <input type="password" placeholder="Confirm Password" name="confirmpassword" id="confirmpassword" class="form-control"/>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-12">
                                    <label for="phone" class="col-form-label">Phone *</label>
                                    <div class="input-group">
                                    <span class="input-group-addon">
                                        <i class="fa fa-phone text-primary"></i>
                                    </span>
                                        <input type="text" id="phone" placeholder="Phone Number" name="phone" class="form-control"/>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="form-group row">
                                <div class="col-sm-9">
                                    <input type="submit" value="Submit" class="btn btn-primary"/>
                                    <button type="reset" class="btn btn-danger">Reset</button>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-9">
                                    <label class="col-form-label">Already have an account?</label> <a href="login.jsp" class="text-primary login_hover"><b>Log In</b></a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- global js -->
<script type="text/javascript" src="/SMGMT/config/js/jquery.min.js.pagespeed.jm.29OAZzvhfX.js"></script>
<script src="/SMGMT/config/js/tether.min.js+bootstrap.min.js.pagespeed.jc.rPlgYXit1U.js"></script><script>eval(mod_pagespeed_XQYzfDw_HR);</script>
<script>eval(mod_pagespeed_c8kNr5VoYW);</script>
<!-- end of global js-->
<!--Plugin js-->
<script type="text/javascript" src="/SMGMT/config/vendors/datepicker/js/bootstrap-datepicker.min.js.pagespeed.jm.OpmpW129i0.js"></script>
<script type="text/javascript" src="/SMGMT/config/vendors/select2/js/select2.js.pagespeed.jm.Eugd1Y0BmV.js"></script>
<script type="text/javascript" src="/SMGMT/config/vendors/bootstrapvalidator/js/bootstrapValidator.min.js.pagespeed.jm.YU3KUlvaHb.js"></script>
<script type="text/javascript" src="/SMGMT/config/vendors/wow/js/wow.min.js.pagespeed.jm.2DNptdyRWs.js"></script>
<!--End of plugin js-->
<!--Page level js-->
<script type="text/javascript">//<![CDATA[
'use strict';$(document).ready(function(){new WOW().init();$(window).on("load",function(){$('.preloader img').fadeOut();$('.preloader').fadeOut(1000);});$('#register_valid').bootstrapValidator({fields:{UserName:{validators:{notEmpty:{message:'The user name is required and cannot be empty'}}},email:{validators:{notEmpty:{message:'The email address is required'},regexp:{regexp:/^\S+@\S{1,}\.\S{1,}$/,message:'The input is not a valid email address'}}},password:{validators:{notEmpty:{message:'Please provide a password'}}},confirmpassword:{validators:{notEmpty:{message:'The confirm password is required and can\'t be empty'},identical:{field:'password',message:'Please enter the same password as above'}}},phone:{validators:{notEmpty:{message:'Please enter valid phone number'},regexp:{regexp:/^[0-9]{10}$/,message:'The phone number can only consist of numbers with 10 digits'}}},check:{validators:{notEmpty:{message:'Check on the field'}}}}});});
//]]></script>
<!-- end of page level js -->
<jsp:include page="/View/common/commonJs.jsp"></jsp:include>
</body>
</html>