using DoctorAppointment.DAO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace DoctorAppointment.BLL
{
    public class PatientLIstBll
    {
        public DataTable GetPatientList(UserProfile oUserProfile)
        {
            DAL.PatientListDal dal = new DAL.PatientListDal();
            DataTable patientList = dal.PatientLisFromDB(oUserProfile);
            return patientList;
        }
    }
}