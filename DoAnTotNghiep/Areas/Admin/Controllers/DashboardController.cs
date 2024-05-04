using DoAnTotNghiep.Data;
using DoAnTotNghiep.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DoAnTotNghiep.Areas.Admin.Controllers
{
    public class DashboardController : BaseController
    {
        QLBanCayCanhEntities db = new QLBanCayCanhEntities();
        // GET: Admin/Home
        public ActionResult Index()
        {
            ViewBag.CountOrderSuccess = db.Orders.Where(m => m.Order_Status == (int)OrderStatus.Da_Hoan_Thanh).Count();
            ViewBag.CountOrderCancel = db.Orders.Where(m => m.Order_Status == (int)OrderStatus.Da_Dat_Hang).Count();
            ViewBag.CountContactDoneReply = db.Contacts.Where(m => m.Flag == 0).Count();
            ViewBag.CountUser = db.Userrs.Count();
            return View();
        }

        [HttpGet]
        public ActionResult GetStatistical(string fromDate, string toDate)
        {
            var query = (from o in db.Orders
                         where o.Order_Status == (int)OrderStatus.Da_Hoan_Thanh
                         select new
                         {
                            CreatedDate = o.Date_Order,
                            Amount = o.Total_money,
                         }).ToList();
            if (!string.IsNullOrEmpty(fromDate))
            {
                DateTime startDate = DateTime.Parse(fromDate);
                query = query.Where(x => x.CreatedDate >= startDate).ToList();
            }
            if (!string.IsNullOrEmpty(toDate))
            {
                DateTime endDate = DateTime.Parse(toDate);
                query = query.Where(x => x.CreatedDate < endDate).ToList();
            }
            var result = query.GroupBy(x => x.CreatedDate.Value.Date).
                Select(x => new
                {
                    Date = x.Key,
                    TotalSell = x.Sum(m => m.Amount),
                }).Select(x => new
                {
                    Date = x.Date,
                    DoanhThu = x.TotalSell,
                }).ToList();
            return Json(new { Data = result }, JsonRequestBehavior.AllowGet);
        }
    }
}