<%@page import="com.servletStore.login.model.UserLoginImpl"%>
<%@page import="com.servletStore.login.model.UserLoginDAO"%>
<section>

 <%
 String userName=null;
 String schoolId=null;
 String academicYear=null;
 String schoolName=null;
 	if(session.getAttribute("userName")==null)
	{
		response.sendRedirect("/SMGMT");
	}
 	else
 	{
 		 userName=session.getAttribute("userName").toString();
 		 schoolId=session.getAttribute("schoolId").toString();
 		 academicYear=session.getAttribute("year").toString();
 		 UserLoginDAO dao=new UserLoginImpl();
 		 schoolName=dao.getSchoolName(schoolId);
 	}	 
%>

 
	<nav class="navbar navbar-static-top">
            <div class="container-fluid m-0">
                <div class="menu">
                    <span class="toggle-left" id="menu-toggle">
                        <i class="fa fa-bars"></i>
                    </span>
                </div>
                
                
                <a class="navbar-brand float-left" href="#">
                    <h4> &nbsp;&nbsp; <%=schoolName%> </h4>
                </a>
                <div class="topnav dropdown-menu-right float-right">
                    <div class="btn-group hidden-md-up small_device_search" data-toggle="modal" data-target="#search_modal">
                        <i class="fa fa-search text-primary"></i>
                    </div>
                    <div class="btn-group">
                        <div class="notifications no-bg">
                            <a class="btn btn-default btn-sm messages" data-toggle="dropdown" id="messages_section"> <i class="fa fa-envelope-o fa-1x"></i>
                                <span class="badge badge-pill badge-warning notifications_badge_top">8</span>
                            </a>
                            <div class="dropdown-menu drop_box_align" role="menu" id="messages_dropdown">
                                <div class="popover-title">You have 8 Messages</div>
                                <div id="messages">
                                    
                                </div>
                                <div class="popover-footer">
                                    <a href="mail_inbox.html" class="text-white">Inbox</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="btn-group">
                        <div class="notifications messages no-bg">
                            <a class="btn btn-default btn-sm" data-toggle="dropdown" id="notifications_section"> <i class="fa fa-bell-o"></i>
                                <span class="badge badge-pill badge-danger notifications_badge_top">9</span>
                            </a>
                            <div class="dropdown-menu drop_box_align" role="menu" id="notifications_dropdown">
                                <div class="popover-title">You have 9 Notifications</div>
                                <div id="notifications">
                                    
                                </div>
                                <div class="popover-footer">
                                    <a href="#" class="text-white">View All</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="btn-group">
                        <div class="notifications request_section no-bg">
                            <a class="btn btn-default btn-sm messages" id="request_btn"> <i class="fa fa-sliders" aria-hidden="true"></i>
                            </a>
                        </div>
                    </div>
                    <div class="btn-group">
                        <div class="user-settings no-bg">
                            <button type="button" class="btn btn-default no-bg micheal_btn" data-toggle="dropdown">
                                 <strong> <%=academicYear%></strong>
                                <span class="fa fa-sort-down white_bg"></span>
                            </button>
                            <div class="dropdown-menu admire_admin">
                                <a class="dropdown-item title" href="#">
                                     <%=userName %> </a>
                                <a class="dropdown-item" href="edit_user.html"><i class="fa fa-cogs"></i>
                                    Account Settings</a>
                                <a class="dropdown-item" href="#">
                                    <i class="fa fa-user"></i>
                                    User Status
                                </a>
                                <a class="dropdown-item" href="mail_inbox.html"><i class="fa fa-envelope"></i>
                                    Inbox</a>
                                <a class="dropdown-item" href="lockscreen.html"><i class="fa fa-lock"></i>
                                    Lock Screen</a>
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#just_me"><i class="fa fa-sign-out"></i>
                                    Log Out</a>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="top_search_box float-right hidden-sm-down">
                    <form class="header_input_search float-right">
                        <input type="text" placeholder="Search" name="search">
                        <button type="submit">
                            <span class="font-icon-search"></span>
                        </button>
                        <div class="overlay"></div>
                    </form>
                </div>
            </div>
            <!-- /.container-fluid -->
            
                            
        </nav>
</section>

 <div class="modal fade modal-fade-in-scale-up jest_me" tabindex="-1" id="just_me" role="dialog" aria-labelledby="modalLabeljust" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header bg-primary">
                                <h4 class="modal-title text-white" id="modalLabeljust">Logout</h4>
                            </div>
                            <form action="/SMGMT/UserLogout" method="post">
                            <div class="modal-body">
                            	<div class="alert alert-warning alert-dismissable">
                                     <strong>Warning!</strong>
                                       Are tou sure you want to logout?
                                  </div>
                            
                            </div>
                            <div class="modal-footer">
                            	<button class="btn  btn-primary" type="submit">&nbsp;&nbsp;&nbsp;Yes&nbsp;&nbsp;&nbsp;</button>
                                <button class="btn  btn-primary" type="button" data-dismiss="modal">&nbsp;&nbsp;&nbsp;No&nbsp;&nbsp;&nbsp;</button>
                            </div>
                            </form>
                        </div>
                    </div>
                </div>

