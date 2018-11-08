using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace DoctorAppointment.DAO
{
    public class DatabaseConnection
    {
        SqlConnection conDA;
        public SqlConnection GetSqlConnection()
        {
            string conStr = ConfigurationManager.ConnectionStrings["doctorAppConnection"].ToString();
            conDA = new SqlConnection(conStr);
            conDA.Open();
            return conDA;
        }
        public void CloseConnection()
        {
            if(conDA != null)
            {
                conDA.Close();
            }
        }
    }
}