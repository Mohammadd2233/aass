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
    
    public partial class student
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public student()
        {
            this.excute = new HashSet<excute>();
            this.st_cr = new HashSet<st_cr>();
        }
    
        public int st_Id { get; set; }
        public string name { get; set; }
        public string email { get; set; }
        public Nullable<decimal> phone { get; set; }
        public string major { get; set; }
        public Nullable<int> cr_id { get; set; }
        public Nullable<int> sec_id { get; set; }
    
        public virtual course_schedu course_schedu { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<excute> excute { get; set; }
        public virtual section section { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<st_cr> st_cr { get; set; }
    }
}
