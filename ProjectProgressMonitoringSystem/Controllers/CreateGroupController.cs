using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ProjectProgressMonitoringSystem.Models;
using ProjectProgressMonitoringSystem.ViewModel;

namespace ProjectProgressMonitoringSystem.Controllers
{
    public class CreateGroupController : Controller
    {
        ProjectProgressMonitoringSystemEntities db = new ProjectProgressMonitoringSystemEntities();
        // GET: CreateGroup1
        public ActionResult Index()
        {
            ViewBag.StudentUSN = new SelectList(db.Students, "StudentUSN", "StudentUSN");
            return View();
        }
        [HttpPost]
        public ActionResult Index(CreateGroup1 createGroup)
        {
            return RedirectToAction("NextPage", "CreateGroup", new { StudentUSN = createGroup.StudentUSN });
        }

        [HttpGet]
        public ActionResult NextPage()
        {
            ViewBag.TeacherID = new SelectList(db.Teachers, "TeacherID", "TeacherName");
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult NextPage([Bind(Include = "ProjectID,TeacherID,ProjectTitle,ProjectGenre")] Project project)
        {
            if (ModelState.IsValid)
            {
                db.Projects.Add(project);
                db.SaveChanges();
                return RedirectToAction("Details");
            }

            ViewBag.TeacherID = new SelectList(db.Teachers, "TeacherID", "TeacherName", project.TeacherID);

           /* Project dbproject = db.Projects.FirstOrDefault(x => x.ProjectID == "1");
            db.Students.FirstOrDefault(x => x.StudentUSN == "1RN17CS022").Projects.Add(dbproject);
            db.SaveChanges();*/
            return View();
        }
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Project project = db.Projects.Find(id);
            if (project == null)
            {
                return HttpNotFound();
            }
            return View(project);
        }
      
            
    }
}