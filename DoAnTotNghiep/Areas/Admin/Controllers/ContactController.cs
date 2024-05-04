using DoAnTotNghiep.Data;
using DoAnTotNghiep.Models;
using DoAnTotNghiep.Models.DTO;
using PagedList;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DoAnTotNghiep.Areas.Admin.Controllers
{
    public class ContactController : BaseController
    {
        QLBanCayCanhEntities db = new QLBanCayCanhEntities();
        // GET: Admin/Contact
        public ActionResult Index(Data.Filter filter)
        {
            ViewData["Filter"] = filter;
            var models = (from c in db.Contacts
                          join u in db.Userrs on c.Updated_by equals u.ID_User
                          select new ContactDTO
                          {
                              UpdatedUserName = u.UserName,
                              Updated_by = c.Updated_by,
                              Created_at = c.Created_at,
                              Email = c.Email,
                              Flag = c.Flag,
                              Fullname= c.Fullname,
                              ID_Contact = c.ID_Contact,
                              Messagee = c.Messagee,
                              Reply = c.Reply,
                              Status = c.Status,
                              Updated_at = c.Updated_at
                          });

            if (!string.IsNullOrEmpty(filter.Keyword))
                models = models.Where(t => t.Fullname.ToUpper().Trim().Contains(filter.Keyword.ToUpper().Trim()) || 
                                            t.Email.ToUpper().Trim().Contains(filter.Keyword.ToUpper().Trim()) ||
                                            t.UpdatedUserName.ToUpper().Trim().Contains(filter.Keyword.ToUpper().Trim()));

            return View(models.OrderBy(t => t.Created_at).ToPagedList(filter.PageIndex, filter.PageSize));
        }

        [HttpGet]
        public ActionResult Create()
        {
            return View(new Contact());
        }

        [HttpPost]
        public ActionResult Create(Contact model)
        {
            if (ModelState.IsValid)
            {
                db.Contacts.Add(model);
                db.SaveChanges();

                return RedirectToAction("Index");
            }
            return View(model);
        }

        [HttpGet]
        public ActionResult Edit(int id)
        {
            var model = db.Contacts.Find(id);

            return View(model);
        }

        [HttpPost]
        public ActionResult Edit(int id, Contact model)
        {
            var admin = (Userr)Session["admin_use"];
            var modelInit = db.Contacts.Find(id);
            if (ModelState.IsValid)
            {
                if(!string.IsNullOrEmpty(model.Reply))
                    modelInit.Flag = (int)ContactFlagStatus.Tra_Loi;
                else modelInit.Flag = (int)ContactFlagStatus.Lien_He;

                modelInit.Email = model.Email;
                modelInit.Updated_by = admin.ID_User;
                modelInit.Updated_at = DateTime.Now;
                modelInit.Reply = model.Reply;
                modelInit.Messagee = model.Messagee;
                modelInit.Fullname = model.Fullname;
                modelInit.Status = (int)ContactStatus.An;

                db.Contacts.AddOrUpdate(modelInit);
                db.SaveChanges();

                return RedirectToAction("Index");
            }
            return View(model);
        }

        public ActionResult Delete(int id)
        {
            var model = db.Contacts.Find(id);
            if (model == null)
                return RedirectToAction("Index");

            db.Contacts.Remove(model);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult UpdateStatus(int id, int status)
        {
            var model = db.Contacts.Find(id);
            if (model == null)
                return RedirectToAction("Index");

            model.Status = status;
            db.Contacts.AddOrUpdate(model);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}