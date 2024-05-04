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
    public class CategoryController : BaseController
    {
        QLBanCayCanhEntities db = new QLBanCayCanhEntities();
        // GET: Admin/Category
        public ActionResult Index(Data.Filter filter)
        {
            ViewData["Filter"] = filter;
            var models = db.Categories.ToList();

            if (!string.IsNullOrEmpty(filter.Keyword))
                models = models.Where(t => t.Category1.ToUpper().Trim().Contains(filter.Keyword.ToUpper().Trim())).ToList();

            return View(models.OrderBy(t => t.Category1).ToPagedList(filter.PageIndex, filter.PageSize));
        }

        [HttpGet]
        public ActionResult Create()
        {
            return View(new Category());
        }

        [HttpPost]
        public ActionResult Create(Category model)
        {
            if(ModelState.IsValid)
            {
                db.Categories.Add(model);
                db.SaveChanges();

                return RedirectToAction("Index");
            }
            return View(model);
        }

        [HttpGet]
        public ActionResult Edit(int id)
        {
            var model = db.Categories.Find(id);

            return View(model);
        }

        [HttpPost]
        public ActionResult Edit(int id, Category model)
        {
            var modelInit = db.Categories.Find(id);
            if (ModelState.IsValid)
            {
                modelInit.Category1 = model.Category1;

                db.Categories.AddOrUpdate(modelInit);
                db.SaveChanges();

                return RedirectToAction("Index");
            }
            return View(model);
        }

        public ActionResult Delete(int id)
        {
            var model = db.Categories.Find(id);
            if(model == null)
                return RedirectToAction("Index");

            db.Categories.Remove(model);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}