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
    
    public partial class question
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public question()
        {
            this.options = new HashSet<option>();
            this.quiz_questions = new HashSet<quiz_questions>();
            this.quiz_response = new HashSet<quiz_response>();
            this.quiz_summary = new HashSet<quiz_summary>();
        }
    
        public int id { get; set; }
        public string question1 { get; set; }
        public bool isactive { get; set; }
        public short difficulty_level { get; set; }
        public int question_type_id { get; set; }
        public decimal points { get; set; }
        public decimal negative_points { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<option> options { get; set; }
        public virtual question_type question_type { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<quiz_questions> quiz_questions { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<quiz_response> quiz_response { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<quiz_summary> quiz_summary { get; set; }
    }
}
