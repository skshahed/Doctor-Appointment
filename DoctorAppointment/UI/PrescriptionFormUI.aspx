<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PrescriptionFormUI.aspx.cs" Inherits="DoctorAppointment.UI.PrescriptionFormUI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        body { background: #CAFF70 !important; color:darkmagenta; h4{color:aqua;}} /* Adding !important forces the browser to overwrite the default style applied by Bootstrap */
    </style>
    <link type="text/css" rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        
<script type="text/javascript" src="../Scripts/jquery-3.3.1.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#divAddMedicine").hide();
            $("#divAddTest").hide();
            GetMedicineList();
            GetTestList();
        });
        function displayMedicine() {
            $("#divAddMedicine").show();
            //var medName = $("#ddlAddMedicine option:selected").text();
            var medName = $("#ddlAddMedicine").children(":selected").text();
            //$("#divAddMedicine").append("#divAddMedicine");
            //$("#lblMedicineName").html(medName);
            // Add new element

                // Finding total number of elements added
            var total_element = $(".elementMed1").length;
 
                // last <div> with element class id
            var lastid = $(".elementMed1:last").attr("id");
                var split_id = lastid.split("_");
                var nextindex = Number(split_id[1]) + 1;

                var max = 5;
                // Check total number elements
                if(total_element < max ){
                    // Adding new div container after last occurance of element class
                    $(".elementMed1:last").after("<div class='elementMed1' id='div_" + nextindex + "'></div>");
 
                    // Adding element to <div>
                    $("#div_" + nextindex).append("<input type='text' placeholder='Enter your skill' id='txt_"+ nextindex +"'>&nbsp;<span id='remove_" + nextindex + "' class='remove'>X</span>");
 
                }
            //alert(medName);
        }
        //$(document).on("click", "#btnAddMedicine", function () {
            
        //    $("#divAddMedicine").show();
        //        //var medName = $("#ddlAddMedicine option:selected").text();
        //        var medName = $("#ddlAddMedicine").children(":selected").text();
        //        //$("#divAddMedicine").append("#divAddMedicine");
        //        $("#lblMedicineName").html(medName);

        //});
        function GetMedicineList() {
            $.ajax({
                type: "POST",
                url: "/AjaxCall.aspx/GetAllMedicine",
               // data: '{"mobileNo":"' + PatientMobile + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (data) {
                    //$("#TxtPatientName").val(data.d);
                    $("#ddlAddMedicine").append("<option value='0'>Select Medicine</option>");
                    for (var i = 0; i < data.d.length; i++) {
                        $("#ddlAddMedicine").append("<option value='" + data.d[i].Id.toString() + "'>" + data.d[i].MedicineName.toString() + "</option>");
                    }
                },
                error: function (msg) {
                    alert(msg);
                }
            });
        }
        function GetTestList() {
            $.ajax({
                type: "POST",
                url: "/AjaxCall.aspx/GetAllTest",
                // data: '{"mobileNo":"' + PatientMobile + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (data) {
                    //$("#TxtPatientName").val(data.d);
                    $("#ddlAddTest").append("<option value='0'>Select Lab Test</option>");
                    for (var i = 0; i < data.d.length; i++) {
                        $("#ddlAddTest").append("<option value='" + data.d[i].Id.toString() + "'>" + data.d[i].TestName.toString() + "</option>");
                    }
                },
                error: function (msg) {
                    alert(msg);
                }
            });
        }
        
    </script>
    <!-- start banner Area -->
    <section style="height: 100px;" class="banner-area relative about-banner" id="home">
        <div class="overlay overlay-bg"></div>
    </section>
    <!-- End banner Area -->
    <!--- Start doctor Prescription section Area ---->
    <section class="section-top-border m-5 border border-info" style="background-color:greenyellow;">
        <div class="container">
    <!--  Start doctor General Information Row -->
            <div class="row">
                <div class="col-md-4 border border-success">
                    <div class="mt-10"></div>
                    <h4>Definition 01</h4>
                    <p>Recently, the US Federal government banned online casinos from operating in America by making it illegal to transfer money to them through any US bank or payment system. </p>
                </div>

                <div class=" col-md-4 border border-success offset-md-4">
                    <div class="mt-10"></div>
                    <h4>Definition 02</h4>
                    <p> As a result of this law, most of the popular online casino networks</p>
                </div>
            </div>
    <!--  End doctor General Information Row -->
            <div class="mt-10 border-bottom"></div>
    <!--  Start Patient General Information Row -->
            <div class="row mt-10">
                <div class=" col-md-4">
                    <label class="font-weight-bold">Patient Name:</label>
                    <asp:Label runat="server" ID="lblPatientName"></asp:Label>
                    <br />
                    <label class="font-weight-bold">Age:</label>
                    <asp:Label runat="server" ID="lblPatientAge"></asp:Label>
                </div>
                    
                <div class=" col-md-4 offset-md-4">
                    <label class="font-weight-bold">Today Date:</label>
                    <asp:Label runat="server" ID="lblTodayDate"></asp:Label>
                    <br />
                    <label class="font-weight-bold">Gender:</label>
                    <asp:Label runat="server" ID="lblGender"></asp:Label>
                </div>
            </div>
    <!--  End Patient General Information Row -->
            <div class="mt-10"></div>
    <!--  Start Prescription Information Row -->
            <div class="row mt-10">
                <div class="col-md-4">
                    <h4 class="text-center text-success bg-white mb-20">Problem/Disease Note</h4>
                    <asp:TextBox CssClass="form-control p-2" style="min-height:300px;resize:vertical;overflow:auto;flex-grow:inherit" TextMode="MultiLine" runat="server" ID="txtAreaDisease" ></asp:TextBox>
                </div>
                <div class="mt-10 ml-30 border-right"></div>
                <div class="col-md ml-30" style="width:100%">
                    <h4 class="text-center bg-white text-success">Prescription Area</h4>
                    <div class="mt-10 form-inline">
                        <asp:Label CssClass="font-weight-bold col-md-4" runat="server" ID="Label3">1. Prescribe Medicine :</asp:Label>
                        <asp:DropDownList ClientIDMode="Static" ID="ddlAddMedicine" runat="server" CssClass="col-md form-control">
                            
                        </asp:DropDownList>
                        <button class="genric-btn info circle ml-3" style="width:100px" id="btnAddMedicine" onclick="displayMedicine(); return false;">Add</button>
                    </div>
                    <div id="divAddMedicine" class="ml-50 mt-10">
                        <div class="divShowMedicine">
                            <div class="form-inline">
                                <asp:Label CssClass="font-weight-bold col-md-4" runat="server" ID="Label4">i). Medicine Name :</asp:Label>
                                <asp:Label CssClass="col-md font-weight-bold font-italic" runat="server" ID="lblMedicineName" ClientIDMode="Static"></asp:Label>
                            </div>
                            <div class="form-inline ml-3 mt-10">
                                <asp:Label CssClass="font-weight-bold col-md-3" runat="server" ID="Label5">Take Procedure :</asp:Label>
                                <asp:TextBox CssClass="form-control col-md ml-5" runat="server" ID="txtMedProcedure"></asp:TextBox>
                                <%-- <button class="genric-btn danger circle ml-3" style="width: 100px" id="btnMedicineRemove">Remove</button>--%>
                            </div>
                        </div>
                    </div>
                    <div class="mt-10 form-inline">
                        <asp:Label CssClass="font-weight-bold col-md-4" runat="server" ID="Label1">2. Test Items :</asp:Label>
                        <asp:DropDownList ID="ddlAddTest" ClientIDMode="Static" runat="server" CssClass="col-md form-control">
                            
                        </asp:DropDownList>
                        <button class="genric-btn info circle ml-3 w-10" style="width:100px" id="btnAddTest">Add</button>
                    </div>
                    <div id="divAddTest" class="ml-50 mt-10">
                        <div class="form-inline">
                            <asp:Label CssClass="font-weight-bold col-md-3" runat="server" ID="Label6">i). Test Name :</asp:Label>
                            <asp:Label runat="server" ID="Label7" ></asp:Label>
                        </div>
                        <div class="form-inline ml-3 mt-10">
                            <asp:Label CssClass="font-weight-bold col-md-3" runat="server" ID="Label8">Requirement :</asp:Label>
                            <asp:Label CssClass="col-md ml-5" runat="server" ID="TextBox2" ></asp:Label>
                            <button class="genric-btn danger circle ml-3" style="width:100px" id="btnTestRemove">Remove</button>
                        </div>
                    </div>
                    <div class="mt-10 form-inline">
                        <asp:Label CssClass="font-weight-bold col-md-4" runat="server" ID="Label2">3. Doctor Advice :</asp:Label>
                        <asp:TextBox CssClass="form-control col-md p-2" style="resize:vertical;overflow:auto;" TextMode="MultiLine" runat="server" ID="TextBox1" ></asp:TextBox>
                    </div>
                    <div class="mt-10 text-right">
                     <asp:Button CssClass="genric-btn primary e-large radius" runat="server" ID="btnSavePrescription" Text="Save & Print" />
                    </div>
                </div>
               
            </div>
    <!--  End Prescription Information Row -->
        </div>
    </section>
    <!--- End doctor Prescription section Area ---->
</asp:Content>
