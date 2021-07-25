using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuizApp.Models
{
    public class LeaderBoardModel
    {
        public int UserId { get; set; }
        public string UserName { get; set; }
        public int QuizID { get; set; }
        public string QuizName { get; set; }
        public decimal PointsObtained { get; set; }
    }   
}