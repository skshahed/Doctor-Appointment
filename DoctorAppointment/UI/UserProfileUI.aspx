<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserProfileUI.aspx.cs" Inherits="DoctorAppointment.UI.UserProfileUI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script type="text/javascript" src="../Scripts/jquery-3.3.1.js"></script>
    <script type="text/javascript">
        //$(document).ready(function(){
            //$('input:text[value!=]').each(function ()
            //{
            //    $(this).attr('readonly', true);
            //});
       // });
        $(function () {
            $("#txtBirthDate").datepicker({
                changeMonth: true,changeYear: true
            });
        });
    </script>
    <!-- start banner Area -->
			<section class="banner-area relative about-banner" id="home">	
				<div class="overlay overlay-bg"></div>
				<div class="container">				
					<div class="row d-flex align-items-center justify-content-center">
						<div class="about-content col-lg-12">
							<h1 class="text-white">
								User Profile		
							</h1>	
							<p class="text-white link-nav"><a runat="server" href="~/">Home </a>  <span class="lnr lnr-arrow-right"></span>  <a runat="server" href="~/UI/UserProfileUI"> User Profile</a></p>
						</div>	
					</div>
				</div>
			</section>
	<!-- End banner Area -->
    <!-- Start user Profile Area -->
    <section class="appointment-area" >			
				<div class="container" >
					<div class="row justify-content-between align-items-center pb-120 appointment-wrap" >
						<div class="col-lg-6 col-md-6 appointment-right pt-60 pb-60" style="margin-left:auto;margin-right:auto;background-color:#BCEE68;">
							
								<h3 style="color:#228B22;" class="pb-20 text-center mb-30">Profile Setting</h3>
                                <div class="mt-10">
                                    <asp:Label runat="server" CssClass="text-center" ID="lblShowMsg" Font-Bold="True" Font-Size="Medium"></asp:Label>
                                </div>
                                <div class="mt-10">
                                    <h6 class="typo-list">Name :</h6>
                                </div>
                                <asp:TextBox CssClass="form-control" ClientIDMode="Static" required="" ID="txtName" runat="server" ></asp:TextBox>
                                <div class="mt-10">
                                    <h6 class="typo-list">Father's Name :</h6>
                                </div>
                                <asp:TextBox CssClass="form-control" runat="server" ClientIDMode="Static" required="" ID="txtFatherName"></asp:TextBox>
                                <div class="mt-10">
                                    <h6 class="typo-list">Mobile Number :</h6>
                                </div>
                                <asp:TextBox CssClass="form-control" ClientIDMode="Static" required="" ID="txtMobileNo" runat="server"></asp:TextBox>
                                <div class="mt-10">
                                    <h6 class="typo-list">Date of Birth :</h6>
                                </div>
                                <asp:TextBox CssClass="form-control" ClientIDMode="Static" required="" ID="txtBirthDate" runat="server"></asp:TextBox>
                                <div class="mt-10">
                                    <h6 class="typo-list">Address :</h6>
                                </div>
                                <asp:TextBox CssClass="single-textarea" ClientIDMode="Static" required="" ID="txtAddress" runat="server" Rows="3"></asp:TextBox>
                               
                                <div class="mt-10">
                                    <asp:Label runat="server" ID="lblGender" Text="Gender :" Font-Bold="True" ForeColor="Black"></asp:Label>
                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:RadioButtonList ClientIDMode="Static" ID="rdBtnGender" runat="server" RepeatDirection="Horizontal" Font-Italic="True" Font-Overline="False" Font-Strikeout="False" ForeColor="#000066" RepeatLayout="Flow">
                                        <asp:ListItem Selected="True" Text="Male" Value="1"></asp:ListItem>
                                        <asp:ListItem style="margin-left:15px;" Text="Female" Value="2"></asp:ListItem>
                                        <asp:ListItem style="margin-left:15px;" Text="Other" Value="3"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>
                                <div class="mt-10" style="text-align:right;">
                                    <asp:Button CssClass="genric-btn primary circle" ID="btnUserDetails" runat="server" Text="Details" OnClick="btnUserDetails_Click" />
                                    <asp:Button CssClass="genric-btn info e-large circle" ID="btnUserProfile" runat="server" Text="Update" OnClick="btnUserProfile_Click" />
                                </div>
							
						</div>
					</div>
				</div>	
	</section>
    <!-- End User Profile Area -->
</asp:Content>
