//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Absent_MG
{
    using System;
    using System.Collections.Generic;
    
    public partial class section
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public section()
        {
            this.excute = new HashSet<excute>();
            this.student = new HashSet<student>();
        }
    
        public int sec_Id { get; set; }
        public string sec_name { get; set; }
        public Nullable<int> st_stack { get; set; }
        public Nullable<int> cr_id { get; set; }
    
        public virtual course_schedu course_schedu { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<excute> excute { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<student> student { get; set; }
    }
}
