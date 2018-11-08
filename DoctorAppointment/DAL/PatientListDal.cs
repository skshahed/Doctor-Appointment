using DoctorAppointment.DAO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace DoctorAppointment.DAL
{
    public class PatientListDal
    {
//Getting Patient List From DB Using DataAdapter-------->>>
        public DataTable PatientLisFromDB(UserProfile oUserProfile)
        {
            DataTable patientListDt = new DataTable();
            string searchInfo = oUserProfile.Name.ToString();
            //string query = "SELECT * FROM Appointment_T WHERE appoint_date = '" + appointDate + "'";
            string query = "SELECT ROW_NUMBER() OVER (ORDER BY user_id DESC) AS serial_no, user_id, name, cell_phone, address FROM UserProfile_T WHERE name LIKE '" + "%" + searchInfo + "%" + "' OR cell_phone LIKE '" + "%" + searchInfo + "%" + "' OR address LIKE '" + "%" + searchInfo + "%" + "'";
            DatabaseConnection con = new DatabaseConnection();
            try
            {
                SqlDataAdapter patientListDa = new SqlDataAdapter(query, con.GetSqlConnection());
                patientListDa.Fill(patientListDt);
            }
            catch (Exception r)
            {
                patientListDt = null;
            }
            finally
            {
                con.CloseConnection();
            }
            return patientListDt;
        }
    }
}