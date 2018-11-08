<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PatientListUI.aspx.cs" Inherits="DoctorAppointment.UI.PatientListUI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!-- start banner Area -->
			<section class="banner-area relative about-banner" id="home">	
				<div class="overlay overlay-bg"></div>
				<div class="container">				
					<div class="row d-flex align-items-center justify-content-center">
						<div class="about-content col-lg-12">
							<h1 class="text-white">
								Patient List			
							</h1>	
							<p class="text-white link-nav"><a runat="server" href="~/">Home </a>  <span class="lnr lnr-arrow-right"></span>  <a runat="server" href="~/UI/PatientListUI"> Patient List</a></p>
						</div>	
					</div>
				</div>
			</section>
	<!-- End banner Area -->


    <!-- Start Patient List Area -->
			<section class="sample-text-area" style="background-color:#CAFF70;">
				<div class="container" >
					<div class="row d-flex justify-content-center">

						<div class="form-group col-md-11 row justify-content-end" style="width: 100%;">
							<div class="col-lg-4 col-md-6">
								<asp:TextBox CssClass="form-control" ClientIDMode="Static" required="" ID="txtPatientSearch" runat="server" placeholder="Search By Name or Mobile or Address" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Search By Name or Mobile or Address'" Font-Size="Small" ForeColor="#000099"></asp:TextBox>
							</div> 
										
							<div class="col-lg-4 col-md-6">
								<asp:Button runat="server" CssClass="nw-btn primary-btn circle" ID="btnSearchPatient" Text="SEARCH" OnClick="btnSearchPatient_Click" ></asp:Button>
							</div> 
						</div>		
										
						<asp:Label runat="server" ID="lblEmptyMsg" Font-Bold="True"  Font-Size="X-Large" ForeColor="#CC0000"></asp:Label>
		                <%--<div class="menu-content pb-70 col-lg-7">--%>
		                    <div class="title text-center">

                                    <asp:GridView ID="GVPatientList" runat="server" AutoGenerateColumns="False" BackColor="#CCFF99" BorderColor="#000099" Width="600px" OnSelectedIndexChanged="GVPatientList_SelectedIndexChanged">
                                    <Columns>
                                        <asp:TemplateField Visible="false" HeaderText="Patient ID">
                                           <ItemTemplate>
                                                <asp:Label ID="lblPatientId" runat="server" Text='<%#Bind("user_id")%>' />
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
                                        <asp:TemplateField HeaderText="Address">
                                            <ItemTemplate>
                                                <asp:Label ID="lblAddress" runat="server" Text='<%#Bind("address")%>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:CommandField HeaderText="Action" SelectText="Details" ShowSelectButton="True" />
                                    </Columns>
                                    </asp:GridView>
                                
		                   <%-- </div>--%>
		                </div>
		            </div>
				</div>	
			</section>
			<!-- End Patient List Area -->
</asp:Content>
