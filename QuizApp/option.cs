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
    
    public partial class option
    {
        public int id { get; set; }
        public int question_id { get; set; }
        public string choice_text { get; set; }
        public bool iscorrect { get; set; }
    
        public virtual question question { get; set; }
    }
}
