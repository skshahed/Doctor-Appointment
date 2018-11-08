<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AppointmentListUI.aspx.cs" Inherits="DoctorAppointment.UI.AppointmentListUI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link type="text/css" rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        
    <script type="text/javascript" src="../Scripts/jquery-3.3.1.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#txtApointDate").datepicker({
                changeMonth: true,
                changeYear: true
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
								Appointment List			
							</h1>	
							<p class="text-white link-nav"><a runat="server" href="~/">Home </a>  <span class="lnr lnr-arrow-right"></span>  <a runat="server" href="~/UI/AppointmentListUI"> Appointment List</a></p>
						</div>	
					</div>
				</div>
			</section>
	<!-- End banner Area -->


    <!-- Start appointment List Area -->
			<section class="sample-text-area" style="background-color:#CAFF70;">
                		
				<div class="container" >
					<div class="row d-flex justify-content-center">

						<div class="form-group col-md-11 row justify-content-end" style="width: 100%;">
							<div class="col-lg-4 col-md-6">
								<asp:TextBox CssClass="form-control" ClientIDMode="Static" required="" ID="txtApointDate" runat="server" placeholder="Appointment Date" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Appointment Date'"></asp:TextBox>
							</div> 
										
							<div class="col-lg-4 col-md-6">
								<asp:Button runat="server" CssClass="nw-btn primary-btn circle" ID="btnSearchAppointment" Text="SEARCH" OnClick="btnSearchAppointment_Click" ></asp:Button>
							</div> 
						</div>		
										
						<asp:Label runat="server" ID="lblEmptyMsg" Font-Bold="True"  Font-Size="X-Large" ForeColor="#CC0000"></asp:Label>
		                <%--<div class="menu-content pb-70 col-lg-7">--%>
		                    <div class="title text-center">
		                       <%-- <h1 class="mb-10">List Of Appointments</h1>--%>

                                    <asp:GridView ID="GVAppointmentList" runat="server" AutoGenerateColumns="False" BackColor="#CCFF99" BorderColor="#000099" Width="600px" OnSelectedIndexChanged="GVAppointmentList_SelectedIndexChanged" OnRowCommand="GVAppointmentList_RowCommand">
                                    <Columns>
                                        <asp:TemplateField Visible="false" HeaderText="Appointment ID">
                                           <ItemTemplate>
                                                <asp:Label ID="lblAppointId" runat="server" Text='<%#Bind("appointment_id")%>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField Visible="false" HeaderText="User ID">
                                           <ItemTemplate>
                                                <asp:Label ID="lblUserId" runat="server" Text='<%#Bind("patient_user_id")%>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Serial No">
                                           <ItemTemplate>
                                                <asp:Label ID="lblSerialNo" runat="server" Text='<%#Bind("serial_no")%>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Patient Name">
                                            <ItemTemplate>
                                                <asp:Label ID="lblName" runat="server" Text='<%#Bind("name")%>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Mobile No">
                                            <ItemTemplate>
                                                <asp:Label ID="lblMobileNo" runat="server" Text='<%#Bind("cell_phone")%>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:CommandField HeaderText="Action" SelectText="View" ShowSelectButton="True" />
                                        
                                        
                                        
                                        <asp:ButtonField CommandName="btnPrescribe" HeaderText="Action" ShowHeader="True" Text="Prescribe" />
                                        
                                        
                                        
                                    </Columns>
                                    </asp:GridView>
                                
		                   <%-- </div>--%>
		                </div>
		            </div>
				</div>	
			</section>
			<!-- End appointment List Area -->
   
</asp:Content>
