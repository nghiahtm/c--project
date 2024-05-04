using System;
using System.Collections.Generic;
using System.Drawing.Printing;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;
using DoAnTotNghiep.Models;
using PagedList;
namespace DoAnTotNghiep.Controllers
{
   
    public class ProductController : Controller
    {
        // GET: Product
        QLBanCayCanhEntities1 db = new QLBanCayCanhEntities1 ();
        public ActionResult Index(int? page)
        {
            if (page == null) page = 1;
            int pageSize = 12;
            int pageNumber = (page ?? 1);
            List<Product> lstProducts = db.Products.ToList();
            return PartialView(lstProducts.ToPagedList(pageNumber,  pageSize));

        }
        public PartialViewResult CategoryPartial()
        {
            return PartialView(db.Categories.ToList());
        }
        public ActionResult ProductByCategory(int ID_Category, int? page)
        {
            if (page == null) page = 1;
            int pageSize = 12;
            int pageNumber = (page ?? 1);
            List<Product> lstProducts = db.Products.Where(n => n.ID_Category == ID_Category).OrderBy(n => n.ID_Category).ToList();
            if (lstProducts.Count == 0)
            {
                ViewBag.Products = "This product is not available!";
                ViewBag.lstProducts = db.Products.ToList();
            }
            return PartialView(lstProducts.ToPagedList(pageNumber, pageSize));
        }
        [HttpPost]
        public ActionResult SearchResults(FormCollection f, int? page)
        {
            if (page == null) page = 1;
            int pageSize = 9;
            int pageNumber = (page ?? 1);
            string searchkey = f["txtsearch"].ToString();
            List<Product> lstSearchResults = db.Products.Where
                (n => n.Product_Name.Contains(searchkey)).ToList();
            ViewBag.keyword = searchkey;
            if (lstSearchResults.Count == 0)
            {
                ViewBag.ThongBao = " This product is not available!";
                return View(db.Products.ToList());
            }
            ViewBag.ThongBao = " Find" + lstSearchResults.Count + "product";
            //return View(lstSearchResults.OrderBy(n => n.Product_Name).ToList());
            return PartialView(lstSearchResults.OrderBy(n => n.Product_Name).ToPagedList(pageNumber, pageSize));
        }
        [HttpGet]
        public ActionResult SearchResults( string searchkey, int? page)
        {
            if (page == null) page = 1;
            int pageSize = 9;
            int pageNumber = (page ?? 1);
            ViewBag.keyword = searchkey;
            List<Product> lstSearchResults = db.Products.Where
                (n => n.Product_Name.Contains(searchkey)).ToList();
            ViewBag.keyword = searchkey;
            if (lstSearchResults.Count == 0)
            {
                ViewBag.ThongBao = " This product is not available!";
                return View(db.Products.ToList());
            }
            ViewBag.ThongBao = "Find" + lstSearchResults.Count + "product";
            return PartialView(lstSearchResults.OrderBy(n => n.Product_Name).ToPagedList(pageNumber, pageSize));
        }
        public ViewResult ProductDetail(int ID_Product)
        {
            Product product = db.Products.SingleOrDefault(n => n.ID_Product == ID_Product);
            if (product == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            var related_products = db.Products.Where(p => p.ID_Product != product.ID_Product && p.ID_Category == product.ID_Category).Take(4).ToList();
            ViewBag.related_products = related_products;
            return View(product);
        }

        public ActionResult Shop(int? page)
        {
            if (page == null) page = 1;
            int pageSize = 12;
            int pageNumber = (page ?? 1);
            List<Product> lstProducts = db.Products.ToList();
            return PartialView(lstProducts.ToPagedList(pageNumber, pageSize));
        }
        public ActionResult Blog(int ? page)
        {
            if (page == null) page = 1;
            int pageSize = 4;
            int pageNumber = (page ?? 1);
            List<Post> lstPost = db.Posts.ToList();
            return PartialView(lstPost.ToPagedList(pageNumber, pageSize));
        }

        public PartialViewResult CategoryPostPartial()
        {
            return PartialView(db.CategoryPosts.ToList());
        }
        public ViewResult PostByCategory(int ID_CategoryP )
        {
            List<Post> lstPost = db.Posts.Where(n => n.ID_CategoryP == ID_CategoryP).OrderBy(n => n.ID_CategoryP).ToList();
            if (lstPost.Count == 0)
            {
                ViewBag.lstPost = db.Posts.ToList();
            }
           
            //var related_post = db.Posts.Where(n => n.ID_CategoryP == ID_CategoryP).OrderByDescending(x => x.Date_post).Take(3).ToList();
            //ViewBag.related_post = related_post;
            return View(lstPost);
        }
        public ViewResult BlogDetail(int ID_CategoryP)
        {
            Post post= db.Posts.SingleOrDefault(n => n.ID_CategoryP == ID_CategoryP);
            if (post == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            var related_post = db.Posts.Where(p => p.ID_CategoryP != post.ID_Post && p.ID_Post == post.ID_CategoryP).OrderByDescending(x => x.Date_post).Take(3).ToList();
            ViewBag.related_post = related_post;
            return View(post);
        }
        public ActionResult Contact()
        {
            return View();
        }
    }
}