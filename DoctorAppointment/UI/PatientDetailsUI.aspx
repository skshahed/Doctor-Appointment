<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PatientDetailsUI.aspx.cs" Inherits="DoctorAppointment.UI.PatientDetailsUI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script type="text/javascript" src="../Scripts/jquery-3.3.1.js"></script>
    <script type="text/javascript">
/********Start of JQuery Ready Fuction ======>>*******/
        $(document).ready(function () {

            var userId = $("#lblUserId").html();
            //alert(userId);
            GetSingleUserAppointList(userId);
        });
/******** <<=====End of JQuery Ready Fuction *******/

/********Start of JQuery UI Accordion Fuction ======>>*******/
        $(function () {
            $("#appointmentHistory").accordion();
            
        });
/********<<===== End of JQuery UI Accordion Fuction *******/

/********Start To getting Single User All Appointment History ======>>*******/
        function GetSingleUserAppointList(singleUserId) {
            $.ajax({
                type: "POST",
                url: "/AjaxCall.aspx/GetUserAppointHistory",
                data: '{"userId":"' + singleUserId + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (data) {
                    if (data.d.length > 0) {
                        for (var i = 0; i < data.d.length; i++)
                        {
                            var appointSuccess = data.d[i].AppointSuccess.toString();
                           // replace = appointSuccess;
                            if (appointSuccess == '1') { appointSuccess = "Yes"; }
                            else { appointSuccess = "No"; }
                            var loadDiv = "createDiv"+i;
                           // $("#appointmentHistory").append("<option> value='" + data.d[i].Id.toString() + "'>" + data.d[i].AppointDate.toString() + "</option>");
                            $("#appointmentHistory").append("<button class='btn-block' value='" + data.d[i].Id.toString() + "'>" + data.d[i].AppointDate.toString() + "</button>");
                            $("#appointmentHistory").append(""+
                                "<div id='" + loadDiv + "'> <table class='table table-bordered table-hover'>" +
                                "<tr><td>Doctor Name :</td><td>" + data.d[i].DoctorName.toString() + "</td></tr>" +
                               "<tr><td>Appointment Date :</td><td>" + data.d[i].ReserveDate.toString() + "</td></tr>" +
                               "<tr><td>Visiting Time :</td><td>" + data.d[i].VisitTime.toString() + "</td></tr>" +
                               "<tr><td>Appeared ? :</td><td>" + appointSuccess + "</td></tr>" +
                                "</table></div>");
                            //alert(loadDiv);
                        }
                        
                    }
                    else {
                        $("#appointmentHistory").append("<h3>No Appointment History Found!!!</h3>");
                    }
                    
                },
                error: function (msg) {
                    alert(msg);
                }
            });
        }
/******** <<======= End of getting Single User All Appointment History *******/
    </script>
    <!-- start banner Area -->
			<section style="height:100px;" class="banner-area relative about-banner" id="home">	
				<div class="overlay overlay-bg"></div>
			</section>
	<!-- End banner Area -->
    <!-- Patient details start Here !! --->
    <section class="our-mission-area section-half">
        <div class="container">
            <div class="row d-flex justify-content-center">
                <div class="menu-content pb-70 col-lg-8">
                    <div class="title text-center">
                        <h1 class="mb-10"><u><i>Patient Information</i></u></h1>
                    </div>
                </div>
            </div>
            <div class="row">
                <!--Patient General Information start Here-->
                <div class="col-md-6 accordion-left border border-info">
                    <div class="text-center p1-gradient-bg mt-10">
                        <h3 class="mb-10"><i style="color: #FFFFFF">General Information</i></h3>
                    </div>
                    <asp:Label runat="server" Visible="true" ClientIDMode="Static" ID="lblUserId"></asp:Label>
                    <div class="mt-10">
                        <h6 class="typo-list">Name :</h6>
                    </div>
                    <asp:TextBox CssClass="form-control" ReadOnly="true" ClientIDMode="Static" required="" ID="txtName" runat="server"></asp:TextBox>
                    <div class="mt-10">
                        <h6 class="typo-list">Father's Name :</h6>
                    </div>
                    <asp:TextBox CssClass="form-control" ReadOnly="true" ClientIDMode="Static" required="" ID="txtFatherName" runat="server"></asp:TextBox>
                    <div class="mt-10">
                        <h6 class="typo-list">Mobile Number :</h6>
                    </div>
                    <asp:TextBox CssClass="form-control" ReadOnly="true" ClientIDMode="Static" required="" ID="txtMobileNo" runat="server"></asp:TextBox>
                    <div class="mt-10">
                        <h6 class="typo-list">Age :</h6>
                    </div>
                    <asp:TextBox CssClass="form-control" ReadOnly="true" ClientIDMode="Static" required="" ID="txtBirthDate" runat="server"></asp:TextBox>
                    <div class="mt-10">
                        <h6 class="typo-list">Address :</h6>
                    </div>
                    <asp:TextBox CssClass="form-control" ReadOnly="true" ClientIDMode="Static" required="" ID="txtAddress" runat="server" Rows="2"></asp:TextBox>

                    <div class="mt-10">
                        <h6 class="typo-list">Gender :</h6>
                    </div>
                    <asp:TextBox CssClass="form-control" ReadOnly="true" ClientIDMode="Static" required="" ID="txtGender" runat="server" ></asp:TextBox>
                    <div class="mt-10" style="text-align: right;">
                        <asp:Button CssClass="genric-btn info e-large circle" ID="btnUserProfile" runat="server" Text="Edit ?" OnClick="btnUserProfile_Click" />
                    </div>
                    <div class="mt-10"></div>
                </div>
                <!--Patient General Information End Here-->

                <!--Patient Appointment Information start Here-->
                <div class="col-md-6 info-area-right justify-content-center align-items-center border border-info badge-warning">
                    <div class="text-center p1-gradient-bg mt-10">
                        <h3 class="mb-10"><i style="color: #FFFFFF">Appointment Information</i></h3>
                    </div>
                    <div id="appointmentHistory">
                        
                    </div>
                </div>
                 <!--Patient Appointment Information end Here-->
            </div>
        </div>
    </section>
    <!-- Patient details End Here !! --->
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
</asp:Content>
