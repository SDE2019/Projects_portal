using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ProjectProgressMonitoringSystem.Models;
namespace ProjectProgressMonitoringSystem.ViewModel
{
    public class ViewStudentDetails
    {
        public IEnumerable<Student> Students { get; set; }
    }
}