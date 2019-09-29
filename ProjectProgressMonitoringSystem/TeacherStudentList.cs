using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ProjectProgressMonitoringSystem.Models;
namespace ProjectProgressMonitoringSystem.ViewModel
{
    public class TeacherStudentList
    {
        public IEnumerable<Student> Students { get; set; }
        public IEnumerable<Teacher> Teachers { get; set; }
    }
}