using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DoAnTotNghiep.Models.DTO
{
    public class ContactDTO
    {
        public int ID_Contact { get; set; }
        public string Fullname { get; set; }
        public string Email { get; set; }
        public string Messagee { get; set; }
        public int Flag { get; set; }
        public string Reply { get; set; }
        public int Status { get; set; }
        public System.DateTime Created_at { get; set; }
        public System.DateTime Updated_at { get; set; }
        public int Updated_by { get; set; }
        public string UpdatedUserName { get; set; }
    }
}