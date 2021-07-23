using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using QuizApp;
using QuizApp.Models;

namespace QuizApp.Controllers
{
    public class quizsController : Controller
    {
        private quiz_webappEntities db = new quiz_webappEntities();

        // GET: quizs
        public ActionResult Index()
        {
            return View(db.quizs.ToList());
        }

        public ActionResult Organize(int id)
        {
            var Questions = db.questions.Where(d => d.isactive == true).ToList();
            var model = new OrganizeQuizModel();
            var Quiz = db.quizs.Where(d => d.id == id).FirstOrDefault();
            var SelectedQuestions = db.quiz_questions.Where(d => d.quizid == id).Select(d=>d.questionid).ToList();
            model.Questions = new List<QuestionModel>() ;

            foreach(var question in Questions)
            {
                var QuestionModel = new QuestionModel();

                if (SelectedQuestions.Contains(question.id))
                {
                    QuestionModel.IsSelected = true;
                }
                else
                {
                    QuestionModel.IsSelected = false;
                }
                QuestionModel.Question = question.question1;
                QuestionModel.QuestionID = question.id;
                model.Questions.Add(QuestionModel);
            }
            model.QuizID = id;
            model.QuizName = Quiz.name;
            
            return View(model);
        }

        [HttpPost]
        public ActionResult Organize(OrganizeQuizModel model)
        {
            var SelectedQuestions = model.Questions.Where(d => d.IsSelected == true).ToList();
            var existingQuestions = db.quiz_questions.Where(d => d.quizid == model.QuizID).ToList();
            
            foreach(var question in existingQuestions)
            {
                db.quiz_questions.Remove(question);
            }
            db.SaveChanges();
            foreach(var q in SelectedQuestions)
            {
                if (q.IsSelected == true)
                {
                    quiz_questions qq = new quiz_questions();
                    qq.quizid = model.QuizID;
                    qq.questionid = q.QuestionID;
                    
                    
                    db.quiz_questions.Add(qq);

                }
            }
            db.SaveChanges();
            
            

            
            return RedirectToAction("index");
        }
        public ActionResult Publish(int id)
        {
            var quiz = db.quizs.Where(d => d.id == id).FirstOrDefault();
            quiz.is_published = !quiz.is_published;
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        // GET: quizs/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            quiz quiz = db.quizs.Find(id);
            if (quiz == null)
            {
                return HttpNotFound();
            }
            return View(quiz);
        }

        // GET: quizs/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: quizs/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,name,difficulty_level,rating,start_time,end_time")] quiz quiz)
        {
            if (ModelState.IsValid)
            {
                db.quizs.Add(quiz);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(quiz);
        }

        // GET: quizs/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            quiz quiz = db.quizs.Find(id);
            if (quiz == null)
            {
                return HttpNotFound();
            }
            return View(quiz);
        }

        // POST: quizs/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,name,difficulty_level,rating,start_time,end_time")] quiz quiz)
        {
            if (ModelState.IsValid)
            {
                db.Entry(quiz).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(quiz);
        }

        // GET: quizs/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            quiz quiz = db.quizs.Find(id);
            if (quiz == null)
            {
                return HttpNotFound();
            }
            return View(quiz);
        }

        // POST: quizs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            quiz quiz = db.quizs.Find(id);
            db.quizs.Remove(quiz);
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
