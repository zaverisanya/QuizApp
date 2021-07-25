using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuizApp.Models
{
    public class quizAttemptOptions
    {
        public int OptionID { get; set; }
        public string OptionText { get; set; }
        public bool IsSelected { get; set; }

    }
}