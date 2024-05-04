using DoAnTotNghiep.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DoAnTotNghiep.Areas.Admin.Controllers
{
    public class CategoryPostController : BaseController
    {
        QLBanCayCanhEntities db = new QLBanCayCanhEntities();
        // GET: Admin/CategoryPost
        public ActionResult Index(Data.Filter filter)
        {
            ViewData["Filter"] = filter;
            var models = db.CategoryPosts.ToList();

            if (!string.IsNullOrEmpty(filter.Keyword))
                models = models.Where(t => t.CategoryP.ToUpper().Trim().Contains(filter.Keyword.ToUpper().Trim())).ToList();

            return View(models.OrderBy(t => t.CategoryP).ToPagedList(filter.PageIndex, filter.PageSize));
        }

        [HttpGet]
        public ActionResult Create()
        {
            return View(new CategoryPost());
        }

        [HttpPost]
        public ActionResult Create(CategoryPost model)
        {
            if (ModelState.IsValid)
            {
                db.CategoryPosts.Add(model);
                db.SaveChanges();

                return RedirectToAction("Index");
            }
            return View(model);
        }

        [HttpGet]
        public ActionResult Edit(int id)
        {
            var model = db.CategoryPosts.Find(id);

            return View(model);
        }

        [HttpPost]
        public ActionResult Edit(int id, CategoryPost model)
        {
            var modelInit = db.CategoryPosts.Find(id);
            if (ModelState.IsValid)
            {
                modelInit.CategoryP = model.CategoryP;

                db.CategoryPosts.AddOrUpdate(modelInit);
                db.SaveChanges();

                return RedirectToAction("Index");
            }
            return View(model);
        }

        public ActionResult Delete(int id)
        {
            var model = db.CategoryPosts.Find(id);
            if (model == null)
                return RedirectToAction("Index");

            db.CategoryPosts.Remove(model);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}