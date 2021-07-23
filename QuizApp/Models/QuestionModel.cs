using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuizApp.Models
{
    public class QuestionModel
    {
        public string Question { get; set; }
        public bool IsSelected { get; set; }

        public int QuestionID { get; set; }
    }

}