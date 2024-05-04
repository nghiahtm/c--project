using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DoAnTotNghiep.Models.DTO
{
    public class PostDTO
    {
        public int ID_Post { get; set; }
        public string Post_Name { get; set; }
        public string Post_Summary { get; set; }
        public string Content { get; set; }
        public string Post_image { get; set; }
        public DateTime? Date_post { get; set; }
        public int ID_CategoryP { get; set; }
        public string Category_Name { get; set; }
    }
}