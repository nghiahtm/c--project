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
    public class PostController : BaseController
    {
        QLBanCayCanhEntities db = new QLBanCayCanhEntities();
        // GET: Admin/Post
        public ActionResult Index(Data.Filter filter)
        {
            ViewData["Filter"] = filter;
            var models = ( from p in db.Posts
                           join c in db.CategoryPosts on p.ID_CategoryP equals c.ID_CategoryP
                           select new PostDTO
                           {
                               Category_Name = c.CategoryP,
                               ID_CategoryP = p.ID_CategoryP.Value,
                               Content = p.Content,
                               Date_post = p.Date_post,
                               ID_Post = p.ID_Post,
                               Post_image = p.Post_image,
                               Post_Name = p.Post_Name,
                               Post_Summary = p.Post_Summary
                           });

            if (!string.IsNullOrEmpty(filter.Keyword))
                models = models.Where(t => t.Post_Name.ToUpper().Trim().Contains(filter.Keyword.ToUpper().Trim()) ||
                                           t.Category_Name.ToUpper().Trim().Contains(filter.Keyword.ToUpper().Trim()));

            return View(models.OrderByDescending(t => t.Date_post).ToPagedList(filter.PageIndex, filter.PageSize));
        }

        [HttpGet]
        public ActionResult Create()
        {
            var model = new Post();
            ViewBag.Categories = new SelectList(db.CategoryPosts.OrderBy(s => s.CategoryP).ToList()
                , "ID_CategoryP", "CategoryP", model.ID_CategoryP);
            return View(model);
        }

        [HttpPost]
        public ActionResult Create(Post model)
        {
            ViewBag.Categories = new SelectList(db.CategoryPosts.OrderBy(s => s.CategoryP).ToList()
                , "ID_CategoryP", "CategoryP", model.ID_CategoryP);

            if (ModelState.IsValid)
            {
                ResponseUpload uploadModel = Constant.UploadFile(model.Post_image);
                if (!uploadModel.Success)
                {
                    ModelState.AddModelError("Post_image", "Select Image");
                    return View(model);
                }

                model.Post_image = uploadModel.Path;
                model.Date_post = DateTime.Now;

                db.Posts.Add(model);
                db.SaveChanges();

                return RedirectToAction("Index");
            }
            return View(model);
        }

        [HttpGet]
        public ActionResult Edit(int id)
        {
            var model = db.Posts.Find(id);
            ViewBag.Categories = new SelectList(db.CategoryPosts.OrderBy(s => s.CategoryP).ToList()
                , "ID_CategoryP", "CategoryP", model.ID_CategoryP);
            return View(model);
        }

        [HttpPost]
        public ActionResult Edit(int id, Post model)
        {
            var modelInit = db.Posts.Find(id);
            ViewBag.Categories = new SelectList(db.CategoryPosts.OrderBy(s => s.CategoryP).ToList()
                , "ID_CategoryP", "CategoryP", model.ID_CategoryP);
            if (ModelState.IsValid)
            {
                if (!string.IsNullOrEmpty(model.Post_image) && modelInit.Post_image != model.Post_image)
                {
                    ResponseUpload uploadModel = Constant.UploadFile(model.Post_image);
                    if (!uploadModel.Success)
                    {
                        ModelState.AddModelError("Post_image", "Select Image");
                        return View(model);
                    }
                    modelInit.Post_image = uploadModel.Path;
                }

                modelInit.Post_Name = model.Post_Name;
                modelInit.Post_Summary = model.Post_Summary;
                modelInit.ID_CategoryP = model.ID_CategoryP;
                modelInit.Content = model.Content;

                db.Posts.AddOrUpdate(modelInit);
                db.SaveChanges();

                return RedirectToAction("Index");
            }
            return View(model);
        }

        public ActionResult Delete(int id)
        {
            var model = db.Posts.Find(id);
            if (model == null)
                return RedirectToAction("Index");

            db.Posts.Remove(model);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}