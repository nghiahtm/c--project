using DoAnTotNghiep.Data;
using DoAnTotNghiep.Models;
using DoAnTotNghiep.Models.DTO;
using PagedList;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web.Mvc;

namespace DoAnTotNghiep.Areas.Admin.Controllers
{
    public class OrderController : BaseController
    {
        QLBanCayCanhEntities db = new QLBanCayCanhEntities();
        public ActionResult Index(Data.Filter filter)
        {
            ViewData["Filter"] = filter;
            var models =  (from o in db.Orders
                           join u in db.Userrs on o.ID_User equals u.ID_User
                           select new OrderDTO
                           {
                               ID_User = o.ID_User,
                                Address = u.User_Address,
                                Date_Order = o.Date_Order,
                                Date_Payment = o.Date_Payment,
                                Email = u.Email,
                                ID_Order = o.ID_Order,
                                Order_Status = o.Order_Status.Value,
                                payment_method = o.payment_method,
                                Payment_Status = o.Payment_Status.Value,
                                Phone = u.Phone,
                                Shipping_fee = o.Shipping_fee,
                                Total_money = o.Total_money,
                                Username = u.UserName   
                           }).ToList();

            if (!string.IsNullOrEmpty(filter.Keyword))
                models = models.Where(t => t.Username.ToUpper().Trim().Contains(filter.Keyword.ToUpper().Trim()) ||
                                            t.Email.ToUpper().Trim().Contains(filter.Keyword.ToUpper().Trim())).ToList();

            return View(models.OrderBy(t => t.Date_Order).ToPagedList(filter.PageIndex, filter.PageSize));
        }

        public ActionResult UpdateStatus(int id, int status)
        {
            var model = db.Orders.Find(id);
            if (model == null)
                return RedirectToAction("Index");

            if (status == (int)OrderStatus.Da_Hoan_Thanh)
                model.Payment_Status = true;

            model.Order_Status = status;

            db.Orders.AddOrUpdate(model);
            db.SaveChanges();

            return RedirectToAction("Index");
        }
    }
}