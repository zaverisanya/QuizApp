using QuizApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QuizApp.Controllers
{
    public class QuizAttemptController : Controller
    {
        private quiz_webappEntities db = new quiz_webappEntities();
        // GET: QuizAttempt
        public ActionResult Attempt(int id)
        {
            quiz_summary qs;
            quizAttemptModel model = new quizAttemptModel();
            model.QuizID = id;
            var user_id = db.users.Where(d => d.email == Helper.Username).FirstOrDefault().user_id;
            bool HasAttempted = db.quiz_summary.Where(d => d.quiz_id == id && d.user_id == user_id).Any();
            if (!HasAttempted)
            {
                qs = new quiz_summary();
                qs.user_id = user_id;
                qs.quiz_id = id;
                var current_question = db.quiz_questions.Include("question").Where(d => d.quizid == id).OrderBy(d => d.id).Select(d => d.question).FirstOrDefault();
                model.Question = current_question;
                var options = db.options.Where(d => d.question_id == current_question.id).ToList();
                model.Options = new List<quizAttemptOptions>();
                qs.current_question_id = current_question.id;
                foreach (var option in options)
                {
                    var qo = new quizAttemptOptions();
                    qo.OptionID = option.id;
                    qo.OptionText = option.choice_text;
                    qo.IsSelected = false;
                    model.Options.Add(qo);
                }
                db.quiz_summary.Add(qs);
                db.SaveChanges();
            }
            else
            {
                qs = db.quiz_summary.Where(d => d.quiz_id == id && d.user_id == user_id).FirstOrDefault();
                var next_question = db.quiz_questions.Include("question").Where(d => d.quizid == id && d.questionid > qs.current_question_id).OrderBy(d => d.id).Any();
                if (next_question)
                {
                    var current_question = db.quiz_questions.Include("question").Where(d => d.quizid == id && d.questionid > qs.current_question_id).OrderBy(d => d.id).Select(d => d.question).FirstOrDefault();
                    var options = db.options.Where(d => d.question_id == current_question.id).ToList();
                    model.Options = new List<quizAttemptOptions>();
                    foreach (var option in options)
                    {
                        var qo = new quizAttemptOptions();
                        qo.OptionID = option.id;
                        qo.OptionText = option.choice_text;
                        qo.IsSelected = false;
                        model.Options.Add(qo);
                    }
                    qs.current_question_id = current_question.id;
                    db.SaveChanges();
                    model.Question = current_question;
                    model.QuizID = id;
                }
                else
                {
                    return View("ThankYou");
                }

            }
            return View(model);

        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult Attempt(quizAttemptModel model)
        {
            var question_id = model.Question.id;
            var user_id = db.users.Where(d => d.email == Helper.Username).FirstOrDefault().user_id;

            var qr = new quiz_response();
            qr.user_id = user_id;
            qr.question_id = model.Question.id;
            qr.option_id = model.SelectedOptionID;
            qr.quiz_id = model.QuizID;
            db.quiz_response.Add(qr);
            db.SaveChanges();
            return RedirectToAction("Attempt", new { @id = model.QuizID });
        }

        /// <summary>
        /// This method generates the leaderboard
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        
        public ActionResult LeaderBoard(int? id)
        {         
            if (id.HasValue == false)
            {
                id = db.quizs.Where(d => d.start_time < DateTime.Now).OrderByDescending(d => d.start_time).Take(1).FirstOrDefault().id;
            }

            List<LeaderBoardModel> modelList = new List<LeaderBoardModel>();
            List<int> users = new List<int>();
            var responses = db.quiz_response.Where(d => d.quiz_id == id).ToList();
            foreach (var response in responses)
            {
                if (!users.Contains(response.user_id))
                {
                    users.Add(response.user_id);
                }
            }
            foreach (var userId in users)
            {
                LeaderBoardModel model = new LeaderBoardModel();
             
                model.QuizID = id.Value;
                model.UserId = userId;
                model.UserName = db.users.Where(d => d.user_id == userId).FirstOrDefault().username; 
                model.PointsObtained = 0;
                var selectedOptions = db.quiz_response.Where(d => d.quiz_id == id && d.user_id == userId).Select(d => d.option_id).ToList();
                
                foreach (var option in selectedOptions)
                {
                    var isCorrectAnswer = db.quiz_response.Include("Option").Where(d => d.option_id == option).Select(d => d.option.iscorrect).FirstOrDefault();
                    var selectedQuestion = db.options.Include("Question").Where(d => d.id == option).Select(d => d.question).FirstOrDefault();
                    if (isCorrectAnswer)
                    {
                        model.PointsObtained += selectedQuestion.points;
                    }
                    else
                    {
                        model.PointsObtained -= selectedQuestion.negative_points;
                    }
                }
                modelList.Add(model);

            }
            if (modelList.Count() <= 0)
            {
                return View("Nil");
            }

            return View(modelList.OrderByDescending(d=>d.PointsObtained).ToList());
        }


    }

}
