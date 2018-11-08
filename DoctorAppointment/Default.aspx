<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="DoctorAppointment._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <!-- start banner Area -->
			<section class="banner-area relative" id="home">
				<div class="overlay overlay-bg"></div>	
				<div class="container">
					<div class="row fullscreen d-flex align-items-center justify-content-center">
						<div class="banner-content col-lg-8 col-md-12">
							<h1>
								We Care for Your Health
								Every Moment		
							</h1>
							<p class="pt-10 pb-10 text-white">
								Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore  et dolore magna aliqua.
							</p>
							<a href="#" class="primary-btn text-uppercase">Get Started</a>
						</div>										
					</div>
				</div>					
			</section>
			<!-- End banner Area -->

			<!-- Start appointment Area -->
			<section class="appointment-area" style="background-color:#CAFF70;">			
				<div class="container" >
					<div class="row justify-content-between align-items-center pb-120 appointment-wrap">
						<div class="col-lg-5 col-md-6 appointment-left">
							<h1>
								Servicing Hours
							</h1>
							<p>
								Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore  et dolore magna aliqua.
							</p>
							<ul class="time-list">
								<li class="d-flex justify-content-between">
									<span>Monday-Friday</span>
									<span>08.00 am - 10.00 pm</span>
								</li>
								<li class="d-flex justify-content-between">
									<span>Saturday</span>
									<span>08.00 am - 10.00 pm</span>
								</li>
								<li class="d-flex justify-content-between">
									<span>Sunday</span>
									<span>08.00 am - 10.00 pm</span>
								</li>																
							</ul>
						</div>
						<div class="col-lg-6 col-md-6 appointment-right pt-60 pb-60" style="margin-left:auto;margin-right:auto;background-color:#BCEE68;">
							
								<h3 style="color:#228B22;" class="pb-20 text-center mb-30">Book an Appointment</h3>
                                <asp:TextBox CssClass="form-control" ID="TxtApointDate" runat="server" placeholder="Appointment Date" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Appointment Date'"></asp:TextBox>	
                                <div class="mt-10">    
                                    <asp:DropDownList ID="DdlDocCategory" runat="server" CssClass="form-select" AutoPostBack="True" >
                                        <asp:ListItem Value="0">Select Category</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="mt-10">
                                    <asp:DropDownList ID="DdlDocName" runat="server" CssClass="form-select">
                                        <asp:ListItem Value="0">Select Doctor</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="mt-10" style="text-align:right;">
                                    <asp:Button CssClass="genric-btn primary radius" ID="BtnCheckAvailable" runat="server" Text="Check Availability" OnClick="BtnCheckAvailable_Click" />
                                </div>
                                <div class="mt-10">
                                    <asp:Label ID="LblAvailabilityMsg" runat="server"></asp:Label>
                                </div>
                                <div class="mt-30">
                                    <asp:TextBox CssClass="form-control" ID="TxtMobileNo" runat="server" placeholder="Mobile Number " onfocus="this.placeholder = ''" onblur="this.placeholder = 'Mobile Number'"></asp:TextBox>
                                </div>
                                <%--<div class="mt-10" style="text-align:right;">
                                    <asp:Button CssClass="genric-btn info circle" ID="BtnUserCheck" runat="server" Text="Search User" />
                                </div>--%>
                                 <div class="mt-10">
                                      <asp:TextBox CssClass="form-control" ID="TxtPatientName" runat="server" placeholder="Patient Name" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Patient Name'"></asp:TextBox>
                                 </div>

                                <asp:Label ID="LblUserCheckMsg" runat="server"></asp:Label>
                                <div class="mt-10" style="text-align:center;">
                                    <asp:Button  CssClass="genric-btn info e-large circle" ID="BtnAddApoint" runat="server" Text="Confirm Appointment" />
                                </div>
								<%--<input type="text" class="form-control" name="name" placeholder="Patient Name" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Patient Name'" >
								<input type="text" class="form-control" name="phone" placeholder="Phone " onfocus="this.placeholder = ''" onblur="this.placeholder = 'Phone'" >
								<input type="email" class="form-control" name="email" placeholder="Email Address" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Email Address'" >
								<input id="datepicker1" name="dop" class="dates form-control"  placeholder="Date of Birth" type="text"> 
								<input id="datepicker2" class="dates form-control"  placeholder="appointment Date" type="text">  
								<textarea name="messege" class="" rows="5" placeholder="Messege" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Messege'"></textarea> 
								<button class="primary-btn text-uppercase">Confirm Booking</button>--%>
							
						</div>
					</div>
				</div>	
			</section>
			<!-- End appointment Area -->

    <%--<div class="jumbotron">
        <h1>ASP.NET</h1>
        <p class="lead">ASP.NET is a free web framework for building great Web sites and Web applications using HTML, CSS, and JavaScript.</p>
        <p><a href="http://www.asp.net" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Getting started</h2>
            <p>
                ASP.NET Web Forms lets you build dynamic websites using a familiar drag-and-drop, event-driven model.
            A design surface and hundreds of controls and components let you rapidly build sophisticated, powerful UI-driven sites with data access.
            </p>
            <p>
                <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301948">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Get more libraries</h2>
            <p>
                NuGet is a free Visual Studio extension that makes it easy to add, remove, and update libraries and tools in Visual Studio projects.
            </p>
            <p>
                <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301949">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Web Hosting</h2>
            <p>
                You can easily find a web hosting company that offers the right mix of features and price for your applications.
            </p>
            <p>
                <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301950">Learn more &raquo;</a>
            </p>
        </div>
    </div>--%>

</asp:Content>
