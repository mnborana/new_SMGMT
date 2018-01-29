<!doctype html>
<html class="no-js" lang="en">


<!-- Mirrored from demo.admireadmin.com/admire2/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 24 Nov 2017 11:57:57 GMT -->
<head>
    <meta charset="UTF-8">
    <title>Dashboard-2 | Admire</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="img/xlogo1.ico.pagespeed.ic.ONh6qx31g4.html"/>

    <!--global styles-->
    <jsp:include page="/View/common/commonCss.jsp"></jsp:include>
    
 <link type="text/css" rel="stylesheet" href="/SMGMT/config/css,_components.css+css,_custom.css+vendors,_chartist,_css,_chartist.min.css+vendors,_circliful,_css,_jquery.circliful.css+css,_pages,_index.css.pagespeed.cc.PvgmTaPSee.css"/>
   	<linl type="text/css" rel="stylesheet" href="/SMGMT/config/css,_components.css+css,_custom.css+vendors,_sweetalert,_css,_sweetalert2.min.css+css,_pages,_sweet_alert.css.pagespeed.cc.vBvlhaOlzl.css">
     <!-- end of global styles-->
    
    
    
    <link type="text/css" rel="stylesheet" href="#" id="skin_change"/>

</head>
 
 <%
	 String schoolId=null;
	 String academicYear=null;
	if(session.getAttribute("userName")==null)
	{
		response.sendRedirect("/SMGMT");
	}
	else
	{
		schoolId=session.getAttribute("schoolId").toString();
		academicYear=session.getAttribute("year").toString();		
	}
 
 
%>
 

<body class="body">
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
        <img src="/SMGMT/config/img/loader.gif.pagespeed.ce.pu_lpoGKrw.gif" style=" width: 50px;" alt="loading...">
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
        <!-- /.navbar -->
    </div>
    <!-- /#top -->
  
            <!-- /.outer -->

        <!-- /#content -->
        <!-- Modal -->
        <div class="modal fade" id="search_modal" tabindex="-1" role="dialog" aria-hidden="true">
            <form>
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span class="float-right" aria-hidden="true">&times;</span>
                        </button>
                        <div class="input-group search_bar_small">
                            <input type="text" class="form-control" placeholder="Search..." name="search">
                            <span class="input-group-btn">
        <button class="btn btn-secondary" type="submit"><i class="fa fa-search"></i></button>
      </span>
                        </div>
                    </div>
                </div>
            </form>
        </div>

