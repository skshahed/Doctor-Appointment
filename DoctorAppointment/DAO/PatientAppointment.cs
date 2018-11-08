using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DoctorAppointment.DAO
{
    public class PatientAppointment
    {
        public int Id { get; set; }
        public int PatientUserId { get; set; }
        public int DoctorUserId { get; set; }
        public string AppointDate { get; set; }
        public string ReserveDate { get; set; }
        public string DoctorName { get; set; }
        public decimal VisitTime { get; set; }
        public int AppointSuccess { get; set; }

    }
}