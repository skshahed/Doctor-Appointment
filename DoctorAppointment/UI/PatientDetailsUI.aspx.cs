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
    public partial class PatientDetailsUI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string userIdQs = Request.QueryString["pId"];
            LoadUserDetails(userIdQs);
        }

        private void LoadUserDetails(string userIdQs)
        {
            BLL.PatientDetailsBll bll = new BLL.PatientDetailsBll();
            UserProfile oUserProfile = new UserProfile();
            oUserProfile.Id = Convert.ToInt32(userIdQs);
            DataTable userInfoDt = bll.GetUserInfo(oUserProfile);
            if (userInfoDt.Rows.Count > 0)
            {
                lblUserId.Text = userInfoDt.Rows[0]["user_id"].ToString();
                txtName.Text = userInfoDt.Rows[0]["name"].ToString();
                txtFatherName.Text = userInfoDt.Rows[0]["father_name"].ToString();
                txtMobileNo.Text = userInfoDt.Rows[0]["cell_phone"].ToString();
                string birthDate = userInfoDt.Rows[0]["birth_date"].ToString();
                
                string getAge = new AgeCalculator().GetAge(birthDate);
                txtBirthDate.Text = getAge;
                    
                txtAddress.Text = userInfoDt.Rows[0]["address"].ToString();
                int gender = Convert.ToInt32(userInfoDt.Rows[0]["gender"]);
                string convertedGender = new GenderConverter().GetGender(gender);
                txtGender.Text = convertedGender;
            }
        }

        protected void btnUserProfile_Click(object sender, EventArgs e)
        {
            string patientIdQs = Request.QueryString["pId"];
            Response.Redirect("UserProfileUI.aspx?pId=" + patientIdQs + "");
        }
    }
}