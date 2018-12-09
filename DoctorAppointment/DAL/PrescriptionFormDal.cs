using DoctorAppointment.DAO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace DoctorAppointment.DAL
{
    public class PrescriptionFormDal
    {
        //Getting User Information From DB Using DataAdapter-------->>>
        public DataTable GetPatientInfo(string appointId)
        {
            DataTable patientInfoDt = new DataTable();
            //string appointId = oPatientAppointment.Id.ToString();
            
            string query = "SELECT user_id, appointment_id, name, gender, birth_date FROM UserProfile_T, Appointment_T WHERE user_id = patient_user_id AND appointment_id = '" + appointId + "'";
            
            
            //string query = "SELECT user_id, name, father_name, address, cell_phone, gender, birth_date FROM UserProfile_T, Appointment_T WHERE user_id = patient_user_id AND appointment_id = '" + appointId + "'";
            DatabaseConnection con = new DatabaseConnection();
            try
            {
                SqlDataAdapter patientInfoDa = new SqlDataAdapter(query, con.GetSqlConnection());
                patientInfoDa.Fill(patientInfoDt);
            }
            catch (Exception r)
            {
                patientInfoDt = null;
            }
            finally
            {
                con.CloseConnection();
            }
            return patientInfoDt;
        }
    }
}