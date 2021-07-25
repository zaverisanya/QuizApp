using QuizApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace QuizApp.Controllers
{
    public class HomeController : Controller
    {
        private quiz_webappEntities db = new quiz_webappEntities();
        public ActionResult Login()
        {
            LoginModel Model = new LoginModel();
            return View(Model);
        }
        public ActionResult QuizMasterlogin()
        {
            return View();
        }
        public ActionResult UserLogin()
        {
            var quizzes = db.quizs.Where(d => (d.start_time <= DateTime.Now || d.start_time > DateTime.Now) && d.end_time>DateTime.Now && d.is_published==true).OrderBy(d => d.start_time).Take(3);
            List<UserQuizModel> userquizzes = new List<UserQuizModel>();
            var user_id = db.users.Where(d => d.email == Helper.Username).FirstOrDefault().user_id;
            foreach(var quiz in quizzes)
            {
                UserQuizModel uq = new UserQuizModel();
                uq.QuizID = quiz.id;
                uq.QuizName = quiz.name;
                uq.StartTime = quiz.start_time;
                uq.EndTime = quiz.end_time;
                uq.DifficultyLevel = quiz.difficulty_level;
                uq.Participants = db.quiz_users.Where(d => d.quiz_id == quiz.id).Count();
                uq.Participated = db.quiz_users.Where(d => d.quiz_id == quiz.id && d.user_id == user_id).Any();
                userquizzes.Add(uq);
            }

            return View(userquizzes);
        }

        public ActionResult Participate(int id)
        {
            var qu = new quiz_users();
            qu.user_id = db.users.Where(d => d.email == Helper.Username).FirstOrDefault().user_id;
            qu.quiz_id = id;
            var participate = db.quiz_users.Add(qu);
            db.SaveChanges();
            return RedirectToAction("../Home/UserLogin");
        }
        public ActionResult Logout()
        {
            
            FormsAuthentication.SignOut();
            Session.Abandon();
            return RedirectToAction("Index");
        }
        [HttpPost]
        public ActionResult Login(LoginModel model)
        {

            quiz_webappEntities e = new quiz_webappEntities();
            var user = e.users.Where(row => row.email.ToLower() == model.Email.ToLower() && row.password == model.Password);
            bool IsAdmin = e.users.Any(d => d.email==model.Email && d.isadmin==true);
            if (user != null && user.Count() > 0)
            {
                FormsAuthentication.SetAuthCookie(user.FirstOrDefault().email, false);
                Helper.Username = user.FirstOrDefault().email;
                if (IsAdmin == true)
                {
                    Helper.isAdmin = true;
                    return RedirectToAction("QuizMasterlogin");
                }
                else
                {
                    return RedirectToAction("UserLogin");
                }
                

            }
            else
            {
                model.Error = "Incorrect username or password";
            }
            return View("Login", model);
        }
        public ActionResult Register()
        {
            RegisterModel model= new RegisterModel();
            return View(model);
        }
       
        [HttpPost]
        public ActionResult Register(RegisterModel registerModel)
        {
            quiz_webappEntities entities = new quiz_webappEntities();
            bool IsUserExist = entities.users.Any(d => d.username == registerModel.UserName );
            bool IsUserEmailExist = entities.users.Any(d => d.email == registerModel.Email);
            if (ModelState.IsValid)
            {
                if (IsUserExist == true || IsUserEmailExist == true)
                {
                  registerModel.Error= "Username or email is not unique";

                    return View(registerModel);
                }
                else
                {
                    QuizApp.user u = new user();
                    u.username = registerModel.UserName;
                    u.email = registerModel.Email;
                    u.password = registerModel.Password;
                    u.isactive = true;
                    u.isadmin = false;
                    entities.users.Add(u);
                    entities.SaveChanges();
                }
                
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