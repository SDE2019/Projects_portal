using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ProjectProgressMonitoringSystem.Models;
using ProjectProgressMonitoringSystem.ViewModel;

namespace ProjectProgressMonitoringSystem.Controllers
{
    public class AdminViewController : Controller
    {
        // GET: AdminView
        public ActionResult Adminview()
        {
            ProjectProgressMonitoringSystemEntities obj = new ProjectProgressMonitoringSystemEntities();
            var mymodel = new TeacherStudentList();
            return View(mymodel);
        }
    }
}