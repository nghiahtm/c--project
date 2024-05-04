using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DoAnTotNghiep.Models.DTO
{
    public class ProductDTO
    {
        public int ID_Product { get; set; }
        public string Product_Name { get; set; }
        public int Quantity { get; set; }
        public string Product_Img { get; set; }
        public double Price { get; set; }
        public string Sort_desc { get; set; }
        public string Characteristic { get; set; }
        public string Meaning { get; set; }
        public string Care_tips { get; set; }
        public int ID_Category { get; set; }
        public string Category_Name { get; set; }
        public string Common_Name { get; set; }
        public string Scientific_Name { get; set; }
        public string Plant_family { get; set; }
        public string Origin { get; set; }
    }
}