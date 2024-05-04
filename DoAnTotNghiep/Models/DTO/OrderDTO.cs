using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DoAnTotNghiep.Models.DTO
{
    public class OrderDTO
    {
        public int ID_Order { get; set; }
        public Nullable<int> ID_User { get; set; }
        public string Username { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Address { get; set; }
        public Nullable<double> Total_money { get; set; }
        public string payment_method { get; set; }
        public Nullable<double> Shipping_fee { get; set; }
        public bool Payment_Status { get; set; }
        public int Order_Status { get; set; }
        public Nullable<System.DateTime> Date_Order { get; set; }
        public string Date_Payment { get; set; }
    }
}