using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DoctorAppointment.DAO
{
    public class DoctorInfo
    {
        public int Id { get; set; }
        public int DoctorUserId { get; set; }
        public int DocCatId { get; set; }
        public decimal VisitTimeStart { get; set; }
        public int VisitDelay { get; set; }
        public int PatientPerDay { get; set; }
        public int AppointRoom { get; set; }
    }
}