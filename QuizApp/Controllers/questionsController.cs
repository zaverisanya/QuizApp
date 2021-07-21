using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using QuizApp;

namespace QuizApp.Controllers
{
    public class questionsController : Controller
    {
        private quiz_webappEntities db = new quiz_webappEntities();

        // GET: questions
        public ActionResult Index()
        {
            var questions = db.questions.Include(q => q.question_type);
            return View(questions.Where(d => d.isactive == true).ToList());
        }

        // GET: questions/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            question question = db.questions.Find(id);
            if (question == null)
            {
                return HttpNotFound();
            }
            return View(question);
        }

        // GET: questions/Create
        public ActionResult Create()
        {
            ViewBag.question_type_id = new SelectList(db.question_type, "id", "name");
            return View();
        }

        // POST: questions/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,question1,isactive,difficulty_level,question_type_id,points,negative_points")] question question)
        {
            if (ModelState.IsValid)
            {
                db.questions.Add(question);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.question_type_id = new SelectList(db.question_type, "id", "name", question.question_type_id);
            return View(question);
        }

        // GET: questions/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            question question = db.questions.Find(id);
            if (question == null)
            {
                return HttpNotFound();
            }
            ViewBag.question_type_id = new SelectList(db.question_type, "id", "name", question.question_type_id);
            return View(question);
        }

        // POST: questions/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,question1,isactive,difficulty_level,question_type_id,points,negative_points")] question question)
        {
            if (ModelState.IsValid)
            {
                db.Entry(question).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.question_type_id = new SelectList(db.question_type, "id", "name", question.question_type_id);
            return View(question);
        }

        // GET: questions/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            question question = db.questions.Find(id);
            if (question == null)
            {
                return HttpNotFound();
            }
            return View(question);
        }

        // POST: questions/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            question question = db.questions.Find(id);
            question.isactive = false;
            db.Entry(question).State = EntityState.Modified;
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
