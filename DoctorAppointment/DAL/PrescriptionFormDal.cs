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

        /****** Save User Information and Appointment*******/
        public bool InsertPrescription(Prescription oPrescription)
        {
            bool isSuccess = false;
            string appointId = Convert.ToString(oPrescription.AppointmentId);
            //string query = "";
            //DateTime nowDtTm = DateTime.Now;
            //if (string.IsNullOrEmpty(oPatientAppointment.PatientUserId.ToString()))
            //{
            //    isPatientId = "";
            //}
            //else
            //{
            //    isPatientId = Convert.ToString(oPatientAppointment.PatientUserId);
            //}
            DatabaseConnection con = new DatabaseConnection();
            //if (Convert.ToInt32(isPatientId) == 0)
            //{
            //    query = "INSERT INTO UserProfile_T(name, cell_phone) VALUES ('" + oUserProfile.Name + "', '" + oUserProfile.PhoneNo + "');SELECT @@IDENTITY";
            //    try
            //    {
            //        SqlCommand cmd = new SqlCommand(query, con.GetSqlConnection());
            //        isPatientId = Convert.ToString(cmd.ExecuteScalar());
            //        string query2 = "INSERT INTO Appointment_T(patient_user_id, doctor_user_id, appoint_date, reserve_date) VALUES ('" + isPatientId + "', '" + oPatientAppointment.DoctorUserId + "', '" + oPatientAppointment.AppointDate + "', GETDATE())";
            //        try
            //        {
            //            SqlCommand cmd2 = new SqlCommand(query2, con.GetSqlConnection());
            //            //cmd.ExecuteNonQuery();
            //            cmd2.ExecuteNonQuery();
            //            isSuccess = true;
            //        }
            //        catch
            //        {
            //            isSuccess = false;
            //        }
            //    }
            //    catch (Exception r)
            //    {
            //        isSuccess = false;
            //    }
            //}
            //else
            //{
                string query2 = "INSERT INTO Prescription_T(appointment_id, patient_disease, doctor_advice) VALUES ('" + appointId + "', '" + oPrescription.PatientDisease + "', '" + oPrescription.DoctorAdvice + "')";
                try
                {
                    SqlCommand cmd2 = new SqlCommand(query2, con.GetSqlConnection());
                    //cmd.ExecuteNonQuery();
                    cmd2.ExecuteNonQuery();
                    isSuccess = true;
                }
                catch
                {
                    isSuccess = false;
                }
            // }
            finally
            {
                con.CloseConnection();
            }
                

            return isSuccess;
        }
    }
}