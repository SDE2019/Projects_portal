using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ProjectProgressMonitoringSystem.Models;
using ProjectProgressMonitoringSystem.ViewModel;
namespace ProjectProgressMonitoringSystem.Controllers
{
    public class CreateGroupController : Controller
    {
        // GET: CreateGroup
        public ActionResult CreateGroup()
        {
            ProjectProgressMonitoringSystemEntities obj = new ProjectProgressMonitoringSystemEntities();
            return View(obj.Students);
        }
        [HttpPost]
        public ActionResult CreateGroup(string searchTerm)
        {

            ProjectProgressMonitoringSystemEntities obj = new ProjectProgressMonitoringSystemEntities();
            List<Student> students;
            students = obj.Students.Where(x => x.Semester.StartsWith(searchTerm)).ToList();
            return View(students);
        }
    }
}