using QuizApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QuizApp.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Login()
        {
            LoginModel Model = new LoginModel();
            return View(Model);
        }
        [HttpPost]
        public ActionResult Login(LoginModel model)
        {

            quiz_webappEntities e = new quiz_webappEntities();
            var user = e.users.Where(row => row.email.ToLower() == model.Email.ToLower() && row.password == model.Password);
            if (user != null && user.Count() > 0)
            {
                ViewBag.message = "Login successful";

            }
            else
            {
                ViewBag.message = "Incorrect username or password";
            }
            return View("AfterLogin", model);
        }
        public ActionResult Register()
        {
            RegisterModel Model = new RegisterModel();
            return View(Model);
        }
        [HttpPost]
        public ActionResult Register(RegisterModel registerModel)
        {
            if (ModelState.IsValid)
            {


                quiz_webappEntities entities = new quiz_webappEntities();
                QuizApp.user u = new user();
                u.username = registerModel.UserName;
                u.email = registerModel.Email;
                u.password = registerModel.Password;
                u.isactive = true;
                u.isadmin = false;
                entities.users.Add(u);
                entities.SaveChanges();
            }

            return RedirectToAction("Index");
        }

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}