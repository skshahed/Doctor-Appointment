using DoctorAppointment.DAO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace DoctorAppointment.DAL
{
    public class AppointmentListDal
    {
//Getting Appointment List From DB Using DataAdapter-------->>>
        public DataTable AppointLisFromDB(PatientAppointment oPatientAppointment)
        {
            DataTable appointmentListDt = new DataTable();
            string appointDate = oPatientAppointment.AppointDate.ToString();
            //string query = "SELECT * FROM Appointment_T WHERE appoint_date = '" + appointDate + "'";
            string query = "SELECT ROW_NUMBER() OVER (ORDER BY appointment_id DESC) AS serial_no, appointment_id,patient_user_id, name, cell_phone FROM UserProfile_T, Appointment_T WHERE user_id = patient_user_id AND appoint_date = '" + appointDate + "'";
            DatabaseConnection con = new DatabaseConnection();
            try
            {
                SqlDataAdapter appointmentListDa = new SqlDataAdapter(query, con.GetSqlConnection());
                appointmentListDa.Fill(appointmentListDt);
            }
            catch (Exception r)
            {
                appointmentListDt = null;
            }
            finally
            {
                con.CloseConnection();
            }
            return appointmentListDt;
        }

 //Get count of user null columns
        public int getNullColumnCount(string userId)
        {
            int countNull = 0;
            DatabaseConnection con = new DatabaseConnection();
            string sql = "SELECT ((CASE WHEN father_name IS NULL THEN 1 ELSE 0 END) + (CASE WHEN address IS NULL THEN 1 ELSE 0 END) + (CASE WHEN gender IS NULL THEN 1 ELSE 0 END) + (CASE WHEN birth_date IS NULL THEN 1 ELSE 0 END)) AS countNull FROM UserProfile_T where user_id='" + userId + "'";
            try
            {
                SqlCommand cmd = new SqlCommand(sql, con.GetSqlConnection());
                int count = (Int32)cmd.ExecuteScalar();
                countNull = count;
            }
            catch (Exception r)
            {
                //countNull = 0;
            }
            finally
            {
                con.CloseConnection();
            }
            return countNull;
        }
    }
}