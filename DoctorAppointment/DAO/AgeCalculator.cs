using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DoctorAppointment.DAO
{
    public class AgeCalculator
    {
        public string GetAge(string birthDate)
        {
            if (string.IsNullOrEmpty(birthDate))
            {
                return "No Age Record Found.";
            }
            else
            {
                DateTime today = DateTime.Today;
                DateTime dob = Convert.ToDateTime(birthDate);
                int age = today.Year - dob.Year;
                int month = today.Month - dob.Month;

                if (dob > today.AddMonths(-month))
                    month--;

                if (dob > today.AddYears(-age))
                    age--;
                return (age + " Years And " + month + " Month").ToString();
                
            }
        }
        
    }
}