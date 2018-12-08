<%@ Page EnableEventValidation="false" Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PatientAppointmentUI.aspx.cs" Inherits="DoctorAppointment.UI.PatientAppointmentUI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<link type="text/css" rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        
<script type="text/javascript" src="../Scripts/jquery-3.3.1.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#TxtPatientName").hide();
            //$("#BtnAddApoint").css('visibility', 'hidden');
            $("#BtnAddApoint").hide();
            $("#lblAppointBtnMsg").text("You Need To Fix an Appointment to Submit");
            $("#lblAppointBtnMsg").css("color", "red");
            GetDoctorCategory();
        });
        $(document).on("change", "#DdlDocCategory", function () {
            $("#DdlDocName").empty();
            //$("#DdlDocName").append("<option value='0'>Select Doctor Name</option>");
            var catId = $(this).val();
            GetDoctorName(catId);

        });
        $(document).on("change", "#TxtMobileNo", function () {
           
            var mobileNo = $(this).val();
            //$("#TxtPatientName").data(mobileNo);
            //$('#TxtPatientName').empty();
            //$('#lblPatientId').clear();
            $('#TxtPatientName').val("");
            $('#lblPatientId').text("");
            GetPatientName(mobileNo);
            $("#TxtPatientName").show();
            //alert("No way.... ");
        });
        function GetDoctorCategory() {
            $.ajax({
                type: "POST",
                url: "/AjaxCall.aspx/GetDoctorCategory",
               // data: '{"mobileNo":"' + PatientMobile + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (data) {
                    //$("#TxtPatientName").val(data.d);
                    $("#DdlDocCategory").append("<option value='0'>Select Doctor Category</option>");
                    for (var i = 0; i < data.d.length; i++) {
                        $("#DdlDocCategory").append("<option value='" + data.d[i].Id.toString() + "'>" + data.d[i].DocCatName.toString() + "</option>");
                    }
                },
                error: function (msg) {
                    alert(msg);
                }
            });
        }
        function GetDoctorName(docCatId) {
            $.ajax({
                type: "POST",
                url: "/AjaxCall.aspx/GetDoctorName",
                data: '{"catId":"' + docCatId + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (data) {
                    if (data.d.length > 0) {
                        $("#DdlDocName").append("<option value='0'>Select Doctor Name</option>");
                        //$("#BtnAddApoint").removeAttr('disabled');
                        for (var i = 0; i < data.d.length; i++) {
                            $("#DdlDocName").append("<option value='" + data.d[i].Id.toString() + "'>" + data.d[i].Name.toString() + "</option>");
                            //alert(data.d[i].Id.toString());
                        }
                    }
                    else {
                        //$("#DdlDocName").empty();
                        $("#DdlDocName").append("<option value='0'>No Doctor Available !</option>");
                        
                        //$("#BtnAddApoint").prop('disabled', 'disabled');
                        
                    }
                    
                },
                error: function (msg) {
                    alert(msg);
                }
            });
        }
        function GetPatientName(PatientMobile) {
            $.ajax({
                type: "POST",
                url: "/AjaxCall.aspx/GetPatientName",
                data: '{"mobileNo":"' + PatientMobile + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (data) {
                   // alert("Go on");
                    if (data.d != '') {
                        $('#TxtPatientName').val(data.d.Name.toString());
                        $('#lblPatientId').html(data.d.Id.toString());
                        //Console.log(data.d[i].Name.toString());
                    }
                    //var mobileNum = $(data.d);
                    //$("#TxtPatientName").val(data.d);
                   // $("#TxtPatientName").hide();
                   // alert(mobileNum);
                },
                error: function (msg) {
                    alert(msg);
                }
            });
        }
        $(function () {
            $("#TxtApointDate").datepicker({ minDate: -0, maxDate: "+1M +1D" });
        });

        function getSerialNo()
        {
            var inputDate = $("#TxtApointDate").val();
            var docId = $("#DdlDocName").val();
           
            $.ajax({
                type: "POST",
                url: "/AjaxCall.aspx/GetSerialNo",
               // data: '{ "appointDate": "' + inputDate + '" }',
                data: '{"appointDate":"' + inputDate + '", "doctorId":"' + docId + '"}',
               // data: "{'appointDate':'" + inputDate + "', 'doctorId':'" + docId + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (data) {
                    //var mobileNum = $(data.d);
                    //console.log(data);
                    // alert(data.d);
                    if (data.d == 0)
                    {
                        $("#LblAvailabilityMsg").text("Sorry !!! No Appointment Available.");
                        $("#LblAvailabilityMsg").css("color", "red");
                       // $("#BtnAddApoint").hide();
                      //  $("#lblAppointBtnMsg").text("You Need To Fix an Appointment to Submit");
                        // $("#lblAppointBtnMsg").css("color", "red");
                        
                    }
                    else if(data.d == "Error")
                    {
                        $("#LblAvailabilityMsg").text("Error !!! Input Data Correctly.");
                        $("#LblAvailabilityMsg").css("color", "red");
                       // $("#BtnAddApoint").hide();
                       // $("#lblAppointBtnMsg").text("You Need To Fix an Appointment to Submit");
                        // $("#lblAppointBtnMsg").css("color", "red");
                    }
                    else
                    {
                        $("#LblAvailabilityMsg").text(data.d);
                        $("#LblAvailabilityMsg").css("color", "blue");
                        $("#BtnAddApoint").show();
                        $("#lblAppointBtnMsg").text("");
                    }
                    //$("#LblAvailabilityMsg").text(data.d);
                    // $("#TxtPatientName").hide();
                    // alert(mobileNum);
                },
                error: function (msg) {
                    alert(msg);
                }
            });

        }
    </script>
    <!-- start banner Area -->
			<section class="banner-area relative about-banner" id="home">	
				<div class="overlay overlay-bg"></div>
				<div class="container">				
					<div class="row d-flex align-items-center justify-content-center">
						<div class="about-content col-lg-12">
							<h1 class="text-white">
								Book Appointment				
							</h1>	
							<p class="text-white link-nav"><a runat="server" href="~/">Home </a>  <span class="lnr lnr-arrow-right"></span>  <a runat="server" href="~/UI/PatientAppointment"> Book Appointment</a></p>
						</div>	
					</div>
				</div>
			</section>
			<!-- End banner Area -->				  

	<!-- Start Appointment Booking Area -->
    <section class="appointment-area" style="background-color:#CAFF70;" >			
				<div class="container" >
					<div class="row justify-content-between align-items-center pb-120 appointment-wrap" >
						<div class="col-lg-6 col-md-6 appointment-right pt-60 pb-60" style="margin-left:auto;margin-right:auto;background-color:#BCEE68;">
							
								<h3 style="color:#228B22;" class="pb-20 text-center mb-30">Book an Appointment</h3>
                                <asp:Label CssClass="text-center font-weight-bold" ID="LblUserMsg" runat="server"></asp:Label>
                                <div class="mt-10">    
                                    <asp:TextBox CssClass="form-control" ClientIDMode="Static" required="" ID="TxtApointDate" runat="server" placeholder="Appointment Date" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Appointment Date'" ></asp:TextBox>	
                                </div>
                                <div class="mt-10">    
                                    <asp:DropDownList ID="DdlDocCategory" ClientIDMode="Static" runat="server" CssClass="form-select" >
                                    </asp:DropDownList>
                                </div>
                                <div class="mt-10">
                                    <asp:DropDownList ID="DdlDocName" ClientIDMode="Static" runat="server" CssClass="form-select" >
                                        <asp:ListItem Value="0">Select Doctor</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="mt-10" style="text-align:right;">
                                    <asp:Button CssClass="genric-btn primary radius" ID="BtnCheckAvailable" ClientIDMode="Static" runat="server" Text="Check Availability" OnClientClick="getSerialNo(); return false;" />
                                </div>
                                <div class="mt-20 text-center text-primary">
                                    <asp:Label ID="LblAvailabilityMsg" ClientIDMode="Static" runat="server" Font-Size="Medium" Font-Bold="True"></asp:Label>
                                </div>
                                <div class="mt-30">
                                    <asp:TextBox CssClass="form-control" ClientIDMode="Static" required="" ID="TxtMobileNo" runat="server" placeholder="Mobile Number " onfocus="this.placeholder = ''" onblur="this.placeholder = 'Mobile Number'"></asp:TextBox>
                                </div>
                                <%--<div class="mt-10" style="text-align:right;">
                                    <asp:Button CssClass="genric-btn info circle" ID="BtnUserCheck" runat="server" Text="Search User" />
                                </div>--%>
                                 <div class="mt-10">
                                      <asp:TextBox CssClass="form-control" ClientIDMode="Static" required="" ID="TxtPatientName" runat="server" placeholder="Patient Name" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Patient Name'"></asp:TextBox>
                                 </div>

                                <asp:Label runat="server" ID="lblPatientId" ClientIDMode="Static" Visible="true" ></asp:Label>
                                <div class="mt-10" style="text-align:center;">
                                    <asp:Button  CssClass="genric-btn info e-large circle" ClientIDMode="Static" ID="BtnAddApoint" runat="server" Text="Confirm Appointment" OnClick="BtnAddApoint_Click" />
                                </div>
                                <div class="mt-10" style="text-align:center;">
                                    <asp:Label runat="server" ID="lblAppointBtnMsg" ClientIDMode="Static" ></asp:Label>
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
    <!-- End Appointment Booking Area -->
   
</asp:Content>
