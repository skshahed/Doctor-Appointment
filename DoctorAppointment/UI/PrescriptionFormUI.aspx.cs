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
                string patientId = Request.QueryString["pId"];
                LoadPrescriptionInfo(appointId, patientId);
            }
        }

        private void LoadPrescriptionInfo(string appointId, string patientId)
        {
            BLL.PrescriptionFormBll bll = new BLL.PrescriptionFormBll();
            DataTable patientDt = bll.GetPatientInfo(appointId, patientId);
            int countRows = patientDt.Rows.Count;
            if (countRows > 0)
            {
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
    }
}