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
    public partial class PatientListUI : System.Web.UI.Page
    {
        string searchInput = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                searchInput = "";
                GetPatientList(searchInput);
            }
        }
/***** Getting Patient List ========> ******/
        private void GetPatientList(string searchInput)
        {
            BLL.PatientLIstBll bll = new BLL.PatientLIstBll();
            UserProfile oUserProfile = new UserProfile();
            oUserProfile.Name = searchInput;
            DataTable patientListDt = bll.GetPatientList(oUserProfile);
            if (patientListDt.Rows.Count > 0)
            {
                lblEmptyMsg.Text = "";
                GVPatientList.DataSource = patientListDt;
                GVPatientList.DataBind();

            }
            else
            {
                GVPatientList.DataSource = null;
                // GVAppointmentList.Columns.Clear();
                GVPatientList.DataBind();
                lblEmptyMsg.Text = "No Patient History Found !!!";
            }
        }
/***** Patient List shows by Search Input Name or Mobile  ========> ******/
        protected void btnSearchPatient_Click(object sender, EventArgs e)
        {
            searchInput = txtPatientSearch.Text;
            GetPatientList(searchInput);
        }

/****** View Appointment patient details from GridView Select ======> *****/

        protected void GVPatientList_SelectedIndexChanged(object sender, EventArgs e)
        {
            // int rowIndex = e.RowIndex;
            string patientId = ((Label)GVPatientList.SelectedRow.FindControl("lblPatientId")).Text;
            Response.Redirect("PatientDetailsUI.aspx?pId=" + patientId + "");
        }
    }
}