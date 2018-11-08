using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using DoctorAppointment.DAO;

namespace DoctorAppointment.BLL
{
    public class PatientAppointmentBll
    {
       public string GetAppointmentSerial(PatientAppointment oPatientAppointment)
        {
            DAL.PatientAppointmentDal dal = new DAL.PatientAppointmentDal();
            string serialNo = dal.GetSerialNo(oPatientAppointment);
            if (serialNo == null)
            {
                serialNo = "01";
            }
            else
            {
                int temp = Convert.ToInt32(serialNo) + 1;
                if (temp.ToString().Length == 1)
                {
                    serialNo = "0" + temp;
                }
                else
                {
                    serialNo = temp.ToString();
                }
            }
            return serialNo;
        }
    }
}