<!--wrapper-->
    <div id="request_list">
        <div class="request_scrollable">
            <ul class="nav nav-tabs m-t-15">
                <li class="nav-item">
                    <a class="nav-link active text-center" href="#settings" data-toggle="tab">Settings</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-center" href="#favourites" data-toggle="tab">Favorites</a>
                </li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane active" id="settings">
                    <div id="settings_section">
                        <div class="layout_styles mx-3">
                            <div class="row">
                                <div class="col-12 m-t-35">
                                    <h4>Layout settings</h4>
                                </div>
                            </div>
                            <form autocomplete="off">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="float-left m-t-20">Fixed Header</div>
                                        <div class="float-right m-t-15">
                                            <div id="setting_fixed_nav">
                                                <input class="make-switch" data-on-text="ON" data-off-text="OFF" type="checkbox" data-size="small">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-12">
                                        <div class="float-left m-t-20">Fixed Menu</div>
                                        <div class="float-right m-t-15">
                                            <div id="setting_fixed_menunav">
                                                <input class="make-switch" data-on-text="ON" data-off-text="OFF" name="radioBox" type="checkbox" data-size="small">
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-12">
                                        <div class="float-left m-t-20">No Breadcrumb</div>
                                        <div class="float-right m-t-15">
                                            <div id="setting_breadcrumb">
                                                <input class="make-switch" data-on-text="ON" data-off-text="OFF" type="checkbox" data-size="small">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="mx-3">
                            <div class="row">
                                <div class="col-12 m-t-35">
                                    <h4 class="setting_title">General Settings</h4>
                                </div>
                            </div>
                            <div class="data m-t-5">
                                <div class="row">
                                    <div class="col-2"><i class="fa fa-bell-o setting_ions text-info"></i></div>
                                    <div class="col-7">
                                        <span class="chat_name">Notifications</span><br/>
                                        Get new notifications
                                    </div>
                                    <div class="col-2 checkbox float-right">
                                        <label class="text-info">
                                            <input type="checkbox" value="" checked>
                                            <span class="cr"><i class="cr-icon fa fa-check"></i></span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="data">
                                <div class="row">
                                    <div class="col-2"><i class="fa fa-envelope-o setting_ions text-danger"></i>
                                    </div>
                                    <div class="col-7">
                                        <span class="chat_name">Messages</span><br/>
                                        Get new messages
                                    </div>
                                    <div class="col-2 checkbox float-right">
                                        <label class="text-danger">
                                            <input type="checkbox" value="" checked>
                                            <span class="cr"><i class="cr-icon fa fa-check"></i></span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="data">
                                <div class="row">
                                    <div class="col-2">
                                        <i class="fa fa-exclamation-triangle setting_ions text-warning"></i>
                                    </div>
                                    <div class="col-7">
                                        <span class="chat_name">Warnings</span><br/>
                                        Get new warnings
                                    </div>
                                    <div class="col-2 checkbox float-right">
                                        <label class="text-warning">
                                            <input type="checkbox" value="" checked>
                                            <span class="cr"><i class="cr-icon fa fa-check"></i></span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="data">
                                <div class="row">
                                    <div class="col-2">
                                        <i class="fa fa-calendar texlayout_stylest-primary setting_ions"></i>
                                    </div>
                                    <div class="col-7">
                                        <span class="chat_name">Events</span><br/>
                                        Show new events
                                    </div>
                                    <div class="col-2 checkbox float-right">
                                        <label class="text-primary">
                                            <input type="checkbox" value="">
                                            <span class="cr"><i class="cr-icon fa fa-check"></i></span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane" id="favourites">
                    <div id="requests" class="mx-3">
                        <div class="m-t-35">
                            <h4 class="setting_title">Favorites</h4>
                        </div>
                        <div class="data m-t-10">
                            <div class="row">
                                <div class="col-2">
                                    <img src="img/images1.jpg.pagespeed.ce.ZjizKiH_lW.jpg" class="message-img avatar rounded-circle" alt="avatar1"></div>
                                <div class="col-8 message-data"><span class="chat_name">Philip J. Webb</span><br/>
                                    Available
                                </div>
                                <div class="col-1">
                                    <i class="fa fa-circle text-success"></i>
                                </div>
                            </div>
                        </div>
                        <div class="data">
                            <div class="row">
                                <div class="col-2">
                                    <img src="img/mailbox_imgs/x8.jpg.pagespeed.ic.bPiulp28ba.jpg" class="message-img avatar rounded-circle" alt="avatar1">
                                </div>
                                <div class="col-8 message-data">
                                    <span class="chat_name">Nancy T. Strozier</span><br/>
                                    Away
                                </div>
                                <div class="col-1">
                                    <i class="fa fa-circle text-warning"></i>
                                </div>
                            </div>
                        </div>
                        <div class="data">
                            <div class="row">
                                <div class="col-2">
                                    <img src="img/mailbox_imgs/3.jpg.pagespeed.ce.GkpJFgsHKa.jpg" class="message-img avatar rounded-circle" alt="avatar1">
                                </div>
                                <div class="col-8 message-data">
                                    <span class="chat_name">Robbinson</span><br/>
                                    Offline
                                </div>
                                <div class="col-1">
                                    <i class="fa fa-circle"></i>
                                </div>
                            </div>
                        </div>
                        <h4 class="setting_title">Contacts</h4>
                        <div class="data m-t-10">
                            <div class="row">
                                <div class="col-2">
                                    <img src="img/mailbox_imgs/x7.jpg.pagespeed.ic.G41SvoerA2.jpg" class="message-img avatar rounded-circle" alt="avatar1">
                                </div>
                                <div class="col-8 message-data">
                                    <span class="chat_name">Chester Hardesty</span><br/>
                                    Busy
                                </div>
                                <div class="col-1">
                                    <i class="fa fa-circle text-warning"></i>
                                </div>
                            </div>
                        </div>
                        <div class="data">
                            <div class="row">
                                <div class="col-2">
                                    <img src="img/mailbox_imgs/2.jpg.pagespeed.ce.ldYVRVirTH.jpg" class="message-img avatar rounded-circle" alt="avatar1"></div>
                                <div class="col-8 message-data">
                                    <span class="chat_name">Peter</span><br/>
                                    Online
                                </div>
                                <div class="col-1">
                                    <i class="fa fa-circle text-warning"></i>
                                </div>
                            </div>
                        </div>
                        <div class="data">
                            <div class="row">
                                <div class="col-2">
                                    <img src="img/mailbox_imgs/x6.jpg.pagespeed.ic.s8HpGucA66.jpg" class="message-img avatar rounded-circle" alt="avatar1">
                                </div>
                                <div class="col-8 message-data">
                                    <span class="chat_name">Devin Hartsell</span><br/>
                                    Available
                                </div>
                                <div class="col-1">
                                    <i class="fa fa-circle text-success"></i>
                                </div>
                            </div>
                        </div>
                        <div class="data">
                            <div class="row">
                                <div class="col-2">
                                    <img src="img/mailbox_imgs/x4.jpg.pagespeed.ic.Sf2RIV1O7k.jpg" class="message-img avatar rounded-circle" alt="avatar1"></div>
                                <div class="col-8 message-data">
                                    <span class="chat_name">Kimy Zorda</span><br/>
                                    Available
                                </div>
                                <div class="col-1">
                                    <i class="fa fa-circle text-success"></i>
                                </div>
                            </div>
                        </div>
                        <div class="data">
                            <div class="row">
                                <div class="col-2">
                                    <img src="img/mailbox_imgs/5.jpg.pagespeed.ce.KlL6qXiRI3.jpg" class="message-img avatar rounded-circle" alt="avatar1"></div>
                                <div class="col-8 message-data">
                                    <span class="chat_name">Jessica Bell</span><br/>
                                    Offline
                                </div>
                                <div class="col-1">
                                    <i class="fa fa-circle"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /#content -->
    <div id="right">
        <div class="right_content">
            <div class="well-small dark m-t-15">
                <div class="row m-0">
                    <div class="col-lg-12 p-d-0">
                        <div class="skinmulti_btn" onclick="javascript:loadjscssfile('blue_black_skin.html','css')">
                            <div class="skin_blue skin_size b_t_r"></div>
                            <div class="skin_blue_border skin_shaddow skin_size b_b_r"></div>
                        </div>
                        <div class="skinmulti_btn" onclick="javascript:loadjscssfile('green_black_skin.html','css')">
                            <div class="skin_green skin_size b_t_r"></div>
                            <div class="skin_green_border skin_shaddow skin_size b_b_r"></div>
                        </div>
                        <div class="skinmulti_btn" onclick="javascript:loadjscssfile('purple_black_skin.html','css')">
                            <div class="skin_purple skin_size b_t_r"></div>
                            <div class="skin_purple_border skin_shaddow skin_size b_b_r"></div>
                        </div>
                        <div class="skinmulti_btn" onclick="javascript:loadjscssfile('orange_black_skin.html','css')">
                            <div class="skin_orange skin_size b_t_r"></div>
                            <div class="skin_orange_border skin_shaddow skin_size b_b_r"></div>
                        </div>
                        <div class="skinmulti_btn" onclick="javascript:loadjscssfile('red_black_skin.html','css')">
                            <div class="skin_red skin_size b_t_r"></div>
                            <div class="skin_red_border skin_shaddow skin_size b_b_r"></div>
                        </div>
                        <div class="skinmulti_btn" onclick="javascript:loadjscssfile('mint_black_skin.html','css')">
                            <div class="skin_mint skin_size b_t_r"></div>
                            <div class="skin_mint_border skin_shaddow skin_size b_b_r"></div>
                        </div>
                        <!--</div>-->
                        <div class="skin_btn skinsingle_btn skin_blue b_r height_40 skin_shaddow" onclick="javascript:loadjscssfile('blue_skin.html','css')"></div>
                        <div class="skin_btn skinsingle_btn skin_green b_r height_40 skin_shaddow" onclick="javascript:loadjscssfile('green_skin.html','css')"></div>
                        <div class="skin_btn skinsingle_btn skin_purple b_r height_40 skin_shaddow" onclick="javascript:loadjscssfile('purple_skin.html','css')"></div>
                        <div class="skin_btn  skinsingle_btn skin_orange b_r height_40 skin_shaddow" onclick="javascript:loadjscssfile('orange_skin.html','css')"></div>
                        <div class="skin_btn skinsingle_btn skin_red b_r height_40 skin_shaddow" onclick="javascript:loadjscssfile('red_skin.html','css')"></div>
                        <div class="skin_btn skinsingle_btn skin_mint b_r height_40 skin_shaddow" onclick="javascript:loadjscssfile('mint_skin.html','css')"></div>
                    </div>
                    <div class="col-lg-12 text-center m-t-15">
                        <button class="btn btn-dark button-rounded" onclick="javascript:loadjscssfile('black_skin.html','css')">Dark
                        </button>
                        <button class="btn btn-secondary button-rounded default_skin" onclick="javascript:loadjscssfile('default_skin.html','css')">Default
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
<!-- # right side -->
</div>
<!-- /#wrap -->
<!-- global scripts-->

