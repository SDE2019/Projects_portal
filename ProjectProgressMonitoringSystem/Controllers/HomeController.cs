﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProjectProgressMonitoringSystem.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "More about Project Progress Monitoring System";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Contact us at:";

            return View();
        }
    }
}