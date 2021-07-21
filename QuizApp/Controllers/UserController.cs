using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QuizApp.Controllers
{
    public class UserController : Controller
    {
        // GET: User
        public ActionResult Index()
        {
            quiz_webappEntities entities = new quiz_webappEntities();
            var users = entities.users.ToList();

            return View(users);
        }
    }
}