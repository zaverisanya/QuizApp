using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuizApp.Models
{
    public class OrganizeQuizModel
    {

        public int QuizID { get; set; }

        public string QuizName { get; set; }
        public List<QuestionModel> Questions { get; set; }

    }
}