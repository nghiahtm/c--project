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
    
    public partial class Order_detail
    {
        public int ID_Order_detail { get; set; }
        public Nullable<int> ID_Order { get; set; }
        public Nullable<int> ID_Product { get; set; }
        public Nullable<int> Quantity { get; set; }
        public Nullable<double> Price { get; set; }
    
        public virtual Order Order { get; set; }
    }
}
