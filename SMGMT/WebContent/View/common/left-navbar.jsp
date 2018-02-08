<%@page import="com.servletStore.setup.model.SetupPOJO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.servletStore.setup.model.SetupImpl"%>
<%@page import="com.servletStore.setup.model.SetupDAO"%>
<section>
<%
	String userName=null;
	int roll=0;
	if(session.getAttribute("userName")==null)
	{
		response.sendRedirect("/SMGMT");
	}
	else
	{
		userName=session.getAttribute("userName").toString();
		roll=(Integer)session.getAttribute("rollId");
		
		SetupDAO dao = new SetupImpl();
		List list=dao.getAccessControlDetails(roll);
		Iterator<SetupPOJO> itr= list.iterator();
		SetupPOJO pojo = new SetupPOJO();
		
		int x=0;
		while(itr.hasNext())
		{
			
			pojo=itr.next();
		}
%>
	<div id="left">
            <div class="menu_scroll">
                <div class="left_media">
                    <div class="media user-media">
                        <div class="user-media-toggleHover">
                            <span class="fa fa-user"></span>
                        </div>
                        <div class="user-wrapper">
                            <a class="user-link" href="#">
                                <img class="media-object img-thumbnail user-img rounded-circle admin_img3" alt="User Picture" src="">
                                <p class="user-info menu_hide">Welcome <%=userName%> </p>
                            </a>
                        </div>
                    </div>
                    <hr/>
                </div>
                <ul id="menu">
                
                
                    <li>
                        <a href="/SMGMT/index.jsp">
                            <i class="fa fa-home"></i>
                            <span class="link-title menu_hide">&nbsp;Dashboard</span>
                        </a>
                    </li>
                     
                    
                    
                    
                    <%if(roll==1) {%>
                    
                    <li class="dropdown_menu">
                        <a href="javascript:;">
                            <i class="fa fa-cog fa-fw"></i>
                            <span class="link-title menu_hide">&nbsp; Organization Settings</span>
                            <span class="fa arrow menu_hide"></span>
                        </a>
                        <ul>
                        	<li>
                                <a href="/SMGMT/View/trustee/setup.jsp">
                                    <i class="fa fa-angle-right"></i>
                                    &nbsp; Assign Privileges
                                </a>
                            </li>
                        
                            <li>
                                <a href="/SMGMT/View/settings/sections/section.jsp">
                                    <i class="fa fa-angle-right"></i>
                                    &nbsp; Add Section
                                </a>
                            </li>
                            
                            <li>
                                <a href="/SMGMT/View/settings/school/addSchool.jsp">
                                    <i class="fa fa-angle-right"></i>
                                    &nbsp; Update School Details
                                </a>
                            </li>
                            
                            <li>
                                <a href="/SMGMT/View/settings/standard/addStandard.jsp">
                                    <i class="fa fa-angle-right"></i>
                                    &nbsp; Add Standard
                                </a>
                            </li>
                            
                            <li>
                                <a href="/SMGMT/View/settings/standard/stdSectionAssignment.jsp">
                                    <i class="fa fa-angle-right"></i>
                                    &nbsp; Generate Classes
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown_menu">
                        <a href="#">
                            <i class="fa fa-user"></i>
                            <span class="link-title menu_hide">&nbsp; Sign Up New User</span>
                            <span class="fa arrow menu_hide"></span>
                        </a>
                        <ul>
                            <li>
                                <a href="/SMGMT/View/signup/adduser.jsp">
                                    <i class="fa fa-angle-right"></i>
                                    &nbsp; Add New User
                                </a>
                            </li>
                        </ul>
                    </li>
                    
                    <%}else if(roll==6){ %>
                    
	                     <li class="dropdown_menu">
	                        <a href="javascript:;">
	                            <i class="fa fa-book fa-fw"></i>
	                            <span class="link-title menu_hide">&nbsp; Library</span>
	                            <span class="fa arrow menu_hide"></span>
	                        </a>
	                        <ul>
	                            <li>
	                                <a href="/SMGMT/View/library/addBook.jsp">
	                                    <i class="fa fa-angle-right"></i>
	                                    &nbsp; Add Books
	                                </a>
	                            </li>
	                             <li>
	                                <a href="/SMGMT/View/library/issueBook.jsp">
	                                    <i class="fa fa-angle-right"></i>
	                                    &nbsp; Issue Book/Return Book
	                                </a>
	                            </li>
	                             <li>
	                                <a href="/SMGMT/View/library/setFine.jsp">
	                                    <i class="fa fa-angle-right"></i>
	                                    &nbsp; Set Library Fine
	                                </a>
	                            </li>
	                            
	                            <li>
	                                <a href="/SMGMT/View/library/fineSubmission.jsp">
	                                    <i class="fa fa-angle-right"></i>
	                                    &nbsp; Fine Submission
	                                </a>
	                            </li>
	                        </ul>
	                    </li>
	                    
	                    <li class="dropdown_menu">
	                        <a href="javascript:;">
	                            <i class="fa fa-book fa-fw"></i>
	                            <span class="link-title menu_hide">&nbsp; Report</span>
	                            <span class="fa arrow menu_hide"></span>
	                        </a>
	                        <ul>
	                            <li>
	                                <a href="/SMGMT/View/report/libraryReport.jsp">
	                                    <i class="fa fa-angle-right"></i>
	                                    &nbsp; Library Report
	                                </a>
	                            </li>
	                        </ul>
	                       </li>
	                                           
                    <%}if(pojo.getSetting()!=0){ %>
                    
                    <li class="dropdown_menu">
                        <a href="javascript:;">
                            <i class="fa fa-cog fa-fw"></i>
                            <span class="link-title menu_hide">&nbsp; Settings</span>
                            <span class="fa arrow menu_hide"></span>
                        </a>
                        <ul>
                            
                              <li>
                                <a href="/SMGMT/View/settings/addDocumentInfo/addDocument.jsp">
                                    <i class="fa fa-angle-right"></i>
                                    &nbsp; Add Document
                                </a>
                            </li>
                            
							 <li>
                                <a href="/SMGMT/View/settings/addBank/addBank.jsp">
                                    <i class="fa fa-angle-right"></i>
                                    &nbsp; Add Bank
                                </a>
                            </li>
                            <li>
                                <a href="/SMGMT/View/settings/classRoom/classRoom.jsp">
                                    <i class="fa fa-angle-right"></i>
                                    &nbsp; Add Class Rooms
                                </a>
                            </li>
                            
                            <li>
                                <a href="/SMGMT/View/settings/subjects/subjects.jsp">
                                    <i class="fa fa-angle-right"></i>
                                    &nbsp; Add Subjects
                                </a>
                            </li>
                            
                             <li>
                                <a href="/SMGMT/View/settings/subjects/subjectAssignment.jsp">
                                    <i class="fa fa-angle-right"></i>
                                    &nbsp; Assign Common Subject
                                </a>
                            </li>
                            
                            <li>
                                <a href="/SMGMT/View/settings/caste/addCategory&Religion.jsp">
                                    <i class="fa fa-angle-right"></i>
                                    &nbsp; Add Category &amp; Religion
                                </a>
                            </li>
                            
                             <li>
                                <a href="/SMGMT/View/settings/caste/addCaste.jsp">
                                    <i class="fa fa-angle-right"></i>
                                    &nbsp; Add Caste
                                </a>
                            </li>
                        </ul>
                    </li>
                    <%}if(pojo.getManagement()!=0){ %>
                    
                    <li class="dropdown_menu">
                        <a href="#">
                            <i class="fa fa-briefcase"></i>
                            <span class="link-title menu_hide">&nbsp; Management</span>
                            <span class="fa arrow menu_hide"></span>
                        </a>
                        <ul>
                            <li>
                                <a href="#">
                                    <i class="fa fa-angle-right"></i>
                                    &nbsp; School Info
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fa fa-angle-right"></i>
                                    <span class="link-title">&nbsp; Section </span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fa fa-angle-right"></i>
                                    &nbsp; Standard 
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fa fa-angle-right"></i>
                                    &nbsp; Category, Caste Management
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fa fa-angle-right"></i>
                                    &nbsp; Joining Info
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fa fa-angle-right"></i>
                                    &nbsp; Document Info
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fa fa-angle-right"></i>
                                    &nbsp; Description
                                </a>
                            </li>
                           
                            <li>
                                <a href="#">
                                    <i class="fa fa-angle-right"></i>
                                    &nbsp; Item Info
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fa fa-angle-right"></i>
                                    &nbsp; Student Info
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fa fa-angle-right"></i>
                                    &nbsp; Category, Caste Management
                                </a>
                            </li>
                        </ul>
                    </li>
                    <%}if(pojo.getAdmission()!=0){ %>
                    <li class="dropdown_menu">
                        <a href="#">
                            <i class="fa fa-graduation-cap"></i>
                            <span class="link-title menu_hide">&nbsp; Admission</span>
                            <span class="fa arrow menu_hide"></span>
                        </a>
                        <ul>
                            <li>
                                <a href="/SMGMT/View/student/addStudent.jsp">
                                    <i class="fa fa-angle-right"></i>
                                    &nbsp; Student Admission
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fa fa-angle-right"></i>
                                    <span class="link-title">&nbsp; Search Candidate by Name </span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fa fa-angle-right"></i>
                                    &nbsp; Identity Card
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fa fa-angle-right"></i>
                                    &nbsp; Online Saral Form
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fa fa-angle-right"></i>
                                    &nbsp; Change Contact Number
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fa fa-angle-right"></i>
                                    &nbsp; PTA Member
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fa fa-angle-right"></i>
                                    &nbsp; Report
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fa fa-angle-right"></i>
                                    &nbsp; Exam Number 
                                </a>
                            </li>
                        </ul>
                    </li>
                    <%}if(pojo.getFee()!=0){ %>
                    <li class="dropdown_menu">
                        <a href="#">
                            <i class="fa fa-inr"></i>
                            <span class="link-title menu_hide">&nbsp; Fees</span>
                            <span class="fa arrow menu_hide"></span>
                        </a>
                        <ul>
                       
                            <li>
                                <a href="/SMGMT/View/fees/installment.jsp">
                                    <i class="fa fa-angle-right"></i>
                                    &nbsp; Generate Modes
                                </a>
                            </li>
                            <li>
                                <a href="/SMGMT/View/fees/feeType.jsp">
                                    <i class="fa fa-angle-right"></i>
                                    <span class="link-title">&nbsp; Generate Fees Types</span>
                                </a>
                            </li>
                            <li>
                                <a href=" /SMGMT/View/fees/castWiseEducationalFees.jsp">
                                    <i class="fa fa-angle-right"></i>
                                    <span class="link-title">&nbsp; Assign Cast Wise Fees</span>
                                </a>
                            </li>
                            <li>
                                <a href="/SMGMT/View/fees/assignStdWiseFees.jsp">
                                    <i class="fa fa-angle-right"></i>
                                    <span class="link-title">&nbsp; Assign Standard Wise Fees</span>
                                </a>
                            </li>
                            <li>
                                <a href="/SMGMT/View/fees/studFeeAssign.jsp">
                                    <i class="fa fa-angle-right"></i>
                                    <span class="link-title">&nbsp; Assign Student Fee</span>
                                </a>
                            </li>
                            <li>
                                <a href="/SMGMT/View/fees/feesCollection.jsp">
                                    <i class="fa fa-angle-right"></i>
                                    <span class="link-title">&nbsp; Fees Collection</span>
                                </a>
                            </li>                            
                        </ul>
                    </li>
                      <%}if(pojo.getFee()!=0){ %>
                    <li class="dropdown_menu">
                        <a href="#">
                           <i class="fa fa-book"></i>
                            <span class="link-title menu_hide">&nbsp; Report</span>
                            <span class="fa arrow menu_hide"></span>
                        </a>
                        <ul>
                       
                            <li>
                                <a href=" /SMGMT/View/report/generalRegister.jsp">
                                    <i class="fa fa-angle-right"></i>
                                    <span class="link-title">&nbsp; General Register</span>
                                </a>
                            </li>
							 <li>
                                <a href=" /SMGMT/View/report/studAddressInfo.jsp">
                                    <i class="fa fa-angle-right"></i>
                                    <span class="link-title">&nbsp; Student Address Info</span>
                                </a>
                            </li>
                            <li>
                                <a href=" /SMGMT/View/report/StudentGeneralInfo.jsp">
                                    <i class="fa fa-angle-right"></i>
                                    <span class="link-title">&nbsp; Student General Info</span>
                                </a>
                            </li>
							
                                                   
                        </ul>
                    </li>
                    <%}if(pojo.getAttendance()!=0) {%>
                   
                    <li class="dropdown_menu">
                        <a href="#">
                            <i class="fa fa-tasks"></i>
                            <span class="link-title menu_hide">&nbsp; Attendance</span>
                            <span class="fa arrow menu_hide"></span>
                        </a>
                        <ul>
                            <li>
                                <a href="/SMGMT/View/attendance/generateCatlog/generateCatlog.jsp">
                                    <i class="fa fa-angle-right"></i>
                                    &nbsp; Generate Catlog
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fa fa-angle-right"></i>
                                    <span class="link-title">&nbsp; Assign Roll No Student </span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fa fa-angle-right"></i>
                                    &nbsp; Remove Student From Catlog
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fa fa-angle-right"></i>
                                    &nbsp; Student Attendance
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fa fa-angle-right"></i>
                                    &nbsp; Report
                                </a>
                            </li>
                        </ul>
                    </li>
                    <%}if(pojo.getExam()!=0){ %>
                    <li class="dropdown_menu">
                        <a href="#">
                            <i class="fa  fa-pencil-square-o"></i>
                            <span class="link-title menu_hide">&nbsp; Exam</span>
                            <span class="fa arrow menu_hide"></span>
                        </a>
                        <ul>
                            <li>
                                <a href="#">
                                    <i class="fa fa-angle-right"></i>
                                    &nbsp; Primary Exam Details
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fa fa-angle-right"></i>
                                    <span class="link-title">&nbsp; Secondary Exam Details </span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fa fa-angle-right"></i>
                                    &nbsp; Weekly Exam Test
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fa fa-angle-right"></i>
                                    &nbsp; Vocation Training Certificate
                                </a>
                            </li>
                        </ul>
                    </li>
                    <%}if(pojo.getTeacher()!=0){ %>
                    <li class="dropdown_menu">
                        <a href="#">
                            <i class="fa fa-group (alias)"></i>
                            <span class="link-title menu_hide">&nbsp; Teacher</span>
                            <span class="fa arrow menu_hide"></span>
                        </a>
                        <ul>
                            <li>
                                <a href="#">
                                    <i class="fa fa-angle-right"></i>
                                    &nbsp; Lecture
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fa fa-angle-right"></i>
                                    <span class="link-title">&nbsp; Teacher Information </span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fa fa-angle-right"></i>
                                    &nbsp; Teacher Attendance
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fa fa-angle-right"></i>
                                    &nbsp; Teacher Management
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fa fa-angle-right"></i>
                                    &nbsp; Report
                                </a>
                            </li>
                        </ul>
                    </li>
                    <%}if(pojo.getRegister()!=0){ %>
                    <li class="dropdown_menu">
                        <a href="#">
                            <i class="fa fa-calendar"></i>
                            <span class="link-title menu_hide">&nbsp; Register</span>
                            <span class="fa arrow menu_hide"></span>
                        </a>
                        <ul>
                          
                            <li>
                                <a href="/SMGMT/View/register/inwardRegister.jsp">
                                    <i class="fa fa-angle-right"></i>
                                    &nbsp; Inward Register
                                </a>
                            </li>
                            <li>
                                <a href="/SMGMT/View/register/outwardRegister.jsp">
                                    <i class="fa fa-angle-right"></i>
                                    &nbsp; Outward Register
                                </a>
                            </li>
                            <li>
                                <a href="/SMGMT/View/register/stockRegister.jsp">
                                    <i class="fa fa-angle-right"></i>
                                    &nbsp; Stock Register
                                </a>
                            </li>
                             <%}if(pojo.getRegister()!=0){ %>
                   	 <li>
                        <a href="#">
                            
                            <span class="link-title menu_hide">&nbsp; Report</span>
                            <span class="fa arrow menu_hide"></span>
                        </a>
                        <ul>
                          
                             <li>
                                <a href="/SMGMT/View/register/Report/InwardRegister.jsp">
                                    <i class="fa fa-angle-right"></i>
                                    &nbsp; Inward Register
                                </a>
                            </li>
                            <li>
                                <a href="/SMGMT/View/register/Report/OutwardRegister.jsp">
                                    <i class="fa fa-angle-right"></i>
                                    &nbsp; Outward Register
                                </a>
                            </li>
                            <li>
                                <a href="/SMGMT/View/register/Report/StockRegister.jsp">
                                    <i class="fa fa-angle-right"></i>
                                    &nbsp; Stock Register
                                </a>
                            </li>
                            
                        </ul>
                    </li>
                        </ul>
                    </li>
                    <%}if(pojo.getCashbook()!=0){ %>
                    <li class="dropdown_menu">
                        <a href="#">
                            <i class="fa fa-file-text"></i>
                            <span class="link-title menu_hide">&nbsp; Cash Book</span>
                            <span class="fa arrow menu_hide"></span>
                        </a>
                        <ul>
                            <li>
                                <a href="/SMGMT/View/cashBook/addCashBook.jsp">
                                    <i class="fa fa-angle-right"></i>
                                    &nbsp;Add Cash Book
                                </a>
                            </li>                            
                             <li>
                                <a href="/SMGMT/View/cashBook/cashBookLedger.jsp">
                                    <i class="fa fa-angle-right"></i>
                                    <span class="link-title">&nbsp; CashBook Ledger/Account </span>
                                </a>
                            </li>                             
                            <li>
                                <a href="/SMGMT/View/cashBook/AccountSubAcc.jsp">
                                    <i class="fa fa-angle-right"></i>
                                    <span class="link-title">&nbsp; Account/SubAccount </span>
                                </a>
                            </li>                             
                            <li>
                                <a href="/SMGMT/View/cashBook/cashBookOpeningBal.jsp">
                                    <i class="fa fa-angle-right"></i>
                                    <span class="link-title">&nbsp; CashBook Opening Balance </span>
                                </a>
                            </li>                       
                            <li>
                                <a href="/SMGMT/View/cashBook/cashBookEntry.jsp">
                                    <i class="fa fa-angle-right"></i>
                                    &nbsp; CashBook Entry
                                </a>
                            </li>
                            
                            <li>
                                <a href="#">
                                    <i class="fa fa-angle-right"></i>
                                    &nbsp; Report
                                </a>
                            </li>
                        </ul>
                    </li>
                    <%}if(pojo.getTransport()!=0){ %>
					<li class="dropdown_menu">
                        <a href="#">
                            <i class="fa fa-car"></i>
                            <span class="link-title menu_hide">&nbsp; Transportation</span>
                            <span class="fa arrow menu_hide"></span>
                        </a>
                        <ul>
                            <li>
                                <a href="/SMGMT/View/transportation/addVehicle.jsp">
                                    <i class="fa fa-angle-right"></i>
                                    &nbsp; Add Vehicle
                                </a>
                            </li>

                            <li>
                                <a href="/SMGMT/View/transportation/AddDriver.jsp">
                                    <i class="fa fa-angle-right"></i>
                                    &nbsp; Add Driver
                                </a>
                            </li>
                            
                            <li>
                                <a href="/SMGMT/View/transportation/AddConductor.jsp">
                                    <i class="fa fa-angle-right"></i>
                                    &nbsp; Add Conductor
                                </a>
                            </li>
                            
                            <li>
                                <a href="/SMGMT/View/transportation/AddRoute.jsp">
                                    <i class="fa fa-angle-right"></i>
                                    &nbsp; Add Route
                                </a>
                            </li>
                            
                            <li>
                                <a href="/SMGMT/View/transportation/AddDestination.jsp">
                                    <i class="fa fa-angle-right"></i>
                                    &nbsp; Add Destination
                                </a>
                            </li>
                            
                            <li>
                                <a href="/SMGMT/View/transportation/AssignRoute.jsp">
                                    <i class="fa fa-angle-right"></i>
                                    &nbsp; Assign Route
                                </a>
                            </li>
                            
                            <li>
                                <a href="/SMGMT/View/transportation/addStudentTransportationFee.jsp">
                                    <i class="fa fa-angle-right"></i>
                                    &nbsp; Add Transmission Fee
                                </a>
                            </li>
                        </ul>
                    </li>

                    <%}if(pojo.getSalary()!=0){ %>
                    <li class="dropdown_menu">
                        <a href="#">
                            <i class="fa fa-money"></i>
                            <span class="link-title menu_hide">&nbsp; Salary</span>
                            <span class="fa arrow menu_hide"></span>
                        </a>
                        <ul>
                            <li>
                                <a href="#">
                                    <i class="fa fa-angle-right"></i>
                                    &nbsp; Master Info
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fa fa-angle-right"></i>
                                    <span class="link-title">&nbsp; Monthly Deduction </span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fa fa-angle-right"></i>
                                    &nbsp; Generate Monthly Payment
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fa fa-angle-right"></i>
                                    &nbsp; Report 
                                </a>
                            </li>
                        </ul>
                    </li>
                    <%}if(pojo.getOther()!=0){ %>
                                       
                    <!-- <li>
                        <a href="/SMGMT/View/student/addStudent.jsp">
                            <i class="fa fa-mortar-board"></i>
                            <span class="link-title menu_hide">&nbsp;Student Admission</span>
                        </a>
                    </li> -->
                    
                    
                    
                    <li class="dropdown_menu">
                        <a href="#">
                            <i class="fa  fa-life-ring"></i>
                            <span class="link-title menu_hide">&nbsp; Other</span>
                            <span class="fa arrow menu_hide"></span>
                        </a>
                        <ul>
                            <li>
                                <a href="#">
                                    <i class="fa fa-angle-right"></i>
                                    &nbsp; Notice
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fa fa-angle-right"></i>
                                    &nbsp; Upload All Student Photo
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fa fa-angle-right"></i>
                                    &nbsp; Letter Head
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fa fa-angle-right"></i>
                                    &nbsp; Help
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fa fa-angle-right"></i>
                                    &nbsp; Contact Us
                                </a>
                            </li>
                        </ul>
                    </li>
                    <%}if(pojo.getEmsg()!=0){ %>
                    <li class="dropdown_menu">
                        <a href="#">
                            <i class="fa fa-envelope"></i>
                            <span class="link-title menu_hide">&nbsp; E-Message</span>
                            <span class="fa arrow menu_hide"></span>
                        </a>
                        <ul>
                            <li>
                                <a href="#">
                                    <i class="fa fa-angle-right"></i>
                                    &nbsp; SMS
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fa fa-angle-right"></i>
                                    &nbsp; Email
                                </a>
                            </li>
                        </ul>
                    </li>
					<%}if(roll==3) {%>
					<li class="dropdown_menu">
                        <a href="#">
                            <i class="fa fa-user"></i>
                            <span class="link-title menu_hide">&nbsp; Sign Up New User</span>
                            <span class="fa arrow menu_hide"></span>
                        </a>
                        <ul>
                            <li>
                                <a href="/SMGMT/View/signup/adduser.jsp">
                                    <i class="fa fa-angle-right"></i>
                                    &nbsp; Add New User
                                </a>
                            </li>
                        </ul>
                    </li>   
                    <%} %>                
                </ul>
				
                <!-- /#menu -->
            </div>
        </div>
<%}%>
</section>
