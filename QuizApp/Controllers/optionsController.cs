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
    public class optionsController : Controller
    {
        private quiz_webappEntities db = new quiz_webappEntities();

        // GET: options
        public ActionResult Index()
        {
            var options = db.options.Include(o => o.question);
            return View(options.ToList());
        }

        // GET: options/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            option option = db.options.Find(id);
            if (option == null)
            {
                return HttpNotFound();
            }
            return View(option);
        }

        // GET: options/Create
        public ActionResult Create()
        {
            ViewBag.question_id = new SelectList(db.questions, "id", "question1");
            return View();
        }

        // POST: options/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,question_id,choice_text,iscorrect")] option option)
        {
            if (ModelState.IsValid)
            {
                db.options.Add(option);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.question_id = new SelectList(db.questions, "id", "question1", option.question_id);
            return View(option);
        }

        // GET: options/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            option option = db.options.Find(id);
            if (option == null)
            {
                return HttpNotFound();
            }
            ViewBag.question_id = new SelectList(db.questions, "id", "question1", option.question_id);
            return View(option);
        }

        // POST: options/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,question_id,choice_text,iscorrect")] option option)
        {
            if (ModelState.IsValid)
            {
                db.Entry(option).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.question_id = new SelectList(db.questions, "id", "question1", option.question_id);
            return View(option);
        }

        // GET: options/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            option option = db.options.Find(id);
            if (option == null)
            {
                return HttpNotFound();
            }
            return View(option);
        }

        // POST: options/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            option option = db.options.Find(id);
            db.options.Remove(option);
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
