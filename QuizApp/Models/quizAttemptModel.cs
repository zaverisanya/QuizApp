using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuizApp.Models
{
    public class quizAttemptModel
    {
        public question Question { get; set; }
        public List<quizAttemptOptions> Options { get; set; }
        public int SelectedOptionID { get; set; }

        public int QuizID { get; set; }

    }
}