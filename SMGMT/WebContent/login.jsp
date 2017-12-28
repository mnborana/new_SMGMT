<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<link rel="shortcut icon" href="img/xlogo1.ico.pagespeed.ic.ONh6qx31g4.html"/>
<!--Global styles -->
<link type="text/css" rel="stylesheet" href="/SMGMT/config/css,_components.css+css,_custom.css+vendors,_bootstrapvalidator,_css,_bootstrapValidator.min.css+vendors,_wow,_css,_animate.css+css,_pages,_login1.css.pagespeed.cc.JIc_Vob0Bc.1f8.dela"/>
<!-- <link type="text/css" rel="stylesheet" href="/SMGMT/config/css/components.css"/>
<link type="text/css" rel="stylesheet" href="/SMGMT/config/vendors/chosen/css/chosen.css"/>
 --><!-- <link type="text/css" rel="stylesheet"
	href="/SMGMT/config/css,_components.css+css,_custom.css+vendors,_bootstrapvalidator,_css,_bootstrapValidator.min.css+css,_pages,_wizards.css.pagespeed.cc.42ti_Q82Gz.css" />
 -->
 <jsp:include page="/View/common/commonCss.jsp"></jsp:include>
<title>Login</title>

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
<div class="container wow fadeInDown" data-wow-delay="0.5s" data-wow-duration="2s">
    <div class="row">
        <div class="col-lg-8 push-lg-2 col-md-10 push-md-1 col-sm-10 push-sm-1 login_top_bottom">
            <div class="row">
                <div class="col-lg-8 push-lg-2 col-md-10 push-md-1 col-sm-12">
                    <div class="login_logo login_border_radius1">
                        <h3 class="text-center">
                            <img src="/SMGMT/config/img/logow2.png.pagespeed.ce.3qFWgMzjGO.png" alt="josh logo" class="admire_logo"><span class="text-white"> VERTICAL SOFT &nbsp;<br/>
                                Log In</span>
                        </h3>
                    </div>
                    <div class="bg-white login_content login_border_radius">
                        <form action="/SMGMT/UserLogin" id="" method="post" class="login_validator">
                            
                            <div class="form-group">
                                <label for="user" class="col-form-label"> Select Year</label>
                                <div class="input-group">
                                    <select class="form-control chzn-select" name="loginYear">
                                    	<option value="2014">2013-14</option>
                                    	<option value="2015">2014-15</option>
                                    	<option value="2016">2015-16</option>
                                    	<option value="2017">2016-17</option>
                                    </select>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label for="user" class="col-form-label"> User Name</label>
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-user text-primary"></i></span>
                                    <input type="text" class="form-control  form-control-md" id="user" name="username" placeholder="User Name">
                                </div>
                            </div>
                            <!--</h3>-->
                            <div class="form-group">
                                <label for="password" class="col-form-label">Password</label>
                                <div class="input-group">
                                    <span class="input-group-addon addon_password"><i class="fa fa-lock text-primary"></i></span>
                                    <input type="password" class="form-control form-control-md" id="password" name="password" placeholder="Password">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <input type="submit" value="Log In" class="btn btn-primary btn-block login_button">
                                    </div>
                                </div>
                            </div>
                        </form>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-6">
                                    <label class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input form-control">
                                        <span class="custom-control-indicator"></span>
                                        <a class="custom-control-description">Keep me logged in</a>
                                    </label>
                                </div>
                                <div class="col-6 text-right forgot_pwd">
                                    <a href="#" class="custom-control-description forgottxt_clr">Forgot password?</a>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-lg-6 col-sm-6 m-t-10">
                                    <div class="icon-white btn-facebook icon_padding loginpage_border">
                                        <i class="fa fa-facebook" aria-hidden="true"></i>
                                        <span class="text-white icon_padding text-center question_mark">Log In With Facebook</span>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-sm-6 pull-lg-right m-t-10">
                                    <div class="icon-white btn-google icon_padding loginpage_border">
                                        <i class="fa fa-google-plus" aria-hidden="true"></i>
                                        <span class="text-white icon_padding question_mark">Log In With Google+</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-form-label">Don't you have an Account? </label>
                            <a href='signup.jsp' class="text-primary"><b>Sign Up</b></a>
                        </div>
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
<script type="text/javascript" src="/SMGMT/config/vendors/bootstrapvalidator/js/bootstrapValidator.min.js.pagespeed.jm.YU3KUlvaHb.js"></script>
<script type="text/javascript" src="/SMGMT/config/vendors/wow/js/wow.min.js.pagespeed.jm.2DNptdyRWs.js"></script>
<!--End of plugin js-->
<script type="text/javascript" src="/SMGMT/config/js/pages/login1.js"></script>
<!-- <script type="text/javascript" src="/SMGMT/config/js/components.js"></script>
<script type="text/javascript" src="/SMGMT/config/vendors/chosen/js/chosen.jquery.js"></script> -->
<jsp:include page="/View/common/commonJs.jsp"></jsp:include>
</body>
</html>