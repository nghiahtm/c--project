using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DoAnTotNghiep.Data
{
    public class Filter
    {
        public string Keyword { get; set; }
        public int PageIndex { get; set; } = 1;
        public int PageSize { get; set; } = 10;
        public string Framework { get; set; } = "";
        public int Category { get; set; } = 0;
        public int Sort { get; set; } = 0;
        public int MoneyStart { get; set; } = 0;
        public int MoneyEnd { get; set; } = 0;

        public string Role { get; set; }
    }
}