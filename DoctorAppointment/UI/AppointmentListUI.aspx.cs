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
    public partial class AppointmentListUI : System.Web.UI.Page
    {
        string searchDate = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                searchDate = Request.QueryString["sDate"];
                if (string.IsNullOrEmpty(searchDate))
                {
                    searchDate = DateTime.Now.ToString("yyyy-MM-dd");
                }
                TodayAppointmentList(searchDate);
            }
        }
/***** Appointment List shows Current date Appointment ========> ******/  
        private void TodayAppointmentList(string getDate)
        {
            //string today = "2018-11-10";
            BLL.AppointmentListBll bll = new BLL.AppointmentListBll();
            PatientAppointment oPatientAppointment = new PatientAppointment();
            oPatientAppointment.AppointDate = getDate;
            DataTable appoinListDt = bll.GetAppointmentList(oPatientAppointment);
            if (appoinListDt != null)
            {
                if (appoinListDt.Rows.Count > 0)
                {
                    lblEmptyMsg.Text = "";
                    GVAppointmentList.DataSource = appoinListDt;
                    GVAppointmentList.DataBind();

                }
                else
                {
                    GVAppointmentList.DataSource = null;
                    // GVAppointmentList.Columns.Clear();
                    GVAppointmentList.DataBind();
                    lblEmptyMsg.Text = "No Appointment History Found !!!";
                }
            }
            else
            {
                GVAppointmentList.DataSource = null;
                // GVAppointmentList.Columns.Clear();
                GVAppointmentList.DataBind();
                lblEmptyMsg.Text = "Really ? Nice Try. Now Input Valid Date !";
            }
        }
/***** Appointment List shows by Search date  ========> ******/
        protected void btnSearchAppointment_Click(object sender, EventArgs e)
        {
            searchDate = txtApointDate.Text;
            TodayAppointmentList(searchDate);
        }
/****** View Appointment patient details from GridView Select ======> *****/

        protected void GVAppointmentList_SelectedIndexChanged(object sender, EventArgs e)
        {
            // int rowIndex = e.RowIndex;
            BLL.AppointmentListBll bll = new BLL.AppointmentListBll();
            string appointId = ((Label)GVAppointmentList.SelectedRow.FindControl("lblAppointId")).Text;
            string patientUserId = ((Label)GVAppointmentList.SelectedRow.FindControl("lblUserId")).Text;
            int nullColumn = bll.GetUserNullInfo(patientUserId);
            if(nullColumn > 0)
            {
                Response.Redirect("UserProfileUI.aspx?aId=" + appointId + "");
            }
            else
            {
                Response.Redirect("PatientDetailsUI.aspx?pId=" + patientUserId + "");
            }
            
        }

        protected void GVAppointmentList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName == "btnPrescribe")
            {
                BLL.AppointmentListBll bll = new BLL.AppointmentListBll();
                //string patientUserId = ((Label)GVAppointmentList.SelectedRow.FindControl("lblUserId")).Text;
                int index = Convert.ToInt32(e.CommandArgument);
                string appointId = ((Label)GVAppointmentList.Rows[index].Cells[1].FindControl("lblAppointId")).Text;
                string patientUserId = ((Label)GVAppointmentList.Rows[index].Cells[2].FindControl("lblUserId")).Text;
                string patientSerial = ((Label)GVAppointmentList.Rows[index].Cells[3].FindControl("lblSerialNo")).Text;
                int nullColumn = bll.GetUserNullInfo(patientUserId);
                if(nullColumn > 0)
                {
                    Response.Redirect("UserProfileUI.aspx?pId=" + patientUserId + "");
                }
                else
                {
                    Response.Redirect("PrescriptionFormUI.aspx?srlNo=" + patientSerial + "&aId=" + appointId + "");
                }
            }
        }
    }
}