using DoctorAppointment.DAO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DoctorAppointment.UI
{
    public partial class PrescriptionFormUI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string appointId = Request.QueryString["aId"];
               // string patientSerial = Request.QueryString["srlNo"];
                LoadPrescriptionInfo(appointId);
            }
        }

        private void LoadPrescriptionInfo(string appointId)
        {
            BLL.PrescriptionFormBll bll = new BLL.PrescriptionFormBll();
            DataTable patientDt = bll.GetPatientInfo(appointId);
            int countRows = patientDt.Rows.Count;
            if (countRows > 0)
            {
                string patientSerial = Request.QueryString["srlNo"];
                lblSerialNo.Text = patientSerial;
                //lblAppointNo.Text = patientDt.Rows[0]["name"].ToString();
                lblAppointNo.Text = patientDt.Rows[0]["appointment_id"].ToString();
                lblPatientName.Text = patientDt.Rows[0]["name"].ToString();
                string birthDate = patientDt.Rows[0]["birth_date"].ToString();
                string getAge = new AgeCalculator().GetAge(birthDate);
                lblPatientAge.Text = getAge;
                int gender = Convert.ToInt32(patientDt.Rows[0]["gender"]);
                string convertedGender = new GenderConverter().GetGender(gender);
                lblGender.Text = convertedGender;
                lblTodayDate.Text = DateTime.Now.ToString("dd-MM-yyyy");
                
            }
        }

        protected void btnSavePrescription_Click(object sender, EventArgs e)
        {
            BLL.PrescriptionFormBll bll = new BLL.PrescriptionFormBll();
            Prescription oPrescription = new Prescription();
            //string totalMedicine = Request.Form["lblMedCounter"];
            string totalMedicine = hfMedCounter.Value;
            string totalTest = lblTestCounter.Text;
            oPrescription.AppointmentId = Convert.ToInt32(lblAppointNo.Text);
            oPrescription.PatientDisease = txtAreaDisease.Text;
            oPrescription.DoctorAdvice = txtDocAdvice.Text;
            bool prescribeSuccess = bll.GetPrescriptionResult(oPrescription);
            if (prescribeSuccess)
            {
                lblSaveMsg.ForeColor = System.Drawing.Color.Green;
                lblSaveMsg.Text = "Successfully Saved Prescription.";
            }
            else
            {
                lblSaveMsg.ForeColor = System.Drawing.Color.Red;
                lblSaveMsg.Text = "Sorry !!! Prescription Not Saved.";
            }
        }
    }
}