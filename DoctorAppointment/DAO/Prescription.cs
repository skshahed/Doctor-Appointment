using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DoctorAppointment.DAO
{
    public class Prescription
    {
        public int Id { get; set; }
        public int AppointmentId { get; set; }
        public string PatientDisease { get; set; }
        public string DoctorAdvice { get; set; }
    }
}