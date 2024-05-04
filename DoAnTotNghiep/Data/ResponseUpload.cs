using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DoAnTotNghiep.Data
{
    public class ResponseUpload
    {
        public string Path { get; set; } = "";
        public string Message { get; set; } = "";
        public bool Success { get; set; }
    }
}