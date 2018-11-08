using DoctorAppointment.DAO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DoctorAppointment
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //DoctorCategory();
            }
        }
        //Method for Getting Doctor Category in DropDownList -------->>>
        //private void DoctorCategory()
        //{
        //    DAL.PatientAppointmentDal dal = new DAL.PatientAppointmentDal();
        //    // DoctorCategory oDoctorCategory = new DoctorCategory();
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
        //Auto Load from DB by SELECTED INDEX CHANGE Method if User Select Doctor category in DropDownList -------->>>
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

        protected void BtnCheckAvailable_Click(object sender, EventArgs e)
        {

        }
    }
}