using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DoctorAppointment.DAO;
using System.Data;

namespace DoctorAppointment.UI
{
    public partial class UserProfileUI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string appointIdQS = Request.QueryString["aId"];
            
            //if (appointIdQS==null)
            //{
            //    appointIdQS = Request.QueryString["pId"]; // When No appointment ID then Patient Id will assign
            //}
            string userIdQS = Request.QueryString["pId"];
            //txtName.Text = appointIdQS;
            if (!IsPostBack) { 
                LoadUserProfile(appointIdQS,userIdQS);
            }

        }
/******** Getting User Information  ======> *****/
        private void LoadUserProfile(string appointIdQS, string userIdQS)
        {
            BLL.UserProfileBll bll = new BLL.UserProfileBll();
            //PatientAppointment oPatientAppointment = new PatientAppointment();
            //oPatientAppointment.Id = Convert.ToInt32(appointIdQS);
            //oPatientAppointment.DoctorUserId = Convert.ToInt32(DdlDocName.SelectedItem.Value);
            DataTable userInfoDt = bll.GetUserInfo(appointIdQS,userIdQS);
            if(userInfoDt.Rows.Count > 0) { 
                txtName.Text = userInfoDt.Rows[0]["name"].ToString();
                txtFatherName.Text = userInfoDt.Rows[0]["father_name"].ToString();
                txtMobileNo.Text = userInfoDt.Rows[0]["cell_phone"].ToString();
                txtBirthDate.Text = userInfoDt.Rows[0]["birth_date"].ToString();
                txtAddress.Text = userInfoDt.Rows[0]["address"].ToString();
                rdBtnGender.Text = userInfoDt.Rows[0]["gender"].ToString();
            }
        }

        protected void btnUserProfile_Click(object sender, EventArgs e)
        {
            BLL.UserProfileBll bll = new BLL.UserProfileBll();
            UserProfile oUserProfile = new UserProfile();
            oUserProfile.Id = Convert.ToInt32(Request.QueryString["pId"]);
            oUserProfile.Name = txtName.Text;
            oUserProfile.FatherName = txtFatherName.Text;
            oUserProfile.Address = txtAddress.Text;
            oUserProfile.PhoneNo = txtMobileNo.Text;
            oUserProfile.Gender = Convert.ToInt32(rdBtnGender.SelectedValue);
            oUserProfile.BirthDate = txtBirthDate.Text;
            bool isSuccess = bll.UserInfoUpdate(oUserProfile);
            if (isSuccess)
            {
                lblShowMsg.ForeColor = System.Drawing.Color.Green;
                lblShowMsg.Text = "Successfully Updated";
            }
            else
            {
                lblShowMsg.ForeColor = System.Drawing.Color.Red;
                lblShowMsg.Text = "Infomation Not Updated";
            }

        }

        protected void btnUserDetails_Click(object sender, EventArgs e)
        {
            string userIdQS = Request.QueryString["pId"];
            Response.Redirect("PatientDetailsUI.aspx?pId=" + userIdQS + "");
        }
    }
}