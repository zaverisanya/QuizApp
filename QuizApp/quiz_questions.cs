//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace QuizApp
{
    using System;
    using System.Collections.Generic;
    
    public partial class quiz_questions
    {
        public int id { get; set; }
        public Nullable<int> quizid { get; set; }
        public Nullable<int> questionid { get; set; }
    
        public virtual question question { get; set; }
        public virtual quiz quiz { get; set; }
    }
}