using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using DoctorAppointment.DAO;

namespace DoctorAppointment.BLL
{
    public class AppointmentListBll
    {
        public DataTable GetAppointmentList(PatientAppointment oPatientAppointment)
        {
            DAL.AppointmentListDal dal = new DAL.AppointmentListDal();
            //string serialNo = dal.GetSerialNo(oPatientAppointment);
            DataTable appointmentList = dal.AppointLisFromDB(oPatientAppointment);
            return appointmentList;
        }
        public int GetUserNullInfo(string patientId)
        {
            DAL.AppointmentListDal dal = new DAL.AppointmentListDal();
            int nullColumnCount = dal.getNullColumnCount(patientId);
            return nullColumnCount;
        }
    }
}