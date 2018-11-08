using DoctorAppointment.DAO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace DoctorAppointment.BLL
{
    public class PatientDetailsBll
    {
/****** Getting User Information  ========>  *****/
        public DataTable GetUserInfo(UserProfile oUserProfile)
        {
            DAL.PatientDetailsDal dal = new DAL.PatientDetailsDal();
            DataTable userInfoDt = dal.GetUserInfo(oUserProfile);
            return userInfoDt;
        }
    }
}