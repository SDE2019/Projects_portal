using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ProjectProgressMonitoringSystem.Models;

namespace ProjectProgressMonitoringSystem.Controllers
{
    public class MarksController : Controller
    {
        private ProjectProgressMonitoringSystemEntities db = new ProjectProgressMonitoringSystemEntities();

        // GET: Marks
        public ActionResult Index()
        {
            var marks = db.Marks.Include(m => m.Phase).Include(m => m.Project).Include(m => m.Student).Include(m => m.Teacher);
            return View(marks.ToList());
        }

        // GET: Marks/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Mark mark = db.Marks.Find(id);
            if (mark == null)
            {
                return HttpNotFound();
            }
            return View(mark);
        }

        // GET: Marks/Create
        public ActionResult Create()
        {
            ViewBag.ProjectID = new SelectList(db.Phases, "PhaseID", "SubmissionDone");
            ViewBag.ProjectID = new SelectList(db.Projects, "ProjectID", "TeacherID");
            ViewBag.StudentUSN = new SelectList(db.Students, "StudentUSN", "StudentName");
            ViewBag.TeacherID = new SelectList(db.Teachers, "TeacherID", "TeacherName");
            return View();
        }

        // POST: Marks/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Marks,ProjectID,PhaseID,TeacherID,StudentUSN")] Mark mark)
        {
            if (ModelState.IsValid)
            {
                db.Marks.Add(mark);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ProjectID = new SelectList(db.Phases, "PhaseID", "SubmissionDone", mark.ProjectID);
            ViewBag.ProjectID = new SelectList(db.Projects, "ProjectID", "TeacherID", mark.ProjectID);
            ViewBag.StudentUSN = new SelectList(db.Students, "StudentUSN", "StudentName", mark.StudentUSN);
            ViewBag.TeacherID = new SelectList(db.Teachers, "TeacherID", "TeacherName", mark.TeacherID);
            return View(mark);
        }

        // GET: Marks/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Mark mark = db.Marks.Find(id);
            if (mark == null)
            {
                return HttpNotFound();
            }
            ViewBag.ProjectID = new SelectList(db.Phases, "PhaseID", "SubmissionDone", mark.ProjectID);
            ViewBag.ProjectID = new SelectList(db.Projects, "ProjectID", "TeacherID", mark.ProjectID);
            ViewBag.StudentUSN = new SelectList(db.Students, "StudentUSN", "StudentName", mark.StudentUSN);
            ViewBag.TeacherID = new SelectList(db.Teachers, "TeacherID", "TeacherName", mark.TeacherID);
            return View(mark);
        }

        // POST: Marks/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Marks,ProjectID,PhaseID,TeacherID,StudentUSN")] Mark mark)
        {
            if (ModelState.IsValid)
            {
                db.Entry(mark).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ProjectID = new SelectList(db.Phases, "PhaseID", "SubmissionDone", mark.ProjectID);
            ViewBag.ProjectID = new SelectList(db.Projects, "ProjectID", "TeacherID", mark.ProjectID);
            ViewBag.StudentUSN = new SelectList(db.Students, "StudentUSN", "StudentName", mark.StudentUSN);
            ViewBag.TeacherID = new SelectList(db.Teachers, "TeacherID", "TeacherName", mark.TeacherID);
            return View(mark);
        }

        // GET: Marks/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Mark mark = db.Marks.Find(id);
            if (mark == null)
            {
                return HttpNotFound();
            }
            return View(mark);
        }

        // POST: Marks/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            Mark mark = db.Marks.Find(id);
            db.Marks.Remove(mark);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
