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
    
    public partial class team_users
    {
        public int id { get; set; }
        public int team_id { get; set; }
        public int user_id { get; set; }
    
        public virtual team team { get; set; }
        public virtual user user { get; set; }
    }
}
