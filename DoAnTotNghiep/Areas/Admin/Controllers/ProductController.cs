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
    public class ProductController : BaseController
    {
        QLBanCayCanhEntities db = new QLBanCayCanhEntities();
        // GET: Admin/Product
        public ActionResult Index(Data.Filter filter)
        {
            ViewData["Filter"] = filter;
            var models = (from p in db.Products
                          join c in db.Categories on p.ID_Category equals c.ID_Category
                          select new ProductDTO
                          {
                              ID_Category = c.ID_Category,
                              Care_tips = p.Care_tips,
                              Category_Name = c.Category1,
                              Characteristic = p.Characteristic,
                              Common_Name = p.Common_Name,
                              ID_Product = p.ID_Product,
                              Meaning = p.Meaning,
                              Origin = p.Origin,
                              Plant_family = p.Plant_family,
                              Price = p.Price ?? 0,
                              Product_Img = p.Product_Img,
                              Product_Name = p.Product_Name,
                              Quantity = p.Quantity ?? 0,
                          });

            if (!string.IsNullOrEmpty(filter.Keyword))
                models = models.Where(t => t.Product_Name.ToUpper().Trim().Contains(filter.Keyword.ToUpper().Trim()) ||
                                        t.Category_Name.ToUpper().Trim().Contains(filter.Keyword.ToUpper().Trim()));

            return View(models.OrderByDescending(t => t.ID_Product).ToPagedList(filter.PageIndex, filter.PageSize));
        }

        [HttpGet]
        public ActionResult Create()
        {
            var model = new Product();
            ViewBag.Categories = new SelectList(db.Categories.OrderBy(s => s.Category1).ToList()
                , "ID_Category", "Category1", model.ID_Category);
            return View(model);
        }

        [HttpPost]
        public ActionResult Create(Product model)
        {
            ViewBag.Categories = new SelectList(db.Categories.OrderBy(s => s.Category1).ToList()
                , "ID_Category", "Category1", model.ID_Category);

            if (ModelState.IsValid)
            {

                ResponseUpload uploadModel = Constant.UploadFile(model.Product_Img);
                if (!uploadModel.Success)
                {
                    ModelState.AddModelError("Product_Img", "Select Image");
                    return View(model);
                }

                model.Product_Img = uploadModel.Path;

                db.Products.Add(model);
                db.SaveChanges();

                return RedirectToAction("Index");
            }
            return View(model);
        }

        [HttpGet]
        public ActionResult Edit(int id)
        {
            var model = db.Products.Find(id);
            ViewBag.Categories = new SelectList(db.Categories.OrderBy(s => s.Category1).ToList()
                , "ID_Category", "Category1", model.ID_Category);
            return View(model);
        }

        [HttpPost]
        public ActionResult Edit(int id, Product model)
        {
            var modelInit = db.Products.Find(id);
            ViewBag.Categories = new SelectList(db.Categories.OrderBy(s => s.Category1).ToList()
                , "ID_Category", "Category1", model.ID_Category);
            if (ModelState.IsValid)
            {
                if(!string.IsNullOrEmpty(model.Product_Img) && modelInit.Product_Img != model.Product_Img)
                {
                    ResponseUpload uploadModel = Constant.UploadFile(model.Product_Img);
                    if (!uploadModel.Success)
                    {
                        ModelState.AddModelError("Product_Img", "Select Image");
                        return View(model);
                    }
                    modelInit.Product_Img = uploadModel.Path;
                }    

                modelInit.Sort_desc = model.Sort_desc;
                modelInit.Price = model.Price;
                modelInit.Quantity = model.Quantity;
                modelInit.Origin = model.Origin;
                modelInit.Meaning = model.Meaning;
                modelInit.Care_tips = model.Care_tips;
                modelInit.Characteristic = model.Characteristic;
                modelInit.Common_Name = model.Common_Name;
                modelInit.Plant_family = model.Plant_family;
                modelInit.Scientific_Name = model.Scientific_Name;
                modelInit.Product_Name = model.Product_Name;

                db.Products.AddOrUpdate(modelInit);
                db.SaveChanges();

                return RedirectToAction("Index");
            }
            return View(model);
        }

        public ActionResult Delete(int id)
        {
            var model = db.Products.Find(id);
            if (model == null)
                return RedirectToAction("Index");

            db.Products.Remove(model);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}