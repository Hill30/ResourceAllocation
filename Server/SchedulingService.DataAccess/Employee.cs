//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SchedulingService.DataAccess
{
    using System;
    using System.Collections.Generic;
    
    public partial class Employee
    {
        public Employee()
        {
            this.EmployeeNotes = new HashSet<EmployeeNote>();
            this.Schedules = new HashSet<Schedule>();
            this.Teams = new HashSet<Team>();
        }
    
        public int Id { get; set; }
        public Nullable<int> ExtId { get; set; }
        public int BranchId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Phone { get; set; }
        public string Address { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string Zip { get; set; }
        public bool IsAmpUser { get; set; }
        public bool PseudoPerson { get; set; }
    
        public virtual Branch Branch { get; set; }
        public virtual ICollection<EmployeeNote> EmployeeNotes { get; set; }
        public virtual ICollection<Schedule> Schedules { get; set; }
        public virtual ICollection<Team> Teams { get; set; }
    }
}
