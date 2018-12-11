<%@ Page Title="" EnableEventValidation="false" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PrescriptionFormUI.aspx.cs" Inherits="DoctorAppointment.UI.PrescriptionFormUI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        body {
            background: #CAFF70 !important;
            color: darkmagenta;
        } h4{color: burlywood;} /* Adding !important forces the browser to overwrite the default style applied by Bootstrap */
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
       /* function displayMedicine() {
            $("#divAddMedicine").show();
            //var medName = $("#ddlAddMedicine option:selected").text();
            var medName = $("#ddlAddMedicine").children(":selected").text();
            //$("#divAddMedicine").append("#divAddMedicine");
            //$("#lblMedicineName").html(medName);
            // Add new element

            // Finding total number of elements added
            var total_element = $(".divShowMedicine").length;

            // last <div> with element class id
            var lastid = $(".divShowMedicine:last").attr("id");
            var split_id = lastid.split("_");
            var nextindex = Number(split_id[1]) + 1;

            var max = 5;
            // Check total number elements
            if (total_element < max) {
                // Adding new div container after last occurance of element class
                $(".divShowMedicine:last").after("<div class='divShowMedicine' id='div_" + nextindex + "'></div>");

                // Adding element to <div>
                $("#div_" + nextindex).append("<input type='text' placeholder='Enter your skill' id='txt_" + nextindex + "'>&nbsp;<span id='remove_" + nextindex + "' class='remove'>X</span>");

            }
            //alert(medName);
        } */
        
        function displayMedicine() {
            var count = $("#hfMedCounter").val();
            //var createIdMedName = "lblMedicineName"+count;
            //var createIdProcedure = "txtMedProcedure"+count;
            var medName = $("#ddlAddMedicine").children(":selected").text();
            if(count == 0){
                $("#divAddMedicine").show();
            }
                $("#divAddMedicine").append("" +
                    "<div class='singleMedArea'><div class='form-inline'>" +
                        "<label class='font-weight-bold col-md-4' ># Medicine Name :</label>" +
                        "<label class='font-weight-bold font-italic' id='lblMedicineName" + count + "' >" + medName + "</label>" +
                    "</div><div class='form-inline mt-10' >" +
                        "<label class='font-weight-bold col-md-4' >Take Procedure :</label>" +
                         "<input class='form-control col-md' id='txtMedProcedure" + count + "' />" +
                         "<button class='genric-btn danger circle ml-3 removeMedicine' type='button' style='width: 100px' id='btnMedicineRemove" + count + "'>Remove</button>" +
                    "</div></div>");
                count++;
                $("#lblMedCounter").text(count);
                $("#hfMedCounter").val(count);
        }

        function displayTest() {
            var countTest = $("#hfTestCounter").val();
            //var createIdTestName = "lblTestName" + countTest;
            //var createIdRequirement = "lblRequirement" + countTest;
            var TestName = $("#ddlAddTest").children(":selected").text();
            if (countTest == 0) {
                $("#divAddTest").show();
            }
            $("#divAddTest").append("" +
                "<div class='singleTestArea'><div class='form-inline'>" +
                    "<label class='font-weight-bold col-md-4' ># Test Name :</label>" +
                    "<label class='font-weight-bold font-italic' id='lblTestName" + countTest + "' >" + TestName + "</label>" +
                "</div><div class='form-inline mt-10' >" +
                    "<label class='font-weight-bold col-md-4' >Requirement :</label>" +
                     "<label class='col-md lnr-text-align-left' id='lblRequirement" + countTest + "' >Requirement </label>" +
                     "<button class='genric-btn danger circle ml-3 removeTest' type='button' style='width: 100px' id='btnTestRemove_" + countTest + "'>Remove</button>" +
                "</div></div>");
            countTest++;
            $("#lblTestCounter").text(countTest);
            $("#hfTestCounter").val(countTest);

        }
        $(document).on("click", '.removeMedicine', function () {
            var count = $("#hfMedCounter").val();
            $(this).closest("div.singleMedArea").remove();
            count--;
            $("#lblMedCounter").text(count);
            $("#hfMedCounter").val(count);
        });
        $(document).on("click", '.removeTest', function () {
            var countTest = $("#hfTestCounter").val();
            $(this).closest("div.singleTestArea").remove();
            countTest--;
            $("#hfTestCounter").val(countTest);
            $("#lblTestCounter").text(countTest);
        });
       // $(document).on("click", "#btnAddMedicine", function () {
        //    $("#divAddMedicine").show();
          //      //var medName = $("#ddlAddMedicine option:selected").text();
          //      var medName = $("#ddlAddMedicine").children(":selected").text();
          //      //$("#divAddMedicine").append("#divAddMedicine");
          //      $("#lblMedicineName").html(medName);

       // });
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
    <section class="section-top-border m-5 border border-info" style="background-color: greenyellow;">
        <div class="container">
            <!--  Start doctor General Information Row -->
            <div class="row">
                <div class="col-md-4 border border-success">
                    <div class="mt-10"></div>
                    <h4>Doctors Appointment</h4>
                    <p>Welcome, this is the place for a better treatment. </p>
                </div>
                
                <div class=" col-md-4 border border-success offset-md-4">
                    <div class="mt-10"></div>
                    <h4>Appointment Information</h4>
                    <table>
                        <tr>
                            <td><b>Visit Time :</b></td>
                            <td>From 6:00 PM to 9:00 PM</td>
                        </tr>
                        <tr>
                            <td><b>Serial No :</b></td>
                            <td><asp:Label runat="server" ID="lblSerialNo"></asp:Label></td>
                            <asp:Label runat="server" Visible="false" ID="lblAppointNo"></asp:Label>
                        </tr>
                    </table>
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
            <div class="mt-10 col-md-12 text-center"><asp:Label runat="server" ID="lblSaveMsg" Font-Size="Medium" Font-Bold="True"></asp:Label></div>
            <div class="mt-10"></div>
            <!--  Start Prescription Information Row -->
            <div class="row mt-10">
                <div class="col-md-4">
                    <h4 class="text-center text-success bg-white mb-20">Problem/Disease Note</h4>
                    <asp:TextBox CssClass="form-control p-2" Style="min-height: 300px; resize: vertical; overflow: auto; flex-grow: inherit" TextMode="MultiLine" runat="server" ID="txtAreaDisease"></asp:TextBox>
                </div>
                <div class="mt-10 ml-30 border-right"></div>
                <div class="col-md ml-30" style="width: 100%">
                    <h4 class="text-center bg-white text-success">Prescription Area</h4>
                    <div class="mt-10 form-inline">
                        <asp:Label CssClass="font-weight-bold col-md-4" runat="server" ID="Label3">i) Prescribe Medicine :</asp:Label>
                        <asp:DropDownList ClientIDMode="Static" ID="ddlAddMedicine" runat="server" CssClass="col-md form-control">
                        </asp:DropDownList>
                        <asp:Button runat="server" CssClass="genric-btn info circle ml-3" style="width: 100px" ClientIDMode="Static" ID="btnAddMedicine" Text="Add" OnClientClick="displayMedicine(); return false;" ></asp:Button>
                    </div>
                    <asp:HiddenField runat="server" ClientIDMode="Static" ID="hfMedCounter" Value="0" />
                    <asp:Label CssClass="badge badge-pill badge-success"  runat="server" ClientIDMode="Static" ID="lblMedCounter" Font-Size="Medium"></asp:Label>
                    <div id="divAddMedicine" class="ml-50 mt-10">
                        
                             <!---- Medicine Stack Here   --->
                       
                    </div>

                    <div class="mt-10 form-inline">
                        <asp:Label CssClass="font-weight-bold col-md-4" runat="server" ID="Label1">ii) Test Items :</asp:Label>
                        <asp:DropDownList ID="ddlAddTest" ClientIDMode="Static" runat="server" CssClass="col-md form-control">
                        </asp:DropDownList>
                        <asp:Button runat="server" CssClass="genric-btn info circle ml-3" style="width: 100px;" ClientIDMode="Static" ID="btnAddTest" Text="Add" OnClientClick="displayTest(); return false;" Enabled="True" UseSubmitBehavior="False"></asp:Button>
                      
                    </div>
                    <asp:HiddenField runat="server" ClientIDMode="Static" ID="hfTestCounter" Value="0" />
                    <asp:Label runat="server" CssClass="badge badge-pill badge-success" ClientIDMode="Static" ID="lblTestCounter" Font-Size="Medium" ></asp:Label>
                    <div id="divAddTest" class="ml-50 mt-10">
                        <!--- Test Will be added Here by JQuery ---->

                    </div>

                    <div class="mt-10 form-inline">
                        <asp:Label CssClass="font-weight-bold col-md-4" runat="server" ID="Label2">iii) Doctor Advice :</asp:Label>
                        <asp:TextBox CssClass="form-control col-md p-2" Style="resize: vertical; overflow: auto;" TextMode="MultiLine" runat="server" ID="txtDocAdvice"></asp:TextBox>
                    </div>
                    <div class="mt-10 text-right">
                        <asp:Button CssClass="genric-btn primary e-large radius" ClientIDMode="Static" runat="server" ID="btnSavePrescription" Text="Save & Print" OnClick="btnSavePrescription_Click" />
                    </div>
                </div>

            </div>
            <!--  End Prescription Information Row -->
        </div>
    </section>
    <!--- End doctor Prescription section Area ---->
</asp:Content>
