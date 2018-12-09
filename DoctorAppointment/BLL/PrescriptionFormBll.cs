using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace DoctorAppointment.BLL
{
    public class PrescriptionFormBll
    {
        /****** Getting Patient Information  ========>  *****/
        public DataTable GetPatientInfo(string appointId)
        {
            DAL.PrescriptionFormDal dal = new DAL.PrescriptionFormDal();
            DataTable PatientInfoDt = dal.GetPatientInfo(appointId);
            return PatientInfoDt;
        }
    }
}