<%-- <jsp:include page="/View/common/commonJs.jsp"></jsp:include> --%>
<script type="text/javascript" src="/SMGMT/config/js/components.js"></script>
<script type="text/javascript" src="/SMGMT/config/js/custom.js"></script>
end of global scripts
 plugin scripts
<script src="/SMGMT/config/vendors/countUp.js%2c_js%2c_countUp.min.js%2bflip%2c_js%2c_jquery.flip.min.js.pagespeed.jc.noHZWqcdrd.js"></script><script>eval(mod_pagespeed_roqmVRzz_b);</script>
<script>eval(mod_pagespeed_5dZxOfn$md);</script>
<script type="text/javascript" src="/SMGMT/config/js/pluginjs/jquery.sparkline.js"></script>
<script src="/SMGMT/config/vendors%2c_chartist%2c_js%2c_chartist.min.js%2bjs%2c_pluginjs%2c_chartist-tooltip.js.pagespeed.jc.1avSTQ4oOH.js"></script><script>eval(mod_pagespeed_grIbxr266A);</script>
<script>eval(mod_pagespeed_cdz8xYvXLT);</script>
<script type="text/javascript" src="/SMGMT/config/vendors/swiper/js/swiper.min.js"></script>
<script type="text/javascript" src="/SMGMT/config/vendors/circliful/js/jquery.circliful.min.js"></script>
<script type="text/javascript" src="/SMGMT/config/vendors/flotchart/js/jquery.flot.js"></script>
<script type="text/javascript" src="/SMGMT/config/vendors/flotchart/js/jquery.flot.resize.js"></script>
end of plugin scripts

<script type="text/javascript" src="/SMGMT/config/js/pages/index.js"></script>




<script type="text/javascript" src="/SMGMT/config/vendors/sweetalert/js/sweetalert2.min.js"></script>
end plugin scripts
Page level scripts
<script type="text/javascript" src="/SMGMT/config/js/pages/sweet_alerts.js.pagespeed.jm.jAodyAc47W.js"></script>
<script type="text/javascript" src="/SMGMT/config/js/pages/modals.js.pagespeed.jm.IHft_nCaZ7.js"></script>
</body>


<!-- Mirrored from demo.admireadmin.com/admire2/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 24 Nov 2017 11:59:08 GMT -->
</html>
