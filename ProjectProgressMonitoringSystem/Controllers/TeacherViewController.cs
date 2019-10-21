using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ProjectProgressMonitoringSystem.Models;
using ProjectProgressMonitoringSystem.ViewModel;
namespace ProjectProgressMonitoringSystem.Controllers
{
    public class TeacherViewController : Controller
    {
        // GET: TeacherView
        public ActionResult TeacherView()
        {
            ProjectProgressMonitoringSystemEntities obj = new ProjectProgressMonitoringSystemEntities();
            var mymodel = new TeacherView();
            return View(mymodel);
           
        }
    }
}