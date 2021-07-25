using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuizApp.Models
{
    public class UserQuizModel
    {
        public bool Participated { get; set; }
        public int QuizID { get; set; }
        public DateTime StartTime { get; set; }
        public DateTime EndTime { get; set; }
        public int DifficultyLevel { get; set; }
        public String QuizName { get; set; }
        public int Participants { get; set; }

    }
}