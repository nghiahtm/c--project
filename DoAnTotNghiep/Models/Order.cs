//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DoAnTotNghiep.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Order
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Order()
        {
            this.Order_detail = new HashSet<Order_detail>();
        }
    
        public int ID_Order { get; set; }
        public Nullable<int> ID_User { get; set; }
        public Nullable<double> Total_money { get; set; }
        public string payment_method { get; set; }
        public Nullable<double> Shipping_fee { get; set; }
        public Nullable<bool> Payment_Status { get; set; }
        public Nullable<int> Order_Status { get; set; }
        public Nullable<System.DateTime> Date_Order { get; set; }
        public string Date_Payment { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Order_detail> Order_detail { get; set; }
        public virtual Userr Userr { get; set; }
    }
}
