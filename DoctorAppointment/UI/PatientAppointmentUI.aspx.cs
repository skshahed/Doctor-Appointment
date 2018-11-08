using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DoctorAppointment.DAO;

namespace DoctorAppointment.UI
{
    public partial class PatientAppointmentUI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //DoctorCategory();
            }
        }
/**** Method for Getting Doctor Category in DropDownList ======>>> ****/
        //private void DoctorCategory()
        //{
        //    DAL.PatientAppointmentDal dal = new DAL.PatientAppointmentDal();
        //   // DoctorCategory oDoctorCategory = new DoctorCategory();
        //    DataTable DocCatDt = dal.selectDoctorCategory();
        //    DdlDocCategory.Items.Clear();
        //    DdlDocCategory.Items.Add("Select Doctor Category");
        //    if (DocCatDt.Rows.Count > 0)
        //    {
        //        foreach (DataRow rows in DocCatDt.Rows)
        //        {
        //            DdlDocCategory.Items.Add(new ListItem(rows["doc_cat_name"].ToString(), rows["doctor_cat_id"].ToString()));
        //        }
        //    }
        //    else
        //    {
        //        DdlDocCategory.Items.Clear();
        //        DdlDocCategory.Items.Add("No Category Found");
        //    }  
        //}


/***** Auto Load from DB by SELECTED INDEX CHANGE Method if User Select Doctor category in DropDownList ======>>> ***/
        //protected void DdlDocCategory_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    DAL.PatientAppointmentDal dal = new DAL.PatientAppointmentDal();
        //    DoctorCategory oDoctorCategory = new DoctorCategory();
        //    oDoctorCategory.Id = Convert.ToInt32(DdlDocCategory.SelectedValue);
        //    DataTable DocNameDt = dal.selectDoctorName(oDoctorCategory);
        //    DdlDocName.Items.Clear();
        //    DdlDocName.Items.Add("Select Doctor Name");
        //    if (DocNameDt.Rows.Count >= 1)
        //    {
        //        foreach (DataRow rows in DocNameDt.Rows)
        //        {
        //            DdlDocName.Items.Add(new ListItem(rows["name"].ToString(), rows["user_id"].ToString()));
        //        }
        //    }
        //    else
        //    {
        //        DdlDocName.Items.Clear();
        //        DdlDocName.Items.Add("No Doctor Found");
        //    }
        //}

/****** Button Click for Check Appointment  availability and getting Serial Number ======> *****/
        protected void BtnCheckAvailable_Click(object sender, EventArgs e)
        {
            //string appointDate = TxtApointDate.Text;
           // if (!IsPostBack)
            { 
            BLL.PatientAppointmentBll bll = new BLL.PatientAppointmentBll();
            PatientAppointment oPatientAppointment = new PatientAppointment();
            oPatientAppointment.AppointDate = TxtApointDate.Text;
            oPatientAppointment.DoctorUserId = Convert.ToInt32(DdlDocName.SelectedItem.Value);
            string serialNo = bll.GetAppointmentSerial(oPatientAppointment);
            string availabilityMsg = "Appointment Avalable. Your Serial NO";
            
            LblAvailabilityMsg.Text = availabilityMsg + "- " + serialNo;
            }
        }

/***** Button Click to Adding Appointment and save to DB *******/
        protected void BtnAddApoint_Click(object sender, EventArgs e)
        {


        }

    }
}